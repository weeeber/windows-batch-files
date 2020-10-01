Const fromEmail    = "weber.brian@hotmail.com"
Const password    = "ybRRw1wF/fCO"
Const toEmail    = "bjw@brianweberdesigns.com; def.weber.brian@gmail.com; bweber@cditech.com"
Const mailSubject = "Test email from Batch File"
Const mailBody = "This email is generated by a batch file."

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile("C:\Export\DailyReports\*")
Dim emailObj, emailConfig,emailAttach
Set emailAttach = "C:\Export\DailyReports\" & objFSO.GetFileName(objFile)
Set emailObj      = CreateObject("CDO.Message")
emailObj.From     = fromEmail
emailObj.To       = toEmail
emailObj.Subject  = mailSubject
emailObj.TextBody = mailBody

emailObj.AddAttachment = emailAttach   
Set emailConfig = emailObj.Configuration
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.live.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing")    = 2  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl")      = true 
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")    = fromEmail
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword")    = password
emailConfig.Fields.Update

emailObj.Send