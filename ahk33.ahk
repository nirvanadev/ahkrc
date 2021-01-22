#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallKeybdHook
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; God Mode - See registry file for swapping capslock to ctrl

; Hide all windows and show desktop or the reverse
F2:: ComObjCreate("Shell.Application").ToggleDesktop()

; Quick window switching of the same application
^F3::    ; Next window
	WinGetClass, ActiveClass, A
	WinSet, Bottom,, A
	WinActivate, ahk_class %ActiveClass%
return
F3::    ; Last window
	WinGetClass, ActiveClass, A
	WinActivateBottom, ahk_class %ActiveClass%
return

; Toggle current window maximization
F5::
	WinGet MX, MinMax, A
	If MX
		WinRestore A
   	Else WinMaximize A
return

; PrintScreen as SnipTool
PrintScreen::Send,#S

; Handle Terminal switching/launching
#IfWinExist ahk_exe WindowsTerminal.exe
F7::WinActivate
#IfWinExist

#IfWinNotExist ahk_exe WindowsTerminal.exe
F7::Run, wt.exe
#IfWinNotExist

; Handle Browser switching/tabs/launching
#IfWinExist ahk_exe vivaldi.exe
F8::WinActivate
>^F8::
	WinGetTitle, title, A
	WinActivate, ahk_exe vivaldi.exe
	Send, ^r
	Sleep 100
	WinActivate %title%
return
#IfWinNotExist ahk_exe vivaldi.exe
F8::Run, Vivaldi
#IfWinNotExist

; Open 'This PC' folder
F11::Run, explorer.exe shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}

; Add some vim-like arrow keys on HJKL
>^j::Send, {Down}
>^k::Send, {Up}
>^h::Send, {Left}
>^l::Send, {Right}

; Tab navigation
>^]::Send, ^{Tab}
>^[::Send, ^+{Tab}
