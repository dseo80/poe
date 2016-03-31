IF NOT A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}


Cheat_Engine_Dynamic_Pointer_Catcher(CH_Path,CH_title,Exe_name,Game_tile,vlaue,move_dir,vlaue2)
{
SoundBeep 
WinMinimizeAll
WinActivate, %Game_tile%
Run, %CH_Path%
WinWaitActive, %CH_title%
Winmove,%CH_title%,,0,0,50,50

ControlClick, Window3, %CH_title%,,,, NA
Sleep, 500
ControlFocus, LCLListBox1, %CH_title%
Sleep, 500
Send, %Exe_name%
Sleep, 1000
Send, {enter}
ControlSetText, Edit1, %vlaue%, %CH_title%
Sleep, 500
ControlClick, Button15, %CH_title%,,,, NA

Loop
{
ControlGetText, Button15_1, Button15,%CH_title% 
IF (Button15_1 = "New Scan")
{
WinActivate, %Game_tile%
WinWaitActive, %Game_tile%
Sleep, 500
Send, {%move_dir%}
break
}
}

WinActivate, %CH_title%
ControlGetText, Button15, Button15,%CH_title%

Loop
{
IF (Button15 = "New Scan")
{
ControlSetText, Edit1,%vlaue2%, %CH_title%
Sleep, 500
ControlClick, Button6, %CH_title%,,,, NA
Sleep, 500

ControlClick, x32 y115, %CH_title%,,,, NA
ControlClick, x32 y115, %CH_title%,,,, NA
Sleep, 400
Click 225, 423, 2
Sleep, 400
send, {ctrl down}
send, {C}
send, {ctrl up}

Process,Close,cheatengine-x86_64.exe
Process,Close,cheatengine-i386.exe
Process,Close,Cheat Engine.exe

NormPoint := Clipboard
coord1 := format( "0x{:x}", format( "{:d}", "0x" clipboard ) ) 
Clipboard = %NormPoint%
FileAppend,Pointer: %NormPoint%`nHex Pointer: %coord1%`n`n,%Game_tile%_Dynamic_pointers.ini
TrayTip,%CH_title% Dynamic Pointer Catcher, Catched it!`n`nPointer: %NormPoint%`nHex Pointer: %coord1%,3
break
}

}
}
ExitApp
return

Escape::ExitApp
