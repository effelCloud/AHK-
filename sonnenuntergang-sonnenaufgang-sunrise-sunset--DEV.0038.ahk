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


showHistoryDEVphase := 1
if showHistoryDEVphase
{
	if !fileExist(a_scriptDir "\" A_ScriptName " timeStampall.txt")
	FileAppend,
	(
Programmstart:	28.Okt.2023  05:20:12:553 Uhr	empty	Programmstart	empty	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	28.Okt.2023  08:15:00:801 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	28.Okt.2023  18:16:00:653 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	F1	^F10	Delete	03:31:48	03:45:04	empty	empty	empty
Sondermeldung:	29.Okt.2023  00:00:05:929 Uhr	Hinweis	Beginn: Winterzeit [ MEZ ]	empty	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	29.Okt.2023  07:16:00:567 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	29.Okt.2023  17:14:00:653 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	F1	^F10	Delete	00:00:00	03:45:04	empty	empty	empty
Gefahrenmeldung:	30.Okt.2023  01:22:44:963 Uhr	F10	Sturmwarnung	thisGefahrenmeldung	F10	empty	empty	00:00:00	00:00:00	empty	empty
Sonnenaufgang:	30.Okt.2023  07:18:00:989 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	F5	F5	empty	03:15:00	03:15:02	empty	empty	empty
Sonnenuntergang:	30.Okt.2023  17:13:00:278 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	F4	F4	empty	05:32:41	05:32:41	empty	empty	empty
Sonnenaufgang:	31.Okt.2023  07:20:00:680 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	^F10	^F10	empty	05:33:27	05:33:30	empty	empty	empty
Sonnenuntergang:	31.Okt.2023  17:11:00:368 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	F4	F4	empty	04:32:41	05:32:41	empty	empty	empty
Sonnenaufgang:	01.Nov.2023  07:22:00:398 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	01.Nov.2023  17:09:01:057 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	02.Nov.2023  07:23:00:997 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	02.Nov.2023  17:07:00:969 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	02.Nov.2023  22:01:52:816 Uhr	F2	Sonnenuntergang [ 2 ]	thisSET	F2	F5	empty	00:00:03	03:00:59	empty	empty	empty
Sonnenaufgang:	03.Nov.2023  07:25:04:506 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	F2	F5	empty	09:23:15	12:24:11	empty	empty	empty
Sonnenaufgang:	03.Nov.2023  15:30:34:897 Uhr	F1	Sonnenaufgang [ 2 ]	thisRISE	F1	F2	empty	00:00:00	17:28:45	empty	empty	empty
Sonnenuntergang:	03.Nov.2023  17:05:00:360 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	04.Nov.2023  07:27:04:283 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	F4	F4	empty	13:55:13	13:55:14	empty	empty	empty
Sonnenuntergang:	04.Nov.2023  17:04:04:199 Uhr	start	Sonnenuntergang [ 2 ]	thisSET	F4	F4	empty	01:48:17	01:48:20	empty	empty	empty
Sonnenaufgang:	05.Nov.2023  07:28:04:523 Uhr	start	Sonnenaufgang [ 2 ]	thisRISE	F4	F4	empty	16:12:15	16:12:18	empty	empty	empty
Sonnenuntergang:	05.Nov.2023  17:02:03:849 Uhr	start	Sonnenuntergang [ 3 ]	thisSET	F4	F4	empty	01:46:15	01:46:17	empty	empty	empty
Sonnenaufgang:	06.Nov.2023  07:30:03:624 Uhr	start	Sonnenaufgang [ 3 ]	thisRISE	F4	F4	empty	16:14:14	16:14:17	empty	empty	empty
Sonnenuntergang:	06.Nov.2023  17:00:03:619 Uhr	start	Sonnenuntergang [ 4 ]	thisSET	F4	F4	empty	01:44:14	01:44:17	empty	empty	empty
Sonnenaufgang:	07.Nov.2023  07:32:03:872 Uhr	start	Sonnenaufgang [ 4 ]	thisRISE	F4	F4	empty	16:16:15	16:16:17	empty	empty	empty
Sonnenuntergang:	07.Nov.2023  16:59:00:464 Uhr	start	Sonnenuntergang [ 5 ]	thisSET	F4	F4	empty	01:43:11	01:43:14	empty	empty	empty
Sonnenaufgang:	07.Nov.2023  20:55:01:438 Uhr	F1	Sonnenaufgang [ 5 ]	thisRISE	F1	F4	empty	00:00:00	05:39:12	empty	empty	empty
Sonnenaufgang:	07.Nov.2023  20:56:10:473 Uhr	F1	Sonnenaufgang [ 6 ]	thisRISE	F1	F1	empty	00:00:00	00:01:09	empty	empty	empty
Sonnenaufgang:	08.Nov.2023  07:34:04:344 Uhr	start	Sonnenaufgang [ 7 ]	thisRISE	F1	F1	empty	10:37:53	10:39:03	empty	empty	empty
Sonnenuntergang:	08.Nov.2023  16:57:03:556 Uhr	start	Sonnenuntergang [ 6 ]	thisSET	F1	F1	empty	20:00:53	20:02:02	empty	empty	empty
Sonnenaufgang:	09.Nov.2023  07:35:00:793 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	09.Nov.2023  16:56:00:897 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	10.Nov.2023  07:37:00:922 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	10.Nov.2023  16:54:00:897 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	11.Nov.2023  07:39:00:478 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	11.Nov.2023  16:53:00:715 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	12.Nov.2023  07:40:00:385 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	12.Nov.2023  16:51:01:054 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	13.Nov.2023  07:42:00:276 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	13.Nov.2023  16:50:01:290 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	14.Nov.2023  07:44:00:300 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty

),% a_scriptDir "\" A_ScriptName " timeStampall.txt"
; ),% a_scriptDir "\" A_ScriptName " timeStampall.txt", UTF-8
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

	  MKPic := 1 ; false  ; screenshot vor und nach mitternacht
	; MKPic := 1, MKPicCount := 0 	;  = täglich
	; MKPic := 1 			;  = einmal

	ToggleGUI := 1			; zeige GUI bei Start
	showOnlyEDIT1Update := 1	; einfache (Tooltip2GUI) Ausgabe
	showTooltipAlso := 0 		; tooltip und Tooltip2GUI anzeigen

	; erstellt zuerst eine Liste: Timestamp Sonnenaufgang Sonnenuntergang Sonnenstunden
	ShowMakeList := 0

	; Dieses Script startet bei Sonnenaufgang und Sonnenuntergang je eine Aktion, wie z.B 
	; Jalousie.-Markiesensteuerung und oder Beleuchtung ein bzw. ausschalten.
	; “Triggercmd Smart Home” und Alexa bieten weitere Möglichkeiten zum schalten.

	; Bei Sonnenaufgang wird RISEfile gestartet
	RISEfile		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Bei Sonnenuntergang wird SETfile gestartet
	SETfile 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Gefahrenmeldungfile
	Gefahrenmeldungfile 	:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; xTriggerfile
	xTriggerfile 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"


showGUI2 := 1


if showGUI2
{
Gui +AlwaysOnTop -DPIScale hwndGUIHWND 
;-
wa:=A_screenwidth,ha:=A_screenHeight,xx:=100

/*
;doro
﻿;Name: \\.\DISPLAY1
;Position: (0|0)
;Size: 1366x768
;Is primary? Yes
;Name: \\.\DISPLAY2
;Position: (1366|0)
;Size: 1360x768
;Is primary? No
*/

zoomfactor:=((A_ScreenWidth/1920)*(96/A_ScreenDPI))
;Fs10:= Round(10 * ZoomFactor, 0)
Fs8 :=(8*zoomfactor)
Fs9 :=(9*zoomfactor)
Fs10 :=(10*zoomfactor)
Fs105 :=(10.5*zoomfactor)
Fs11 :=(11*zoomfactor)
Fs12 :=(12*zoomfactor)
Fs13 :=(13*zoomfactor)
Fs14 :=(14*zoomfactor)
Fs15 :=(15*zoomfactor)
Fs16 :=(16*zoomfactor)
;=============================================================	
	color=D4D0C8 
;	Gui,1:Color,Black,Black
;	Gui,1:Color,Gray,Black
	Gui,1:Color,Silver,Black
	Gui,1:add,text,x0 y0 vT1
	
;	Gui,1:Font, s%fs16% cYellow Bold, Verdana
Gui,1:Font, s%fs16% cBlack Bold, Verdana
	;-
	ListViewEinUndAusblenden := 1
    x:=(wa*0)/xx,y:=(ha*1)/xx,w:=(wa*30)/xx  ;- w ist gui width  
;    Gui,1:Add, text,x%x% y%y% w%w% vTextEdit1 hwndhTextEdit1 center section gGeplanteTrigger ,% A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr" ; timestamp
     Gui,1:Add, text,x%x% y%y% w%w% vTextEdit1 hwndhTextEdit1 center section ,% A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr" ; timestamp
	;-
Gui,1:Font, s%fs10% normal,
    ;-
	x:=(wa*1.1)/xx,y:=(ha*5.2)/xx 
	Gui,1:Add, text, x%x% y%y%  , Trigger:
	;-
Gui,1:Font, s%fs10% normal,
	x:=(wa*4.5)/xx,y:=(ha*5)/xx,w:=(wa*1.6)/xx,h:=(ha*2.2)/xx
	Gui,1:Add, edit, x%x% y%y% w%w% h%h% vSonnenEditStunden hwndhSsonnenEditStunden section cWhite center, 00
	;-
Gui,1:Font, s%fs10% normal,
	x:=(wa*6.5)/xx,y:=(ha*5.2)/xx
	Gui,1:Add, text, x%x% y%y%, Stunden
	;-
Gui,1:Font, s%fs10% normal,
	x:=(wa*10)/xx,y:=(ha*5)/xx,w:=(wa*1.6)/xx,h:=(ha*2.2)/xx
	Gui,1:Add, edit, x%x% y%y% w%w% h%h%  vSonnenEditMinuten hwndhSsonnenEditMinuten cWhite center, 02
	;-
Gui,1:Font, s%fs10% normal,
	x:=(wa*12)/xx,y:=(ha*5.2)/xx
	Gui,1:Add, text, x%x% y%y% , Minuten
	;-
Gui,1:Font, s%fs10% normal,
    ;-
	x:=(wa*15.5)/xx,y:=(ha*5)/xx,w:=(wa*13.5)/xx
	Gui,1:Add, DropDownList, x%x% y%y% w%w% r15 section vddl1 choose1, %a_space%Trigger auswählen...		;		%Trigger auswählen...
								| vor Sonnenaufgang
								| nach Sonnenaufgang
								| vor Sonnenuntergang
								| nach Sonnenuntergang
								| nach MEZ > MESZ Wechsel
								| nach MESZ > MEZ Wechsel
								| nach Morgen 07 bis 11 Uhr
								| nach Vormittag 11:00 bis 13 Uhr
								| nach Mittag 13 bis 15 Uhr
								| nach Nachmittag 15 bis 18 Uhr
								| nach Abend 18 bis 22 Uhr
								| nach Nacht 22 bis 7 Uhr
								| nach Sturmwarnung
								| nach Pollenwarnung
    ;-								
	x:=(wa*1)/xx,	y:=(ha*8.5)/xx,	w:=(wa*28)/xx
	Gui,1:Add, DropDownList,x%x% y%y% w%w% vddl3 choose1,  %a_space%Trigger Datei auswählen...		;		Trigger Datei auswählen...
								| Öffnen...
								| Telegram Msg an Service
								| Telegram Msg an Bereitschaft
								| Lüftung Raum G einschalten
								| Lüftung Raum G ausschalten
								| Heizung einschalten
								| Heizung ausschalten
								| Heizung 21 Grad
								| Markiese Wohnzimmer einfahren
								| Markiese Wohnzimmer 50 `%
								| Markiese Wohnzimmer ausfahren
								| Jalousien Küche rauf
								| Jalousien Küche 50 `%
								| Jalousien Küche runter
								| Beleuchtung Hof Lampe 1B einschalten
								| Beleuchtung Hof Lampe 1B ausschalten
								| Steckdose xP-23 (Lager) einschalten
								| Steckdose xP-23 (Lager) ausschalten
								| Alarmanlage Zugang 1 aktivieren
								| Alarmanlage Zugang 1 ausschalten
	;-



MaßNehmen := 0 ; Stellt das Steuerelement als Rechteck dar, das mit der aktuellen Farbe des Fensterrahmens gefüllt ist. Diese Farbe ist standardmäßig schwarz



Gui,1:Font, s%fs10% normal,											;		Wiederholen
	x:=(wa*1)/xx,	y:=(ha*12.1)/xx,	w:=(wa*28)/xx,	h:=(ha*4.8)/xx
	Gui,1:Add, GroupBox,x%x% y%y% w%w% h%h%  vGroupBoxA,  %a_Space%Wiederholen%a_Space%
	;-
Gui,1:Font, s%fs10% normal,
	x:=(wa*1.5)/xx,y:=(ha*14.2)/xx
	Gui,1:Add, radio, x%x% y%y% vRadioEinmal hwndhRadioEinmal section , einmal
	x:=(wa*6)/xx,y:=(ha*14.2)/xx
	Gui,1:Add, radio, x%x% y%y% vRadioTäglich hwndhRadioTäglich checked , täglich
	x:=(wa*10.5)/xx,y:=(ha*14.2)/xx
	Gui,1:Add, radio, x%x% y%y% vRadioWöchendlich hwndhRadioWöchendlich , wöchendlich
	x:=(wa*17.5)/xx,y:=(ha*14.2)/xx
	Gui,1:Add, radio, x%x% y%y% vRadioMonatlich hwndhRadioMonatlich , monatlich
	x:=(wa*23.5)/xx,y:=(ha*14.2)/xx
	Gui,1:Add, radio, x%x% y%y% vRadioJährlich hwndhRadioJährlich , jährlich
	color=Aqua
;	color=Teal
;	color=Silver

; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Geplante Trigger: (über listview1) 
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Geplante Trigger: (über listview1) 
/*
fileRead, getguicontrols,% a_scriptDir "\" a_scriptName
loop, parse, getguicontrols, `n
if inStr(a_loopField,"GuiControl,1:    ") && inStr(a_loopField,"show")
clipboard .= a_loopField "`n"
msgbox % a_scriptName "`n" clipboard 
	GuiControl,1:    hide, 			GroupBoxÜberListView1
	GuiControl,1:    hide, 			Übernehmen
	GuiControl,1:    hide, 			GroupBoxUnterListView1
	GuiControl,1:    hide, 			ListView1
	GuiControl,1:    hide, 			mehr
	GuiControl,1:    hide, 			MarkierteLöschen
	GuiControl,1:    hide, 			ListeExportieren
	GuiControl,1:    hide, 			ListeImportieren
	GuiControl,1:    hide, 			GroupBoxNächsteSystemAktion
	GuiControl,1:    hide, 			NächsteGeplanteSystemAction
	GuiControl,1:    hide, 			GroupBoxLOG
	GuiControl,1:    hide, 			GroupBoxUnterLOGListview
	GuiControl,1:    hide, 			LogListeExportieren
	GuiControl,1:    hide, 			LV1

	GuiControl,1:    show, 			GroupBoxÜberListView1
	GuiControl,1:    show, 			Übernehmen
	GuiControl,1:    show, 			GroupBoxUnterListView1
	GuiControl,1:    show, 			ListView1
	GuiControl,1:    show, 			mehr
	GuiControl,1:    show, 			MarkierteLöschen
	GuiControl,1:    show, 			ListeExportieren
	GuiControl,1:    show, 			ListeImportieren
	GuiControl,1:    show, 			GroupBoxNächsteSystemAktion
	GuiControl,1:    show, 			NächsteGeplanteSystemAction
	GuiControl,1:    show, 			GroupBoxLOG
	GuiControl,1:    show, 			GroupBoxUnterLOGListview
	GuiControl,1:    show, 			LogListeExportieren
	GuiControl,1:    show, 			LV1
*/
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Geplante Trigger: (über listview1) 
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Geplante Trigger: (über listview1) 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxÜberListView1 cBlue  ; Maß nehmen
	else
	Gui,1:Add, GroupBox, vGroupBoxÜberListView1 Hidden 
	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		GroupBoxÜberListView1, 			% thisX(1.0) thisY(21.2) thisW(28.0) thisH(2.0) ;  default
	GuiControl,1:    Font, 			GroupBoxÜberListView1
	GuiControl,1: ,  GroupBoxÜberListView1, 					%a_Space%Geplante Trigger:%a_Space% 
	GuiControl,1:    show, 			GroupBoxÜberListView1
;	GuiControl,1:    hide, 			GroupBoxÜberListView1
;	GuiControl,1:    focus, 		GroupBoxÜberListView1
;	GuiControl,1:    disable, 		GroupBoxÜberListView1
;	GuiControl,1:    enable, 		GroupBoxÜberListView1
; ////////////////////////////////////////////////////////////////////////////////////	button ListView (oben) AnsichErweitern
;	if !MaßNehmen
;	Gui,1: Add, text , 0x1000 vListViewAnsichErweitern 	; Maß nehmen
;	else
	Gui,1:Add, button, vListViewAnsichErweitern Hidden gListViewEinUndAusblenden  
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		ListViewAnsichErweitern, 				% thisX(14.5) thisY(18.0) thisW(7.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ListViewAnsichErweitern
	GuiControl,1: ,  ListViewAnsichErweitern, 							Ansicht erweitern
	GuiControl,1:    show, 			ListViewAnsichErweitern
;	GuiControl,1:    hide, 			ListViewAnsichErweitern
;	GuiControl,1:    focus, 		ListViewAnsichErweitern
;	GuiControl,1:    disable, 		ListViewAnsichErweitern
;	GuiControl,1:    enable, 		ListViewAnsichErweitern
; ////////////////////////////////////////////////////////////////////////////////////	button Übernehmen
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vÜbernehmen	; Maß nehmen
	else
	Gui,1:Add, button, vÜbernehmen Hidden 
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		Übernehmen, 				% thisX(22.5) thisY(18.0) thisW(5.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			Übernehmen
	GuiControl,1: ,  Übernehmen, 							Übernehmen
	GuiControl,1:    show, 			Übernehmen
;	GuiControl,1:    hide, 			Übernehmen
;	GuiControl,1:    focus, 		Übernehmen
;	GuiControl,1:    disable, 		Übernehmen
;	GuiControl,1:    enable, 		Übernehmen
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox (unter listview1) 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxUnterListView1	; Maß nehmen
	else
	Gui,1:Add, GroupBox, vGroupBoxUnterListView1 Hidden 
	Gui,1: Font,									 % thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1,			 % thisX(1.0) thisY(42.0) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    Font, 			GroupBoxUnterListView1
;	GuiControl,1: ,  GroupBoxUnterListView1, 					; empty
	GuiControl,1:    show, 			GroupBoxUnterListView1
;	GuiControl,1:    hide, 			GroupBoxUnterListView1
;	GuiControl,1:    focus, 		GroupBoxUnterListView1
;	GuiControl,1:    disable, 		GroupBoxUnterListView1
;	GuiControl,1:    enable, 		GroupBoxUnterListView1
; ////////////////////////////////////////////////////////////////////////////////////	ListView1 (oben) 
;	color=Aqua
;	color=Teal
	color=e9e3ff
;	color=D4D0C8 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListView1 	; Maß nehmen
	else
	Gui,1: Add, listview, vListView1 hwndhListView1 grid background%color% cBlack Hidden	
									, HH
									. |MM
									. |Trigger
									. |Trigger File
	LV_ModifyCol(1,(wa*2)/xx)
	LV_ModifyCol(2,(wa*2)/xx)
	LV_ModifyCol(3,(wa*6)/xx)
	LV_ModifyCol(4,(wa*16.5)/xx)

	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(20.0) ;  default
	GuiControl,1:    Font, 			ListView1
	GuiControl,1:    show, 			ListView1
;	GuiControl,1:    hide, 			ListView1
;	GuiControl,1:    focus, 		ListView1
;	GuiControl,1:    disable, 		ListView1
;	GuiControl,1:    enable, 		ListView1
; ////////////////////////////////////////////////////////////////////////////////////	button mehr... im geplante trigger_listview
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vmehr     	; Maß nehmen
	else
	Gui,1: Add, button , 	vmehr Hidden	
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		mehr,					% thisX(25.0) thisY(43.5) thisW(3.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			mehr
	GuiControl,1: ,  			mehr,					mehr...
	GuiControl,1:    show, 			mehr
;	GuiControl,1:    hide, 			mehr
;	GuiControl,1:    focus, 		mehr
;	GuiControl,1:    disable, 		mehr
;	GuiControl,1:    enable, 		mehr
; ////////////////////////////////////////////////////////////////////////////////////	button Markierte Einträge im trigger_listview Löschen 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vMarkierteLöschen ; Maß nehmen
	else
	Gui,1: Add, button , 	vMarkierteLöschen Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		MarkierteLöschen,			% thisX(17.1) thisY(43.5) thisW(7.6) thisH(2.6) ;  default
	GuiControl,1:    Font, 			MarkierteLöschen
	GuiControl,1: ,  			MarkierteLöschen, 			Markierte löschen
	GuiControl,1:    show, 			MarkierteLöschen
;	GuiControl,1:    hide, 			MarkierteLöschen
;	GuiControl,1:    focus, 		MarkierteLöschen
;	GuiControl,1:    disable, 		MarkierteLöschen
;	GuiControl,1:    enable, 		MarkierteLöschen
; ////////////////////////////////////////////////////////////////////////////////////	button trigger_listview Liste exportieren
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListeExportieren ; Maß nehmen
	else
	Gui,1: Add, button , 	vListeExportieren Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		ListeExportieren,			% thisX(9.3) thisY(43.5) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ListeExportieren
	GuiControl,1: ,  			ListeExportieren, 			Liste exportieren
	GuiControl,1:    show, 			ListeExportieren
;	GuiControl,1:    hide, 			ListeExportieren
;	GuiControl,1:    focus, 		ListeExportieren
;	GuiControl,1:    disable, 		ListeExportieren
;	GuiControl,1:    enable, 		ListeExportieren
; ////////////////////////////////////////////////////////////////////////////////////	button Liste importieren
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListeImportieren ; Maß nehmen
	else
	Gui,1: Add, button , 	vListeImportieren Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(43.5) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ListeImportieren
	GuiControl,1: ,  			ListeImportieren, 			Liste importieren
	GuiControl,1:    show, 			ListeImportieren
;	GuiControl,1:    hide, 			ListeImportieren
;	GuiControl,1:    focus, 		ListeImportieren
;	GuiControl,1:    disable, 		ListeImportieren
;	GuiControl,1:    enable, 		ListeImportieren
; ////////////////////////////////////////////////////////////////////////////////////  GroupBox Nächste System Aktion
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxNächsteSystemAktion	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBLUE vGroupBoxNächsteSystemAktion	Hidden	
	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		GroupBoxNächsteSystemAktion, 		% thisX(1.0) thisY(47.5) thisW(28.0) thisH(4.2) ;  default
	GuiControl,1:    Font, 			GroupBoxNächsteSystemAktion
	GuiControl,1: ,  GroupBoxNächsteSystemAktion, 					%a_Space%Nächste System Aktion:%a_Space%
	GuiControl,1:    show, 			GroupBoxNächsteSystemAktion
;	GuiControl,1:    hide, 			GroupBoxNächsteSystemAktion
;	GuiControl,1:    focus, 		GroupBoxNächsteSystemAktion
;	GuiControl,1:    disable, 		GroupBoxNächsteSystemAktion
;	GuiControl,1:    enable, 		GroupBoxNächsteSystemAktion
; ////////////////////////////////////////////////////////////////////////////////////	text Nächste System Aktion
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vNächsteGeplanteSystemAction ; Maß nehmen
	else
	Gui,1: Add, text , 	vNächsteGeplanteSystemAction cBLUE Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		NächsteGeplanteSystemAction,		% thisX(2.5) thisY(49.5) thisW(26) thisH(2) ;  default
	GuiControl,1:    Font, 			NächsteGeplanteSystemAction
	GuiControl,1: ,  			NächsteGeplanteSystemAction, 		;Nächste System Aktion
	GuiControl,1:    show, 			NächsteGeplanteSystemAction
;	GuiControl,1:    hide, 			NächsteGeplanteSystemAction
;	GuiControl,1:    focus, 		NächsteGeplanteSystemAction
;	GuiControl,1:    disable, 		NächsteGeplanteSystemAction
;	GuiControl,1:    enable, 		NächsteGeplanteSystemAction
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox LOG: 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxLOG	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBLUE vGroupBoxLOG	Hidden	
	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		GroupBoxLOG, 				% thisX(1.0) thisY(52.8) thisW(28.0) thisH(2.11) ;  default
	GuiControl,1:    Font, 			GroupBoxLOG
	GuiControl,1: ,  GroupBoxLOG, 							%a_Space%Log:%a_Space%
	GuiControl,1:    show, 			GroupBoxLOG
;	GuiControl,1:    hide, 			GroupBoxLOG
;	GuiControl,1:    focus, 		GroupBoxLOG
;	GuiControl,1:    disable, 		GroupBoxLOG
;	GuiControl,1:    enable, 		GroupBoxLOG
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox unter LOGListview
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxUnterLOGListview	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBLUE vGroupBoxUnterLOGListview Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		GroupBoxUnterLOGListview, 		% thisX(1.0) thisY(73.7) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    Font, 			GroupBoxUnterLOGListview
;	GuiControl,1: ,  GroupBoxUnterLOGListview, 					; empty
	GuiControl,1:    show, 			GroupBoxUnterLOGListview
;	GuiControl,1:    hide, 			GroupBoxUnterLOGListview
;	GuiControl,1:    focus, 		GroupBoxUnterLOGListview
;	GuiControl,1:    disable, 		GroupBoxUnterLOGListview
;	GuiControl,1:    enable, 		GroupBoxUnterLOGListview
; ////////////////////////////////////////////////////////////////////////////////////	button Log Liste Exportieren
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vLogListeExportieren	; Maß nehmen
	else
	Gui,1: Add, button , 	vLogListeExportieren Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(10.01) 
	GuiControl,1:    MoveDraw, 		LogListeExportieren, 			% thisX(19.5) thisY(75.2) thisW(8.9) thisH(2.6) ;  default
	GuiControl,1:    Font, 			LogListeExportieren
	GuiControl,1: ,  LogListeExportieren, 	Logdaten exportieren
	GuiControl,1:    show, 			LogListeExportieren
;	GuiControl,1:    hide, 			LogListeExportieren
;	GuiControl,1:    focus, 		LogListeExportieren
;	GuiControl,1:    disable, 		LogListeExportieren
;	GuiControl,1:    enable, 		LogListeExportieren
; ////////////////////////////////////////////////////////////////////////////////////  ListView LOG LV1
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vLV1 	; Maß nehmen
	else
	Gui,1: Add, listview, vLV1 hwndhLV1 grid background%color% cBlack Hidden	
									, Timestamp
									. |ThisLabel
									. |Name
									. |ThisFunc
									. |ThisHotkey
									. |PriorHotkey
									. |PriorKey
									. |TimeSinceThisHotkey
									. |TimeSincePriorHotkey
									. |GuiControl
									. |GuiEvent
									. |EventInfo
	LV_ModifyCol(1,(wa*1.9)/xx)
	LV_ModifyCol(2,(wa*1.9)/xx)
	LV_ModifyCol(3,(wa*6)/xx)
	LV_ModifyCol(4,(wa*17)/xx)

	Gui,1: Font,									% thisZoomFactorNormal(10.01)
	GuiControl,1:    MoveDraw, 		LV1, 					% thisX(1.0) thisY(54.8) thisW(28.0) thisH(20.0) ;  default
	GuiControl,1:    Font, 			LV1
	GuiControl,1:    show, 			LV1
;	GuiControl,1:    hide, 			LV1
;	GuiControl,1:    focus, 		LV1
;	GuiControl,1:    disable, 		LV1
;	GuiControl,1:    enable, 		LV1
; ////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////
;-	

Gui,1:Font, s%fs11% normal,
	x:=(wa*30)/xx,	y:=(ha*1)/xx,	w:=(wa*34)/xx,	h:=(ha*15)/xx
	Gui,1:Add, GroupBox,x%x% y%y% w%w% h%h%  vGroupBoxB,  %a_Space%Sonne%a_Space%
	x:=(wa*30)/xx,	y:=(ha*17)/xx,	w:=(wa*34)/xx,	h:=(ha*15)/xx
	Gui,1:Add, GroupBox,x%x% y%y% w%w% h%h%  vGroupBoxC,  %a_Space%Mond%a_Space%
	x:=(wa*30)/xx,	y:=(ha*33)/xx,	w:=(wa*34)/xx,	h:=(ha*15)/xx
	Gui,1:Add, GroupBox,x%x% y%y% w%w% h%h%  vGroupBoxD,  %a_Space%Wetter%a_Space%
	x:=(wa*30)/xx,	y:=(ha*49)/xx,	w:=(wa*34)/xx,	h:=(ha*15)/xx
	Gui,1:Add, GroupBox,x%x% y%y% w%w% h%h%  vGroupBoxE,  %a_Space%Umwelt%a_Space%
	;-
;----
; https://www.autohotkey.com/boards/viewtopic.php?p=39229#p39229
; Bildschirmbreite ermitteln, ZoomFaktor berechnen (100%=1920px)
; Berechnung der korrigierten Pixel als Variable Ln
loop, 2000
	L%A_Index% := Round(A_Index * ZoomFactor, 0)

WinGetPos, X, Y, Width, SysWinHoehe, ahk_class Shell_TrayWnd
hoehe := L1080 - SysWinHoehe

showGUIzweiFULL := 0
if showGUIzweiFULL
{
;Gui, 1: -Border
;gui,show, x0 y0 w%L1920% h%A_screenHeight% ,% strReplace((substr(a_scriptname,-11)),".ahk")
 gui,show, x0 y0 w%L1920% h%L1080% ,% strReplace((substr(a_scriptname,-11)),".ahk")
} else {
x:=(wa*29)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
;  gui,show,x-1650 y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
   gui,show,x%x% y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
}
; gui,show,x%x% y%y% w%w% h%h% ,TEST	
;GuiControl,1: Focus,T1			
GuiControl,1: Focus,LV1
;GuiControl,1: hide,ListView1
;GuiControl,1: focus, ListeImportieren
} else {   ; #################################################################################################################################################################################################################################
;- Die Lesbarkeit auf dem Bildschirm erleichtern 
;- https://www.autohotkey.com/boards/viewtopic.php?f=9&t=122977

	Gui +AlwaysOnTop hwndGUIHWND 
	Gui -DPIScale
	wa:=A_screenwidth,ha:=A_screenHeight,xx:=100
	Gui,1:Color,Gray,Black
	
	;-https://www.autohotkey.com/boards/viewtopic.php?p=39229#p39229  user Gurkentoepfer  2015-02-25
    ZoomFactor := A_ScreenWidth/1920 * 96/A_ScreenDPI
    ;-
     Fs16 := Round(16 * ZoomFactor, 0)
    Gui,1:Font, s%fs16% cMaroon Bold, Verdana
	;-
    x:=(wa*0)/xx,y:=(ha*1)/xx,w:=(wa*30)/xx  ;- w ist gui width  
    Gui,1:Add, text,x%x% y%y% w%w% vTextEdit1 hwndhTextEdit1 center section,% A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr" ; timestamp
	;-
	Fs10 := Round(10 * ZoomFactor, 0)
	Gui,1:Font, s%fs10% cYellow 
    ;-
	x:=(wa*1.5)/xx,y:=(ha*5)/xx 
	Gui,1:Add, text, x%x% y%y%  , Trigger:
	;-
	x:=(wa*5)/xx,y:=(ha*5)/xx,w:=(wa*1.6)/xx,h:=(ha*2.2)/xx
	Gui,1:Add, edit, x%x% y%y% w%w% h%h% vSonnenEditStunden hwndhSsonnenEditStunden section center, 00
	;-
	x:=(wa*7)/xx,y:=(ha*5)/xx
	Gui,1:Add, text, x%x% y%y%, Stunden
    ;-	
	x:=(wa*12)/xx,y:=(ha*5)/xx,w:=(wa*1.6)/xx,h:=(ha*2.2)/xx
	Gui,1:Add, edit, x%x% y%y% w%w% h%h%  vSonnenEditMinuten hwndhSsonnenEditMinuten center, 59
	;-
	x:=(wa*14)/xx,y:=(ha*5)/xx
	Gui,1:Add, text, x%x% y%y% , Minuten
	;-
	x:=(wa*18)/xx,y:=(ha*5)/xx,w:=(wa*10.5)/xx
	Gui,1:Add, DropDownList, x%x% y%y% w%w% r5 section vddl1 choose1, Trigger auswählen...
								| vor Sonnenaufgang
								| nach Sonnenaufgang
								| vor Sonnenuntergang
								| nach Sonnenuntergang
						
    ;-			********************************************************************************					
;	x:=(wa*0)/xx,	y:=(ha*1)/xx,	w:=(wa*30)/xx  ;- w ist gui width  
	x:=(wa*1)/xx,	y:=(ha*8.5)/xx,	w:=(wa*28)/xx
	Gui,1:Add, DropDownList,x%x% y%y% w%w% vddl3 +center choose1,  Trigger Datei auswählen...| Öffnen...
	;-
	color=D4D0C8 

	x:=(wa*1)/xx,y:=(ha*13)/xx,w:=(wa*28)/xx,h:=(ha*20)/xx
	Gui,1:Add, listview, x%x% y%y% w%w% h%h%  vListView1 hwndhListView1 grid background%color% cBlack , HH|MM|Trigger|Trigger File
	T1:=(wa*1.9)/xx,T2:=(wa*1.9)/xx,T3:=(wa*6)/xx,T4:=(wa*17)/xx
    LV_ModifyCol(1,T1),LV_ModifyCol(2,T2),LV_ModifyCol(3,T3),LV_ModifyCol(4,T4)
	
;	Gui,1:Add, listview, x10 ym+390 	w545 r7  vLV1 hwndhLV1 grid, Timestamp|ThisLabel|Name|ThisFunc|ThisHotkey|PriorHotkey|PriorKey|TimeSinceThisHotkey|TimeSincePriorHotkey|GuiControl|GuiEvent|EventInfo

	x:=(wa*1)/xx,y:=(ha*43)/xx,w:=(wa*28)/xx,h:=(ha*20)/xx
	Gui,1:Add, listview, x%x% y%y% w%w% h%h%  vLV1 hwndhLV1 grid, Timestamp|ThisLabel|Name|ThisFunc|ThisHotkey|PriorHotkey|PriorKey|TimeSinceThisHotkey|TimeSincePriorHotkey|GuiControl|GuiEvent|EventInfo
	T1:=(wa*1.9)/xx,T2:=(wa*1.9)/xx,T3:=(wa*6)/xx,T4:=(wa*17)/xx
;    LV_ModifyCol(1,T1),LV_ModifyCol(2,T2),LV_ModifyCol(3,T3),LV_ModifyCol(4,T4)


x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST		
}
;----------------------------------------------- load history
;----------------------------------------------- load history
;msgbox %  A_DefaultListView
Gui,1:ListView, LV1 
	fileRead, thisReloadtimeStamp,  % a_scriptDir "\" A_ScriptName " timeStampall.txt"
	GuiControl, -Redraw, LV1
	Loop, parse, thisReloadtimeStamp,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if !LoadListViewFull {
	if a_loopfield contains Programmstart,exitapp, Uhr	F1	, Uhr	F2	 ; space=TAB
	continue
	}
	if inStr(a_loopfield,"exitapp")
	continue

	split2  := strReplace(split.2,(SubStr(split.2, -7)))	; Uhr
	split2a := strReplace(split.2,(SubStr(split.2, -28)))	; wochentag
	split2b  := strReplace(split2,split2a)
	if split2
;	x:=LV_Modify(LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12), "Vis")
	x:=LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12)
	LV_Modify(x, "+Focus")
	LV_Modify(x, "Vis")
	}
;	GuiControl, +Redraw, LV1
}
	GuiControl, +Redraw, LV1

