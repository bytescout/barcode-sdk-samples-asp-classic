'*****************************************************************************************'
'                                                                                         '
' Download offline evaluation version (DLL): https://bytescout.com/download/web-installer '
'                                                                                         '
' Signup Web API free trial: https://secure.bytescout.com/users/sign_up                   '
'                                                                                         '
' Copyright © 2017-2018 ByteScout Inc. All rights reserved.                               '
' http://www.bytescout.com                                                                '
'                                                                                         '
'*****************************************************************************************'


<%

' In case of "Server.CreateObject Failed", "Server object error "ASP 0177 : 8000ffff" or similar errors:
' Please try the following:
' - Open IIS 
' - Find application pools (DefaultAppPool is used by default)
' - Open its properties and check .NET CLR version selected:
' - if you have  .NET 1.1 then change to .NET CLR 2.00
' - if you have .NET CLR 2.00 then try to change to .NET CLR 4.0


Set bc = Server.CreateObject("Bytescout.BarCode.Barcode")

' set symbology to Datamatrix
bc.Symbology = 15 ' 15 = DataMatrix symbology type

' set barcode value to encode
bc.Value = "http://www.bytescout.com"

' Place barcode at top-left corner of every document page
barcode.DrawToPDF "..\wikipedia.pdf", -1, 10, 10, "result.pdf"

 PDFImage = bc.BinaryImage

 response.ContentType = "application/pdf"

 ' add content type header 
 response.AddHeader "Content-Type", "application/pdf"

 ' set the content disposition
 response.AddHeader "Content-Disposition", "inline;filename=HelloWorld.pdf"

 ' write the binary image to the Response output stream 
 response.BinaryWrite PDFImage
 response.End


' disconnect from libraries
Set bc = Nothing

%>
