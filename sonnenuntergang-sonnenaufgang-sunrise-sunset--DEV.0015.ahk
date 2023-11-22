SetTimer,UPDATEDSCRIPT,500
ANow := A_DD "." Month(A_MM) "." a_YYYY " " A_Hour "-" A_Min "-" A_Sec "-" A_MSec
If !FileExist(A_ScriptDir "\save\")
FileCreateDir,% A_ScriptDir "\save\"
FileCopy, % A_ScriptFullPath, % A_ScriptDir "\save\" A_ScriptName " save " ANow " .ahk"

/*
https://www.google.com/search?q=site%3Aautohotkey.com+alexa+Triggercmd&rlz=1C1CHBD_deDE898DE898&oq=site%3Aautohotkey.com+alexa+Triggercmd&aqs=chrome..69i57j6i58.10224j0j4&sourceid=chrome&ie=UTF-8

Es ist möglich, AutoHotkey zu verwenden, um Alexa zu steuern. Eine Möglichkeit besteht darin, den Windows-Client 
von Triggercmd zu installieren und Alexa-Befehle als Schalter zu erstellen. Mit Hilfe von Drittprogrammen wie 
AutoHotkey können Sie dann fast alles steuern, was auf Ihrem Computer ausgeführt wird 1. Hier ist eine Kurzanleitung, 
die Ihnen helfen kann, Ihren PC mit Alexa zu steuern 

Erstellen Sie einen Account bei Triggercmd 

Aktivieren Sie den Skill “Triggercmd Smart Home” in Alexa 

Installieren Sie den Windows-Client und geben Sie den Key ein, der in Ihrem Account hinterlegt ist 

Nachdem Sie diese Schritte ausgeführt haben, können Sie Befehle erstellen, um Programme oder Parameter auszuführen. 
Mit AutoHotkey können Sie dann fast alles steuern, was auf Ihrem Computer ausgeführt wird 
*/



	; https://www.autohotkey.com/boards/viewtopic.php?p=439038#p439038   
	; https://sonnenuntergang-sonnenaufgang.info/koeln ; hier findest du die Sonnenzeiten für deinen Standort

	#SingleInstance force
	;#NoTrayIcon
	#NoEnv
	#Persistent
	FileEncoding, UTF-8
	SetBatchLines, -1
	SetTitleMatchMode, 2
	SetKeyDelay 20
	SetWorkingDir, %A_ScriptDir%

if((A_PtrSize=8&&A_IsCompiled="")||!A_IsUnicode){ ;32 bit=4  ;64 bit=8
    SplitPath,A_AhkPath,,dir
    if(!FileExist(correct:=dir "\AutoHotkeyU32.exe")){
	    MsgBox error
	    ExitApp
    }
    Run,"%correct%" "%A_ScriptName%",%A_ScriptDir%
    ExitApp
    return
}

	atickCount := a_tickCount
	GuiLiveTime := (1439.99*60*1000) ; GuiLiveTime bei Guistart 23:59:59 maximale Größe darf nicht überschritten werden, sonst laufen die Zähler nicht korrekt
	MainArray := []

	outOfOrder := 1
	MakeList := 1
	HideGui := 1 ; or dont hide by counter null


	NoTimeCounter := 0		; alle counter ein oder ausblenden
	aindexMOD := 2
	thisMOD := 3-Mod(3-Mod(aindexMOD,3),3)
	ToggleShowGuiLiveTime := 0 	; F5::
	thisToggleFunc := ToggleFunc()

	empty := "Empty"

;	GUISizeToggle := 0
	GUISizeToggle := !(GUISizeToggle:=!GUISizeToggle)

	LVInsertADD := 0

	MKPic := 1  ; screenshot vor und nach mitternacht

	ToggleGUI := 1			; zeige GUI bei Start
	showOnlyEDIT1Update := 1 	; einfache (Tooltip2GUI) Ausgabe
	showTooltipAlso := 0 		; tooltip und Tooltip2GUI anzeigen

	; erstellt zuerst eine Liste: Timestamp Sonnenaufgang Sonnenuntergang Sonnenstunden
	ShowMakeList := 0

	; Dieses Script startet bei Sonnenaufgang und Sonnenuntergang je eine Aktion, wie z.B 
	; Jalousie.-Markiesensteuerung und oder Beleuchtung ein bzw. ausschalten.
	; “Triggercmd Smart Home” und Alexa bieten weitere Möglichkeiten zum schalten.

	; Bei Sonnenaufgang wird RISEfile gestartet
	RISEfile := A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Bei Sonnenuntergang wird SETfile gestartet
	SETfile  := A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Gefahrenmeldungfile
	Gefahrenmeldungfile  := A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; xTriggerfile
	xTriggerfile  := A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"


	AScreenHeight300 := (A_ScreenHeight-300)
	; https://ahkde.github.io/docs/v1/lib/Gui.htm#PosSize
	Gui +AlwaysOnTop hwndGUIHWND ; msgBox immer im vordergrund ../viewtopic.php?p=544035#p544035 ; lnk toolTip:
	Gui, Font, 	s19 bold
	;Gui, Font, 	s12
	Gui, Add, text, x10 ym0 w560 h30  vEDIT2 hwndhGUI2 center cblue ; timestamp
	Gui, Font, 	s12 norm 
	Gui, Add, text, x10 ym+40 w600 h290 vEDIT1 hwndhGUIA  
;	Gui, Add, text, hide x10 ym+270 w560 h60  vEDIT3 hwndhGUI3 ; timeout hide
	Gui, Font, s10	norm 
	Gui, Add, listview, x10 ym+350 w545 h400  vLV1 hwndhLV1 grid, Timestamp|ThisLabel|Name|ThisFunc|ThisHotkey|PriorHotkey|PriorKey|TimeSinceThisHotkey|TimeSincePriorHotkey|GuiControl|GuiEvent|EventInfo
	Gui, Add, listview, x610 ym+20 w585 h300  vLV2 hwndhLV2 grid, Datum|Sonnenaufgang|Sonnenuntergang|Sonnenstunden|SonnenstundenSpeak
;guicontrol, hide, edit2 
;----------------------------------------------- load history
Gui, ListView, LV1
	fileRead, thisReloadtimeStamp,  % a_scriptDir "\" A_ScriptName " timeStampall.txt"
	Loop, parse, thisReloadtimeStamp,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if !LoadListViewFull {
	if a_loopfield contains Programmstart,exitapp
	continue
	}
	if inStr(a_loopfield,"exitapp")
	continue

	split2  := strReplace(split.2,(SubStr(split.2, -7)))	; Uhr
	split2a := strReplace(split.2,(SubStr(split.2, -28)))	; wochentag
	split2b  := strReplace(split2,split2a)

	LV_Modify(LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12), "Vis")
;msgbox % split.1 "`n" split2 "`n" split2b
	}}
;----------------------------------------------- load sonnenuntergang-sonnenaufgang-sunrise-sunset
Gui, ListView, LV2
	fileRead, thisReloadSunriseSunsetYYYY,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
	Loop, parse, thisReloadSunriseSunsetYYYY,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield
	LV_Modify(LV_Add("", split.1, split.2, split.3, split.4, split.5), "Vis")
	;msgbox % split.1 "`n" split2 "`n" split2b
	}
;----------------------------------------------- load result
Gui, ListView, LV1










		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		if LVInsertADD
		LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Programmstart"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Programmstart"
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
		fileAppend,% "Programmstart:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. "empty`t"
							. "Programmstart`t"
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


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Gui, Show, x110 y31 w565 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
guicontrol, hide, edit3 
	settimer, toolTip, 500
	if !MakeList
	settimer, start, -1

	if MakeList
	{
		try filedelete,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
		for thisMonth, month in strSplit("31,28,31,30,31,30,31,31,30,31,30,31",",") {
			loop,% month 
			{
			thisDay++
			AMM := thisMonth, ADD := thisDay
			gosub start
		;	sleep, 1 ; test
			}
			thisDay:=0
		}
	fileAppend,% thisres,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
	if ShowMakeList
	try run,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
	} 


	if (DayCounter=365)
	MakeList := false
	if !MakeList
	settimer, start, -1
	if !MakeList
	outOfOrder := 0
