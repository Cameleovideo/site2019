<%@ WebHandler Language="VB" Class="Handler" %>

Public Class Handler
    Implements IHttpHandler, IRequiresSessionState

	ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
		Get
            Return False
		End Get
	End Property
    
	Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
		' Set up the response settings
		context.Response.ContentType = "image/jpeg"
		context.Response.Cache.SetCacheability(HttpCacheability.Public)
		context.Response.BufferOutput = False
		' Setup the Size Parameter
		Dim size As PhotoSize = PhotoSize.Original
		Select Case context.Request.QueryString("Size")
			Case "S"
				size = PhotoSize.Small
			Case "M"
				size = PhotoSize.Medium
            Case "L"
                size = PhotoSize.Large
            Case "O"
                size = PhotoSize.Original
            Case Else
                size = PhotoSize.Small
        End Select
               
        
        ' Setup the PhotoID Parameter
        Dim id As Int32 = -1
        Dim albumID As Integer = -1
        Dim stream As IO.Stream = Nothing
        Dim albumRights As Boolean = False
        
        If ((Not (context.Request.QueryString("PhotoID")) Is Nothing) _
           AndAlso (context.Request.QueryString("PhotoID") <> "")) Then
            id = [Convert].ToInt32(context.Request.QueryString("PhotoID"))
            Dim tmpPhoto As Photo = PhotoManager.GetPhoto(id)
            albumID = tmpPhoto.AlbumID
            If size = PhotoSize.Original Or size = PhotoSize.Medium Then
                If tmpPhoto.IsGreenScreen Then
                    size = PhotoSize.Large
                End If
            End If
        Else
            albumID = [Convert].ToInt32(context.Request.QueryString("AlbumID"))
        End If
        
        If Not context.Session Is Nothing Then
            Dim AlbumList As Generic.List(Of Album) = context.Session("AlbumList")
            If AlbumList Is Nothing Then
                AlbumList = PhotoManager.GetAllAlbums
                context.Session("AlbumList") = AlbumList
            End If
            
            For Each tmpAlbum As Album In AlbumList
                If tmpAlbum.AlbumID = albumID Or tmpAlbum.MasterAlbumID = albumID Then
                    albumRights = True
                    Exit For
                End If
            Next
            If albumRights = False And HttpContext.Current.User.Identity.Name.Contains("Anonymous") Then
                albumRights = True
            End If
        End If
        
        If albumRights Or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) Then
            If id = -1 Then
                stream = PhotoManager.GetFirstPhoto(albumID, size)
            Else
                stream = PhotoManager.GetPhoto(id, size)
            End If
        End If
        
        ' Get the photo from the database, if nothing is returned, get the default "placeholder" photo
        If (stream Is Nothing) Then
            stream = PhotoManager.GetPhoto(size)
        End If
        ' Write image stream to the response stream
        Dim buffersize As Integer = (1024 * 16)
        Dim buffer() As Byte = New Byte((buffersize) - 1) {}
        Dim count As Integer = stream.Read(buffer, 0, buffersize)
        
        Do While (count > 0)
            context.Response.OutputStream.Write(buffer, 0, count)
            count = stream.Read(buffer, 0, buffersize)
            
        Loop
    End Sub
	
End Class