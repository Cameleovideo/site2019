<%@ WebHandler Language="VB" Class="HandlerFrame" %>

Imports System
Imports System.Web
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D

Public Class HandlerFrame : Implements IHttpHandler, IRequiresSessionState
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        If Not context.Request.QueryString("FramePhotoId") Is Nothing AndAlso _
            Not context.Request.QueryString("FramePhotoId").Trim.Length = 0 AndAlso _
             Not context.Request.QueryString("FramePhotoId") = 0 Then
            Dim photoID As Integer = context.Request.QueryString("PhotoID")
            Dim framePhotoID As Integer = context.Request.QueryString("framePhotoID")
        
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
            End If
            
            If albumRights Then
                Using foregroundStream As System.IO.MemoryStream = PhotoManager.GetPhoto(framePhotoID, PhotoSize.Medium)
                    Using backgroundStream As System.IO.MemoryStream = PhotoManager.GetPhoto(photoID, PhotoSize.Medium)
                        Using newImage As System.Drawing.Image = System.Drawing.Image.FromStream(backgroundStream)
                            Using foreImage As System.Drawing.Image = System.Drawing.Image.FromStream(foregroundStream)
                                Using oGraphics As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(newImage)
                                    oGraphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality
                                    oGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic
                                    oGraphics.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality
                                    oGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality
                                    oGraphics.CompositingMode = Drawing.Drawing2D.CompositingMode.SourceOver
                                    oGraphics.DrawImage(foreImage, 0, 0)
                                    
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
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class