;	setTimer, F1, -25000 	; disable Gui Counter
	setTimer, F5, -500 	; disable Gui Counter
	setTimer, ^F5, -500 	; ebable debugInfo



;	MsgBox % TagNachtZeiten() "`n" LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10")

	; https://www.autohotkey.com/boards/viewtopic.php?p=439828#p439828 by amateur+   Schaltjahrberechnung
;	MsgBox,,, % daysInYear := Mod(A_Year, 4) || ! Mod(A_Year, 100) & Mod(A_Year, 400) ? ("Jahr hat: " 365 " Tage") : ("Jahr hat: " 366 " Tage (Schaltjahr)"), 3
	

thisTimer#1 := (.5*60*1000)
;		setTimer, apiGefahrenmeldung, -5000
;		setTimer, apixTrigger, -10000

	;	Gefahrenmeldung("Gefahrenmeldung") ; test


settimer, sekundenTrigger, 1000
settimer, Sondermeldung, -5000
return




;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Sondermeldung:
;-----------------------------------------------
sondermeldungSommerWinterZeitAnzeige := MainArray["SommerWinterZeitAnzeigeOhneEnter"]
;-----------------------------------------------
; sondermeldung mez <> mesz wechsel

	fileRead, thisReloadtimeStamp,  % a_scriptDir "\" A_ScriptName " timeStampall.txt"
	Loop, parse, thisReloadtimeStamp,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if a_loopfield contains %sondermeldungSommerWinterZeitAnzeige%
	sondermeldungSommerWinterZeitAnzeige := ""
	}}

if sondermeldungSommerWinterZeitAnzeige
{
		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		if LVInsertADD
		LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, ("Hinweis")
							, (sondermeldungSommerWinterZeitAnzeige)
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
							, ("Hinweis")
							, (sondermeldungSommerWinterZeitAnzeige)
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
		fileAppend,% "Sondermeldung:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. "Hinweis`t"
							. sondermeldungSommerWinterZeitAnzeige "`t"
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
}

;msgbox % sondermeldungSommerWinterZeitAnzeige
	return







;//////////////////////////////////////////////////////////////////////////////////////////////////////// convolution

apiGefahrenmeldung:
Gefahrenmeldung("Gefahrenmeldung") ; test
return

apixTrigger:
xTrigger("xTrigger") ; test
return



start:
	if MakeList
	x:=strSplit(SunriseSunset(AMM,ADD),"`t")
	else
	x:=strSplit(SunriseSunset(A_MM,A_DD),"`t")

	; sorgt dafür das die Zeiten auch nach dem Ereignis für den jweiligen KALENDERTAG erhalten bleiben
 	Sonnenaufgang 	:= ConvertToMilliseconds((MainArray["thisCalendarDaySunRise",A_DD,A_MM]) ":" 00 "`," 000)
			 - ConvertToMilliseconds(A_Hour ":" A_Min ":" 00 "`," 000)
 	Sonnenuntergang := ConvertToMilliseconds((MainArray["thisCalendarDaySunSet",A_DD,A_MM])  ":" 00 "`," 000)
			 - ConvertToMilliseconds(A_Hour ":" A_Min ":" 00 "`," 000)
 	Sonnenstunden 	:= ConvertToMilliseconds(x.2 ":" 00 "`," 000)
			 - ConvertToMilliseconds(x.1 ":" 00 "`," 000)

	MainArray["STATSSonnenstundengesternMilliseconds"] := ConvertToMilliseconds(MainArray["SonnenstundenCalendarDay", A_YDay-1] ":" 00 "`," 000)
	MainArray["STATSSonnenstundenThisDayMilliseconds"]   := ConvertToMilliseconds(MainArray["SonnenstundenCalendarDay", A_YDay]   ":" 00 "`," 000)

	MainArray["SonnentagLaengenBerechnung"] := MainArray["STATSSonnenstundengesternMilliseconds"]
						>  MainArray["STATSSonnenstundenThisDayMilliseconds"]
						? "Tage werden kürzer"
						: "Tage werden länger" 
	MainArray["NachtLaengenBerechnung"] := MainArray["STATSSonnenstundengesternMilliseconds"]
						>  MainArray["STATSSonnenstundenThisDayMilliseconds"]
						? "Nächte werden länger"
						: "Nächte werden kürzer" 

	StimeStd := StimeStdNoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenstunden),1,2)
	StimeStd := LTRIM(StimeStd,0)
	StimeMIN := StimeMINnoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenstunden),4,2)
	StimeMIN := LTRIM(StimeMIN,0)

	SAstd 	 := SAstdNoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenaufgang),1,2)
	SAstd 	 := LTRIM(SAstd,0)
	SAmin	 := SAminNoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenaufgang),4,2)
	SAmin	 := LTRIM(SAmin,0)
	SUstd	 := SUstdNoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenuntergang),1,2)
	SUstd 	 := LTRIM(SUstd,0)
	SUmin	 := SUminNoLTRIM := subStr(ConvertToHHMMSSMS(Sonnenuntergang),4,2)
	SUmin	 := LTRIM(SUmin,0)

	MainArray["Stunden bis zum nächsten Sonnenaufgang"]	:= ((SAstd=1)
								? "  " SAstd " Stunde    "
								: (SAstd>1) && (SAstd<10)
								? "  " SAstd " Stunden "
								: (SAstd>=10)
								? SAstd " Stunden "
								: "") 
	MainArray["Minuten bis zum nächsten Sonnenaufgang"]	:= ((SAmin=1)
								? "  " SAmin " Minute"
								: (SAmin>1) && (SAmin<10)
								? "  " SAmin " Minuten"
								: (SAmin>=10)
								? SAmin " Minuten"
								: (SAstd="") && (SAmin="")
								? thisRISE(RISEfile)
								: "")
	MainArray["Stunden bis zum nächsten Sonnenuntergang"]	:= ((SUstd=1)
								? "  " SUstd " Stunde    "
								: (SUstd>1) && (SUstd<10)
								? "  " SUstd " Stunden "
								: (SUstd>=10)
								? SUstd " Stunden "
								: "") 
	MainArray["Minuten bis zum nächsten Sonnenuntergang"]	:= ((SUmin=1)
								? "  " SUmin " Minute"
								: (SUmin>1) && (SUmin<10)
								? "  " SUmin " Minuten"
								: (SUmin>=10)
								? SUmin " Minuten"
								: (SUstd="") && (SUmin="")
								? thisSET(SETfile)
								: "")

	MainArray["Zeit seit letztem Sonnenuntergang"]	 := 	  ConvertToMilliseconds(A_Hour ":" A_Min ":" A_Sec "," A_MSec)
								- ConvertToMilliseconds(MainArray["thisCalendarDaySunSet",A_DD,A_MM] ":" 00 "`," 000)
	MainArray["Zeit seit letztem Sonnenaufgang"]	 := 	  ConvertToMilliseconds(A_Hour ":" A_Min ":" A_Sec "," A_MSec)
								- ConvertToMilliseconds(MainArray["thisCalendarDaySunRise",A_DD,A_MM] ":" 00 "`," 000)

	DelaySAstd 	 := DelaySAstdNoLTRIM := subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenaufgang"]),1,2)
	DelaySAstd 	 := LTRIM(DelaySAstd,0)
	DelaySAmin	 := DelaySAminNoLTRIM := subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenaufgang"]),4,2)
	DelaySAmin	 := LTRIM(DelaySAmin,0)
	DelaySUstd	 := DelaySUstdNoLTRIM := subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenuntergang"]),1,2)
	DelaySUstd 	 := LTRIM(DelaySUstd,0)
	DelaySUmin	 := DelaySUminNoLTRIM := subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenuntergang"]),4,2)
	DelaySUmin	 := LTRIM(DelaySUmin,0)

	MainArray["Stunden seit letztem Sonnenaufgang"]		:= ((DelaySAstd=1)
								? "  " DelaySAstd " Stunde    "
								: (DelaySAstd>1) && (DelaySAstd<10)
								? "  " DelaySAstd " Stunden "
								: (DelaySAstd>=10)
								? DelaySAstd " Stunden "
								: "") 
	MainArray["Minuten seit letztem Sonnenaufgang"]		:= ((DelaySAmin=1)
								? "  " DelaySAmin " Minute"
								: (DelaySAmin>1) && (DelaySAmin<10)
								? "  " DelaySAmin " Minuten"
								: (DelaySAmin>=10)
								? DelaySAmin " Minuten"
								: "")
	MainArray["Stunden seit letztem Sonnenuntergang"]	:= ((DelaySUstd=1)
								? "  " DelaySUstd " Stunde    "
								: (DelaySUstd>1) && (DelaySUstd<10)
								? "  " DelaySUstd " Stunden "
								: (DelaySUstd>=10)
								? DelaySUstd " Stunden "
								: "") 
	MainArray["Minuten seit letztem Sonnenuntergang"]	:= ((DelaySUmin=1)
								? "  " DelaySUmin " Minute"
								: (DelaySUmin>1) && (DelaySUmin<10)
								? "  " DelaySUmin " Minuten"
								: (DelaySUmin>=10)
								? DelaySUmin " Minuten"
								: "")

	MainArray["Zeit seit letztem SonnenuntergangHHMM"]	 := 	subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenuntergang"]),1,5) 	
	MainArray["Zeit seit letztem SonnenaufgangHHMM"]	 := 	subStr(ConvertToHHMMSSMS(MainArray["Zeit seit letztem Sonnenaufgang"]),1,5) 	 

	MainArray["Aktuelle Zeit"] 	:= A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr"