/*
;----------------------------------------------- load sonnenuntergang-sonnenaufgang-sunrise-sunset
Gui, ListView, LV2
	fileRead, thisReloadSunriseSunsetYYYY,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
	Loop, parse, thisReloadSunriseSunsetYYYY,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if (a_index=1)
	continue
	x:=LVaddLine ;= LV_Modify(LV_Add("", ((a_index=1) ? ("") : (a_index-1)), split.1, split.2, split.3, split.4, split.5, split.6), "Vis")
		LV_ModifyCol(1, "AutoHdr")	; Datum
		LV_ModifyCol(2, "AutoHdr")	; Sonnenaufgang
		LV_ModifyCol(3, "AutoHdr")	; Sonnenuntergang
		LV_ModifyCol(4, "AutoHdr")	; Sonnenstunden
		LV_ModifyCol(5, "AutoHdr")	; SonnenstundenSpeak
		LV_ModifyCol(6, "AutoHdr")	; SonnenstundenSpeak
	LV_Modify(x, "Vis")
	;msgbox % split.1 "`n" split2 "`n" split2b
	}}
;----------------------------------------------- load result ; DayCounter ; 
Gui, ListView, LV1
*/









		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

		if LVInsertADD
		x:=LV_Insert(1 , Optionen, A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
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
		x:=LV_Modify(LV_Add("", A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
							, (A_ThisLabel?A_ThisLabel:"System")
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
	LV_Modify(x, "Vis")
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

;	Gui, Show, x110 y31 w565 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
guicontrol, hide, edit3 
guicontrol, hide, tab3
	settimer, toolTip, 300
	if !MakeList
	settimer, start, -1

;/////////////////////////////////////////////////////////////////////############################################################################
;/////////////////////////////////////////////////////////////////////############################################################################
;/////////////////////////////////////////////////////////////////////############################################################################

; todo
isLeapYear := 0 ; is schaltjahr if isLeapYear 



if isLeapYear 
{  ; isLeapYear 
   if MakeList
   { ; SunriseSunsetSchaltjahr(mm,dd)
		try filedelete,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
			for thisMonth, month in strSplit("31,29,31,30,31,30,31,31,30,31,30,31",",") {  ; is schaltjahr if isLeapYear 
				loop,% month 
				{
				thisDay++
				if (thisDay>=31) && (thisMonth=12)
				continue
				AMM := thisMonth, ADD := thisDay
				gosub start
			;	sleep, 10  ; test
				}
				thisDay:=0
			} 

		fileAppend,% thisres,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
		if ShowMakeList
		try run,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
   }  ; MakeList
} else { ; isLeapYear }
   if MakeList
   {  ; SunriseSunset(mm,dd)
		try filedelete,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
			for thisMonth, month in strSplit("31,28,31,30,31,30,31,31,30,31,30,31",",") {
				loop,% month 
				{
				if !month
				continue
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
   }  ; MakeList

}  ; isLeapYear }
;/////////////////////////////////////////////////////////////////////############################################################################
;/////////////////////////////////////////////////////////////////////############################################################################
;/////////////////////////////////////////////////////////////////////############################################################################



; 	if (DayCounter>=365) ; if isLeapYear ; isLeapYear := 0
;	if (DayCounter=365)
;	if (thisDay>=31) && (thisMonth=12)
	if (thisDay>=0) && (thisMonth=12)
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


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

; isSchaltjahrTrueFalse()
Gui, ListView, LV2
Gui, listview, default
; https://www.autohotkey.com/boards/viewtopic.php?p=387176#p387176 <>  ListView 
; RowsPerPage := DllCall("SendMessage", "Ptr", HW01, "UInt", 0x1028, "Ptr", 0, "Ptr", 0, "Ptr")

/*
	testTMP272 := 0 					; 2 default
	if (testTMP272=1) 				; 1
	{

	isSchaltjahrTrueFalse := 1 ; morgen

	   xModify#1 :=  (isSchaltjahrTrueFalse=0)
			? (A_YDay)
			: (isSchaltjahrTrueFalse=1)
			? (A_YDay+1)
			: ""
	} 
	else 
	if (testTMP272=2) ; heute 			; 2 default
	{
	xModify#1 :=  (isSchaltjahrTrueFalse()=0)
			? (A_YDay)			; kein Schaltjahr
			: (isSchaltjahrTrueFalse()=1)
			? (A_YDay+1)			; Schaltjahr ( plus 1 day )
			: ""
	} 
	else 
	if (testTMP272=3) ; test 			; 3
	{
	xModify#1 :=  (isSchaltjahrTrueFalse()=0)
			? (A_YDay+59)
			: (isSchaltjahrTrueFalse()=1)
			? (A_YDay+10)
			: ""
	}
*/
	; 28.02 = a_day = Tag 59 ; wenn schaltjahr dann ab 28.februar plus ein tag
 	xModify#1 :=  MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] := 	 ((A_YDay>=59) && (isSchaltjahrTrueFalse()=1))
											? (A_YDay+1)
											: (isSchaltjahrTrueFalse()=0)
											? (A_YDay)
											: ""
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;----------------------------------------------- load sonnenuntergang-sonnenaufgang-sunrise-sunset
Gui, ListView, LV2
Gui, listview, default
	GuiControl, -Redraw, LV2
;	fileRead, thisReloadSunriseSunsetYYYY,% a_scriptDir "\sonnenuntergang-sonnenaufgang-sunrise-sunset.csv"
	Loop, parse, thisReloadSunriseSunsetYYYY,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if (a_index=1)
	continue
	x:=LV_Modify(LV_Add("", ((a_index=1) ? ("") : (a_index-1)), split.1, split.2, split.3, split.4, split.5, split.6), "Vis")
		LV_ModifyCol(1, "AutoHdr")	; Datum
		LV_ModifyCol(2, "AutoHdr")	; Sonnenaufgang
		LV_ModifyCol(3, "AutoHdr")	; Sonnenuntergang
		LV_ModifyCol(4, "AutoHdr")	; Sonnenstunden
		LV_ModifyCol(5, "AutoHdr")	; SonnenstundenSpeak
		LV_ModifyCol(6, "AutoHdr")	; SonnenstundenSpeak
;	LV_Modify(x, "Vis")
	;msgbox % split.1 "`n" split2 "`n" split2b
	}}
;----------------------------------------------- load result ; DayCounter ; 
	GuiControl, +Redraw, LV2

LV_Modify((xModify#1+(RowsPerPage/2)), "Vis")
LV_Modify(xModify#1-6, "Vis")
LV_Modify(xModify#1, "+Focus")
LV_Modify(xModify#1, "+Select")
LV_Modify(xModify#1, "focus")
;send, {Tab}
Gui, ListView, LV1
; send, {TAB}
 send, {DOWN}

;	Gui, Show, x110 y31 w565 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if showMsgBoxTest#854a
msgbox,,% a_lineNumber, % "showMsgBoxTest#854a = " showMsgBoxTest#854a "`n" test#854a

;settimer, sekundenTrigger, 1000
;settimer, Sondermeldung, -5000
;setTimer, ^F10, -100			; GUI maximal vergrößern für debug view





; clipboard := MainArray["nextScheduledAction"]
settimer, showhideListView1, 500

return 	; firstreturn

ButtonAdd:
Gui, Submit , NoHide
MsgBox,262144,, % TextEdit1 "`n"
	. SonnenEditStunden "`n"
	. SonnenEditMinuten "`n"
	. trim(ddl1) "`n"
	. trim(ddl3) "`n"
	. RadioEinmal "`n"
	. RadioTäglich 
return
showhideListView1:
gui, submit, nohide
;GuiControlGet, ListViewEinUndAusblenden
;ListViewEinUndAusblenden := (ListViewEinUndAusblenden:=!ListViewEinUndAusblenden)
Return


ListViewEinUndAusblenden: 								; 
gui, submit, nohide
;GuiControlGet, ListViewEinUndAusblenden
ListViewEinUndAusblenden := (ListViewEinUndAusblenden:=!ListViewEinUndAusblenden)
if !ListViewEinUndAusblenden
{
;	GuiControl,1:    hide, 			GroupBoxÜberListView1
;	GuiControl,1:    hide, 			Übernehmen
	GuiControl,1:    hide, 			GroupBoxUnterListView1
	GuiControl,1:    hide, 			ListView1
;	GuiControl,1:    hide, 			mehr
;	GuiControl,1:    hide, 			MarkierteLöschen
;	GuiControl,1:    hide, 			ListeExportieren
;	GuiControl,1:    hide, 			ListeImportieren
	GuiControl,1:    hide, 			GroupBoxNächsteSystemAktion
	GuiControl,1:    hide, 			NächsteGeplanteSystemAction
	GuiControl,1:    hide, 			GroupBoxLOG
	GuiControl,1:    hide, 			GroupBoxUnterLOGListview
	GuiControl,1:    hide, 			LogListeExportieren
	GuiControl,1:    hide, 			LV1

	GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(51.8) ;  default
	GuiControl,1:    show, 			ListView1
;	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1, 		% thisX(1.0) thisY(72.0) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1, 		% thisX(1.0) thisY(73.7) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    show, 			GroupBoxUnterListView1
	GuiControl,1:    MoveDraw, 		mehr,					% thisX(25.0) thisY(75.2) thisW(3.5) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		MarkierteLöschen,			% thisX(17.1) thisY(75.2) thisW(7.6) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		ListeExportieren,			% thisX(9.3) thisY(75.2) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(75.2) thisW(7.4) thisH(2.6) ;  default

} else {
; 	GuiControl,1:    MoveDraw, 		LogListeExportieren, 			% thisX(19.5) thisY(75.2) thisW(8.9) thisH(2.6) ;  default

;return
	GuiControl,1:    MoveDraw, 		mehr,					% thisX(25.0) thisY(43.5) thisW(3.5) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		MarkierteLöschen,			% thisX(17.1) thisY(43.5) thisW(7.6) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		ListeExportieren,			% thisX(9.3) thisY(43.5) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(43.5) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1,			 % thisX(1.0) thisY(42.0) thisW(28.0) thisH(4.8) ;  default
			GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(20.0) ;  default
	GuiControl,1:    show, 			GroupBoxÜberListView1
	GuiControl,1:    show, 			Übernehmen
	GuiControl,1:    show, 			GroupBoxUnterListView1
;	GuiControl,1:    show, 			ListView1
	GuiControl,1:    show, 			mehr
	GuiControl,1:    show, 			MarkierteLöschen
	GuiControl,1:    show, 			ListeExportieren
	GuiControl,1:    show, 			ListeImportieren
	GuiControl,1:    show, 			GroupBoxNächsteSystemAktion
	GuiControl,1:    show, 			NächsteGeplanteSystemAction
	GuiControl,1:    show, 			GroupBoxLOG
	GuiControl,1:    show, 			GroupBoxUnterLOGListview
	GuiControl,1:    show, 			LogListeExportieren
	GuiControl,1:    show, 			LV1
}
return

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;Gui +OwnDialogs  ; Den Benutzer zwingen, das folgende Dialogfenster zu schließen, bevor er das Hauptfenster nutzen kann.
Sondermeldung:   ; heute beginn sommer,- winterzeit
;-----------------------------------------------
sondermeldungSommerWinterZeitAnzeige := MainArray["SommerWinterZeitAnzeigeOhneEnter"]
;-----------------------------------------------
; sondermeldung mez <> mesz wechsel

	; nur einmal im listview eintragen
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
; isLeapYear := 0
	if isLeapYear ; schaltjahr
		{
		if MakeList
		x:=strSplit(SunriseSunsetSchaltjahr(AMM,ADD),"`t")
		else
		x:=strSplit(SunriseSunsetSchaltjahr(A_MM,A_DD),"`t") 
		} else {
		if MakeList
		x:=strSplit(SunriseSunset(AMM,ADD),"`t") 
		else
		x:=strSplit(SunriseSunset(A_MM,A_DD),"`t") 
		}



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

	MainArray["nextScheduledAction_"] :=			  ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000)
								< ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)
								? "Trigger Sonnenuntergang " MainArray["Sonnenuntergang"] " Uhr in "
								. MainArray["Stunden bis zum nächsten Sonnenuntergang"]		
								. MainArray["Minuten bis zum nächsten Sonnenuntergang"]	
								: "Trigger Sonnenaufgang " MainArray["Sonnenaufgang"] " Uhr in "
								. MainArray["Stunden bis zum nächsten Sonnenaufgang"]
								. MainArray["Minuten bis zum nächsten Sonnenaufgang"]

	MainArray["nextScheduledAction"] :=			  ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000)
								< ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)
								? "Trigger Sonnenuntergang " MainArray["Sonnenuntergang"] " Uhr in "
								. MainArray["Stunden bis zum nächsten Sonnenuntergang"]		
								. MainArray["Minuten bis zum nächsten Sonnenuntergang"]	
								: ConvertToMilliseconds(SUstdNoLTRIM ":" SUminNoLTRIM ":" 00 "`," 000)
								> ConvertToMilliseconds(SAstdNoLTRIM ":" SAminNoLTRIM ":" 00 "`," 000)
								? "Trigger Sonnenaufgang " MainArray["Sonnenaufgang"] " Uhr in "
								. MainArray["Stunden bis zum nächsten Sonnenaufgang"]
								. MainArray["Minuten bis zum nächsten Sonnenaufgang"]
								: "0 Stunden 0 Minuten"
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

MainArray["schaltjahrTriggerHeuteStunde"] 		:= (SubStr(MainArray["Sonnenaufgang"], 2, 1))
MainArray["schaltjahrTriggerGesternStunde"] 		:= (SubStr(MainArray["SonnenaufgangCalendarDay", A_YDay-1], 2, 1))
	MainArray["SommerWinterZeitAnzeige"] 		:=    !(MainArray["schaltjahrTriggerHeuteStunde"]  
							     =  MainArray["schaltjahrTriggerGesternStunde"])
								? "Beginn: " thisJahresZeit()  "`n"
								: ""

MainArray["schaltjahrTriggerHeuteStunde"] 		:= (SubStr(MainArray["Sonnenaufgang"], 2, 1))
MainArray["schaltjahrTriggerGesternStunde"] 		:= (SubStr(MainArray["SonnenaufgangCalendarDay", A_YDay-1], 2, 1))
	MainArray["SommerWinterZeitAnzeigeOhneEnter"] 	:=    !(MainArray["schaltjahrTriggerHeuteStunde"]  
							     =  MainArray["schaltjahrTriggerGesternStunde"])
								? "Beginn: " thisJahresZeit()
								: ""
;msgbox % MainArray["SommerWinterZeitAnzeige"] 

; ///////////////////////////////////////////////////////////////////////////////////// ; aktionen die nach 00 uhr gestartet werden
; ///////////////////////////////////////////////////////////////////////////////////// ; aktionen die nach 00 uhr gestartet werden
	 MKPic := 1, MKPicCount := 0 	;  = täglich
	; MKPic := 1 			;  = einmal
	if MKPic
	{
		MainArray["sollZeitVorZwölf"] 	:= 23 ":" 59 ":" 55
		MainArray["sollZeitNachZwölf"] 	:= 00 ":" 00 ":" 01

		MainArray["istZeitvorZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec
		MainArray["istZeitnachZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec

			if (MainArray["sollZeitVorZwölf"] 
				= MainArray["istZeitvorZwölf"])
			|| (MainArray["sollZeitNachZwölf"]
				= MainArray["istZeitnachZwölf"]) 
			{
	; 28.02 = a_day = Tag 59 ; wenn schaltjahr dann ab 28.februar plus ein tag
 	xModify#1 :=  MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] := 	 ((A_YDay>=59) && (isSchaltjahrTrueFalse()=1))
											? (A_YDay+1)
											: (isSchaltjahrTrueFalse()=0)
											? (A_YDay)
											: ""
			RowsPerPage := DllCall("SendMessage", "Ptr", HW01, "UInt", 0x1028, "Ptr", 0, "Ptr", 0, "Ptr")
			Gui, ListView, LV2					; nach mitternacht LV2 nächste zeile +focus & +Select
			Gui, listview, default
			LV_Modify((xModify#1+(RowsPerPage/2)), "Vis")
			LV_Modify(xModify#1-6, "Vis")
			LV_Modify(xModify#1, "+Focus")
			LV_Modify(xModify#1, "+Select")
			LV_Modify(xModify#1, "focus")
			;send, {Tab}
			thisRISECounter := 0  ; nach mitternacht die counter für sonnenauf,- untergang in liestview 1zurücksetzen
			thisSETCounter := 0
			try run,%  A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"
			MKPicCount++
			}
		if (MKPicCount=2)
		MKPic := false
	}
; ///////////////////////////////////////////////////////////////////// ; aktionen die nach xx:xx uhr gestartet werden
	; Trigger#1 := 1, Trigger#1Count := 0 	;  = täglich
	; Trigger#1 := 1 			;  = einmal
	if Trigger#1
	{
		MainArray["sollZeitVorZwölf"] 	:= 23 ":" 59 ":" 55
		MainArray["sollZeitNachZwölf"] 	:= 00 ":" 00 ":" 01

		MainArray["istZeitvorZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec
		MainArray["istZeitnachZwölf"] 	:= A_Hour ":" A_Min ":" A_Sec

			if (MainArray["sollZeitVorZwölf"] 
				= MainArray["istZeitvorZwölf"])
			|| (MainArray["sollZeitNachZwölf"]
				= MainArray["istZeitnachZwölf"]) 
			{
	; 28.02 = a_day = Tag 59 ; wenn schaltjahr dann ab 28.februar plus ein tag
 	xModify#1 :=  MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] := 	 ((A_YDay>=59) && (isSchaltjahrTrueFalse()=1))
											? (A_YDay+1)
											: (isSchaltjahrTrueFalse()=0)
											? (A_YDay)
											: ""
			RowsPerPage := DllCall("SendMessage", "Ptr", HW01, "UInt", 0x1028, "Ptr", 0, "Ptr", 0, "Ptr")
			Gui, ListView, LV2					; nach mitternacht LV2 nächste zeile +focus & +Select
			Gui, listview, default
			LV_Modify((xModify#1+(RowsPerPage/2)), "Vis")
			LV_Modify(xModify#1-6, "Vis")
			LV_Modify(xModify#1, "+Focus")
			LV_Modify(xModify#1, "+Select")
			LV_Modify(xModify#1, "focus")
			;send, {Tab}
			thisRISECounter := 0  ; nach mitternacht die counter für sonnenauf,- untergang in liestview 1zurücksetzen
			thisSETCounter := 0
			try run,%  A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"
			Trigger#1Count++
			}
		if (Trigger#1Count=2)
		Trigger#1 := false
	}
; ///////////////////////////////////////////////////////////////////// ; aktionen die nach xx:xx uhr gestartet werden

	MainArray["presets", "Trigger#2", "beschreibung"] 		:= "Eine Stunde vor Sonnenuntergeng Heizung ON"
	MainArray["presets", "Trigger#2", "triggerFile"] 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"
	MainArray["presets", "Trigger#2", "triggerZeit"] 		:= 01 ":" 00 ":" 00 ; std min sec
	MainArray["presets", "Trigger#2", "triggerModus"] 		:= "VorSonnenUntergang" a_tab "NachSonnenUntergang" a_tab "VorSonnenAufgang" a_tab "NachSonnenAufgang"
	MainArray["presets", "Trigger#2", "triggerMonatTrueTorZeit"] 	:= 09 a_tab 10 a_tab 11 a_tab 12 a_tab 01 a_tab 02 a_tab 03
	MainArray["presets", "Trigger#2", "triggerMonatFalseTorZeit"] 	:= 04 a_tab 05 a_tab 06 a_tab 07 a_tab 08

showMsgBoxTest#854a := 0
for all, triggers in MainArray["presets", "Trigger#2"]
test#854a .= all a_tab triggers "`n"
;msgbox,,% a_lineNumber, % "showMsgBoxTest#854a = " showMsgBoxTest#854a "`n" test#854a

	; thisTime := A_DD "." A_MM "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec
	; Trigger#2 := 1, Trigger#2Count := 0 	;  = täglich
	; Trigger#2 := 1 			;  = einmal
	if Trigger#2
	{
		MainArray["istZeit"] 	:= A_Hour ":" A_Min ":" A_Sec
		MainArray["sollZeit"] 	:= 00 ":" 10 ":" 01

			if (MainArray["istZeit"] = (MainArray["presets", "Trigger#2", "triggerZeit"]))
			{
			if !inStr(Trigger#2all, A_DD "." A_MM "." a_YYYY a_space MainArray["sollZeit"])
				{
				try run,%  MainArray["presets", "Trigger#2", "triggerFile"]
				Trigger#2Count++
				Trigger#2all .= A_DD "." A_MM "." a_YYYY a_space MainArray["sollZeit"] "`n"
			}}
		if (Trigger#2Count=2)
		Trigger#2 := false
	}

; /////////////////////////////////////////////////////////////////////////////////////
;GuiControlGet, AusgabeVar, Focus
;msgbox % AusgabeVar
; /////////////////////////////////////////////////////////////////////////////////////				Nächste System Aktion [NächsteGeplanteSystemAction]
	thisNextScheduledAction := MainArray["nextScheduledAction"]
		while instr(thisNextScheduledAction,a_space a_space)
		thisNextScheduledAction := strReplace(thisNextScheduledAction,a_space a_space,a_space)
			if !(LastNextScheduledAction=thisNextScheduledAction)
			GuiControl,, NächsteGeplanteSystemAction,% thisNextScheduledAction
	LastNextScheduledAction := thisNextScheduledAction
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
































; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
































; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
































; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////












































 if !MakeList   ; evaluation utilization
 {
; thisGuiUpdate := DEBUGINFO() "`n" thisGuiTimeOutDownCounter()
 thisGuiUpdate := thisGuiTimeOutDownCounter() "`n" DEBUGINFO() MainArray["SommerWinterZeitAnzeige"]
	 . "" ; thisGuiTimeOutDownCounter()
	. "nächste geplante Aktion:`t" MainArray["nextScheduledAction"] ; a_tab MainArray["SonnentagLaengenBerechnung"] " <> " MainArray["NachtLaengenBerechnung"] ; tage werden länger oder kürzer
;	. "`n`nSonnenaufgang:`t" 		MainArray["Sonnenaufgang"] " Uhr  [ gestern " MainArray["SonnenaufgangCalendarDay", A_YDay-1] " ]" a_space MainArray["SonnentagLaengenBerechnung"]
;	. "`nSonnenuntergang:`t"	MainArray["Sonnenuntergang"] " Uhr  [ gestern " MainArray["SonnenuntergangCalendarDay", A_YDay-1] " ]" a_space MainArray["NachtLaengenBerechnung"]
;	. "`nSonnenstunden:`t" 	"[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]
	. "`n`n" isSchaltjahr(A_Year) 
	. "`nTag: " MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] " - Woche: " 
;	. SubStr(A_YWeek, 1, 4) a_space 
;	. SubStr(A_YWeek, -1) a_space " - Es ist " TagNachtZeiten()
	. SubStr(A_YWeek, -1) a_space " - " TagNachtZeiten()
	. "`n`nSonnenaufgang:`t" 		MainArray["Sonnenaufgang"] " Uhr  [ gestern " MainArray["SonnenaufgangCalendarDay", A_YDay-1] " ]" a_space MainArray["SonnentagLaengenBerechnung"]
	. "`nSonnenuntergang:`t"	MainArray["Sonnenuntergang"] " Uhr  [ gestern " MainArray["SonnenuntergangCalendarDay", A_YDay-1] " ]" a_space MainArray["NachtLaengenBerechnung"]
	. "`nSonnenstunden:`t" 	"[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]
;	. "`nSchaltjahr: " isSchaltjahr(A_Year) 
;	. "`n" isSchaltjahrTrueFalse()
	. "`n`nZeit bis zum nächsten Sonnenaufgang:`t`t" 
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
;	. (LVaddLine)?("`n" LVaddLine "`n"):("`n"empty`n")
;	. MainArray["SommerWinterZeitTrigger"] ; togglet im sekundentakt
;	. "`n" MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] 
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

		MainArray["SonnenstundenCalendarDayLTRIM", DayCounter]  := StimeStd ":" StimeMINNoLTRIM
		}

	if !MakeList
	settimer, start, -900
;	if !MakeList
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
thisZoomFactor(factor) {
global
return (factor*zoomfactor)
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisZoomFactorBold(factor) {
global
return "s" (factor*zoomfactor) " bold "
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisZoomFactorNormal(factor) {
global
return "s" (factor*zoomfactor) " normal " 
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisX(factor) {
global
return	" x" (wa*factor)/xx
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisY(factor) {
global
return	" y" (ha*factor)/xx 
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisW(factor) {
global
return	" w" (wa*factor)/xx
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisH(factor) {
global
return	" h" (ha*factor)/xx 
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

isSchaltjahrTrueFalse() {
global
ayear := (a_year)
return daysInYear 	:= Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : (1)
}
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

GeplanteTrigger:
;reload
msgbox,4096,% "Zeile:`t" a_lineNumber, Test geplanter Trigger, 4
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
;	GuiControl, +Redraw, LV1
;	GuiControl, +Redraw, LV2
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
;	GuiControl, +Redraw, LV1
;	GuiControl, +Redraw, LV2
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
;	GuiControl, -Redraw, LV1
LVModifyCol()
;	GuiControl, +Redraw, LV1
;	GuiControl, +Redraw, LV2

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
;//////////////////////////////////////////////////////////////////////////////////////////////////////// 

^F10::
return
;GuiControl,, EDIT2a,% MainArray["SommerWinterZeitAnzeige"]
;	GuiControl, +Redraw, LV1
;	GuiControl, +Redraw, LV2

GUISizeToggle := (GUISizeToggle:=!GUISizeToggle)
if GUISizeToggle
{
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
	AScreenWidth180  := (A_ScreenWidth-220)
	AScreenWidth200  := (A_ScreenWidth-200)
	GuiControl, Move,lv1, w%AScreenWidth180%  r7
	GuiControl, +Redraw, LV1

	Gui, Show, w%AScreenWidth200%  h%AScreenHeight300%
LVModifyCol()
} else {
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,lv1, w545 r7
;	Gui, Show, w565 h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
;gui,show,x%x% y%y% w%w% h%h% ,TEST		
gui,show,x%x% y%y% w%w% h%h% ,TEST
LVModifyCol()
	GuiControl, +Redraw, LV1
}
;	Gui, Show, x110 y31 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST	
return


if GUISizeToggle____________test_______
{
AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
	GuiControl, Move,lv1, w%AScreenWidth180%  r7
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
;	Gui, Show, w%AScreenWidth200%  h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST	
} else {
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,lv1, w545 r7
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
;	Gui, Show, w565 h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST
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
GuiControl,, TextEdit1 ,% MainArray["Aktuelle Zeit"]

return

if ToggleGUI
{
if showOnlyEDIT1Update
{
if (thisGuiUpdateEdit1OLD!=thisGuiUpdate)
GuiControl,, EDIT1,% thisGuiUpdate

;if sekundenTriggerToggle
;if !(thisGuiUpdateEdit1OLD=thisGuiUpdate)
GuiControl,, EDIT2,% MainArray["Aktuelle Zeit"]
GuiControl,, TextEdit1 ,% MainArray["Aktuelle Zeit"]
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
	}}} ; thisRISECounter thisSETCounter 

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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
							, (A_ThisLabel?A_ThisLabel:"System")
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
;return
if GUISizeToggle 
{
	GuiControl, -Redraw, LV1
	AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
;	GuiControl, Move,lv1, w%AScreenWidth180%  r7
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
		LV_ModifyCol(4, 0)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	GuiControl, +Redraw, LV1
	Gui, Show ; , w%AScreenWidth200%  h%AScreenHeight300%
;x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
;gui,show,x%x% y%y% w%w% h%h% ,TEST		
} else {
	GuiControl, -Redraw, LV1
	AScreenHeight300 := (A_ScreenHeight-300)
;	GuiControl, Move,lv1, w545 r7
		LV_ModifyCol(1, "AutoHdr")	; Timestamp
		LV_ModifyCol(2, "AutoHdr")	; Action
		LV_ModifyCol(3, "AutoHdr")	; Name
		LV_ModifyCol(4, 0)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	GuiControl, +Redraw, LV1
;	Gui, Show, w565 h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show ; ,x%x% y%y% w%w% h%h% ,TEST		
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


SunriseSunsetSchaltjahr(mm,dd) {  ; tabelle: cologne
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
08:11	07:16	07:13	06:07	05:23	05:18	05:51	06:39	07:27	07:16	08:07	08:32
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
17:19	18:13	20:00	20:51	21:35	21:52	21:25	20:27	19:17	17:14	16:32	16:35
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
	? TagNachtZeitenMESZ()  " [ ME Sommer Z bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) " ]" 
	: TagNachtZeitenMEZ()  " [ ME Winter Z bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2)) " ]"
}

_TagNachtZeiten() {
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
;	? "Sommerzeit [ MESZ ]"
;	: "Winterzeit [ MEZ ]"
	? "[ MESZ Sommerzeit ]"
	: "[ MEZ Winterzeit ]"
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
return MainArray["TagNachtZeit"] := "Abendzeit 18 bis 22 Uhr"
if (Ahour>=15) && (Ahour<=17)
return MainArray["TagNachtZeit"] := "Nachmittag 15 bis 18 Uhr"
if (Ahour>=13) && (Ahour<=14)
return MainArray["TagNachtZeit"] := "Mittagszeit 13 bis 15 Uhr"
if (Ahour>=11) && (Ahour<=12)
return MainArray["TagNachtZeit"] := "Vormittag 11 bis 13 Uhr"
if (Ahour>=07) && (Ahour<=10)
return MainArray["TagNachtZeit"] := "Morgenzeit 7:00 bis 11 Uhr"
else 
return MainArray["TagNachtZeit"] := "Nachtzeit 22 bis 7 Uhr"
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////

TagNachtZeitenMEZ() {
global
thisAhour := 0 ; test
Ahour := A_hour
Ahour := thisAhour ? thisAhour : Ahour
if (Ahour>=17) && (Ahour<=20)
return MainArray["TagNachtZeit"] := "Abendzeit 17 bis 21 Uhr"
if (Ahour>=14) && (Ahour<=16)
return MainArray["TagNachtZeit"] := "Nachmittag 14 bis 17 Uhr"
if (Ahour>=12) && (Ahour<=13)
return MainArray["TagNachtZeit"] := "Mittagzeit 12 bis 14 Uhr"
if (Ahour>=10) && (Ahour<=11)
return MainArray["TagNachtZeit"] := "Vormittag 10 bis 12 Uhr"
if (Ahour>=06) && (Ahour<=09)
return MainArray["TagNachtZeit"] := "Morgenzeit 6 bis 10 Uhr"
else 
return MainArray["TagNachtZeit"] := "Nachtzeit 21 bis 6 Uhr"
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









