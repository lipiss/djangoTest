#z::Run https://autohotkey.com  ; Win+Z

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    /*Run Notepad*/
	Run Notepad++
return