entwederOder#1 := 0  ; test
If entwederOder#1                   ; wenn sonnenuntergang > sonnenaufgang
{
	MainArray["tagOderNacht"] :=				  ConvertToMilliseconds(SUstd ":" SUmin ":" 00 "`," 000)		; beispiel 8:8
								> ConvertToMilliseconds(SAstd ":" SAmin ":" 00 "`," 000)	
								? "nacht" 
								: "tag"
	MainArray["nightOrDay"]	 := 				  ConvertToMilliseconds(SUstd ":" SUmin ":" 00 "`," 000)
								< ConvertToMilliseconds(SAstd ":" SAmin ":" 00 "`," 000)
								? "Day" 
								: "Night"
} else {
	MainArray["tagOderNacht"] :=				  ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000) ; beispiel 08:08
								> ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)	
								? "nacht" 
								: "tag"
	MainArray["nightOrDay"]	 := 				  ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000)
								< ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)
								? "Day" 
								: "Night"

	MainArray["nextScheduledAction"] :=			  ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000)
								< ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)
								? "Trigger: Sonnenuntergang: " MainArray["Sonnenuntergang"] " Uhr"
								: "Trigger: Sonnenaufgang: " MainArray["Sonnenaufgang"] " Uhr"
}


	MainArray["thisRISECounter"] 	:= thisRISECounter ? thisRISECounter : 0
	MainArray["thisSETCounter"] 	:= thisSETCounter  ? thisSETCounter  : 0
	MainArray["thisGefahrenmeldungCounter"] := thisGefahrenmeldungCounter ? thisGefahrenmeldungCounter : 0
	MainArray["thisxTriggerCounter"] := thisxTriggerCounter ? thisxTriggerCounter : 0
	MainArray["GUI DefaultTime"] 	:= thisSTARTCountTimeout()
	MainArray["GUI Timeout"] 	:= thisGUITimeout()
	MainArray["GUI UPTime"] 	:= thisUPCountTimeout()
	MainArray["GUI LiveTimes"] 	:= "`nLiveTimes:`t`t{"
					. MainArray["LIVETIME TimeStamp"]				; TimeStamp
					. MainArray["LIVETIME downCount"]		 		; downCount
					. MainArray["LIVETIME UPCount"]					; UPCount
 					.  "}"
	MainArray["Sonnenaufgang"] 	:= x.1
	MainArray["Sonnenuntergang"] 	:= x.2
	MainArray["Sonnenstunden"] 	:= StimeStd
	MainArray["Sonnenminuten"] 	:= ((StimeMIN=1)
					? "  " StimeMIN " Minute"
					: (StimeMIN>1) && (StimeMIN<10)
					? "  " StimeMIN " Minuten"
					: (StimeMIN>=10)
					? StimeMIN " Minuten"
					: "") 
	MainArray["SonnenminutenExport"] := ((StimeMIN=1)
					 ? " " StimeMIN " Minute"
					 : (StimeMIN>1) && (StimeMIN<10)
					 ? " " StimeMIN " Minuten"
					 : (StimeMIN>=10)
					 ? StimeMIN " Minuten"
					 : "") 

MainArray["schaltjahrTriggerHeuteStunde"] 	:= (SubStr(MainArray["Sonnenaufgang"], 2, 1))
MainArray["schaltjahrTriggerGesternStunde"] 	:= (SubStr(MainArray["SonnenaufgangCalendarDay", A_YDay-1], 2, 1))
	MainArray["SommerWinterZeitAnzeige"] 	:=    !(MainArray["schaltjahrTriggerHeuteStunde"]  
						     =  MainArray["schaltjahrTriggerGesternStunde"])
	? "Beginn: " thisJahresZeit()  "`n"
	: ""

MainArray["schaltjahrTriggerHeuteStunde"] 	:= (SubStr(MainArray["Sonnenaufgang"], 2, 1))
MainArray["schaltjahrTriggerGesternStunde"] 	:= (SubStr(MainArray["SonnenaufgangCalendarDay", A_YDay-1], 2, 1))
	MainArray["SommerWinterZeitAnzeigeOhneEnter"] 	:=    !(MainArray["schaltjahrTriggerHeuteStunde"]  
						     =  MainArray["schaltjahrTriggerGesternStunde"])
	? "Beginn: " thisJahresZeit()
	: ""
;msgbox % MainArray["SommerWinterZeitAnzeige"] 

