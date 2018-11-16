^#n::
/*ctrl + win + n*/
SetTitleMatchMode 2
IfWinNotExist, Notepad++
{
; need to put your own location of notepad++.exe here
run "c:\Program Files (x86)\Notepad++\notepad++.exe"
}
else
{
winclose, Notepad++
}
return