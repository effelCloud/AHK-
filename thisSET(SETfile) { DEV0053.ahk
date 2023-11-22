	thisSET(SETfile) {
			global
	if outOfOrder
		return
		ToggleGUI := 0
		NoTimeCounter := 1 ; unterbindet GUI Timeout
		if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		  if (NoTimeCounter=0)
		  {
		  atickCount := a_tickCount
		  GuiLiveTime:=(.299*60*1000)
		  Gui, Show
		  thisGUITimeout()
		}}
	if !inStr(timeStampSETall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang") && (A_ThisLabel="start") {
		thisF2Counter := F2Counter()
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, LV1
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Sonnenuntergang (system) [ " thisF2Counter " ]`t"
							. (A_ThisFunc?A_ThisFunc:"empty") "`t"
							. (A_ThisHotkey?A_ThisHotkey:"empty") "`t"
							. (A_PriorHotkey?A_PriorHotkey:"empty") "`t"
							. (A_PriorKey?A_PriorKey:"empty") "`t"
							. (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty") "`t"
							. (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty") "`t"
							. (A_GuiControl?A_GuiControl:"empty") "`t"
							. (A_GuiEvent?A_GuiEvent:"empty") "`t"
							. (A_EventInfo?A_EventInfo:"empty") "`n"
				, % a_scriptDir "\" A_ScriptName " timeStampall.txt"
		if LVInsertADD
		LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (system) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty"))
		else
		LV_Modify(LV_Add("", A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (system) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty")), "Vis")
		LVModifyCol()
	GuiControl, +Redraw, LV1
		thisSETCounter++
	nMalBlinkenContinue := 1
	 nMalBlinken(6)
	return " `tSUNSET" 
	} else {
	if (A_ThisLabel="F2") {
		thisF2Counter := F2Counter()
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, LV1
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenuntergang (User) [ " thisF2Counter " ]") "`t"
							. (A_ThisFunc?A_ThisFunc:"empty") "`t"
							. (A_ThisHotkey?A_ThisHotkey:"empty") "`t"
							. (A_PriorHotkey?A_PriorHotkey:"empty") "`t"
							. (A_PriorKey?A_PriorKey:"empty") "`t"
							. (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty") "`t"
							. (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty") "`t"
							. (A_GuiControl?A_GuiControl:"empty") "`t"
							. (A_GuiEvent?A_GuiEvent:"empty") "`t"
							. (A_EventInfo?A_EventInfo:"empty") "`n"
				, % a_scriptDir "\" A_ScriptName " timeStampall.txt"
		if LVInsertADD
		LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (User) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty"))
		else
		LV_Modify(LV_Add("", A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (User) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty")), "Vis")
		LVModifyCol()
	GuiControl, -Redraw, LV1
		thisSETCounter++
	nMalBlinkenContinue := 1
	 nMalBlinken(6)
		return " `tSUNSET"
	} else {
		thisF2Counter := F2Counter()
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, LV1
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenuntergang (System) [ " thisF2Counter " ]") "`t" ; wenn vorher User F2 gedrückt hat
							. (A_ThisFunc?A_ThisFunc:"empty") "`t"
							. (A_ThisHotkey?A_ThisHotkey:"empty") "`t"
							. (A_PriorHotkey?A_PriorHotkey:"empty") "`t"
							. (A_PriorKey?A_PriorKey:"empty") "`t"
							. (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty") "`t"
							. (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty") "`t"
							. (A_GuiControl?A_GuiControl:"empty") "`t"
							. (A_GuiEvent?A_GuiEvent:"empty") "`t"
							. (A_EventInfo?A_EventInfo:"empty") "`n"
				, % a_scriptDir "\" A_ScriptName " timeStampall.txt"
		if LVInsertADD
		LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (System) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty"))
		else
		LV_Modify(LV_Add("", A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
							, ("Sonnenuntergang (System) [ " thisF2Counter " ]")
							, (A_ThisFunc?A_ThisFunc:"empty")
							, (A_ThisHotkey?A_ThisHotkey:"empty")
							, (A_PriorHotkey?A_PriorHotkey:"empty")
							, (A_PriorKey?A_PriorKey:"empty")
							, (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty")
							, (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty")
							, (A_GuiControl?A_GuiControl:"empty")
							, (A_GuiEvent?A_GuiEvent:"empty")
							, (A_EventInfo?A_EventInfo:"empty")), "Vis")
		LVModifyCol()
	GuiControl, -Redraw, LV1
		thisSETCounter++
	nMalBlinkenContinue := 1
	 nMalBlinken(6)
		return " `tSUNSET"
}}}

F2Counter() {
static  thisF2Counter
thisF2Counter++
return thisF2Counter
}