; /////////////////////////////////////////////////////////////////////////////////////
	; MKPic := 1, MKPicCount := 0 	;  = täglich
	; MKPic := 1 			;  = einmal
	if MKPic 
	{
	MKPicCount++
	MainArray["sollZeitVorZwölf"] 	:= 23 ":" 59 ":" 55
	MainArray["sollZeitNachZwölf"] 	:= 00 ":" 00 ":" 01
	MainArray["istZeitvorZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec
	MainArray["istZeitnachZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec
		if (MainArray["sollZeitVorZwölf"] 
			. =  MainArray["istZeitvorZwölf"])
		|| (MainArray["sollZeitNachZwölf"]
			. = . MainArray["istZeitnachZwölf"])
	try run,%  A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"
	if (MKPicCount=2)
	MKPic := false
	}
; /////////////////////////////////////////////////////////////////////////////////////






























 if !MakeList   ; evaluation utilization
 {
; thisGuiUpdate := DEBUGINFO() "`n" thisGuiTimeOutDownCounter()
 thisGuiUpdate := thisGuiTimeOutDownCounter() "`n" DEBUGINFO() MainArray["SommerWinterZeitAnzeige"]
	 . "" ; thisGuiTimeOutDownCounter()
	. "nächste geplante Aktion:`t" MainArray["nextScheduledAction"] ; a_tab MainArray["SonnentagLaengenBerechnung"] " <> " MainArray["NachtLaengenBerechnung"] ; tage werden länger oder kürzer
	. "`nSonnenaufgang:`t" 		MainArray["Sonnenaufgang"] " Uhr  [ gestern " MainArray["SonnenaufgangCalendarDay", A_YDay-1] " ]" a_space MainArray["SonnentagLaengenBerechnung"]
	. "`nSonnenuntergang:`t"	MainArray["Sonnenuntergang"] " Uhr  [ gestern " MainArray["SonnenuntergangCalendarDay", A_YDay-1] " ]" a_space MainArray["NachtLaengenBerechnung"]
	. "`nSonnenstunden:`t" 	"[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]
	. "`nTagNachtZeiten: " TagNachtZeiten()
;	. "`nSchaltjahr: " isSchaltjahr(A_Year) 
	. "`n" isSchaltjahr(A_Year) 
	. "`nZeit bis zum nächsten Sonnenaufgang:`t`t" 
			. MainArray["Stunden bis zum nächsten Sonnenaufgang"]
			. MainArray["Minuten bis zum nächsten Sonnenaufgang"]
	. "`nZeit seit letztem Sonnenaufgang:`t`t" MainArray["Stunden seit letztem Sonnenaufgang"]  
	. MainArray["Minuten seit letztem Sonnenaufgang"]
	. "`nZeit bis zum nächsten Sonnenuntergang:`t" 
			. MainArray["Stunden bis zum nächsten Sonnenuntergang"]		
			. MainArray["Minuten bis zum nächsten Sonnenuntergang"]	
	. "`nZeit seit letztem Sonnenuntergang:`t`t" 
	. MainArray["Stunden seit letztem Sonnenuntergang"]
	. MainArray["Minuten seit letztem Sonnenuntergang"]
;	. MainArray["SommerWinterZeitTrigger"] ; togglet im sekundentakt
	} else {
		DayCounter++
 thisGuiUpdate := "Aktuelle Zeit: " A_DD "." Month(A_MM) "." a_YYYY " " A_Hour ":" A_Min ":" A_Sec " Uhr"
		. ((MakeList=1)
		? "`nListe wird erstellt...`nDatum:`t" ADD "." Month(AMM) "." a_YYYY "`nTag:`t" DayCounter
		: "") 
		firstLine := "Datum`tSonnenaufgang`tSonnenuntergang`tSonnenstunden`tSonnenstundenSpeak"
		if (DayCounter=1)
		fileAppend,% firstLine "`n",% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
		thisres .= ADD "." 
			. Month(AMM) "`t"
			. x.1 "`t"
			. x.2 "`t"
			. StimeStdnoLTRIM ":"
			. StimeMINnoLTRIM "`t"
			. strReplace((MainArray["Sonnenstunden"] " Stunden " MainArray["SonnenminutenExport"]), "  ", " ") "`n"

		MainArray["thisCalendarDaySunRise",ADD,AMM] := MainArray["Sonnenaufgang"]
		MainArray["thisCalendarDaySunSet", ADD,AMM] := MainArray["Sonnenuntergang"]

		MainArray["SonnenstundenCalendarDay", DayCounter]  	:= StimeStdnoLTRIM ":" StimeMINnoLTRIM

		MainArray["SonnenaufgangCalendarDay", DayCounter]  	:= MainArray["Sonnenaufgang"]
		MainArray["SonnenuntergangCalendarDay", DayCounter]  	:= MainArray["Sonnenuntergang"]

		MainArray["SonnenstundenCalendarDayLTRIM", DayCounter]  	:= StimeStd ":" StimeMINNoLTRIM
		}

	if !MakeList
	settimer, start, -900
;	if !MakeList
;	GuiControl, +Redraw, LV1
	return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
isSchaltjahr(AYear) {
;global
return daysInYear := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) 
			? ("Das Jahr " AYear " hat: " 365 " Tage ( kein Schaltjahr ) " NextSchaltjahrDIGIT()) 
			: ("Das Jahr " AYear " hat: " 366 " Tage ( Schaltjahr ) " NextSchaltjahrDIGIT())
}

NextSchaltjahrDIGIT() {
loop
{
; ayear := (2024 + a_index) ; test
  ayear := (a_year + a_index)
schaltjahr := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : (1)
if schaltjahr 
return daysInYear := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : ("[ nächstes Schaltjahr: " AYear " ]")
}}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
DEBUGINFO() {
global
if showDebuginfo
return "Status: rise#: " MainArray["thisRISECounter"] 
	. " - set#: " MainArray["thisSETCounter"]
	. " - alert#: " MainArray["thisGefahrenmeldungCounter"] " - " 
	. "MOD#:" thisToggleFunc thisMOD 
	. " - [ Strg && F5 ] toggleHide`n"
}
^F5::
showDebuginfo := (showDebuginfo:=!showDebuginfo)
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
sekundenTrigger:
if sekundenTriggerToggle := (sekundenTriggerToggle:=!sekundenTriggerToggle)
{
MainArray["schaltjahrTriggerHeuteStunde"] 	:= (SubStr(MainArray["Sonnenaufgang"], 2, 1))
MainArray["schaltjahrTriggerGesternStunde"] 	:= (SubStr(MainArray["SonnenaufgangCalendarDay", A_YDay-1], 2, 1))
	MainArray["SommerWinterZeitTrigger"] :=    !(MainArray["schaltjahrTriggerHeuteStunde"]  
						=  MainArray["schaltjahrTriggerGesternStunde"])
	? "`nSondermeldung:`tHeute beginnt die " thisJahresZeit()  ; MainArray["schaltjahrTriggerHeuteStunde"] a_tab MainArray["schaltjahrTriggerGesternStunde"]
	: ""
} else {
MainArray["SommerWinterZeitTrigger"] := ""
}
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////

;////////////////////////////////////////////////////////////////////////////////////////////////////////

guiclose:

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		fileAppend,% "Exitapp:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. "`t"
							. "Exitapp`t"
							. A_ThisFunc "`t"
							. A_ThisHotkey "`t"
							. A_PriorHotkey "`t"
							. A_PriorKey "`t"
							. ATimeSinceThisHotkey "`t"
							. ATimeSincePriorHotkey "`t"
							. A_GuiControl "`t"
							. A_GuiEvent "`t"
							. A_EventInfo "`n"
				, % a_scriptDir "\" A_ScriptName " timeStampall.txt"
reload
exitapp
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F1::
thisRISE(RISEfile)
return
	thisGuiUpdate := ""
	NoTimeCounter := 0
	thisToggleFunc := 1
	thisMOD := 2
	ToggleGUI := 0
	if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		atickCount := a_tickCount
		GuiLiveTime:=(1.29*60*1000) ; 59 sec
		thisGUITimeout()
		thisRISE(RISEfile)
		Gui, Show
	} 
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F2::
thisSET(SETfile)
return
	thisGuiUpdate := ""
	NoTimeCounter := 0
	thisToggleFunc := 1
	thisMOD := 2
	ToggleGUI := 0
	if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		atickCount := a_tickCount
		GuiLiveTime:=(.09*60*1000) ; 59 sec
		thisGUITimeout()
		thisSET(SETfile)
		Gui, Show
	} 
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F3::
	thisGuiUpdate := ""
	NoTimeCounter := 0
	thisToggleFunc := 1
	thisMOD := 2
	ToggleGUI := 0
	if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		atickCount := a_tickCount
		GuiLiveTime:=(1439.99*60*1000) ; 59 sec
		thisGUITimeout()
	;       > alexa file <
		Gui, Show
	}
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F4::                                                             ; Toggle Gui
	thisGuiUpdate := ""
	if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		atickCount := a_tickCount
		GuiLiveTime:=(1439.99*60*1000)
		thisGUITimeout()
		Gui, Show
	} else {
		atickCount := a_tickCount
		GuiLiveTime:=(.009*60*1000)
		thisGUITimeout()
}
return
;//////////////////////////////////////////////////////////////////////////////////////////////////////// 
F5:: 
aindexMOD++
thisMaxCount := 3 ; tripleChoice
thisMOD := thisMaxCount-Mod(thisMaxCount-Mod(aindexMOD,thisMaxCount),thisMaxCount)  ; zählt dauernd 1 2 3 1 2 3 1 2 3 1... usw
if x := (thisMOD=1)
NoTimeCounter := 0, ToggleShowGuiLiveTime := 1, thisToggleFunc := ToggleFunc()
if x := (thisMOD=2)
NoTimeCounter := 0, ToggleShowGuiLiveTime := 0, thisToggleFunc := ToggleFunc()
if x := (thisMOD=3)
NoTimeCounter := 1
;if x := (thisMOD=4)
;NoTimeCounter := 0, thisToggleFunc := 1, thisMOD := 2
return

