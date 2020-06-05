#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Handle Terminal switching/launching
#IfWinExist ahk_exe ubuntu.exe
F5::WinActivate
#IfWinExist

#IfWinNotExist ahk_exe ubuntu.exe
F5::Run, Ubuntu
#IfWinNotExist

; Handle Browser switching/tabs/launching
#IfWinExist ahk_exe vivaldi.exe
F6::WinActivate
F7::
	WinActivate
	Send, ^6
return
F8::
	WinActivate
	Send, ^5
return
F9::
	WinActivate
	Send, ^1
return
F10::
	WinActivate
	Send, ^2
return
#IfWinExist

#IfWinNotExist ahk_exe vivaldi.exe
F6::Run, Vivaldi
#IfWinNotExist

; Add some vim-like arrow keys on HJKL
^j::Send, {Down}
^k::Send, {Up}
^h::Send, {Left}
^l::Send, {Right}

; Make Ctrl+Shift+K still work without affecting Ctrl+K mapping above
#IfWinActive ahk_exe vivaldi.exe
^+k::
	Hotkey, ^k,,Off
	Send, ^k
	Hotkey, ^k,,On
return
#IfWinActive

; Quicker tab switching
^$]::send, ^{Tab}
^$[::send, ^+{Tab}

^F3::    ; Next window
WinGetClass, ActiveClass, A
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return

F3::    ; Last window
WinGetClass, ActiveClass, A
WinActivateBottom, ahk_class %ActiveClass%
return
