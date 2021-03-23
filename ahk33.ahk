#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallKeybdHook
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; File Explorer Windows Group
GroupAdd, expWin, ahk_class CabinetWClass
; Vivaldi Group
GroupAdd, vivaldi, ahk_exe vivaldi.exe
; Teams Group
GroupAdd, MSTeams, ahk_exe Teams.exe
return

; Enable God Mode - See registry file for swapping capslock to ctrl

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
F8::GroupActivate, vivaldi, R
#IfWinExist
#IfWinNotExist ahk_exe vivaldi.exe
F8::Run, Vivaldi
#IfWinNotExist

; Handle Outlook switching/launching
; #IfWinExist ahk_exe OUTLOOK.EXE
; F9::WinActivate
; #IfWinExist
; 
; #IfWinNotExist ahk_exe OUTLOOK.EXE
; F9::Run, Outlook
; #IfWinNotExist

; Handle Teams switching/launching
#IfWinExist ahk_exe Teams.exe
F9::GroupActivate, MSTeams, R
#IfWinExist
#IfWinNotExist ahk_exe Teams.exe
F9::
    EnvGet, local, LOCALAPPDATA
    app = %local%\Microsoft\Teams\Update.exe
    param = --processStart "Teams.exe"
    If !FileExist(app) {
     MsgBox, 48, Error, Program not found.`n`n%app%
     Return
    }
    Run, %app% %param%
return
#IfWinNotExist

; Open 'This PC' folder
#IfWinNotExist ahk_class CabinetWClass 
F10::Run, explorer.exe shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
#IfWinNotExist
#IfWinExist ahk_class CabinetWClass 
>^F10::Run, explorer.exe shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
F10::GroupActivate, expWin, R
#IfWinExist

; Add some vim-like arrow keys on HJKL
>^j::Send, {Down}
>^k::Send, {Up}
>^h::Send, {Left}
>^l::Send, {Right}

; Tab navigation
>^]::Send, ^{Tab}
>^[::Send, ^+{Tab}
