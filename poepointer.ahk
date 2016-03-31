IF NOT A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

#Include, memory.ahk
#SingleInstance force

ProcessName := "PathOfExile.exe"

hwnd := MemoryOpenFromName(ProcessName)

HP = 
SH = 
MA = 
EX = 

IT = 
ST = 
DE = 

Gui, +AlwaysOnTop

Gui, Add, Text,,Life:
Gui, Add, Text,,Shield:
Gui, Add, Text,, Mana:
Gui, Add, Text,, EXP:

Gui, Add, Text,,Intelligence:
Gui, Add, Text,, Strenght:
Gui, Add, Text,, Dexterity:

Gui, Add, Edit, ReadOnly vHP_GUI ym
Gui, Add, Edit, ReadOnly vSH_GUI
Gui, Add, Edit, ReadOnly vMA_GUI
Gui, Add, Edit, ReadOnly vEX_GUI

Gui, Add, Edit, ReadOnly vIT_GUI
Gui, Add, Edit, ReadOnly vST_GUI
Gui, Add, Edit, ReadOnly vDE_GUI
Gui, Show, , POE Reader


Loop
{
   
 ; Life,Mana,sheiald,exp  
HP2 := MemoryReadPointer(hwnd,HP, "int")
GuiControl,, HP_GUI, %HP2%

SH2 := MemoryReadPointer(hwnd,SH, "int")
GuiControl,, SH_GUI, %SH2%

MA2 := MemoryReadPointer(hwnd,MA, "int")
GuiControl,, MA_GUI, %MA2%

EX2 := MemoryReadPointer(hwnd,EX, "int")
GuiControl,, EX_GUI, %EX2%

; inteletins,srange,dexter
IT2 := MemoryReadPointer(hwnd,IT, "int")
GuiControl,, IT_GUI, %IT2%

ST2 := MemoryReadPointer(hwnd,ST, "int")
GuiControl,, ST_GUI, %ST2%

DE2 := MemoryReadPointer(hwnd,DE, "int")
GuiControl,, DE_GUI, %DE2%
}
return
