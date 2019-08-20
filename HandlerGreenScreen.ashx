<%@ WebHandler Language="VB" Class="HandlerGreenScreen" %>

Imports System
Imports System.Web
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D

Public Class HandlerGreenScreen : Implements IHttpHandler, IRequiresSessionState
    
    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
    
    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        ' Setup the Size Parameter
        Dim size As PhotoSize = PhotoSize.Medium
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
                size = PhotoSize.Medium
        End Select
        
        If Not context.Request.QueryString("BackdropPhotoId") Is Nothing AndAlso _
            Not context.Request.QueryString("BackdropPhotoId").Trim.Length = 0 AndAlso _
             Not context.Request.QueryString("BackdropPhotoId") = 0 Then
            Dim photoID As Integer = context.Request.QueryString("PhotoID")
            Dim backdropPhotoID As Integer = context.Request.QueryString("BackdropPhotoID")
        
            ' Set up the response settings
            context.Response.ContentType = "image/jpeg"
            context.Response.Cache.SetCacheability(HttpCacheability.Public)
            context.Response.BufferOutput = False
            
            Dim albumRights As Boolean = False
            Dim tmpPhoto As Photo = PhotoManager.GetPhoto(photoID)
            Dim albumID As Integer = tmpPhoto.AlbumID
            
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
            
            If albumRights Then
                Using foregroundStream As System.IO.MemoryStream = PhotoManager.GetPhoto(photoID, size)
                    Using backgroundStream As System.IO.MemoryStream = PhotoManager.GetPhoto(backdropPhotoID, size)
                        Using newImage As System.Drawing.Image = System.Drawing.Image.FromStream(backgroundStream)
                            Using foreImage As System.Drawing.Image = System.Drawing.Image.FromStream(foregroundStream)
                                Using oGraphics As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(newImage)
                                    Dim tmpBackPhoto As Photo = PhotoManager.GetPhoto(backdropPhotoID)
                                    oGraphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality
                                    oGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic
                                    oGraphics.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality
                                    oGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality
                                    oGraphics.CompositingMode = Drawing.Drawing2D.CompositingMode.SourceOver
                                    
                                    If tmpBackPhoto.IsLandscape Then
                                        'landscape background
                                        If foreImage.Width < foreImage.Height Then
                                            'But fore image in portrait
                                            'Resize foreimage to landscape                                            
                                            oGraphics.DrawImage(foreImage, newImage.Width - CInt((foreImage.Width * foreImage.Width) / foreImage.Height), 0, CInt((foreImage.Width * foreImage.Width) / foreImage.Height), foreImage.Width)
                                        Else
                                            'else just superpose
                                            oGraphics.DrawImage(foreImage, 0, 0)
                                        End If
                                    Else
                                        'else just superpose
                                        oGraphics.DrawImage(foreImage, 0, 0)
                                    End If
                                    
                                    If tmpBackPhoto.ThreeLayersPhotoId >= 0 Then
                                        'Three layers
                                        'Add third layer
                                        Using thirdImageStream As System.IO.MemoryStream = PhotoManager.GetPhoto(tmpBackPhoto.ThreeLayersPhotoId, size)
                                            Using thirdImage As System.Drawing.Image = System.Drawing.Image.FromStream(thirdImageStream)
                                                oGraphics.DrawImage(thirdImage, 0, 0)
                                            End Using
                                        End Using
                                    End If
                                    
                                    'Frame photo?
                                    If Not context.Request.QueryString("FramePhotoId") Is Nothing _
                                        AndAlso Not context.Request.QueryString("FramePhotoId") = "" _
                                        AndAlso CInt(context.Request.QueryString("FramePhotoId")) > 0 Then
                                        'Yes
                                        Dim framePhotoID As Integer = context.Request.QueryString("FramePhotoID")
                                        
                                        Using frameStream As System.IO.MemoryStream = PhotoManager.GetPhoto(framePhotoID, size)
                                            Using frameImage As System.Drawing.Image = System.Drawing.Image.FromStream(frameStream)
                                                oGraphics.DrawImage(frameImage, 0, 0)
                                            End Using
                                        End Using
                                    Else
                                        'Else, continue
                                    End If
                                    
                                    'write watermark if not digital rights 
                                    If tmpPhoto.DigitalRights = False Then
                                        oGraphics.TranslateTransform(CType(newImage.Size.Width / 10, Single), CType(newImage.Size.Height / 3, Single))
                                        oGraphics.RotateTransform(-45)
                                        Dim tmpFormat As StringFormat = New StringFormat(StringFormatFlags.NoClip)
                                        tmpFormat.Alignment = StringAlignment.Center
                                        tmpFormat.LineAlignment = StringAlignment.Center
                                        Dim tmpBrush As SolidBrush = New SolidBrush(Color.FromArgb(60, 255, 255, 255))
                                        Dim tmpFont As Font = New Font("verdana", CType(newImage.Size.Height / 20, Single), FontStyle.Bold)
                                        Dim strWatermark As String = "© Caméléo Photo"
                                        oGraphics.DrawString(strWatermark, tmpFont, tmpBrush, 0, 0, tmpFormat)
                                        oGraphics.TranslateTransform(-CType(newImage.Size.Width / 10, Single), CType(newImage.Size.Height / 2, Single))
                                        oGraphics.DrawString(strWatermark, tmpFont, tmpBrush, 0, 0, tmpFormat)
                                    End If
                                   
                                    'Save as bmp temporarily
                                    Dim newStream As New System.IO.MemoryStream
                                    newImage.Save(newStream, ImageFormat.Bmp)

                                    'Save the bitmap as a JPEG file with quality level 100. 
                                    Dim objImageCodecInfo As ImageCodecInfo = PhotoManager.GetEncoderInfo("image/jpeg")
                                    Dim objEncoderParameters As EncoderParameters = New EncoderParameters(3)
                                    objEncoderParameters.Param(0) = New EncoderParameter(Encoder.Quality, 100L)
                                    objEncoderParameters.Param(1) = New EncoderParameter(Encoder.Compression, Fix(EncoderValue.CompressionNone))
                                    objEncoderParameters.Param(2) = New EncoderParameter(Encoder.Transformation, Fix(EncoderValue.TransformRotate90))
                                    Using otherImage As System.Drawing.Bitmap = System.Drawing.Bitmap.FromStream(newStream, True, True)
                                        otherImage.Save(context.Response.OutputStream, objImageCodecInfo, objEncoderParameters)
                                    End Using
                                End Using
                            End Using
                        End Using
                    End Using
                End Using
            Else
                Dim stream As IO.Stream = PhotoManager.GetPhoto(PhotoSize.Small)
                ' Write image stream to the response stream
                Dim buffersize As Integer = (1024 * 16)
                Dim buffer() As Byte = New Byte((buffersize) - 1) {}
                Dim count As Integer = stream.Read(buffer, 0, buffersize)
                
                Do While (count > 0)
                    context.Response.OutputStream.Write(buffer, 0, count)
                    count = stream.Read(buffer, 0, buffersize)
                Loop
            End If
        End If
    End Sub

End Class