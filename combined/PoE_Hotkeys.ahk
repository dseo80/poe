#Initial Commit


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance FORCE
Menu, tray, Icon, data\poe-bw.ico

;Run Poe_Helper.exe, , , PoePID1
;Run PoE_Item\POE_ItemInfo.exe, , , PoePID2
;Run PoE_Item\POE_ItemLookup.exe, , , PoePID3
;Run PoE_ck.exe, , , PoePID5
;Run PoE_macros.exe, , , PoePID6
;Run PoeHud\PoeHUD.exe, C:\Users\Seohyun\Desktop\POE\PoeHud, , PoePID4
;Process, priority, %PoePID1%, High

OnExit, ExitSub

;Quick and Dirty Hotkeys
#IfWinActive Path of Exile ahk_class Direct3DWindowClass
F10::JoinChannels() ; Assign F10 to execute the joinchannels command
F2::Remaining()
F4::Logout()

^h::Hideout()
^t::TradeLastPlayer()
^i::InviteLastPlayer()
^a::SetAFK



;Switches Right and Middle Button Functions (so you dont turn off your auras)
#IfWinActive Path of Exile ahk_class Direct3DWindowClass
$RButton::MButton
$MButton::RButton


/* 
commented out

#IfWinActive Path of Exile ahk_class Direct3DWindowClass
;changes behavior of  left click to control+leftclick
Lbutton::
Send ^{Click down}
KeyWait Lbutton
Send ^{Click up}
Return

;incase we need to use regular click control button reverts it back
^Lbutton::Send {Click}

;for one handed playing with mouse
Wheelup::Send Q
Wheeldown::Send T

*/


Logout(){
	Run, cports.exe /close * * * * PathofExile.exe
}


JoinChannels(){
        BlockInput On
        Send {Enter}
        Sleep 25
        Send /trade 1
        Send {Enter}
		Sleep 25
		Send {Enter}
		Sleep 25
		Send /global 820
        Send {Enter}
		Sleep 25
        BlockInput Off
        return
}

/*
 
CheckItemLevel(){
        BlockInput On
        Send {LButton}
        Send {Enter}
        Sleep 50
        Send /itemlevel
        Send {Enter}
        Sleep 75
        Send {LButton}
        BlockInput Off
        return
}

Tradespam() {
TradeChannel:=1
		  Loop 8
			   {
			   SetKeyDelay, 20, 20
                  ControlSend,,{NumpadEnter}, Path of Exile ahk_class Direct3DWindowClass
                  sleep 50
				  ControlSendRaw,,`/trade %TradeChannel%, Path of Exile ahk_class Direct3DWindowClass
                  sleep 50
				  ControlSend,,{NumpadEnter}, Path of Exile ahk_class Direct3DWindowClass
				  Sleep 1500
				  ControlSend,,{NumpadEnter}{Up 2}{NumpadEnter}, Path of Exile ahk_class Direct3DWindowClass
				  Sleep 2000
				  TradeChannel++
				  SetKeyDelay, 0, 0
               }
			    SetKeyDelay, 20, 20
				ControlSend,,{NumpadEnter}, Path of Exile ahk_class Direct3DWindowClass
                ControlSendRaw,,`/trade 1, Path of Exile ahk_class Direct3DWindowClass
                ControlSend,,{NumpadEnter}, Path of Exile ahk_class Direct3DWindowClass
				SetKeyDelay, 0, 0
}

*/


ExitSub:
;if A_ExitReason not in Logoff,Shutdown  ; Avoid spaces around the comma in this line.
{
	Process, close, %PoePID2%
	Process, close, %PoePID3%
	Process, close, %PoePID5%
	Process, close, %PoePID6%
	;Process, close, %PoePID4%
}
ExitApp