ToggleFunc() {
global thisToggleFunc := 1
return thisToggleFunc:=!thisToggleFunc
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F10::
	GuiControl, -Redraw, LV1
LVModifyCol()
	GuiControl, +Redraw, LV1

for all, vars in MainArray
;res .= all a_tab (isObject(vars) ? whatVars(vars) : vars) "`n"
 res .= all a_tab "  :  " a_tab (isObject(vars) ? "Object" : vars) "`n"
Gui +OwnDialogs  ; msgBox immer im vordergrund ../viewtopic.php?p=544035#p544035
;MsgBox,,, % res,3
res := ""
;try run,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
Gefahrenmeldung("Gefahrenmeldung") ; test
;sleep, 2000
;Gefahrenmeldung("xTrigger") ; test
return

whatVars(vars) {
for all, var in vars
x .= all a_tab var "`n"
sort, x
return 
}
;//////////////////////////////////////////////////////////////////////////////////////////////////////// vLV1 hwndhLV1

^F10::
;GuiControl,, EDIT2a,% MainArray["SommerWinterZeitAnzeige"]

GUISizeToggle := (GUISizeToggle:=!GUISizeToggle)
if GUISizeToggle
{
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
	AScreenWidth180  := (A_ScreenWidth-220)
	AScreenWidth200  := (A_ScreenWidth-200)
	GuiControl, Move,lv1, w%AScreenWidth180%  h300
	GuiControl, +Redraw, LV1

	Gui, Show, w%AScreenWidth200%  h%AScreenHeight300%
LVModifyCol()
} else {
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,lv1, w545 h300
	Gui, Show, w565 h%AScreenHeight300%
LVModifyCol()
	GuiControl, +Redraw, LV1
}
return


if !GUISizeToggle___________________
{
AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
	GuiControl, Move,lv1, w%AScreenWidth180%  h300
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
	Gui, Show, w%AScreenWidth200%  h%AScreenHeight300%
} else {
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,lv1, w545 h300
		LV_ModifyCol(1, 220)	; Timestamp
		LV_ModifyCol(2, 70)	; Action
		LV_ModifyCol(3, 130)	; Name
		LV_ModifyCol(4, 90)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	Gui, Show, w565 h%AScreenHeight300%
}

for all, vars in MainArray
;res .= all a_tab (isObject(vars) ? whatVars(vars) : vars) "`n"
 res .= all a_tab "  :  " a_tab (isObject(vars) ? "Object" : vars) "`n"
Gui +OwnDialogs  ; msgBox immer im vordergrund ../viewtopic.php?p=544035#p544035
;MsgBox,,, % res,3
res := ""
;try run,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
;Gefahrenmeldung("Gefahrenmeldung") ; test
;sleep, 2000
Gefahrenmeldung("xTrigger") ; test
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
toolTip:
if ToggleGUI
{
if showOnlyEDIT1Update
{
if (thisGuiUpdateEdit1OLD!=thisGuiUpdate)
GuiControl,, EDIT1,% thisGuiUpdate

;if sekundenTriggerToggle
;if !(thisGuiUpdateEdit1OLD=thisGuiUpdate)
GuiControl,, EDIT2,% MainArray["Aktuelle Zeit"]
;else
;if !(thisGuiUpdateEdit1OLD=thisGuiUpdate)
;GuiControl,, EDIT2,% MainArray["SommerWinterZeitAnzeige"] 

if (thisGuiUpdateEdit3OLD!=thisGuiTimeOutDownCounter())
GuiControl,, EDIT3,% thisGuiTimeOutDownCounter()
sleep, 1

thisGuiUpdateEdit1OLD := thisGuiUpdate
thisGuiUpdateEdit3OLD := thisGuiTimeOutDownCounter()

thisGuiUpdatex := strReplace(thisGuiUpdate,"nächsten Sonnenaufgang:`t`t","nächsten Sonnenaufgang:`t")
if showTooltipAlso
tooltip,% thisGuiUpdatex
}} else {
ToolTip
Gui, Show, hide 
}
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
ToolTipTimeout(min:=1) {
global
ToggleGUI := 1
sleep,% (min*60*1000)
ToggleGUI := 0
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
GUItimeout(min:=.055) {
global
;    ToggleGUI := 1
GuiControl,Text,% hthisTEXTid, %thisGUIUpdate%
Gui, Show
sleep,% (min*60*1000)
;sleep,% GuiLiveTime:=(min*60*1000)
Gui, Show, hide
settimer, start, -1
;    ToggleGUI := 0
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisGuiTimeOutDownCounter() {   						; F5::
global
if NoTimeCounter
{
;;thisGuiUpdate := ""
thisToggleFunc := 1
thisMOD := 3
NoTimeCounter := 1
atickcount := a_tickcount
GuiLiveTime:=(1439.99*60*1000)
  return "GUI Timeout:`t`tdisabled - enable: [ F3 ] mnimize: [ F4 ] switch: [ F5 ]"
}
if ToggleShowGuiLiveTime
return    "GUI DefaultTime:`t" thisSTARTCountTimeout()  " - switch [ F5 ]"
;	.  "`nGUI Timeout:`t`t" thisGUITimeout()
	. "`nGUI UPTime:`t`t" thisUPCountTimeout()
else
return  thisGUITimeout()  " - switch [ F5 ]"
}

thisGUITimeout() {
 global 
 atickcountB := a_tickcount-atickcount
 thisdownCount := subStr(ConvertToHHMMSSMS(GuiLiveTime-atickcountB),1,8) 	; downCount
	thisdownCountStd := subStr(thisdownCount,1,2)
	thisdownCountStd := LTRIM(thisdownCountStd,0)
	thisdownCountMIN := subStr(thisdownCount,4,2)
	thisdownCountMIN := LTRIM(thisdownCountMIN,0)
	thisdownCountSEC := subStr(thisdownCount,7,2)
	thisdownCountSEC := LTRIM(thisdownCountSEC,0)
if (thisdownCountStd="") && (thisdownCountMIN="") && (thisdownCountSEC="")
{
if HideGui
Gui, Show, hide
sleep, 1
}else{
thisGuiTimeoutDIGIT :=  (thisdownCountSTD<1) && (thisdownCountMIN<1) 
			? thisdownCountSEC
			:  ""
if thisGuiTimeoutDIGIT   ; wenn nur noch sekunden
{
 return   	 "`nGUI Timeout:`t`t"
		. ((thisdownCountSTD=1)
		? "  " thisdownCountSTD " Stunde "
		: (thisdownCountSTD>1) && (thisdownCountSTD<10)
		? "  " thisdownCountSTD " Stunden "
		: (thisdownCountSTD>=10)
		? thisdownCountSTD " Stunden "
		: "") 
		. ((thisdownCountMIN=1)
		? thisdownCountMIN " Minute "
		: (thisdownCountMIN>1) && (thisdownCountMIN<10)
		? "  " thisdownCountMIN " Minuten "
		: (thisdownCountMIN>=10)
		? thisdownCountMIN " Minuten "
		: "") 
		. ((thisdownCountSEC=1)
		? thisdownCountSEC " Sekunde"
		: (thisdownCountSEC>1) && (thisdownCountSEC<10) || (thisdownCountSEC>=10)
		? thisdownCountSEC " Sekunden - hold alive [ F3 ]"
		: "") 
} else {
return "`nGUI Timeout:`t`t"
		. ((thisdownCountSTD=1)
		? "  " thisdownCountSTD " Stunde "
		: (thisdownCountSTD>1) && (thisdownCountSTD<10)
		? "  " thisdownCountSTD " Stunden "
		: (thisdownCountSTD>=10)
		? thisdownCountSTD " Stunden "
		: "") 
		. ((thisdownCountMIN=1)
		? thisdownCountMIN " Minute "
		: (thisdownCountMIN>1) && (thisdownCountMIN<10)
		? "  " thisdownCountMIN " Minuten "
		: (thisdownCountMIN>=10)
		? thisdownCountMIN " Minuten "
		: "") 
		. ((thisdownCountSEC=1)
		? thisdownCountSEC " Sekunde"
		: (thisdownCountSEC>1) && (thisdownCountSEC<10) || (thisdownCountSEC>=10)
		? thisdownCountSEC " Sekunden" 
		: "") 
}}}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisUPCountTimeout() {
 global 
 atickcountC := a_tickcount-atickcount
 thisUPCount := subStr(ConvertToHHMMSSMS(atickcountC),1,8) 	; UPCount
	thisUPCountStd := subStr(thisUPCount,1,2)
	thisUPCountStd := LTRIM(thisUPCountStd,0)
	thisUPCountMIN := subStr(thisUPCount,4,2)
	thisUPCountMIN := LTRIM(thisUPCountMIN,0)
	thisUPCountSEC := subStr(thisUPCount,7,2)
	thisUPCountSEC := LTRIM(thisUPCountSEC,0)
	MainArray["LIVETIME TimeStamp"]	:= subStr(ConvertToHHMMSSMS(GuiLiveTime),1,8)
	MainArray["LIVETIME downCount"]	:= subStr(ConvertToHHMMSSMS(GuiLiveTime-atickcountB),1,8)
	MainArray["LIVETIME UPCount"] 	:= subStr(ConvertToHHMMSSMS(atickcountC),1,8)
 return   	((thisUPCountSTD=1)
		? "  " thisUPCountSTD " Stunde "
		: (thisUPCountSTD>1) && (thisUPCountSTD<10)
		? "  " thisUPCountSTD " Stunden "
		: (thisUPCountSTD>=10)
		? thisUPCountSTD " Stunden "
		: "") 
		. ((thisUPCountMIN=1)
		? thisUPCountMIN " Minute "
		: (thisUPCountMIN>1) && (thisUPCountMIN<10)
		? "  " thisUPCountMIN " Minuten "
		: (thisUPCountMIN>=10)
		? thisUPCountMIN " Minuten "
		: "") 
		. ((thisUPCountSEC=1)
		? thisUPCountSEC " Sekunde"
		: (thisUPCountSEC>1) && (thisUPCountSEC<10) || (thisUPCountSEC>=10)
		? thisUPCountSEC " Sekunden"
		: "") 
 		. "`nLiveTimes:`t`t{ "
		. MainArray["LIVETIME TimeStamp"] " / "	; TimeStamp
		. MainArray["LIVETIME downCount"] " / "	; downCount
		. MainArray["LIVETIME UPCount"] 	; UPCount
		.  " }"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisSTARTCountTimeout() {
 global 
; atickcountB := a_tickcount-atickcount
 thisStartTime := subStr(ConvertToHHMMSSMS(GuiLiveTime),1,8) 	; TimeStamp
	thisStartTimeStd := subStr(thisStartTime,1,2)
	thisStartTimeStd := LTRIM(thisStartTimeStd,0)
	thisStartTimeMIN := subStr(thisStartTime,4,2)
	thisStartTimeMIN := LTRIM(thisStartTimeMIN,0)
	thisStartTimeSEC := subStr(thisStartTime,7,2)
	thisStartTimeSEC := LTRIM(thisStartTimeSEC,0)
 return   	((thisStartTimeSTD=1)
		? "  " thisStartTimeSTD " Stunde "
		: (thisStartTimeSTD>1) && (thisStartTimeSTD<10)
		? "  " thisStartTimeSTD " Stunden "
		: (thisStartTimeSTD>=10)
		? thisStartTimeSTD " Stunden "
		: "") 
		. ((thisStartTimeMIN=1)
		? thisStartTimeMIN " Minute "
		: (thisStartTimeMIN>1) && (thisStartTimeMIN<10)
		? "  " thisStartTimeMIN " Minuten "
		: (thisStartTimeMIN>=10)
		? thisStartTimeMIN " Minuten "
		: "") 
		. ((thisStartTimeSEC=1)
		? thisStartTimeSEC " Sekunde"
		: (thisStartTimeSEC>1) && (thisStartTimeSEC<10) || (thisStartTimeSEC>=10)
		? thisStartTimeSEC " Sekunden"
		: "") 
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
Month(thisMonth) {
		Month := strSplit("Jan,Feb,Mrz,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez",",")
		return Month[thisMonth]
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////
	thisRISE(RISEfile) {
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
	if !inStr(timeStampRISEall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang") && (A_ThisLabel="start") {
		thisF1Counter := F1Counter()
		try run,% RISEfile,, hide, AusgabeVarPID
		timeStampRISEall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		GuiControl, -Redraw, LV1
		fileAppend,% "Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "Sonnenaufgang [ " thisF1Counter " ]`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenaufgang [ " thisF1Counter " ]")
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenaufgang [ " thisF1Counter " ]")
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
		thisRISECounter++
	return " `tSUNRISE" 
	} else {
	if (A_ThisLabel="F1") {
		thisF1Counter := F1Counter()
		try run,% RISEfile,, hide, AusgabeVarPID
		timeStampRISEall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		GuiControl, -Redraw, LV1
		fileAppend,% "Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "Sonnenaufgang [ " thisF1Counter " ]`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenaufgang [ " thisF1Counter " ]")
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenaufgang [ " thisF1Counter " ]")
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
		thisRISECounter++
		return " `tSUNRISE"
	}}}

F1Counter() {
static  thisF1Counter
thisF1Counter++
return thisF1Counter
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
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
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "Sonnenuntergang [ " thisF2Counter " ]`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenuntergang [ " thisF2Counter " ]")
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenuntergang [ " thisF2Counter " ]")
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
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. ("Sonnenuntergang [ " thisF2Counter " ]") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenuntergang [ " thisF2Counter " ]")
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, ("Sonnenuntergang [ " thisF2Counter " ]")
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
		return " `tSUNSET"
	}}}

F2Counter() {
static  thisF2Counter
thisF2Counter++
return thisF2Counter
}

;////////////////////////////////////////////////////////////////////////////////////////////////////////

;////////////////////////////////////////////////////////////////////////////////////////////////////////
	thisGefahrenmeldung(Gefahrenmeldungfile) {
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
	if !inStr(timeStampGefahrenmeldungall, A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung") {
		try run,% Gefahrenmeldungfile,, hide, AusgabeVarPID
		timeStampGefahrenmeldungall .= A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, LV1
		fileAppend,% "Gefahrenmeldung:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "Sturmwarnung`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Sturmwarnung"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Sturmwarnung"
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
		thisGefahrenmeldungCounter++
	return " `tSturmwarnung" 
	}  else {
;	if (A_ThisLabel="Gefahrenmeldung") || (A_ThisLabel="apiGefahrenmeldung") || (A_ThisLabel=!"") {
;	if (A_ThisLabel=!"") {
		try run,% Gefahrenmeldungfile,, hide, AusgabeVarPID
		timeStampGefahrenmeldungall .= A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, LV1
		fileAppend,% "Sturmwarnung:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "Sturmwarnung`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Sturmwarnung"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "Sturmwarnung"
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
		thisGefahrenmeldungCounter++
		return " `tSturmwarnung"
	}   }  ; }
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F8::
empty := "Empty"
send, ^c
clipboard := RTRIM(clipboard,a_space)
send (
send %clipboard%?%clipboard%:"empty"
send )%a_space%
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
	thisxTrigger(xTriggerfile) {
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
	if !inStr(timeStampxTriggerall, A_DD "." Month(A_MM) "." a_YYYY " xTrigger") {
		try run,% xTriggerfile,, hide, AusgabeVarPID
		timeStampxTriggerall .= A_DD "." Month(A_MM) "." a_YYYY " xTrigger " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, LV1
		fileAppend,% "xTrigger:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "xTrigger"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "xTrigger"
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
		thisGefahrenmeldungCounter++
	return " `txTrigger" 
	}  else {
;	if (A_ThisLabel="xTrigger") || (A_ThisLabel="apixTrigger") || (A_ThisLabel=!"") {
;	if (A_ThisLabel=!"") {
		try run,% xTriggerfile,, hide, AusgabeVarPID
		timeStampxTriggerall .= A_DD "." Month(A_MM) "." a_YYYY " xTrigger " A_Hour ":" A_Min ":" A_Sec "`n"


subStr(ConvertToHHMMSSMS(Sonnenuntergang),4,2)

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, LV1
		fileAppend,% "xTrigger:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"Trigger") "`t"
							. "xTrigger`t"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "xTrigger"
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
							, (A_ThisLabel?A_ThisLabel:"Trigger")
							, "xTrigger"
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
		thisGefahrenmeldungCounter++
		return " `txTrigger"
	}   }  ; }
;////////////////////////////////////////////////////////////////////////////////////////////////////////


;////////////////////////////////////////////////////////////////////////////////////////////////////////
Gefahrenmeldung(thisReason) {
global
thisGefahrenmeldung(Gefahrenmeldungfile)
return ""
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
xTrigger(thisReason) {
global
thisxTrigger(xTriggerfile)
return ""
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
; 


LVModifyCol() {
global
;Gui, Show, hide
if GUISizeToggle 
{
	GuiControl, -Redraw, LV1
	AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
	GuiControl, Move,lv1, w%AScreenWidth180%  h300
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
	GuiControl, +Redraw, LV1
	Gui, Show, w%AScreenWidth200%  h%AScreenHeight300%
} else {
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,lv1, w545 h300
		LV_ModifyCol(1, "AutoHdr")	; Timestamp
		LV_ModifyCol(2, "AutoHdr")	; Action
		LV_ModifyCol(3, "AutoHdr")	; Name
		LV_ModifyCol(4, "AutoHdr")	; A_ThisFunc
		LV_ModifyCol(5, "AutoHdr")	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	GuiControl, +Redraw, LV1
	Gui, Show, w565 h%AScreenHeight300%
}}

;////////////////////////////////////////////////////////////////////////////////////////////////////////


SunriseSunset(mm,dd){  ; tabelle: cologne
sunrise=
(
08:32	08:06	07:15	07:06	06:04	05:21	05:20	05:56	06:43	07:30	07:22	08:10
08:32	08:05	07:13	07:04	06:02	05:20	05:20	05:57	06:45	07:32	07:23	08:11
08:32	08:03	07:10	07:02	06:00	05:19	05:21	05:59	06:46	07:33	07:25	08:13
08:32	08:02	07:08	06:59	05:58	05:19	05:22	06:00	06:48	07:35	07:27	08:14
08:32	08:00	07:06	06:57	05:56	05:18	05:23	06:02	06:50	07:37	07:28	08:15
08:31	07:59	07:04	06:55	05:55	05:18	05:24	06:03	06:51	07:38	07:30	08:17
08:31	07:57	07:02	06:53	05:53	05:17	05:24	06:05	06:53	07:40	07:32	08:18
08:31	07:55	07:00	06:51	05:51	05:17	05:25	06:06	06:54	07:41	07:34	08:19
08:30	07:54	06:57	06:48	05:50	05:16	05:26	06:08	06:56	07:43	07:35	08:20
08:30	07:52	06:55	06:46	05:48	05:16	05:27	06:09	06:57	07:45	07:37	08:21
08:29	07:50	06:53	06:44	05:46	05:16	05:28	06:11	06:59	07:46	07:39	08:22
08:28	07:48	06:51	06:42	05:45	05:15	05:29	06:12	07:00	07:48	07:40	08:23
08:28	07:46	06:49	06:40	05:43	05:15	05:30	06:14	07:02	07:50	07:42	08:24
08:27	07:45	06:46	06:38	05:42	05:15	05:32	06:15	07:04	07:51	07:44	08:25
08:26	07:43	06:44	06:36	05:40	05:15	05:33	06:17	07:05	07:53	07:45	08:26
08:25	07:41	06:42	06:33	05:39	05:15	05:34	06:18	07:07	07:55	07:47	08:27
08:25	07:39	06:40	06:31	05:37	05:15	05:35	06:20	07:08	07:56	07:49	08:27
08:24	07:37	06:37	06:29	05:36	05:15	05:36	06:22	07:10	07:58	07:50	08:28
08:23	07:35	06:35	06:27	05:35	05:15	05:38	06:23	07:11	08:00	07:52	08:29
08:22	07:33	06:33	06:25	05:33	05:15	05:39	06:25	07:13	08:01	07:54	08:29
08:21	07:31	06:31	06:23	05:32	05:15	05:40	06:26	07:14	08:03	07:55	08:30
08:19	07:29	06:29	06:21	05:31	05:15	05:41	06:28	07:16	08:05	07:57	08:30
08:18	07:27	06:26	06:19	05:30	05:16	05:43	06:29	07:18	08:06	07:58	08:31
08:17	07:25	06:24	06:17	05:29	05:16	05:44	06:31	07:19	08:08	08:00	08:31
08:16	07:23	06:22	06:15	05:27	05:16	05:46	06:32	07:21	08:10	08:01	08:32
08:15	07:21	07:20	06:13	05:26	05:17	05:47	06:34	07:22	08:11	08:03	08:32
08:13	07:19	07:17	06:11	05:25	05:17	05:48	06:36	07:24	08:13	08:04	08:32
08:12	07:17	07:15	06:09	05:24	05:18	05:50	06:37	07:25	08:15	08:06	08:32
08:11		07:13	06:07	05:23	05:18	05:51	06:39	07:27	07:16	08:07	08:32
08:09		07:11	06:05	05:23	05:19	05:53	06:40	07:29	07:18	08:09	08:32
08:08		07:08		05:22		05:54	06:42		07:20		08:32
)

sunset=
(
16:38	17:24	18:13	20:05	20:54	21:38	21:51	21:21	20:20	19:13	17:09	16:31
16:39	17:26	18:15	20:07	20:56	21:39	21:51	21:19	20:18	19:10	17:07	16:30
16:40	17:28	18:17	20:08	20:57	21:40	21:51	21:17	20:16	19:08	17:05	16:30
16:41	17:29	18:19	20:10	20:59	21:41	21:50	21:16	20:14	19:06	17:04	16:29
16:42	17:31	18:20	20:12	21:00	21:42	21:50	21:14	20:11	19:04	17:02	16:29
16:43	17:33	18:22	20:13	21:02	21:43	21:49	21:12	20:09	19:02	17:00	16:29
16:45	17:35	18:24	20:15	21:04	21:44	21:49	21:10	20:07	18:59	16:59	16:28
16:46	17:36	18:25	20:17	21:05	21:45	21:48	21:09	20:05	18:57	16:57	16:28
16:47	17:38	18:27	20:18	21:07	21:46	21:47	21:07	20:02	18:55	16:56	16:28
16:49	17:40	18:29	20:20	21:08	21:46	21:47	21:05	20:00	18:53	16:54	16:28
16:50	17:42	18:30	20:22	21:10	21:47	21:46	21:03	19:58	18:51	16:53	16:28
16:51	17:44	18:32	20:23	21:11	21:48	21:45	21:01	19:56	18:49	16:51	16:27
16:53	17:45	18:34	20:25	21:13	21:48	21:44	20:59	19:53	18:46	16:50	16:27
16:54	17:47	18:35	20:26	21:14	21:49	21:43	20:58	19:51	18:44	16:48	16:27
16:56	17:49	18:37	20:28	21:16	21:49	21:43	20:56	19:49	18:42	16:47	16:28
16:57	17:51	18:39	20:30	21:17	21:50	21:42	20:54	19:47	18:40	16:46	16:28
16:59	17:52	18:40	20:31	21:19	21:50	21:41	20:52	19:44	18:38	16:44	16:28
17:00	17:54	18:42	20:33	21:20	21:51	21:39	20:50	19:42	18:36	16:43	16:28
17:02	17:56	18:44	20:35	21:22	21:51	21:38	20:48	19:40	18:34	16:42	16:29
17:04	17:58	18:45	20:36	21:23	21:51	21:37	20:46	19:38	18:32	16:41	16:29
17:05	17:59	18:47	20:38	21:24	21:52	21:36	20:44	19:35	18:30	16:40	16:29
17:07	18:01	18:49	20:39	21:26	21:52	21:35	20:42	19:33	18:28	16:39	16:30
17:09	18:03	18:50	20:41	21:27	21:52	21:34	20:39	19:31	18:26	16:38	16:30
17:10	18:05	18:52	20:43	21:28	21:52	21:32	20:37	19:28	18:24	16:37	16:31
17:12	18:06	18:54	20:44	21:30	21:52	21:31	20:35	19:26	18:22	16:36	16:32
17:14	18:08	19:55	20:46	21:31	21:52	21:30	20:33	19:24	18:20	16:35	16:32
17:15	18:10	19:57	20:48	21:32	21:52	21:28	20:31	19:22	18:18	16:34	16:33
17:17	18:12	19:59	20:49	21:33	21:52	21:27	20:29	19:19	18:16	16:33	16:34
17:19		20:00	20:51	21:35	21:52	21:25	20:27	19:17	17:14	16:32	16:35
17:20		20:02	20:52	21:36	21:52	21:24	20:25	19:15	17:13	16:32	16:36
17:22		20:04		21:37		21:22	20:22		17:11		16:37
)

for x,y in strsplit(sunrise,"`n","`r")
	for a,b in strsplit(y,"`t")
		if (x=dd and a=mm)
			res :=    b

for x,y in strsplit(sunset,"`n","`r")
	for a,b in strsplit(y,"`t")
		if (x=dd and a=mm)
return 	res .=    "`t" b
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

; https://www.autohotkey.com/boards/viewtopic.php?p=251379#p251379
; Die Sommerzeit beginnt in Deutschland am letzten Sonntag im März und endet am letzten Sonntag im Oktober
; Sommerzeit beginnt am letzten Sonntag im März und endet am letzten Sonntag im Oktober
;MsgBox % IsSummerTime("20180228")			; Winter
;MsgBox % IsSummerTime("20180401")			; Sommer
;MsgBox % IsSummerTime(A_YYYY A_MM A_DD)		; Heute (20181204) Winter
;MsgBox % IsSummerTime("20180931")			; Sommer
;MsgBox % IsSummerTime("20181101")			; Winter
;////////////////////////////////////////////////////////////////////////////////////////////////////////

TagNachtZeiten() {
global
; LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10") 
return 	(IsSummerTime(A_YYYY A_MM A_DD)=1) 
	? TagNachtZeitenMESZ()  " Sommerzeit [ MESZ bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) " ]" 
	: TagNachtZeitenMEZ()  " Winterzeit [ MEZ bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2)) " ]"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisJahresZeit() {
global
; LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10") 
return 	(IsSummerTime(A_YYYY A_MM A_DD)=1) 
;	? "Sommerzeit"
;	: "Winterzeit"
	? "Sommerzeit [ MESZ ]"
	: "Winterzeit [ MEZ ]"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

IsSummerTime(Date)
{
	if (Date >= LastSunday(A_YYYY "03")) && (Date < LastSunday(A_YYYY "10"))
		return 1
	return 0
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

LastSunday(Date)
{
	Date += 31, D
	Date := SubStr(Date, 1, 6)
	Date += -1, Day
	FormatTime, WD, %Date%, WDay
	Date += -(WD - 1), D
	return SubStr(Date, 1, 8)
}

; SubStr(LastSunday(A_YYYY "03"), 7, 2) ; kalendertag Sommeranfang
; SubStr(LastSunday(A_YYYY "03"), 5, 2) ; monat 
; SubStr(LastSunday(A_YYYY "10"), 7, 2) ; kalendertag Winteranfang
; SubStr(LastSunday(A_YYYY "10"), 5, 2) ; monat 
;////////////////////////////////////////////////////////////////////////////////////////////////////////

TagNachtZeitenMESZ() {
global
thisAhour := 0 ; test
Ahour := A_hour
Ahour := thisAhour ? thisAhour : Ahour
if (Ahour>=18) && (Ahour<=21)
return MainArray["TagNachtZeit"] := "Abend 18 bis 22 Uhr"
if (Ahour>=15) && (Ahour<=17)
return MainArray["TagNachtZeit"] := "Nachmittag 15 bis 18 Uhr"
if (Ahour>=13) && (Ahour<=14)
return MainArray["TagNachtZeit"] := "Mittag 13 bis 15 Uhr"
if (Ahour>=11) && (Ahour<=12)
return MainArray["TagNachtZeit"] := "Vormittag 11 bis 13 Uhr"
if (Ahour>=07) && (Ahour<=10)
return MainArray["TagNachtZeit"] := "Morgen 7:00 bis 11 Uhr"
else 
return MainArray["TagNachtZeit"] := "Nacht 22 bis 7 Uhr"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

TagNachtZeitenMEZ() {
global
thisAhour := 0 ; test
Ahour := A_hour
Ahour := thisAhour ? thisAhour : Ahour
if (Ahour>=17) && (Ahour<=20)
return MainArray["TagNachtZeit"] := "Abend 17 bis 21 Uhr"
if (Ahour>=14) && (Ahour<=16)
return MainArray["TagNachtZeit"] := "Nachmittag 14 bis 17 Uhr"
if (Ahour>=12) && (Ahour<=13)
return MainArray["TagNachtZeit"] := "Mittag 12 bis 14 Uhr"
if (Ahour>=10) && (Ahour<=11)
return MainArray["TagNachtZeit"] := "Vormittag 10 bis 12 Uhr"
if (Ahour>=06) && (Ahour<=09)
return MainArray["TagNachtZeit"] := "Morgen 6 bis 10 Uhr"
else 
return MainArray["TagNachtZeit"] := "Nacht 21 bis 6 Uhr"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

;https://www.autohotkey.com/boards/viewtopic.php?p=213907#p213907 by just me

ConvertToMilliseconds(HHMMSSMS)
{
   Sekunden := A_YYYY . "0101" . StrReplace(SubStr(HHMMSSMS, 1, 8), ":")
   Sekunden -= A_YYYY, S
   Return (Sekunden * 1000) + SubStr(HHMMSSMS, 10)
}

ConvertToHHMMSSMS(Millisekunden)
{
   Zeitstempel := A_YYYY ; nur der Deutlichkeit halber, AHK rechnet auch mit leeren Variablen
   Zeitstempel += % (Millisekunden // 1000), S
   FormatTime, HHMMSS, %Zeitstempel%, HH:mm:ss
   Return (HHMMSS . Format(",{:03}", Mod(Millisekunden, 1000)))
}



UPDATEDSCRIPT() {
FileGetAttrib,attribs,%A_ScriptFullPath%
            IfInString,attribs,A
             {
                FileSetAttrib,-A,%A_ScriptFullPath%
                SplashTextOn,,,Updated script,
                Sleep,1500 
                Reload             
}}
;SetTimer,UPDATEDSCRIPT,500
;Return









