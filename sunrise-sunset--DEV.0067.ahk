aindexMODListViewFeiertage := 0
triggerFilesOFF := 0

; msgbox = ahk_class #32770
;WinGetPos, X, Y, Width, SysWinHoehe, ahk_class #32770

;try	soundplay ,% "gutenMorgen.mp3"

gutenMorgen := 0 

; https://www.youtube.com/watch?v=_EJv6c4ogQE				
; Äquinoktium Frühling Tagundnachtgleiche 	21.mrz.2023 10:37 Uhr 12 stunden sonne https://www.youtube.com/watch?v=_AkdtRoeNAk
; 		sommersonnenwende	 	21.06.2023 16 std tag  nacht
; Äquinoktium Herbst-Tagundnachtgleiche 	23.09.2023
; 		wintersonnenwende		21.12.2023 kürzester tag im jahr 
; kulminationspunkt ( 12 uhr mittag ) https://youtu.be/0qUau2ujaKM?si=sKjRKi0IhKISuGrd&t=188
/* bing ki
Ein Kulminationspunkt ist ein astronomischer Begriff, der den höchsten oder tiefsten Stand eines 
Gestirns am Himmelsgewölbe in Bezug auf den Horizont bezeichnet 12. In der Astronomie wird der 
Begriff verwendet, um den höchsten Punkt zu beschreiben, den ein Stern oder Planet während seiner 
täglichen Bahn über das Himmelsgewölbe erreicht 34. Der Durchgang des Gestirns durch den 
Kulminationspunkt wird auch als Kulmination bezeichnet 4. Im übertragenen Sinne kann der Begriff 
auch als Höhepunkt oder Gipfelpunkt einer Laufbahn oder Entwicklung verwendet werden 52. 
*/
; https://www.youtube.com/watch?v=ZV6CxydqhcM
; https://www.youtube.com/watch?v=nNNbwKHQgGY erde sonne mond sendung m d maus
if FILE_SUSPEND
{
try run O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)\sonnenuntergang-sonnenaufgang-sunrise-sunset--DEV.0026.ahk
try run O:\untertitel 2023\ahk scripz Copy and Start\###   ahk copy and start.ahk
;sleep, 2000
DetectHiddenWindows, On
WM_COMMAND := 0x0111
ID_FILE_SUSPEND := 65404
; https://ahkde.github.io/docs/v1/lib/Suspend.htm#PostMessage
; Sendet einen Suspend-Befehl an ein anderes Skript.
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)\sonnenuntergang-sonnenaufgang-sunrise-sunset--DEV.0026.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, O:\untertitel 2023\ahk scripz Copy and Start\###   ahk copy and start.ahk ahk_class AutoHotkey
}



; https://raw.githubusercontent.com/effelCloud/AHK-/main/sonnenuntergang-sonnenaufgang-sunrise-sunset--DEV.0051.ahk
; 1 = ja
; 0 = nein
bildAnzeigen 	:= 0
Bildauswahl 	:= 0

; GUI auf Monitor rechts
throwLaeis := 0

; Stellt das Steuerelement als Rechteck dar, das mit der aktuellen Farbe des Fensterrahmens gefüllt ist. Diese Farbe ist standardmäßig schwarz
MaßNehmen := 0

kontextabhängigeHilfeViaTooltip := 1

; +BackgroundTrans für listviews
ShowListViewTrans := 0

; nach mitternacht die counter für sonnenauf,- untergang in liestview2 zurücksetzen
 alleTriggerCounterAufNull := 0

if Bildauswahl 
	pic := a_scriptDir "\po.jpg"
else
	pic := "O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)\fotos\2018.September.2 12.10.25--familienbande 02.09.2018 2.jpg"


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


; ////////////////////////////////////////////////////////////////////////////////////	Load_HIDE_and_SHOW_ controls
LoadThisCcontrols := 0
; alle controls ins clipboard laden, (hilfe für z.b. [ansicht erweitern])
; die daten befinden sich bis das msgbox fenster geschlossen wird, im clipboard
	if LoadThisCcontrols
	{
	thisClipBoard 	:= ""
	ClipBoardold 	:= ""
	ClipBoardold 	:= clipboard
		fileRead, getguicontrols,% a_scriptDir "\" a_scriptName
		
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
if inStr(aloopfield,"1080")
continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"show")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"hide")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"MoveDraw")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"Font")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"show")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"focus")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"disable")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}
thisClipBoard .= "`n"
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(thisClipBoard, aloopField) || instr(aloopField, "if inStr")
			continue
				if inStr(aloopField,"GuiControl,1:    ") && inStr(aloopField,"enable")
				{
				thisClipBoard .= TRIM(aloopField,"`t") "`n"
	}}

			while instr(thisClipboard,a_space a_space)
			thisClipboard := strReplace(thisClipboard,a_space a_space,a_space)
			while instr(thisClipboard,a_tab a_tab)
			thisClipboard := strReplace(thisClipboard,a_tab a_tab,a_tab)

	if thisClipboard
	ClipBoard 	:= thisClipboard
;;msgbox ClipBoard in notepad speichern`nund dann erst OK drücken
msgbox,4096,msgbox1, ClipBoard in notepad speichern`nund dann erst OK drücken
;sleep, 1000
;WinMove,msgbox#1, ,100,300, 400,
MsgBoxTimeOut()
	if clipboardold
	clipboard 	:= clipboardold
}

; ////////////////////////////////////////////////////////////////////////////////////


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
Sonnenuntergang:	14.Nov.2023  16:48:19:669 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	15.Nov.2023  07:45:01:059 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	15.Nov.2023  16:47:02:313 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	16.Nov.2023  07:47:00:878 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	16.Nov.2023  16:45:02:313 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	17.Nov.2023  07:49:00:197 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	Right	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	17.Nov.2023  16:44:02:313 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	18.Nov.2023  07:50:00:491 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	18.Nov.2023  16:43:00:992 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	19.Nov.2023  07:52:00:285 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	20.Nov.2023  07:54:01:201 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	20.Nov.2023  16:41:00:551 Uhr	start	Sonnenuntergang [ 1 ]	thisSET	empty	empty	-	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	21.Nov.2023  07:55:01:308 Uhr	start	Sonnenaufgang [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Programmstart:	23.Nov.2023  05:53:50:563 Uhr	empty	Programmstart	empty	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  05:53:55:940 Uhr	F1	Sonnenaufgang (User) [ 1 ]	thisRISE	F1	empty	F1	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:00:608 Uhr	start	Sonnenaufgang (System) [ 2 ]	thisRISE	F1	empty	F1	02:04:02	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:03:502 Uhr	start	Sonnenaufgang (System) [ 3 ]	thisRISE	F1	empty	F1	02:04:05	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:06:380 Uhr	start	Sonnenaufgang (System) [ 4 ]	thisRISE	F1	empty	F1	02:04:08	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:09:491 Uhr	start	Sonnenaufgang (System) [ 5 ]	thisRISE	F1	empty	F1	02:04:11	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:12:410 Uhr	start	Sonnenaufgang (System) [ 6 ]	thisRISE	F1	empty	F1	02:04:14	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:15:300 Uhr	start	Sonnenaufgang (System) [ 7 ]	thisRISE	F1	empty	F1	02:04:17	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:19:101 Uhr	start	Sonnenaufgang (System) [ 8 ]	thisRISE	F1	empty	F1	02:04:20	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:22:010 Uhr	start	Sonnenaufgang (System) [ 9 ]	thisRISE	F1	empty	F1	02:04:23	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:24:907 Uhr	start	Sonnenaufgang (System) [ 10 ]	thisRISE	F1	empty	F1	02:04:26	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:27:921 Uhr	start	Sonnenaufgang (System) [ 11 ]	thisRISE	F1	empty	F1	02:04:29	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:30:757 Uhr	start	Sonnenaufgang (System) [ 12 ]	thisRISE	F1	empty	F1	02:04:32	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:33:648 Uhr	start	Sonnenaufgang (System) [ 13 ]	thisRISE	F1	empty	F1	02:04:35	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:36:466 Uhr	start	Sonnenaufgang (System) [ 14 ]	thisRISE	F1	empty	F1	02:04:38	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:39:273 Uhr	start	Sonnenaufgang (System) [ 15 ]	thisRISE	F1	empty	F1	02:04:41	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:42:271 Uhr	start	Sonnenaufgang (System) [ 16 ]	thisRISE	F1	empty	F1	02:04:44	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:45:085 Uhr	start	Sonnenaufgang (System) [ 17 ]	thisRISE	F1	empty	F1	02:04:46	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:47:893 Uhr	start	Sonnenaufgang (System) [ 18 ]	thisRISE	F1	empty	F1	02:04:49	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:50:714 Uhr	start	Sonnenaufgang (System) [ 19 ]	thisRISE	F1	empty	F1	02:04:52	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:53:523 Uhr	start	Sonnenaufgang (System) [ 20 ]	thisRISE	F1	empty	F1	02:04:55	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:56:590 Uhr	start	Sonnenaufgang (System) [ 21 ]	thisRISE	F1	empty	F1	02:04:58	00:00:00	empty	empty	empty
Sonnenaufgang:	23.Nov.2023  07:58:59:457 Uhr	start	Sonnenaufgang (System) [ 22 ]	thisRISE	F1	empty	F1	02:05:01	00:00:00	empty	empty	empty
Gefahrenmeldung:	24.Nov.2023  02:18:38:149 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	empty	empty	LControl	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Sturmwarnung:	24.Nov.2023  02:18:45:563 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	empty	empty	LControl	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Sturmwarnung:	24.Nov.2023  02:18:48:039 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	empty	empty	LControl	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Gefahrenmeldung:	24.Nov.2023  02:19:55:002 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	empty	empty	LControl	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Gefahrenmeldung:	24.Nov.2023  02:20:29:104 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	F8	empty	F8	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Gefahrenmeldung:	24.Nov.2023  02:29:17:972 Uhr	GewählterHotkey	Sturmwarnung	thisGefahrenmeldung	F8	empty	F8	00:00:00	00:00:00	GewählterHotkey	Normal	empty
Gefahrenmeldung:	24.Nov.2023  02:31:52:931 Uhr	F10	Sturmwarnung	thisGefahrenmeldung	F10	empty	F10	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	24.Nov.2023  02:42:13:323 Uhr	F1	Sonnenaufgang (User) [ 1 ]	thisRISE	F1	empty	F1	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	24.Nov.2023  02:46:37:258 Uhr	F1	Sonnenaufgang (User) [ 1 ]	thisRISE	F1	empty	F1	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	24.Nov.2023  07:44:45:196 Uhr	F1	Sonnenaufgang (User) [ 1 ]	thisRISE	F1	empty	F1	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	24.Nov.2023  08:00:00:434 Uhr	start	Sonnenaufgang (system) [ 2 ]	thisRISE	F1	empty	Enter	00:15:15	00:00:00	empty	empty	empty
Sonnenaufgang:	24.Nov.2023  08:38:10:917 Uhr	F1	Sonnenaufgang (User) [ 3 ]	thisRISE	F1	F1	f	00:00:00	00:53:25	empty	empty	empty
Sonnenuntergang:	24.Nov.2023  16:32:58:599 Uhr	F2	Sonnenuntergang (User) [ 1 ]	thisSET	F2	empty	F2	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	24.Nov.2023  16:37:00:423 Uhr	start	Sonnenuntergang (System) [ 2 ]	thisSET	F2	empty	F2	00:04:02	00:00:00	empty	empty	empty
Sonnenaufgang:	25.Nov.2023  08:01:00:438 Uhr	start	Sonnenaufgang (System) [ 1 ]	thisRISE	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	25.Nov.2023  12:48:10:804 Uhr	F1	Sonnenaufgang (User) [ 2 ]	thisRISE	F1	empty	F1	00:00:00	00:00:00	empty	empty	empty
Sonnenaufgang:	27.Nov.2023  08:04:00:871 Uhr	start	Sonnenaufgang (System) [ 1 ]	thisRISE	empty	empty	Enter	00:00:00	00:00:00	empty	empty	empty
Sonnenuntergang:	27.Nov.2023  16:34:00:320 Uhr	start	Sonnenuntergang (System) [ 1 ]	thisSET	empty	empty	empty	00:00:00	00:00:00	empty	empty	empty

),% a_scriptDir "\" A_ScriptName " timeStampall.txt"
; ),% a_scriptDir "\" A_ScriptName " timeStampall.txt", UTF-8
}



	atickCount := a_tickCount
	GuiLiveTime := (1439.99*60*1000) ; GuiLiveTime bei Guistart 23:59:59 maximale Größe darf nicht überschritten werden, sonst laufen die Zähler nicht korrekt
	MainArray := []


Menu, Bundeslaender, Add, 1 - alle Bundesländer, MenuHandlerBundesland
Menu, Bundeslaender, Add, 2 - Bayern alle, MenuHandlerBundesland
Menu, Bundeslaender, Add, 3 - Bayern kath., MenuHandlerBundesland
Menu, Bundeslaender, Add, 4 - Bayern prot., MenuHandlerBundesland
Menu, Bundeslaender, Add, 5 - Berlin, MenuHandlerBundesland
Menu, Bundeslaender, Add, 6 - Brandenburg, MenuHandlerBundesland
Menu, Bundeslaender, Add, 7 - Bremen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 8 - Hamburg, MenuHandlerBundesland
Menu, Bundeslaender, Add, 9 - Hessen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 10 - Mecklenburg-Vorpommern, MenuHandlerBundesland
Menu, Bundeslaender, Add, 11 - Niedersachsen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 12 - Nordrhein-Westfalen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 13 - Rheinland-Pfalz, MenuHandlerBundesland
Menu, Bundeslaender, Add, 14 - Saarland, MenuHandlerBundesland
Menu, Bundeslaender, Add, 15 - Sachsen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 16 - Sachsen-Anhalt, MenuHandlerBundesland
Menu, Bundeslaender, Add, 17 - Schleswig-Holstein, MenuHandlerBundesland
Menu, Bundeslaender, Add, 18 - Thüringen, MenuHandlerBundesland
Menu, Bundeslaender, Add, 19 - Baden-Württemberg, MenuHandlerBundesland
Menu, Bundeslaender, Add, 20 - Tabelle ausblenden, MenuHandlerBundesland


Menu, Ansicht, Add, 2 - Hauptansicht , MenuHandler
Menu, Ansicht, Add, 2 - Triggermenü , MenuHandler
;Menu, Ansicht, Show

Menu, ButtonMehrMenue, Add, 1 - Historiemenü , MenuHandler
Menu, ButtonMehrMenue, Add, 2 - HauptButtonMehrMenue , MenuHandler
Menu, ButtonMehrMenue, Add, 2 - Triggermenü , MenuHandler
;Menu, ButtonMehrMenue, Show

nMalBlinkenContinue := 1

	outOfOrder := 1
	MakeList := 1
	HideGui := 1 ; or dont hide by counter null

	thisListViewAnsichtErweiternProgressModus := 0


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
	showOnlyEDIT1Update := 0	; einfache (Tooltip2GUI) Ausgabe
	showTooltipAlso := 0 		; tooltip und Tooltip2GUI anzeigen

	; erstellt zuerst eine Liste: Timestamp Sonnenaufgang Sonnenuntergang Sonnenstunden
	ShowMakeList := 0

	; Dieses Script startet bei Sonnenaufgang und Sonnenuntergang je eine Aktion, wie z.B 
	; Jalousie.-Markiesensteuerung und oder Beleuchtung ein bzw. ausschalten.
	; “Triggercmd Smart Home” und Alexa bieten weitere Möglichkeiten zum schalten.

	; Bei Sonnenaufgang wird RISEfile gestartet
	RISEfile 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Bei Sonnenuntergang wird SETfile gestartet
	SETfile 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; Gefahrenmeldungfile
	Gefahrenmeldungfile 	:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"

	; xTriggerfile
	xTriggerfile 		:= A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"


if triggerFilesOFF 
 RISEfile:="", SETfile:="", Gefahrenmeldungfile:="", xTriggerfile:=""

showGUI2 := 1

;  msgbox % thisX(23) "`n" thisZoomFactorNormal(29.01)

if showGUI2
{
;Gui +AlwaysOnTop -DPIScale hwndGUIHWND 
;HideFocusBorder(GUIHWND)
Gui -DPIScale hwndGUIHWND 
;-
wa:=A_screenwidth,ha:=A_screenHeight,xx:=100




;Gui,1:Color,FF9977
;Gui,1:Color,black, black
;ListView1Color=Silver
;ListView2Color=Silver
;	GuiControl,1: 	+BackgroundTrans, 	ListView1
;	GuiControl,1: 	+BackgroundTrans, 	ListView2
;	GuiControl,1: 	+BackgroundTrans, 	LVFeiertage

;ListView1Color=FF9977
;ListView2Color=FF9977

zoomfactor:=((A_ScreenWidth/1920)*(96/A_ScreenDPI))
;Fs10:= Round(10 * ZoomFactor, 0)
/*
; modifiziert thisZoomFactorNormal(20.5111) " cBlack", Verdana
; modifiziert thisZoomFactorBold(20.5111) " cBlack", Verdana
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
*/
; ////////////////////////////////////////////////////////////////////////////////////	 
;=============================================================	
;	color=D4D0C8 
;	Gui,1:Color,Black,Black
;	Gui,1:Color,Black,Silver
;	Gui,1:Color, Silver, Black
;	Gui,1:add,text,x0 y0 vT1
;	Gui, Color, silver
; ////////////////////////////////////////////////////////////////////////////////////						;		Wiederholen
	
;	Gui,1:Color,Silver,Black
;Gui,1:Font, s%fs16% cBlack Bold, Verdana
	;-
	ListViewEinUndAusblenden := 1


; //////////////////////////////////////////////////////////////////////////////////// 			schriftFarbe 
schriftFarbe := "blue"
;thisCcolor := "aqua"




; ////////////////////////////////////////////////////////////////////////////////////	GroupBoxA Wiederholen (radios)
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxAWiederholen cBlack  ; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxAWiederholen Hidden 
	Gui,1: Font,									% thisZoomFactorNormal(9.01) ; " cFF9977"
	GuiControl,1:    MoveDraw, 		GroupBoxAWiederholen, 			% thisX(1.0) thisY(12.1) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    Font, 			GroupBoxAWiederholen
	GuiControl,1: ,  GroupBoxAWiederholen, 						%a_Space%Wiederholen%a_Space% 
	GuiControl,1:    show, 			GroupBoxAWiederholen
;	GuiControl,1:    hide, 			GroupBoxAWiederholen
;	GuiControl,1:    focus, 		GroupBoxAWiederholen
;	GuiControl,1:    disable, 		GroupBoxAWiederholen
;	GuiControl,1:    enable, 		GroupBoxAWiederholen
	GuiControl,1: 	+cBlack, 		GroupBoxAWiederholen
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxAWiederholen
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxAWiederholen
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxAWiederholen
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox unter LOGListview
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxUnterLOGListview	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxUnterLOGListview Hidden		
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		GroupBoxUnterLOGListview, 		% thisX(1.0) thisY(73.7) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    Font, 			GroupBoxUnterLOGListview
;	GuiControl,1: ,  GroupBoxUnterLOGListview, 					; empty
	GuiControl,1:    show, 			GroupBoxUnterLOGListview
;	GuiControl,1:    hide, 			GroupBoxUnterLOGListview
;	GuiControl,1:    focus, 		GroupBoxUnterLOGListview
;	GuiControl,1:    disable, 		GroupBoxUnterLOGListview
;	GuiControl,1:    enable, 		GroupBoxUnterLOGListview
	GuiControl,1: 	+cBlack, 		GroupBoxUnterLOGListview
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxUnterLOGListview
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxUnterLOGListview
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxUnterLOGListview
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox LOG: Historie
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxLOG	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxLOG	Hidden	
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		GroupBoxLOG, 				% thisX(1.0) thisY(52.8) thisW(28.0) thisH(2.11) ;  default
	GuiControl,1:    Font, 			GroupBoxLOG
	GuiControl,1: ,  GroupBoxLOG, 							%a_Space%Historie%a_Space%
	GuiControl,1:    show, 			GroupBoxLOG
;	GuiControl,1:    hide, 			GroupBoxLOG
;	GuiControl,1:    focus, 		GroupBoxLOG
;	GuiControl,1:    disable, 		GroupBoxLOG
;	GuiControl,1:    enable, 		GroupBoxLOG
	GuiControl,1: 	+cBlack, 		GroupBoxLOG
	GuiControl,1: 	+cBlack, 		GroupBoxLOG
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxLOG
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxLOG
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxLOG
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox unter geplante trigger (unter listview1) 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxUnterListView1	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxUnterListView1 hwndHGroupBoxUnterListView1 Hidden 
	Gui,1: Font, 									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1, 		% thisX(1.0) thisY(42.0) thisW(28.0) thisH(4.8) ;  default
	GuiControl,1:    Font, 			GroupBoxUnterListView1
;	GuiControl,1: ,  GroupBoxUnterListView1, 					; empty
	GuiControl,1:    show, 			GroupBoxUnterListView1
;	GuiControl,1:    hide, 			GroupBoxUnterListView1
;	GuiControl,1:    focus, 		GroupBoxUnterListView1
;	GuiControl,1:    disable, 		GroupBoxUnterListView1
;	GuiControl,1:    enable, 		GroupBoxUnterListView1
	GuiControl,1: 	+cBlack, 		GroupBoxUnterListView1
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxUnterListView1
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxUnterListView1
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxUnterListView1
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Geplante Trigger: (über listview1) 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxÜberListView1 cBlack , vGroupBoxÜberListView1  ; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxÜberListView1 hwndHGroupBoxÜberListView1 Hidden 
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		GroupBoxÜberListView1, 			% thisX(1.0) thisY(21.2) thisW(28.0) thisH(2.0) ;  default
	GuiControl,1:    Font, 			GroupBoxÜberListView1
	GuiControl,1: ,  GroupBoxÜberListView1, 					%a_Space%Geplante Trigger%a_Space% 
	GuiControl,1:    show, 			GroupBoxÜberListView1
;	GuiControl,1:    hide, 			GroupBoxÜberListView1
;	GuiControl,1:    focus, 		GroupBoxÜberListView1
;	GuiControl,1:    disable, 		GroupBoxÜberListView1
;	GuiControl,1:    enable, 		GroupBoxÜberListView1
	GuiControl,1: 	+cBlack, 		GroupBoxÜberListView1
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxÜberListView1
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxÜberListView1
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxÜberListView1
; ////////////////////////////////////////////////////////////////////////////////////  GroupBox Nächste System Aktion
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxNächsteSystemAktion	; Maß nehmen
	else
	Gui,1:Add, GroupBox, cBlack vGroupBoxNächsteSystemAktion	Hidden	
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		GroupBoxNächsteSystemAktion, 		% thisX(1.0) thisY(47.5) thisW(28.0) thisH(4.6) ;  default
	GuiControl,1:    Font, 			GroupBoxNächsteSystemAktion
	GuiControl,1: ,  GroupBoxNächsteSystemAktion, 					%a_Space%Nächste System Aktion%a_Space%
	GuiControl,1:    show, 			GroupBoxNächsteSystemAktion
;	GuiControl,1:    hide, 			GroupBoxNächsteSystemAktion
;	GuiControl,1:    focus, 		GroupBoxNächsteSystemAktion
;	GuiControl,1:    disable, 		GroupBoxNächsteSystemAktion
;	GuiControl,1:    enable, 		GroupBoxNächsteSystemAktion
	GuiControl,1: 	+cBlack, 		GroupBoxNächsteSystemAktion
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		GroupBoxNächsteSystemAktion
else
	GuiControl,1: 	+c%thisCcolor%, 	GroupBoxNächsteSystemAktion
;	GuiControl,1: 	+BackgroundFF9977, 	GroupBoxNächsteSystemAktion
; ////////////////////////////////////////////////////////////////////////////////////	text TextEdit1 TimeStamp
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vTextEdit1 ; Maß nehmen
	else
	Gui,1: Add, text , 	vTextEdit1 hwndhTextEdit1 center Hidden	 gnMalBlinkenOFF 
	TextEdit1_TT := "`nGui,1: Add, text , vTextEdit1 hwndhTextEdit1 center Hidden gnMalBlinkenOFF`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorBold(20.0111) " cBlack", Verdana ; zoomf (22.5111) (15.01) 
	GuiControl,1:    MoveDraw, 		TextEdit1,		% thisX(1) thisY(0.5) thisW(28.0) thisH(3.6) ;  default
	GuiControl,1:    Font, 			TextEdit1		
;	GuiControl,1: ,  			TextEdit1, 		% A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr" ; timestamp
;	GuiControl,1: ,  			TextEdit1, 		% A_DD "." A_MM "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr" ; timestamp
	GuiControl,1:    show, 			TextEdit1
;	GuiControl,1:    hide, 			TextEdit1
;	GuiControl,1:    focus, 		TextEdit1
;	GuiControl,1:    disable, 		TextEdit1
;	GuiControl,1:    enable, 		TextEdit1

; ////////////////////////////////////////////////////////////////////////////////////	Sonnen Edit Stunden
;	Gui,1:Color,Black,Black
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vSonnenEditStunden ; Maß nehmen
	else
	Gui,1: Add, edit , 	vSonnenEditStunden gSonnenEditStunden hwndhSsonnenEditStunden  center Limit2 Number ; BackgroundTrans 
;	Gui,1: Add, text , 	vSonnenEditStunden gSonnenEditStunden hwndhSsonnenEditStunden  center ; BackgroundTrans 
	SonnenEditStunden_TT := "`nGui,1: Add, edit , vSonnenEditStunden gSonnenEditStunden hwndhSsonnenEditStunden center Limit2 Number`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorNormal(10.01)   " cBlack "
	GuiControl,1:    MoveDraw, 		SonnenEditStunden,	% thisX(1.1) thisY(5.0) thisW(2.9) thisH(2.2) ;  <-- hier doro :-)
	GuiControl,1:    Font, 			SonnenEditStunden
	GuiControl,1: ,  			SonnenEditStunden, 		00
	GuiControl,1:    show, 			SonnenEditStunden
;	GuiControl,1:    hide, 			SonnenEditStunden
;	GuiControl,1:    focus, 		SonnenEditStunden
;	GuiControl,1:    disable, 		SonnenEditStunden
;	GuiControl,1:    enable, 		SonnenEditStunden
	GuiControl,1: 	+cBlack, 		SonnenEditStunden
;	GuiControl,1: 	+Background009977,	SonnenEditStunden
	GuiControl,1: 	+BackgroundFF9977, 	SonnenEditStunden
	Gui, Add, UpDown, vSonnenEditStundenUpDown Horz 16 Range0-23, 0
	GuiControl,1:    MoveDraw, 		SonnenEditStundenUpDown, 			% thisW(2.2) thish(2.20)
;	Gui,1:Color,silver,black

; ////////////////////////////////////////////////////////////////////////////////////	Text Stunden
;Gui, Color, silver
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vTextStunden ; Maß nehmen
	else
	Gui,1: Add, text , vTextStunden Hidden ; center
	TextStunden_TT := "`nGui,1: Add, text , vTextStunden Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		TextStunden,		% thisX(5.65) thisY(5.45) thisW(3.1) thisH(2) "  cBlack " ;  default
	GuiControl,1:    Font, 			TextStunden
	GuiControl,1: ,  			TextStunden, 		Stunden
	GuiControl,1:    show, 			TextStunden
;	GuiControl,1:    hide, 			TextStunden
;	GuiControl,1:    focus, 		TextStunden
;	GuiControl,1:    disable, 		TextStunden
;	GuiControl,1:    enable, 		TextStunden
	GuiControl,1: 	+cBlack, 		TextStunden
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		TextStunden
else
	GuiControl,1: 	+c%thisCcolor%, 		TextStunden
; ////////////////////////////////////////////////////////////////////////////////////	Sonnen Edit tMinuten
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vSonnenEditMinuten ; Maß nehmen
	else
	Gui,1: Add, edit ,  vSonnenEditMinuten gSonnenEditMinuten hwndhSsonnenEditMinuten Hidden  center Limit2 Number 
	SonnenEditMinuten_TT := "`nGui,1: Add, edit, vSonnenEditMinuten gSonnenEditMinuten hwndhSsonnenEditMinuten Hidden center Limit2 Number`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorNormal(10.01)   " cBlack "
	GuiControl,1:    MoveDraw, 		SonnenEditMinuten,	% thisX(8.8) thisY(5) thisW(2.9) thisH(2.2) ;  default
	GuiControl,1:    Font, 			SonnenEditMinuten
	GuiControl,1: ,  			SonnenEditMinuten, 	02 
	GuiControl,1:    show, 			SonnenEditMinuten
;	GuiControl,1:    hide, 			SonnenEditMinuten
;	GuiControl,1:    focus, 		SonnenEditMinuten
;	GuiControl,1:    disable, 		SonnenEditMinuten
;	GuiControl,1:    enable, 		SonnenEditMinuten
	GuiControl,1: 	+cBlack, 		SonnenEditStunden
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		SonnenEditStunden
else
	GuiControl,1: 	+c%thisCcolor%, 	SonnenEditStunden
	Gui, Add, UpDown, vSonnenEditMinutenUpDown Horz 16 Range00-59, 02
	GuiControl,1:    MoveDraw, 		SonnenEditMinutenUpDown, 			% thisW(2.2) thish(2.20)
;	GuiControl,1: 	+cBlack, 		SonnenEditMinutenUpDown
; ////////////////////////////////////////////////////////////////////////////////////	vTextMinuten 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vTextMinuten ; Maß nehmen
	else
	Gui,1: Add, text , 	vTextMinuten cBlack Hidden ; center
	TextMinuten_TT := "`nGui,1: Add, text , vTextMinuten cBlack Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		TextMinuten,		% thisX(13.3) thisY(5.45) thisW(3.39) thisH(2) ;  default
	GuiControl,1:    Font, 			TextMinuten
	GuiControl,1: ,  			TextMinuten, 		Minuten
	GuiControl,1:    show, 			TextMinuten
;	GuiControl,1:    hide, 			TextMinuten
;	GuiControl,1:    focus, 		TextMinuten
;	GuiControl,1:    disable, 		TextMinuten
;	GuiControl,1:    enable, 		TextMinuten
	GuiControl,1: 	+cBlack, 		TextMinuten
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		TextMinuten
else
	GuiControl,1: 	+c%thisCcolor%, 	TextMinuten
; ////////////////////////////////////////////////////////////////////////////////////	ddl1 Trigger auswählen...

	if MaßNehmen
	Gui,1: Add, text , 0x1000 vddl1 cBlack  ; Maß nehmen
	else
	Gui,1:Add, DDL, vddl1 hwndhDDL1 choose1 r39
	ddl1_TT := "`nGui,1:Add, DDL, vddl1 hwndhDDL1 choose1, `%a_space`%Trigger auswählen...`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorNormal(10.01) " Verdana"
	GuiControl,1:    MoveDraw, 		ddl1, 			% thisX(16.7) thisY(5) thisW(12.3) ; thisH(2.2) ;  default
	GuiControl,1:    Font, 			ddl1
	GuiControl,1:    show, 			ddl1
;	GuiControl,1:    hide, 			ddl1
;	GuiControl,1:    focus, 		ddl1
;	GuiControl,1:    disable, 		ddl1
;	GuiControl,1:    enable, 		ddl1

	thisFeiertage := feiertage(a_yyyy,"dl","longdate")
	while instr(thisFeiertage,a_tab)
	thisFeiertage := strReplace(thisFeiertage,a_tab,a_space)
	while instr(thisFeiertage,a_space a_space)
	thisFeiertage := strReplace(thisFeiertage,a_space a_space, a_space)

loadFeiertage = || vor Sonnenaufgang
		| nach Sonnenaufgang
		| vor Sonnenuntergang
		| nach Sonnenuntergang
		| nach MEZ > MESZ Wechsel
		| nach MESZ > MEZ Wechsel
		| nach Morgen 07-11 Uhr
		| nach Vormittag 11-13 Uhr
		| nach Mittag 13-15 Uhr
		| nach Nachmittag 15-18 Uhr
		| nach Abend 18-22 Uhr
		| nach Nacht 22-7 Uhr
		| nach Sturmwarnung
		| nach Pollenwarnung

	loop, parse, thisFeiertage, `n, `r
	if a_loopField {
	aLoopField := strSplit(a_loopField, [":",","])
	loadFeiertage .= "| " aLoopField.1 a_space aLoopField.3
	}

	loop, parse, % loadFeiertage, "|"
	if a_loopField {
	thisLoad := StringWidth(TRIM(a_loopField),"Verdana",thisZoomFactorNormal(10.01)) 	; breite des eintrags bestimmen
	if (thisLoad>thisLoadFULL)
	thisLoadFULL := thisLoad
	}
	
	GuiControl,1: ,  ddl1, 					% "Trigger auswählen... " loadFeiertage 
	SendMessage, 0x0160, (thisLoadFULL+20), 0, , ahk_id  %hDDL1% 	; CB_SETDROPPEDWIDTH := 0x0160

; 	https://ahkde.github.io/docs/v1/lib/GuiControls.htm#DropDownList
; 	PostMessage, 0x0153, -1, 21,, ahk_id %hDDL1%  ; Setzt die Höhe des Auswahlfeldes.
; 	PostMessage, 0x0153,  0, 20,, ahk_id %hDDL1%  ; Setzt die Höhe jedes Listeneintrags.

; https://www.autohotkey.com/board/topic/122519-listbox-with-a-different-width-for-the-drop-down/
; https://www.autohotkey.com/boards/viewtopic.php?p=67682#p67682 by FanaticGuru
; msgbox % StringWidth("String",,10)
StringWidth(String, Font:="", FontSize:=10) 
{
	Gui StringWidth:Font, s%FontSize%, %Font%
	Gui StringWidth:Add, Text, R1, %String%
	GuiControlGet T, StringWidth:Pos, Static1
	Gui StringWidth:Destroy
	return TW
}

; ////////////////////////////////////////////////////////////////////////////////////	ddl3 Trigger Datei auswählen...
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vddl3 ; Maß nehmen
	else
	Gui,1:Add, DDL, vddl3 hwndhDDL3 choose1, 			%a_space%Trigger Datei auswählen...
	Gui,1: Font,							% thisZoomFactorNormal(9.711) 
	DDL3_TT := "`nGui,1:Add, DDL, vddl3 hwndhDDL3 choose1, %a_space%Trigger Datei auswählen...`n" a_space "a_LineNumber: " a_lineNumber
	GuiControl,1:    MoveDraw, 		ddl3, 			% thisX(1.0) thisY(8.5) thisW(28.0) ; thisH(2.2) ;  default
	GuiControl,1:    Font, 			ddl3
	GuiControl,1: ,  ddl3, 					 %a_space%Öffnen...
								| Soundplay Audiodatei #1
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

;	GuiControl,1: ,  ddl3, 					 | 		; DDL leeren  https://www.autohotkey.com/boards/viewtopic.php?style=17&p=366221#p366221 danke just me
;	GuiControl,1: ,  ddl3, 					 | 		; DDL leeren  https://www.autohotkey.com/boards/viewtopic.php?style=17&p=366221#p366221 danke just me
;	GuiControl,1: ,  ddl3, 					 %a_space% 	; DDL leeren  https://www.autohotkey.com/boards/viewtopic.php?style=17&p=366221#p366221 danke just me
	GuiControl,1:    show, 			ddl3
;	GuiControl,1:    hide, 			ddl3
;	GuiControl,1:    focus, 		ddl3
;	GuiControl,1:    disable, 		ddl3
;	GuiControl,1:    enable, 		ddl3
; PostMessage, 0x0153, -1, 21,, ahk_id %hDDL3%  ; Setzt die Höhe des Auswahlfeldes. 	; https://ahkde.github.io/docs/v1/lib/GuiControls.htm#DropDownList
; PostMessage, 0x0153,  0, 20,, ahk_id %hDDL3%  ; Setzt die Höhe jedes Listeneintrags.
; ////////////////////////////////////////////////////////////////////////////////////	 






;Gui, Color, silver


;Gui,1:Font, s%fs10% normal,



; ////////////////////////////////////////////////////////////////////////////////////	RadioEinmal 

;MaßNehmen := 0

	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRadioEinmal ; Maß nehmen
	else
	Gui,1: Add, radio, vRadioEinmal hwndHRadioEinmal 
	RadioEinmal_TT := "`nGui,1: Add, radio, vRadioEinmal hwndHRadioEinmal`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		RadioEinmal, 				% thisX(1.5) thisY(14.2) thisW(4.0) thisH(2.0) ;  default
	GuiControl,1:    Font, 			RadioEinmal
	GuiControl,1: ,  RadioEinmal, 							einmal
	GuiControl,1:    show, 			RadioEinmal
;	GuiControl,1:    hide, 			RadioEinmal
;	GuiControl,1:    focus, 		RadioEinmal
;	GuiControl,1:    disable, 		RadioEinmal
;	GuiControl,1:    enable, 		RadioEinmal
;	GuiControl,1: 	+BackgroundFF9977, 	RadioEinmal
;	GuiControl,1: 	+Backgroundyellow, 	RadioEinmal
;	x:=(wa*1.5)/xx,y:=(ha*14.2)/xx
;	Gui,1:Add, radio, x%x% y%y% vRadioEinmal hwndhRadioEinmal section , einmal
	GuiControl,1: 	+cBlack, 		RadioEinmal
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		RadioEinmal
else
	GuiControl,1: 	+c%thisCcolor%, 	RadioEinmal

; ////////////////////////////////////////////////////////////////////////////////////	radio täglich										;		Wiederholen
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRadioTäglich ; Maß nehmen
	else
	Gui,1: Add, radio, vRadioTäglich hwnhHRadioTäglich checked 
	RadioTäglich_TT := "`nGui,1: Add, radio, vRadioTäglich hwnhHRadioTäglich checked`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01) 
	GuiControl,1:    MoveDraw, 		RadioTäglich, 				% thisX(6.3) thisY(14.2) thisW(4.0) thisH(2.0) ;  default
	GuiControl,1:    Font, 			RadioTäglich
	GuiControl,1: ,  RadioTäglich, 							täglich
	GuiControl,1:    show, 			RadioTäglich
;	GuiControl,1:    hide, 			RadioTäglich
;	GuiControl,1:    focus, 		RadioTäglich
;	GuiControl,1:    disable, 		RadioTäglich
;	GuiControl,1:    enable, 		RadioTäglich
;	GuiControl,1: 	+BackgroundFF9977, 	RadioTäglich
;	GuiControl,1: 	+Backgroundyellow, 	RadioTäglich
;	x:=(wa*6)/xx,y:=(ha*14.2)/xx
;	Gui,1:Add, radio, x%x% y%y% vRadioTäglich hwndhRadioTäglich checked , täglich
	GuiControl,1: 	+cBlack, 		RadioTäglich
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		RadioTäglich
else
	GuiControl,1: 	+c%thisCcolor%, 	RadioTäglich
/*
	GuiControl,1: 	+cRed, 	RadioEinmal
	GuiControl,1: 	+cRed, 	RadioTäglich
	GuiControl,1: 	+cRed, 	RadioWöchendlich
	GuiControl,1: 	+cRed, 	RadioMonatlich
	GuiControl,1: 	+cRed, 	RadioJährlich
	GuiControl,1: 	+cRed, 	GroupBoxAWiederholen
*/
; ////////////////////////////////////////////////////////////////////////////////////	radio wöchendlich									;		Wiederholen
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRadioWöchendlich ; Maß nehmen
	else
	Gui,1: Add, radio, vRadioWöchendlich hwndHRadioWöchendlich 
	RadioWöchendlich_TT := "`nGui,1: Add, radio, vRadioWöchendlich hwndHRadioWöchendlich`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		RadioWöchendlich, 			% thisX(11.0) thisY(14.2) thisW(5.6) thisH(2.0) ;  default
	GuiControl,1:    Font, 			RadioWöchendlich
	GuiControl,1: ,  RadioWöchendlich, 							wöchendlich
	GuiControl,1:    show, 			RadioWöchendlich
;	GuiControl,1:    hide, 			RadioWöchendlich
;	GuiControl,1:    focus, 		RadioWöchendlich
;	GuiControl,1:    disable, 		RadioWöchendlich
;	GuiControl,1:    enable, 		RadioWöchendlich
;	GuiControl,1: 	+BackgroundFF9977, 	RadioWöchendlich
;	GuiControl,1: 	+Backgroundyellow, 	RadioWöchendlich
;	x:=(wa*10.5)/xx,y:=(ha*14.2)/xx
;	Gui,1:Add, radio, x%x% y%y% vRadioWöchendlich hwndhRadioWöchendlich , wöchendlich

	GuiControl,1: 	+cBlack, 		RadioWöchendlich
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		RadioWöchendlich
else
	GuiControl,1: 	+c%thisCcolor%, 	RadioWöchendlich
; ////////////////////////////////////////////////////////////////////////////////////	radio monatlich
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRadioMonatlich ; Maß nehmen
	else
	Gui,1: Add, radio, vRadioMonatlich hwndHRadioMonatlich
	RadioMonatlich_TT := "`nGui,1: Add, radio, vRadioMonatlich hwndHRadioMonatlich`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		RadioMonatlich, 			% thisX(17.5) thisY(14.2) thisW(4.5) thisH(2.0) ;  default
	GuiControl,1:    Font, 			RadioMonatlich
	GuiControl,1: ,  RadioMonatlich, 							monatlich
	GuiControl,1:    show, 			RadioMonatlich
;	GuiControl,1:    hide, 			RadioMonatlich
;	GuiControl,1:    focus, 		RadioMonatlich
;	GuiControl,1:    disable, 		RadioMonatlich
;	GuiControl,1:    enable, 		RadioMonatlich
;	GuiControl,1: 	+BackgroundFF9977, 	RadioMonatlich
;	GuiControl,1: 	+Backgroundyellow, 	RadioMonatlich
;	x:=(wa*17.5)/xx,y:=(ha*14.2)/xx

	GuiControl,1: 	+cBlack, 		RadioMonatlich
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		RadioMonatlich
else
	GuiControl,1: 	+c%thisCcolor%, 	RadioMonatlich
; ////////////////////////////////////////////////////////////////////////////////////	radio jährlich
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRadioJährlich ; Maß nehmen
	else
	Gui,1: Add, radio, vRadioJährlich hwndHRadioJährlich
	RadioJährlich_TT := "`nGui,1: Add, radio, vRadioJährlich hwndHRadioJährlich`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		RadioJährlich, 				% thisX(23.5) thisY(14.2) thisW(4.0) thisH(2.0) ;  default
	GuiControl,1:    Font, 			RadioJährlich
	GuiControl,1: ,  RadioJährlich, 							jährlich
	GuiControl,1:    show, 			RadioJährlich
;	GuiControl,1:    hide, 			RadioJährlich
;	GuiControl,1:    focus, 		RadioJährlich
;	GuiControl,1:    disable, 		RadioJährlich
;	GuiControl,1:    enable, 		RadioJährlich
;	GuiControl,1: 	+BackgroundFF9977, 	RadioJährlich
;	GuiControl,1: 	+Backgroundyellow, 	RadioJährlich
;	x:=(wa*23.5)/xx,y:=(ha*14.2)/xx
;	Gui,1:Add, radio, x%x% y%y% vRadioJährlich hwndhRadioJährlich , jährlich
	GuiControl,1: 	+cBlack, 		RadioJährlich
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		RadioJährlich
else
	GuiControl,1: 	+c%thisCcolor%, 	RadioJährlich
; ////////////////////////////////////////////////////////////////////////////////////	

;Gui,1:Font,%  thisZoomFactorNormal(16) 


;MaßNehmen := 1



;	color=Aqua
;	color=Teal
;	color=Silver

; ////////////////////////////////////////////////////////////////////////////////////		edit triggerSuche	
;Gui, Color, FF9867
;BGcolor := 009911
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vtriggerSuche hwndHtriggerSuche ; Maß nehmen
	else
	Gui,1: Add, edit, vtriggerSuche hwndHtriggerSuche -WantReturn 
;	Gui,1: Add, ComboBox, vtriggerSuche , Rot|Grün|Blau|Schwarz|Weiß
	triggerSuche_TT := "`nGui,1: Add, edit, vtriggerSuche hwndHtriggerSuche -WantReturn`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.01)  " cBlack "
	GuiControl,1:    MoveDraw, 		triggerSuche, 				% thisX(1.1) thisY(18.0) thisW(10.9) thisH(2.6) ;  default
	GuiControl,1:    Font, 			triggerSuche
;	GuiControl,1: ,  triggerSuche, 							TriggerSuche|2|3
	GuiControl,1:    show, 			triggerSuche
;	GuiControl,1:    hide, 			triggerSuche
;	GuiControl,1:    focus, 		triggerSuche
;	GuiControl,1:    disable, 		triggerSuche
;	GuiControl,1:    enable, 		triggerSuche
;	GuiControl,1: 	+cFF9977, 		triggerSuche
;	GuiControl,1: 	+Background009977,	triggerSuche
;	GuiControl,1: 	+Backgroundyellow, 	triggerSuche
;	GuiControl,1: 	+BackgroundFF9977, 	triggerSuche
 	EM_SETCUEBANNER(HtriggerSuche, " Trigger suchen...")
	GuiControl,1: 	+cBlack, 		triggerSuche
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		triggerSuche
else
	GuiControl,1: 	+c%thisCcolor%, 	triggerSuche


; ////////////////////////////////////////////////////////////////////////////////////	button Progress ListView (oben) AnsichErweitern (blinker) 
/*
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vthisListViewAnsichtErweiternProgress 	; Maß nehmen
	else
	Gui,1: Add, Progress, 	vthisListViewAnsichtErweiternProgress hwndHthisListViewAnsichtErweiternProgress,% outputvar
;	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(0) thisY(0) thisW(0) thisH(0) ;  null
	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(12.35) thisY(17.8) thisW(9.8) thisH(2.99) ;  Default
	GuiControl,1:    hide, 			thisListViewAnsichtErweiternProgress
	GuiControl,1:    disable, 		thisListViewAnsichtErweiternProgress
	GuiControl,1: 	+BackgroundLime, 	thisListViewAnsichtErweiternProgress
;	GuiControl,1: 	+BackgroundSilver, 	thisListViewAnsichtErweiternProgress
	Control ExStyle, -0x20000,, % "ahk_id" HthisListViewAnsichtErweiternProgress ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos
;	Control ExStyle, +0x20000,, % "ahk_id" HthisListViewAnsichtErweiternProgress ; test
;	DllCall("RedrawWindow", uint, Gui1, uint, 0, uint, 0, uint, RDW_INVALIDATE)
; ////////////////////////////////////////////////////////////////////////////////////	button Progress ListView (unten) AnsichErweitern (blinker) 
; wird .2 punkte größer, hinter dem button angelegt z.b. button thisX(8.9) <> progress thisX(8.7)
	Gui,1: Add, Progress, 	vLogListeAnsichtErweiternProgress hwndHLogListeAnsichtErweiternProgress
;	GuiControl,1:    MoveDraw, 		LogListeAnsichtErweiternProgress,			% thisX(0) thisY(0) thisW(0) thisH(0) ;  default
	GuiControl,1:    MoveDraw, 		LogListeAnsichtErweiternProgress,			% thisX(8.99) thisY(75.0) thisW(10.2) thisH(3.0) ;  klein
;	GuiControl,1:    hide, 			LogListeAnsichtErweiternProgress
;	GuiControl,1:    disable, 		LogListeAnsichtErweiternProgress
;	GuiControl,1:    show, 			LogListeAnsichtErweiternProgress
	GuiControl,1: 	+BackgroundLime, 	LogListeAnsichtErweiternProgress
;	GuiControl,1: 	+BackgroundSilver, 	LogListeAnsichtErweiternProgress
;	Control ExStyle, -0x20000,, % "ahk_id" HLogListeAnsichtErweiternProgress ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos
;	Control ExStyle, +0x20000,, % "ahk_id" HLogListeAnsichtErweiternProgress ; test
;	DllCall("RedrawWindow", uint, Gui1, uint, 0, uint, 0, uint, RDW_INVALIDATE)
*/
; ////////////////////////////////////////////////////////////////////////////////////	button ListView (oben) AnsichErweitern 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListViewAnsichErweitern 	; Maß nehmen
	else
	Gui,1:Add, button, vListViewAnsichErweitern Hidden gListViewEinUndAusblenden  BackgroundTrans ; 0x200 
	ListViewAnsichErweitern_TT := "`nGui,1:Add, button, vListViewAnsichErweitern Hidden gListViewEinUndAusblenden  BackgroundTrans`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011) " cBlack "
	GuiControl,1:    MoveDraw, 		ListViewAnsichErweitern, 		% thisX(12.5) thisY(18.0) thisW(9.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ListViewAnsichErweitern
	GuiControl,1: ,  ListViewAnsichErweitern, 							Ansicht erweitern
	GuiControl,1:    show, 			ListViewAnsichErweitern
; ////////////////////////////////////////////////////////////////////////////////////	Progress button ansicht erweitern blinkend




; ////////////////////////////////////////////////////////////////////////////////////	button Übernehmen
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vUebernehmen	gUebernehmen	; Maß nehmen
	else
	Gui,1:Add, button, vÜbernehmen hwndHÜbernehmen Hidden gUebernehmen	
	Übernehmen_TT := "`nGui,1:Add, button, vÜbernehmen hwndHÜbernehmen Hidden gUebernehmen`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		Übernehmen, 				% thisX(22.5) thisY(18.0) thisW(5.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			Übernehmen
	GuiControl,1: ,  Übernehmen, 							Übernehmen
	GuiControl,1:    show, 			Übernehmen
;	GuiControl,1:    hide, 			Übernehmen
;	GuiControl,1:    focus, 		Übernehmen
;	GuiControl,1:    disable, 		Übernehmen
;	GuiControl,1:    enable, 		Übernehmen
; ////////////////////////////////////////////////////////////////////////////////////	ListView1 (oben) 
;	color=Aqua
;	color=Teal
	ListView1Color=FF9977
	ListView1Color=silver
;	ListView1Color=D4D0C8
;	color=D4D0C8 
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListView1 	; Maß nehmen
	else
	Gui,1: Add, listview, vListView1 gListview1 hwndhListView1 grid background%ListView1Color% cBlack Hidden  +Checked
									, Aktiv Std:Min
									| Wiederholen
									| Trigger
									| Trigger File
	ListView1_TT := "`nGui,1: Add, listview, vListView1 hwndhListView1 grid background`%ListView1Color`% cBlack Hidden +Checked`n" a_space "a_LineNumber: " a_lineNumber
	LV_ModifyCol(1,(wa*1.9)/xx)
	LV_ModifyCol(2,(wa*1.9)/xx)
	LV_ModifyCol(3,(wa*6)/xx)
	LV_ModifyCol(4,(wa*14)/xx)
	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(20.0) ;  default
	GuiControl,1:    Font, 			ListView1
	GuiControl,1:    show, 			ListView1
;	GuiControl,1:    hide, 			ListView1
;	GuiControl,1:    focus, 		ListView1
;	GuiControl,1:    disable, 		ListView1
;	GuiControl,1:    enable, 		ListView1
;	GuiControl,1: 	+BackgroundFF9977, 	ListView1
	GuiControl,1: 	+cBlack, 		ListView1
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		ListView1
else
	GuiControl,1: 	+c%thisCcolor%, 	ListView1

if ShowListViewTrans
{
	GuiControl,1: 	+cWhite, 		ListView1
	GuiControl,1:    +BackgroundTrans, 	ListView1
}
; ////////////////////////////////////////////////////////////////////////////////////	button mehr... im geplante trigger_listview
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vmehr     	; Maß nehmen
	else
	Gui,1: Add, button , 	vmehr Hidden	gButtonMehr
	mehr_TT := "`nGui,1: Add, button , vmehr Hidden gButtonMehr`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
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
	MarkierteLöschen_TT := "`nGui,1: Add, button, vMarkierteLöschen Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
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
	ListeExportieren_TT := "`nGui,1: Add, button , vListeExportieren Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
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
	ListeImportieren_TT := "`nGui,1: Add, button , vListeImportieren Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(43.5) thisW(7.4) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ListeImportieren
	GuiControl,1: ,  			ListeImportieren, 			Liste importieren
	GuiControl,1:    show, 			ListeImportieren
;	GuiControl,1:    hide, 			ListeImportieren
;	GuiControl,1:    focus, 		ListeImportieren
;	GuiControl,1:    disable, 		ListeImportieren
;	GuiControl,1:    enable, 		ListeImportieren
; ////////////////////////////////////////////////////////////////////////////////////	text Nächste System Aktion
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vNächsteGeplanteSystemAction ; Maß nehmen
	else
	Gui,1: Add, text , 	vNächsteGeplanteSystemAction cBlack Hidden	 center	
	Gui,1: Font,									% thisZoomFactorBold(10.501)
	GuiControl,1:    MoveDraw, 		NächsteGeplanteSystemAction,		% thisX(1.5) thisY(49.5) thisW(26.9) thisH(2) ;  default
	GuiControl,1:    Font, 			NächsteGeplanteSystemAction
	GuiControl,1: ,  			NächsteGeplanteSystemAction, 		;Nächste System Aktion
	GuiControl,1:    show, 			NächsteGeplanteSystemAction
;	GuiControl,1:    hide, 			NächsteGeplanteSystemAction
;	GuiControl,1:    focus, 		NächsteGeplanteSystemAction
;	GuiControl,1:    disable, 		NächsteGeplanteSystemAction
;	GuiControl,1:    enable, 		NächsteGeplanteSystemAction
	GuiControl,1: 	+cBlack, 		NächsteGeplanteSystemAction
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		NächsteGeplanteSystemAction
else
	GuiControl,1: 	+c%thisCcolor%, 	NächsteGeplanteSystemAction
; ////////////////////////////////////////////////////////////////////////////////////	button Log Liste Exportieren
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vLogListeExportieren ; Maß nehmen
	else
	Gui,1: Add, button , 	vLogListeExportieren gLogListeExportieren Hidden 		
	LogListeExportieren_TT := "`nGui,1: Add, button , vLogListeExportieren gLogListeExportieren Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		LogListeExportieren, 			% thisX(19.5) thisY(75.2) thisW(8.9) thisH(2.6) ;  default
	GuiControl,1:    Font, 			LogListeExportieren
	GuiControl,1: ,  LogListeExportieren, 	Logdaten exportieren
	GuiControl,1:    show, 			LogListeExportieren
;	GuiControl,1:    hide, 			LogListeExportieren
;	GuiControl,1:    focus, 		LogListeExportieren
;	GuiControl,1:    disable, 		LogListeExportieren
;	GuiControl,1:    enable, 		LogListeExportieren
; ////////////////////////////////////////////////////////////////////////////////////	button Log Liste Ansicht erweitern
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vLogListeAnsichtErweitern ; Maß nehmen
	else
	Gui,1: Add, button , 	vLogListeAnsichtErweitern Hidden ; gLogListeAnsichtErweitern 	
	LogListeAnsichtErweitern_TT := "`nGui,1: Add, button , vLogListeAnsichtErweitern Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		LogListeAnsichtErweitern, 		% thisX(9.1) thisY(75.2) thisW(9.9) thisH(2.6) ;  default
	GuiControl,1:    Font, 			LogListeAnsichtErweitern
	GuiControl,1: ,  LogListeAnsichtErweitern, 					Historie Ansicht erweitern
	GuiControl,1:    show, 			LogListeAnsichtErweitern
;	GuiControl,1:    hide, 			LogListeAnsichtErweitern
;	GuiControl,1:    focus, 		LogListeAnsichtErweitern
;	GuiControl,1:    disable, 		LogListeAnsichtErweitern
;	GuiControl,1:    enable, 		LogListeAnsichtErweitern

; ////////////////////////////////////////////////////////////////////////////////////  ListView LOG ListView2
;	ListView2Color=FF9977
ListView2Color=silver
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vListView2 	; Maß nehmen
	else
	Gui,1: Add, listview, vListView2 gListView2 hwndhListView2 grid background%ListView2Color% cBlack Hidden  +Checked	
									, Timestamp
									 |ThisLabel
									 |Name
									 |ThisFunc
									 |ThisHotkey
									 |PriorHotkey
									 |PriorKey
									 |TimeSinceThisHotkey
									 |TimeSincePriorHotkey
									 |GuiControl
									 |GuiEvent
									 |EventInfo
	ListView2_TT := "`nGui,1: Add, listview, vListView2 hwndhListView2 grid background%ListView2Color% cBlack Hidden +Checked`n" a_space "a_LineNumber: " a_lineNumber
	LV_ModifyCol(1,(wa*1.9)/xx)
	LV_ModifyCol(2,(wa*1.9)/xx)
	LV_ModifyCol(3,(wa*6)/xx)
	LV_ModifyCol(4,(wa*14)/xx)

	Gui,1: Font,									% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		ListView2, 					% thisX(1.0) thisY(54.8) thisW(28.0) thisH(20.0) ;  default
;	GuiControl,1:    MoveDraw, 		ListView2, 					% thisX(1.0) thisY(54.8) thisW(38.0) thisH(20.0) ;  dev
	GuiControl,1:    Font, 			ListView2
	GuiControl,1:    show, 			ListView2
;	GuiControl,1:    hide, 			ListView2
;	GuiControl,1:    focus, 		ListView2
;	GuiControl,1:    disable, 		ListView2
;	GuiControl,1:    enable, 		ListView2
;	GuiControl,1: 	+BackgroundFF9977, 	ListView2
	GuiControl,1: 	+cBlack, 		ListView2
	GuiControl,1: 	+cWhite, 		ListView2
;schriftFarbe := "blue"
if (schriftFarbe = "blue")
	GuiControl,1: 	+cBlack, 		ListView2
else
	GuiControl,1: 	+c%thisCcolor%, 	ListView2
if ShowListViewTrans
{
	GuiControl,1: 	+cWhite, 		ListView2
	GuiControl,1:    +BackgroundTrans, 	ListView2
}
; ////////////////////////////////////////////////////////////////////////////////////


/*
Gui,1:Font, s%fs10% normal,
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
*/

; '''''''''''''''''''''''''''#########################################''''''''''''''''''''''''''''''''''''#######################################'''''''''''''''''''''''######
; ////////////////////////////////////////////////////////////////////////////////////	ActiveXA

;if Bildauswahl 
;	pic := a_scriptDir "\po.jpg"
;else
;	pic := "O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)\fotos\2018.September.2 12.10.25--familienbande 02.09.2018 2.jpg"

	if MaßNehmen
	Gui,1: Add, text , 0x1000 vActiveXA ; Maß nehmen
	else
;	Gui,1: Add, ActiveX , vActiveXA hwndHActiveXA Hidden w300 h450	0x4000000,		% "mshtml:<img src='" pic "' />" 
	Gui,1: Add, pic , vActiveXA hwndHActiveXA Hidden center ; w300 h450	
	ActiveXA_TT := "`nGui,1: Add, pic , vActiveXA hwndHActiveXA Hidden center"
;	Gui,1: Font,							% thisZoomFactorBold(16.01) " cBlack", Verdana
; guimaße x:=(wa*29)/xx,	y:=(ha*10)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx

;	GuiControl,1:    MoveDraw, 		ActiveXA,		% thisX(0) thisY(0) thisW(65)  thisH(-1) ;  default
	GuiControl,1:    MoveDraw, 		ActiveXA,		% thisX(30) thisY(28) thisW(34) thisH(50) ;  default
;	GuiControl,1:    MoveDraw, 		ActiveXA,		% thisX(0) thisY(5) thisW(34) thisH(73) ;  default
;	GuiControl,1:    Font, 			ActiveXA
	GuiControl,1: ,  			ActiveXA, 		% pic

;	GuiControl,1:    show, 			ActiveXA
	if !bildAnzeigen
	GuiControl,1:    hide, 			ActiveXA
	else
	GuiControl,1:    show, 			ActiveXA

;	GuiControl,1:    focus, 		ActiveXA
;	GuiControl,1:    disable, 		ActiveXA
;	GuiControl,1:    enable, 		ActiveXA
;	GuiControl,1: 	+BackgroundFF9977, 	ActiveXA
;	GuiControl,1: 	+cFF9977, 		ActiveXA
;	pics := "http://www.animatedgif.net/cartoons/A_7blink_e0.gif"
;	GuiControl,1: 	, 			ActiveXA,  pics
;	GuiControl,1: 	, 	%	ahk_ID	HActiveXA,  % "mshtml:<img src='" pics "' />" 
	pic := a_scriptDir "\laptop 1360x768 dev.jpg"
	pic := a_scriptDir "\po.jpg"
;	Breite := thisW(65)
 	Breite := 600
    Höhe := -1  ; "Seitenverhältnis beibehalten" erscheint sinnvoll.
;     GuiControl,, ActiveXA,  %pic%  ; Bild laden.
;    GuiControl,, ActiveXA, *w%Breite% *h%Höhe% %pic%  ; Bild laden.
;    GuiControl,, ActiveXA,% "*w" thisW(333.5) " *h" Höhe a_space pic  ; Bild laden.
;    GuiControl,, ActiveXA,% "w" thisW(65) " h" Höhe a_space pic  ; Bild laden.
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Screen Saver
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vGroupBoxScreenSaver     	; Maß nehmen
	else
	Gui,1: Add, GroupBox, 	vGroupBoxScreenSaver Hidden	hwndHButtonGroupBoxScreenSaver
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		GroupBoxScreenSaver,					% thisX(30.0) thisY(.5) thisW(34.0) thisH(13.6) ;  default
	GuiControl,1:    Font, 			GroupBoxScreenSaver
	GuiControl,1: ,  			GroupBoxScreenSaver,					%a_space%Einstellen...%a_space%
;	GuiControl,1:    show, 			GroupBoxScreenSaver
	GuiControl,1:    hide, 			GroupBoxScreenSaver
;	GuiControl,1:    focus, 		GroupBoxScreenSaver
	GuiControl,1:    disable, 		GroupBoxScreenSaver
;	GuiControl,1:    enable, 		GroupBoxScreenSaver
; ////////////////////////////////////////////////////////////////////////////////////	GroupBox AlertConfig
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vAlertConfig     	; Maß nehmen
	else
	Gui,1: Add, GroupBox , 	vAlertConfig Hidden	hwndHButtonAlertConfig
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		AlertConfig,					% thisX(53.3) thisY(1.9) thisW(10.0) thisH(10.6) ;  default
	GuiControl,1:    Font, 			AlertConfig
	GuiControl,1: ,  			AlertConfig,					%a_space%Alarme && Trigger%a_space%
;	GuiControl,1:    show, 			AlertConfig
	GuiControl,1:    hide, 			AlertConfig
;	GuiControl,1:    focus, 		AlertConfig
	GuiControl,1:    disable, 		AlertConfig
;	GuiControl,1:    enable, 		AlertConfig
; ////////////////////////////////////////////////////////////////////////////////////	button ScreenSaver
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vScreenSaver     	; Maß nehmen
	else
	Gui,1: Add, button , 	vScreenSaver Hidden	hwndHButtonScreenSaver Left
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		ScreenSaver,					% thisX(30.5) thisY(2.5) thisW(11.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			ScreenSaver
	GuiControl,1: ,  			ScreenSaver,					%a_space%Bildschirmschoner...%a_space%
	GuiControl,1:    show, 			ScreenSaver
	GuiControl,1:    hide, 			ScreenSaver
;	GuiControl,1:    focus, 		ScreenSaver
;	GuiControl,1:    disable, 		ScreenSaver
;	GuiControl,1:    enable, 		ScreenSaver
; ////////////////////////////////////////////////////////////////////////////////////	button Trigger Dateien konfigurieren
	if !MaßNehmen
	Gui,1: Add, text , 0x1000 vTriggerDateien     	; Maß nehmen
	else
	Gui,1: Add, button , 	vTriggerDateien Hidden	hwndHButtonTriggerDateien Left
	TriggerDateien_TT := "`nGui,1: Add, button , vTriggerDateien Hidden hwndHButtonTriggerDateien Left"
	Gui,1: Font,									% thisZoomFactorNormal(9.011)
	GuiControl,1:    MoveDraw, 		TriggerDateien,					% thisX(30.5) thisY(5.5) thisW(11.5) thisH(2.6) ;  default
	GuiControl,1:    Font, 			TriggerDateien
	GuiControl,1: ,  			TriggerDateien,					%a_space%Trigger Dateien konfigurieren...%a_space%
	GuiControl,1:    show, 			TriggerDateien
	GuiControl,1:    hide, 			TriggerDateien
;	GuiControl,1:    focus, 		TriggerDateien
;	GuiControl,1:    disable, 		TriggerDateien
;	GuiControl,1:    enable, 		TriggerDateien






MaßNehmen1200 := 0

; ////////////////////////////////////////////////////////////////////////////////////	SonnenaufgangText SonnenaufgangGUI2Text

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSonnenaufgangGUI2Text ; Maß nehmen
	else
	Gui,1: Add, text , 	vSonnenaufgangGUI2Text hwndhSonnenaufgangGUI2Text Left Hidden	; gnMalBlinkenOFF 
	SonnenaufgangGUI2Text_TT := "`nGui,1: Add, text , 	vSonnenaufgangGUI2Text hwndhSonnenaufgangGUI2Text Left Hidden`n"
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SonnenaufgangGUI2Text,		% thisX(31.5900) thisY(4.9) thisW(11) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SonnenaufgangGUI2Text
	GuiControl,1: ,  			SonnenaufgangGUI2Text, 		Nächster in:
	GuiControl,1:    show, 			SonnenaufgangGUI2Text
;	GuiControl,1:    hide, 			SonnenaufgangGUI2Text
;	GuiControl,1:    focus, 		SonnenaufgangGUI2Text
;	GuiControl,1:    disable, 		SonnenaufgangGUI2Text
;	GuiControl,1:    enable, 		SonnenaufgangGUI2Text
	GuiControl,1:    +BackgroundTrans, 	SonnenaufgangGUI2Text
; ////////////////////////////////////////////////////////////////////////////////////	SonnenaufgangZeit SonnenaufgangGUI2Zeit

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSonnenaufgangGUI2Zeit gSonnenaufgangGUI2Zeit_gLabel ; Maß nehmen
	else
	Gui,1: Add, text , 	vSonnenaufgangGUI2Zeit hwndhSonnenaufgangGUI2Zeit Left Hidden	; gnMalBlinkenOFF 
	SonnenaufgangGUI2Zeit_TT := "`nGui,1: Add, text , 	vSonnenaufgangGUI2Zeit hwndhSonnenaufgangGUI2Zeit Left Hidden`n" a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SonnenaufgangGUI2Zeit,		% thisX(43.0) thisY(4.9) thisW(20.1111) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SonnenaufgangGUI2Zeit
	GuiControl,1: ,  			SonnenaufgangGUI2Zeit, 		99 Stunden 99 Minuten ; Nächster in:
	GuiControl,1:    show, 			SonnenaufgangGUI2Zeit
;	GuiControl,1:    hide, 			SonnenaufgangGUI2Zeit
;	GuiControl,1:    focus, 		SonnenaufgangGUI2Zeit
;	GuiControl,1:    disable, 		SonnenaufgangGUI2Zeit
;	GuiControl,1:    enable, 		SonnenaufgangGUI2Zeit
	GuiControl,1:    +BackgroundTrans, 	SonnenaufgangGUI2Zeit
; ////////////////////////////////////////////////////////////////////////////////////	SeitSonnenaufgangText SeitSonnenaufgangGUI2Text

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSeitSonnenaufgangGUI2Text ; Maß nehmen
	else
	Gui,1: Add, text , 	vSeitSonnenaufgangGUI2Text hwndhSeitSonnenaufgangGUI2Text Left Hidden	; gnMalBlinkenOFF 
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SeitSonnenaufgangGUI2Text,	% thisX(31.5900) thisY(8.6) thisW(11) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SeitSonnenaufgangGUI2Text
	GuiControl,1: ,  			SeitSonnenaufgangGUI2Text, 		Letzter vor:
	GuiControl,1:    show, 			SeitSonnenaufgangGUI2Text
;	GuiControl,1:    hide, 			SeitSonnenaufgangGUI2Text
;	GuiControl,1:    focus, 		SeitSonnenaufgangGUI2Text
;	GuiControl,1:    disable, 		SeitSonnenaufgangGUI2Text
;	GuiControl,1:    enable, 		SeitSonnenaufgangGUI2Text
	GuiControl,1:    +BackgroundTrans, 	SeitSonnenaufgangGUI2Text
; ////////////////////////////////////////////////////////////////////////////////////	seitSonnenaufgangZeit SonnenaufgangGUI2Zeit

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSeitSonnenaufgangGUI2Zeit ; Maß nehmen
	else
	Gui,1: Add, text , 	vSeitSonnenaufgangGUI2Zeit Left Hidden	; gnMalBlinkenOFF 
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SeitSonnenaufgangGUI2Zeit,		% thisX(43.0) thisY(8.6) thisW(20.1111) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SeitSonnenaufgangGUI2Zeit
	GuiControl,1: ,  			SeitSonnenaufgangGUI2Zeit, 		99 Stunden 99 Minuten ; Letzter vor:
	GuiControl,1:    show, 			SeitSonnenaufgangGUI2Zeit
;	GuiControl,1:    hide, 			SeitSonnenaufgangGUI2Zeit
;	GuiControl,1:    focus, 		SeitSonnenaufgangGUI2Zeit
;	GuiControl,1:    disable, 		SeitSonnenaufgangGUI2Zeit
;	GuiControl,1:    enable, 		SeitSonnenaufgangGUI2Zeit
	GuiControl,1:    +BackgroundTrans, 	SeitSonnenaufgangGUI2Zeit
; ////////////////////////////////////////////////////////////////////////////////////	

MaßNehmen1264 := 0
; ////////////////////////////////////////////////////////////////////////////////////		GroupBox Sonnenaufgang
	if MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vGroupBoxSonneAuf     	; Maß nehmen
	else
	Gui,1: Add, GroupBox, 	vGroupBoxSonneAuf Hidden	hwndHButtonGroupBoxSonneAuf 
	Gui,1: Font,									% thisZoomFactorBold(22.5111)
	GuiControl,1:    MoveDraw, 		GroupBoxSonneAuf,					% thisX(30.0) thisY(.5) thisW(34.0) thisH(13.01) ;  default
	GuiControl,1:    Font, 			GroupBoxSonneAuf
	GuiControl,1: ,  			GroupBoxSonneAuf,					; %a_space%Sonnenaufgang%a_space%23:99
	GuiControl,1:    show, 			GroupBoxSonneAuf
;	GuiControl,1:    hide, 			GroupBoxSonneAuf
;	GuiControl,1:    focus, 		GroupBoxSonneAuf
;	GuiControl,1:    disable, 		GroupBoxSonneAuf
;	GuiControl,1:    enable, 		GroupBoxSonneAuf
;	GuiControl,1:    +BackgroundTrans, 	GroupBoxSonneAuf

; ////////////////////////////////////////////////////////////////////////////////////	GroupBox Sonnenuntergang
	if MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vGroupBoxSonneUnter     	; Maß nehmen
	else
	Gui,1: Add, GroupBox, 	vGroupBoxSonneUnter Hidden	hwndHButtonGroupBoxSonneUnter
	Gui,1: Font,									% thisZoomFactorBold(22.5111)
	GuiControl,1:    MoveDraw, 		GroupBoxSonneUnter,					% thisX(30.0) thisY(13.5) thisW(34.0) thisH(13.1) ;  default
	GuiControl,1:    Font, 			GroupBoxSonneUnter
	GuiControl,1: ,  			GroupBoxSonneUnter,					; %a_space%Sonnenuntergang%a_space%23:99
	GuiControl,1:    show, 			GroupBoxSonneUnter
;	GuiControl,1:    hide, 			GroupBoxSonneUnter
;	GuiControl,1:    focus, 		GroupBoxSonneUnter
;	GuiControl,1:    disable, 		GroupBoxSonneUnter
;	GuiControl,1:    enable, 		GroupBoxSonneUnter
;	GuiControl,1:    +BackgroundTrans, 	GroupBoxSonneUnter

; /////////////////////////////////////////////GroupBox klickbar machen/////////////	GroupBox Sonnenstunden GroupBoxSonnenstunden
	Gui,1: Add, text, gGroupBoxSonnenstundenCSV vGroupBoxSonnenstundenCSV ; GroupBoxSonnenstundenCSV:
	GuiControl,1:    MoveDraw, 		GroupBoxSonnenstundenCSV,				% thisX(30.0) thisY(26.9) thisW(34.0) thisH(4.1) ;  default thisY(30.5) 
;	GuiControl,1:    show, 			GroupBoxSonnenstundenCSV
;	GuiControl,1:    +BackgroundTrans, 	GroupBoxSonnenstundenCSV
;	GuiControl,1:    +BackgroundBlue, 	GroupBoxSonnenstundenCSV

	if  MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vGroupBoxSonnenstunden     	; Maß nehmen
	else
	Gui,1: Add, GroupBox, 	vGroupBoxSonnenstunden Hidden	hwndHButtonGroupBoxSonnenstunden ; gGroupBoxSonnenstunden GroupBoxSonnenstunden:
	Gui,1: Font,									% thisZoomFactorBold(19.6111)  ; (22.5111)
	GuiControl,1:    MoveDraw, 		GroupBoxSonnenstunden,					% thisX(30.0) thisY(26.9) thisW(34.0) thisH(4.1) ;  default thisY(30.5) 
	GuiControl,1:    Font, 			GroupBoxSonnenstunden
	thisSonnenstunden  := "[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]
;	GuiControl,1: ,  			GroupBoxSonnenstunden,					% thisSonnenstunden  
;	GuiControl,1: ,  			GroupBoxSonnenstunden,					% "Sonnenstunden "  Sonnenstunden Sonnenminuten
;	GuiControl,1:    +BackgroundGreen	, 			GroupBoxSonnenstunden
	GuiControl,1:    show, 			GroupBoxSonnenstunden
;	GuiControl,1:    hide, 			GroupBoxSonnenstunden
;	GuiControl,1:    focus, 		GroupBoxSonnenstunden
;	GuiControl,1:    disable, 		GroupBoxSonnenstunden
;	GuiControl,1:    enable, 		GroupBoxSonnenstunden
;	GuiControl,1:    +BackgroundTrans, 	GroupBoxSonnenstunden

; ////////////////////////////////////////////////////////////////////////////////////	SonnenuntergangText SonnenuntergangGUI2Text

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSonnenuntergangGUI2Text ; Maß nehmen
	else
	Gui,1: Add, text , 	vSonnenuntergangGUI2Text Left Hidden gThrowTouch
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SonnenuntergangGUI2Text,		% thisX(31.5900) thisY(17.8500) thisW(11) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SonnenuntergangGUI2Text
	GuiControl,1: ,  			SonnenuntergangGUI2Text, 		Nächster in:
	GuiControl,1:    show, 			SonnenuntergangGUI2Text
;	GuiControl,1:    hide, 			SonnenuntergangGUI2Text
;	GuiControl,1:    focus, 		SonnenuntergangGUI2Text
;	GuiControl,1:    disable, 		SonnenuntergangGUI2Text
;	GuiControl,1:    enable, 		SonnenuntergangGUI2Text
	GuiControl,1:    +BackgroundTrans, 	SonnenuntergangGUI2Text
; ////////////////////////////////////////////////////////////////////////////////////	SonnenuntergangZeit SonnenuntergangGUI2Zeit

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSonnenuntergangGUI2Zeit ; Maß nehmen
	else
	Gui,1: Add, text , 	vSonnenuntergangGUI2Zeit hwndhSonnenuntergangGUI2Zeit Left Hidden	; gnMalBlinkenOFF 
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SonnenuntergangGUI2Zeit,		% thisX(43.0) thisY(17.8500) thisW(20.1111) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SonnenuntergangGUI2Zeit
	GuiControl,1: ,  			SonnenuntergangGUI2Zeit, 		99 Stunden 99 Minuten ; Nächster in:
	GuiControl,1:    show, 			SonnenuntergangGUI2Zeit
;	GuiControl,1:    hide, 			SonnenuntergangGUI2Zeit
;	GuiControl,1:    focus, 		SonnenuntergangGUI2Zeit
;	GuiControl,1:    disable, 		SonnenuntergangGUI2Zeit
;	GuiControl,1:    enable, 		SonnenuntergangGUI2Zeit
	GuiControl,1:    +BackgroundTrans, 	SonnenuntergangGUI2Zeit
; ////////////////////////////////////////////////////////////////////////////////////	SeitSonnenuntergangText SeitSonnenuntergangGUI2Text

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSeitSonnenuntergangGUI2Text ; Maß nehmen
	else
	Gui,1: Add, text , 	vSeitSonnenuntergangGUI2Text gThrowLaeis Left Hidden	; gnMalBlinkenOFF 
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SeitSonnenuntergangGUI2Text,		% thisX(31.5900) thisY(21.5500) thisW(11) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SeitSonnenuntergangGUI2Text
	GuiControl,1: ,  			SeitSonnenuntergangGUI2Text, 		Letzter vor:
	GuiControl,1:    show, 			SeitSonnenuntergangGUI2Text
;	GuiControl,1:    hide, 			SeitSonnenuntergangGUI2Text
;	GuiControl,1:    focus, 		SeitSonnenuntergangGUI2Text
;	GuiControl,1:    disable, 		SeitSonnenuntergangGUI2Text
;	GuiControl,1:    enable, 		SeitSonnenuntergangGUI2Text
	GuiControl,1:    +BackgroundTrans, 	SeitSonnenuntergangGUI2Text
; ////////////////////////////////////////////////////////////////////////////////////	seitSonnenuntergangZeit SonnenuntergangGUI2Zeit

	if MaßNehmen || MaßNehmen1200
	Gui,1: Add, text , 0x1000 vSeitSonnenuntergangGUI2Zeit ; Maß nehmen
	else
	Gui,1: Add, text , 	vSeitSonnenuntergangGUI2Zeit Left Hidden	; gnMalBlinkenOFF 
	Gui,1: Font,							% thisZoomFactorBold(20.5111) " cBlack", Verdana 
	GuiControl,1:    MoveDraw, 		SeitSonnenuntergangGUI2Zeit,		% thisX(43.0) thisY(21.5500) thisW(20.1111) thisH(2.99) ;  default
	GuiControl,1:    Font, 			SeitSonnenuntergangGUI2Zeit
	GuiControl,1: ,  			SeitSonnenuntergangGUI2Zeit, 		99 Stunden 99 Minuten ; Letzter vor:
	GuiControl,1:    show, 			SeitSonnenuntergangGUI2Zeit
;	GuiControl,1:    hide, 			SeitSonnenuntergangGUI2Zeit
;	GuiControl,1:    focus, 		SeitSonnenuntergangGUI2Zeit
;	GuiControl,1:    disable, 		SeitSonnenuntergangGUI2Zeit
;	GuiControl,1:    enable, 		SeitSonnenuntergangGUI2Zeit
	GuiControl,1:    +BackgroundTrans, 	SeitSonnenuntergangGUI2Zeit
; ////////////////////////////nacht woche schaltjahr /////////////////////////	text unter GroupBox Sonnenstunden GroupBoxSonnenstunden ; 
	if MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vTextInGroupBoxSonnenstunden     	; Maß nehmen
	else
	Gui,1: Add, text , gGroupBoxUnterSonnenstundenCSV vTextInGroupBoxSonnenstunden Hidden	center hwndHButtonTextInGroupBoxSonnenstunden
	Gui,1: Font,									% thisZoomFactorBold(13.6111)  ; (22.5111)
	GuiControl,1:    MoveDraw, 		TextInGroupBoxSonnenstunden,		% thisX(30.41900) thisY(35.5)  thisW(33.0) thisH(2.9) ;  default (31.5900) 
	GuiControl,1:    Font, 			TextInGroupBoxSonnenstunden

;	thisSonnenstunden  := "[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]

;	GuiControl,1: ,  			TextInGroupBoxSonnenstunden, ;					% thisSonnenstunden  
	GuiControl,1: ,  			TextInGroupBoxSonnenstunden, ;	%  isSchaltjahr(A_Year) "`n" TagNachtZeiten() "`n" MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"]
	GuiControl,1:    +BackgroundTrans, 	TextInGroupBoxSonnenstunden
	GuiControl,1:    show, 			TextInGroupBoxSonnenstunden
;	GuiControl,1:    hide, 			TextInGroupBoxSonnenstunden
;	GuiControl,1:    focus, 		TextInGroupBoxSonnenstunden
;	GuiControl,1:    disable, 		TextInGroupBoxSonnenstunden
;	GuiControl,1:    enable, 		TextInGroupBoxSonnenstunden
;	GuiControl,1:    +BackgroundGreen,	TextInGroupBoxSonnenstunden
	GuiControl,1:    +cBlack,	TextInGroupBoxSonnenstunden
	GuiControl,1:    +BackgroundTrans, 	TextInGroupBoxSonnenstunden
; //////////////////////////////GroupBoxUnterSonnenstundenCSV: klickbar machen///////////	GroupBox winterzeit unter Sonnenstunden GroupBoxUnterSonnenstunden
;	Gui,1: Add, text, gGroupBoxUnterSonnenstundenCSV vGroupBoxUnterSonnenstundenCSV ; GroupBoxUnterSonnenstunden:
;	GuiControl,1:    MoveDraw, 		GroupBoxUnterSonnenstundenCSV,					% thisX(30.0) thisY(32.5) thisW(34.0) thisH(6.1) ;  default thisY(30.5) 

	if MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vGroupBoxUnterSonnenstunden     	; Maß nehmen
	else
	Gui,1: Add, GroupBox , 	vGroupBoxUnterSonnenstunden Hidden	hwndHGroupBoxUnterSonnenstunden
	Gui,1: Font,									% thisZoomFactorBold(14.1111)  ; (22.5111)
	GuiControl,1:    MoveDraw, 		GroupBoxUnterSonnenstunden,					% thisX(30.0) thisY(32.5) thisW(34.0) thisH(6.1) ;  default thisY(30.5) 
	GuiControl,1:    Font, 			GroupBoxUnterSonnenstunden
	GuiControl,1: ,  			GroupBoxUnterSonnenstunden,					Test
	GuiControl,1: ,  			GroupBoxUnterSonnenstunden,				 	%  a_space TagNachtZeiten() a_space 
;	GuiControl,1:    +BackgroundGreen, 	GroupBoxUnterSonnenstunden
	GuiControl,1:    show, 			GroupBoxUnterSonnenstunden
;	GuiControl,1:    hide, 			GroupBoxUnterSonnenstunden
;	GuiControl,1:    focus, 		GroupBoxUnterSonnenstunden
;	GuiControl,1:    disable, 		GroupBoxUnterSonnenstunden
;	GuiControl,1:    enable, 		GroupBoxUnterSonnenstunden
;	GuiControl,1:    +BackgroundTrans, 	GroupBoxUnterSonnenstunden
; ////////////////////////////////////////////////////////////////////////////////////	

/* 

Gui, +Resize
Gui, Add, Button, default, Neues Bild &laden
Gui, Add, Radio, ym+5 x+10 vOption checked, &Originalgröße
Gui, Add, Radio, ym+5 x+10, &Kompletter Bildschirm
Gui, Add, Pic, xm vPic
Gui,1: Show
return

ButtonNeuesBildLaden:
FileSelectFile, Datei,,, Bild auswählen:, Bilder (*.gif; *.jpg; *.bmp; *.png; *.tif; *.ico; *.cur; *.ani; *.exe; *.dll)
if not Datei
    return
Gui, Submit, NoHide ; Speichert die Werte der Radio-Steuerelemente.
if (Option = 1)  ; Bild mit aktueller Größe anzeigen.
{
    Breite := 0
    Höhe := 0
}
else ; Zweites Optionsfeld ausgewählt: Größe des Bildes an Bildschirmgröße anpassen.
{
    Breite := A_ScreenWidth - 28  ; Minus 28, um Platz für Rahmen und Innenabstand zu schaffen.
    Höhe := -1  ; "Seitenverhältnis beibehalten" erscheint sinnvoll.
}
GuiControl,, Pic, *w%Breite% *h%Höhe% %Datei%  ; Bild laden.
Gui,1: Show, xCenter y0 AutoSize, %Datei%  ; Fenstergröße an Bildgröße anpassen.
return

GuiClose:
ExitApp
*/ 
; '''''''''''''''''''''''''''#########################################''''''''''''''''''''''''''''''''''''#######################################'''''''''''''''''''''''######


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
	Gui,1: Add, Progress,   Disabled BackgroundSilver	vThisProgress#1a
	GuiControl,1:    MoveDraw, 		ThisProgress#1a,			% thisX(.5) thisY(.5) thisW(65) thisH(.01) ;  default
;Gui, 1: -Border
;gui,show, x0 y0 w%L1920% h%A_screenHeight% ,% strReplace((substr(a_scriptname,-11)),".ahk")
 gui,show, x0 y0 w%L1920% h%L1080% ,% strReplace((substr(a_scriptname,-11)),".ahk")
} else { ; https://www.autohotkey.com/board/topic/120289-color-f%C3%BCr-buttons/ by garry
;	Gui, Color, ffAA99
;	Gui, Color, black, black
; loopProgress()							; 
; thisLoopProgress, 
	Gui,1: Add, Progress,   BackgroundRed vthisLoopProgress hwndHthisLoopProgress
	Control ExStyle, -0x20000,, % "ahk_id" HthisLoopProgress ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos
	GuiControl,1:    MoveDraw, 		thisLoopProgress,			% thisX(0) thisY(0) thisW(65) thisH(80) ;  default
	GuiControl,1:    hide, 			thisLoopProgress

	Gui,1: Add, Progress,   BackgroundRed vThisProgress#1c hwndHThisProgress#1c
	Control ExStyle, -0x20000,, % "ahk_id" HThisProgress#1c ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos
	GuiControl,1:    MoveDraw, 		ThisProgress#1c,			% thisX(.05) thisY(.5) thisW(.5) thisH(79.1) ;  default

	Gui,1: Add, Progress,   BackgroundRed	vThisProgress#1d hwndHThisProgress#1d
	Control ExStyle, -0x20000,, % "ahk_id" HThisProgress#1d
	GuiControl,1:    MoveDraw, 		ThisProgress#1d,			% thisX(64.5) thisY(.5) thisW(.5) thisH(79.1) ;  default

	Gui,1: Add, Progress,   BackgroundRed	vThisProgress#1a hwndHThisProgress#1a
	Control ExStyle, -0x20000,, % "ahk_id" HThisProgress#1a
	GuiControl,1:    MoveDraw, 		ThisProgress#1a,			% thisX(.6) thisY(.5) thisW(63.9) thisH(1.01) ;  default

	Gui,1: Add, Progress,   BackgroundRed	vThisProgress#1b hwndHThisProgress#1b
	Control ExStyle, -0x20000,, % "ahk_id" HThisProgress#1b
	GuiControl,1:    MoveDraw, 		ThisProgress#1b,			% thisX(.5) thisY(78.5) thisW(63.9) thisH(1.01) ;  default

	GuiControl,1:    hide, 			ThisProgress#1a
	GuiControl,1:    hide, 			ThisProgress#1b
	GuiControl,1:    hide, 			ThisProgress#1c
	GuiControl,1:    hide, 			ThisProgress#1d
;	Gui, +LastFound
;	WinSet, TransColor, EEAA99
;	Gui, Color, default

	if !MaßNehmen || MaßNehmen1264
	Gui,1: Add, text , 0x1000 vGewählterHotkey     	; Maß nehmen
	else
	Gui, Add, Hotkey, vGewählterHotkey gGewählterHotkey ; hwndHGewählterHotkey 
;	Gui,1: Add, text , 	vGewählterHotkey Hidden	hwndHButtonGewählterHotkey
	Gui,1: Font,								% thisZoomFactorBold(8.6111)  ; (22.5111)
	GuiControl,1:    MoveDraw, 		GewählterHotkey,		% thisX(30.41900) thisY(45.5)  thisW(13.0) thisH(2.4) ;  default (31.5900) 
;	GuiControl,1:    Font, 			GewählterHotkey
;	GuiControl,1: ,  			GewählterHotkey,	; Hotkey festlegen
;	GuiControl,1:    +BackgroundTrans, 	GewählterHotkey
;	GuiControl,1:    show, 			GewählterHotkey
	GuiControl,1:    hide, 			GewählterHotkey
;	GuiControl,1:    focus, 		GewählterHotkey
	GuiControl,1:    disable, 		GewählterHotkey
;	GuiControl,1:    enable, 		GewählterHotkey
;	GuiControl,1:    +BackgroundGreen,	GewählterHotkey
;	GuiControl,1:    +cMaroon,		GewählterHotkey
;	GuiControl,1:    +BackgroundTrans, 	GewählterHotkey
;	GuiControl,1: 	 +cBlack, 		GewählterHotkey
; 	EM_SETCUEBANNER(HGewählterHotkey, " Hotkey festlegen")




; ////////////////////////////////////////////////////////////////////////////////////	counteranzeige neben "historie ansicht erweitern" MainArray["thisRISECounter"]
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vRiseCounterGUIanzeige     	; Maß nehmen
	else
	Gui,1: Add, text , 	vRiseCounterGUIanzeige gRiseCounterGUIanzeige center
	Gui,1: Font,									% thisZoomFactorBold(16.654321)
	GuiControl,1:    MoveDraw, 		RiseCounterGUIanzeige,		% thisX(2.41900) thisY(75.1)  thisW(2.0) thisH(3.0) ;
	GuiControl,1:    Font, 			RiseCounterGUIanzeige
	GuiControl,1: ,  			RiseCounterGUIanzeige,		%  MainArray["thisRISECounter"] := f1counter(true)
	GuiControl,1:    +BackgroundTrans, 	RiseCounterGUIanzeige
	GuiControl,1:    show, 			RiseCounterGUIanzeige
;	GuiControl,1:    hide, 			RiseCounterGUIanzeige
;	GuiControl,1:    focus, 		RiseCounterGUIanzeige
;	GuiControl,1:    disable, 		RiseCounterGUIanzeige
;	GuiControl,1:    enable, 		RiseCounterGUIanzeige
;	GuiControl,1:    +BackgroundGreen,	RiseCounterGUIanzeige
	GuiControl,1:    +cMaroon,	RiseCounterGUIanzeige
; ////////////////////////////////////////////////////////////////////////////////////	counteranzeige neben "historie ansicht erweitern" MainArray["thisSETCounter"]
	if MaßNehmen
	Gui,1: Add, text , 0x1000 vSetCounterGUIanzeige     	; Maß nehmen
	else
	Gui,1: Add, text , 	vSetCounterGUIanzeige gSetCounterGUIanzeige center
	Gui,1: Font,									% thisZoomFactorBold(16.654321)
	GuiControl,1:    MoveDraw, 		SetCounterGUIanzeige,		% thisX(5.41900) thisY(75.1)  thisW(2.0) thisH(3.0) ;
	GuiControl,1:    Font, 			SetCounterGUIanzeige
	GuiControl,1: ,  			SetCounterGUIanzeige,		%  MainArray["thisSETCounter"] := f2counter(true)
	GuiControl,1:    +BackgroundTrans, 	SetCounterGUIanzeige
	GuiControl,1:    show, 			SetCounterGUIanzeige
;	GuiControl,1:    hide, 			SetCounterGUIanzeige
;	GuiControl,1:    focus, 		SetCounterGUIanzeige
;	GuiControl,1:    disable, 		SetCounterGUIanzeige
;	GuiControl,1:    enable, 		SetCounterGUIanzeige
;	GuiControl,1:    +BackgroundGreen,	SetCounterGUIanzeige
	GuiControl,1:    +cMaroon,		SetCounterGUIanzeige


; ////////////////////////////////////////////////////////////////////////////////////feiertage//

	thisFeiertagBundesland = all ; default

	if (thisFeiertagBundesland="bw")
	thisFeiertage :=  feiertage(a_yyyy,"bw","longdate")  	; bw=Baden-Württemberg 12
			, LVReihen = 6, thisH := thisH(22.801)

	if (thisFeiertagBundesland="bya")
	thisFeiertage := feiertage(a_yyyy,"bya","longdate") 	; bya=Bayern alle 16
			, LVReihen = 8, thisH := thisH(29.502)

	if (thisFeiertagBundesland="byk")
	thisFeiertage := feiertage(a_yyyy,"byk","longdate") 	; byk=Bayern kath. 15
			, LVReihen = 7, thisH := thisH(28.0)

	if (thisFeiertagBundesland="byp")
	thisFeiertage := feiertage(a_yyyy,"byp","longdate") 	; byp=Bayern prot. 14
			, LVReihen = 7, thisH := thisH(26.5)

	if (thisFeiertagBundesland="be")
	thisFeiertage := feiertage(a_yyyy,"be","longdate") 	; be=Berlin  10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="bb")
	thisFeiertage := feiertage(a_yyyy,"bb","longdate") 	; bb=Brandenburg 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="hb")
	thisFeiertage := feiertage(a_yyyy,"hb","longdate") 	; hb=Bremen 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="hh")
	thisFeiertage := feiertage(a_yyyy,"hh","longdate") 	; hh=Hamburg 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="he")
	thisFeiertage := feiertage(a_yyyy,"he","longdate") 	; he=Hessen 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="mv")
	thisFeiertage := feiertage(a_yyyy,"mv","longdate") 	; mv=Mecklenburg-Vorpommern 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="ni")
	thisFeiertage := feiertage(a_yyyy,"ni","longdate") 	; ni=Niedersachsen 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="nw")
	thisFeiertage := feiertage(a_yyyy,"nw","longdate") 	; nw=Nordrhein-Westfalen 11
			, LVReihen = 6, thisH := thisH(21.50) 

	if (thisFeiertagBundesland="rp")
	thisFeiertage := feiertage(a_yyyy,"rp","longdate") 	; rp=Rheinland-Pfalz 11
			, LVReihen = 6, thisH := thisH(21.50) 

	if (thisFeiertagBundesland="sl")
	thisFeiertage := feiertage(a_yyyy,"sl","longdate") 	; sl=Saarland 12
			, LVReihen = 6, thisH := thisH(22.801)

	if (thisFeiertagBundesland="sn")
	thisFeiertage := feiertage(a_yyyy,"sn","longdate") 	; sn=Sachsen 11
			, LVReihen = 6, thisH := thisH(21.50) 

	if (thisFeiertagBundesland="st")
	thisFeiertage := feiertage(a_yyyy,"st","longdate") 	; st=Sachsen-Anhalt 11
			, LVReihen = 6, thisH := thisH(21.50) 

	if (thisFeiertagBundesland="sh")
	thisFeiertage := feiertage(a_yyyy,"sh","longdate") 	; sh=Schleswig-Holstein 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="th")
	thisFeiertage := feiertage(a_yyyy,"th","longdate") 	; th=Thüringen 10
			, LVReihen = 5, thisH := thisH(19.50) 

	if (thisFeiertagBundesland="all")
	thisFeiertage := feiertage(a_yyyy,"dl","longdate") 	; alle Bundesländer 19
			, LVReihen = 10, thisH := thisH(35.0) 

		while instr(thisFeiertage,a_tab)
		thisFeiertage := strReplace(thisFeiertage,a_tab,a_space)

		while instr(thisFeiertage,a_space a_space)
		thisFeiertage := strReplace(thisFeiertage,a_space a_space, a_space)

	if MaßNehmen
	Gui,1: Add, text , 0x1000 gLVfeiertageON vLVfeiertageON cBlack Hidden backgroundTrans, dieses feld anklicken zum reaktivieren des vorher ausgeblendeten listview
	else
	Gui,1: Add, text , gLVfeiertageON vLVfeiertageON cBlack Hidden backgroundTrans  ;  dieses feld anklicken zum reaktivieren des vorher ausgeblendeten listview
	_LVfeiertageON_TT := "`nGui,1: Add, text , gLVfeiertageON vLVfeiertageON cBlack Hidden backgroundTrans`n"
	GuiControl,1:    MoveDraw, 		LVfeiertageON,			% thisX(30.0) thisY(45.5) thisW(34.0)  thisH
	GuiControl,1:    hide, 			LVfeiertageON

	reihenListViewFeiertage := strSplit(thisFeiertage,"`n","`r")
; LVfeiertage:
	if MaßNehmen
	Gui,1: Add, text , % "r" (reihenListViewFeiertage.length()-7.3) " 0x1000  vLVfeiertage gLVfeiertage  hwndhLVfeiertage "
	else ; 			    ((reihenListViewFeiertage.length())-6) ; nrw -6) ; alle -10)
	Gui,1: Add, listview ,% "r" ((reihenListViewFeiertage.length())-LVReihen+1) " NoSort vLVfeiertage gLVfeiertage  hwndhLVfeiertage grid cBlack Hidden background"  ListView1Color 
																, #|Feiertage %a_yyyy%|Wochentag|Datum - alle Bundesländer - 19 Feiertage
	LVfeiertage_TT := "`nGui,1: Add, listview ,% ""r"" ((reihenListViewFeiertage.length())-LVReihen) "" vLVfeiertage gLVfeiertage  hwndhLVfeiertage grid cBlack Hidden background""  ListView1Color`n
																, #|Feiertage `%a_yyyy`%|Wochentag|Datum`n" 
																. a_space "a_LineNumber: " a_lineNumber
	Gui,1: Font,								% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		LVfeiertage,			% thisX(30.0) thisY(40.5) thisW(34.0)  thisH ; " r" ((reihenListViewFeiertage.length())) ;
	GuiControl,1:    Font, 			LVfeiertage
	GuiControl,1:    show, 			LVfeiertage
;	GuiControl,1:    hide, 			LVfeiertage

	Gui,1: listview, LVfeiertage
	loop, parse, thisFeiertage, `n, `r 
	{
	if a_loopField {
	aloopField := RTRIM(a_loopField,",")
	LV_ADD("", (a_index-1), strSplit(aloopField,[":","`,"],,3)*)
	}}
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
;	LV_ADD("", "#", reihenListViewFeiertage.length())

	Gui,1: listview, listview2

A_DefaultListViewTest := 0
if A_DefaultListViewTest
{
	GuiControl,1: Focus, ListView2
	Gui,1: listview, listview2
}


; ////////////////////////////////////////////////////////////////////////////////////	

;/*
if throwLaeis		; GUI auf Monitor rechts
x:=(wa*-65)/xx,	y:=(ha*0)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
   else
x:=(wa*29)/xx,	y:=(ha*10)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
   gui,1: show, x%x% y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
;   gui,show,x-1650 y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
}
; gui,show,x%x% y%y% w%w% h%h% ,TEST	
;GuiControl,1: Focus,T1			
GuiControl,1: Focus, ListView2
;	GuiControl,1:    hide, 			ListView1
;GuiControl,1: focus, ListeImportieren
} else {   ; #################################################################################################################################################################################################################################
sleep 1111
} ; showGUI2 }
;*/

if ListViewTrans
{
	GuiControl,1: 	+BackgroundTrans, 	ListView1
	GuiControl,1: 	+BackgroundTrans, 	ListView2
	GuiControl,1: 	+BackgroundTrans, 	LVFeiertage
} else {
	GuiControl,1: 	+Backgroundwhite, 	ListView1
	GuiControl,1: 	+Backgroundwhite, 	ListView2
	GuiControl,1: 	+Backgroundwhite, 	LVFeiertage
}

;GuiControlGet, LVfeiertage, Pos
;MsgBox Die X-Koordinate ist %MeinEditX%. Die Y-Koordinate ist %MeinEditY%. Die Breite ist %MeinEditW%. Die Höhe ist %MeinEditH%.




























;----------------------------------------------- load history
;----------------------------------------------- load history
;msgbox %  A_DefaultListView
Gui,1:ListView, ListView2 
	fileRead, thisReloadtimeStamp,  % a_scriptDir "\" A_ScriptName " timeStampall.txt"
	GuiControl, -Redraw, ListView2
	Loop, parse, thisReloadtimeStamp,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if !LoadListViewFull {
	if a_loopfield contains Programmstart,exitapp, Uhr	F1	, Uhr	F2	 ; space=TAB
	continue
	if inStr(a_loopfield,"exitapp")
	continue
	if inStr(a_loopField,"Sturmwarnung") && inStr(a_loopField," Uhr	F10	")
	continue
;	if inStr(a_loopField,"Sonnenaufgang") && inStr(a_loopField,"F1")
;	continue
;	if inStr(a_loopField,"Sonnenuntergang") && inStr(a_loopField,"F2")
;	continue
	}

	split2  := strReplace(split.2,(SubStr(split.2, -7)))	; Uhr
	split2a := strReplace(split.2,(SubStr(split.2, -28)))	; wochentag
	split2b  := strReplace(split2,split2a)
	if split2
;	x:=LV_Modify(LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12), "Vis")
	x:=LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12)
	LV_Modify(x, "+Focus")
	LV_Modify(x, "Vis")
	}
;	GuiControl, +Redraw, ListView2
}
	GuiControl, +Redraw, ListView2

listviewfüllen := 0
if listviewfüllen
{
Gui,1:ListView, ListView1 
	fileRead, thisReloadtimeStamp,  % a_scriptDir "\" A_ScriptName " timeStampall.txt"
	GuiControl, -Redraw, ListView1
	Loop, parse, thisReloadtimeStamp,`n
	{
	split := strSplit(a_loopfield,a_tab)
	if a_loopfield {
	if !LoadListViewFull {
	if a_loopfield contains Programmstart,exitapp, Uhr	F1	, Uhr	F2	 ; space=TAB
	continue
	if inStr(a_loopfield,"exitapp")
	continue
	if inStr(a_loopField,"Sturmwarnung") && inStr(a_loopField," Uhr	F10	")
	continue
;	if inStr(a_loopField,"Sonnenaufgang") && inStr(a_loopField,"F1")
;	continue
;	if inStr(a_loopField,"Sonnenuntergang") && inStr(a_loopField,"F2")
;	continue
	}

	split2  := strReplace(split.2,(SubStr(split.2, -7)))	; Uhr
	split2a := strReplace(split.2,(SubStr(split.2, -28)))	; wochentag
	split2b  := strReplace(split2,split2a)
	if split2
;	x:=LV_Modify(LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12), "Vis")
	x:=LV_Add("", split2, split.3, split.4 , split.5, split.6, split.7, split.8, split.9, split.10, split.11, split.12)
	LV_Modify(x, "+Focus")
	LV_Modify(x, "Vis")
	}
;	GuiControl, +Redraw, ListView1
}
	GuiControl, +Redraw, ListView1
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
Gui,1:ListView, ListView2 
}



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
Gui, ListView, ListView2
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

;	Gui,1: Show, x110 y31 w565 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
;guicontrol, hide, edit3 
;guicontrol, hide, tab3
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

;		Gefahrenmeldung("Gefahrenmeldung") ; test
;		Gefahrenmeldung(x) ; test
;		thisxTrigger(xTriggerfile)

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
Gui, ListView, ListView2
; send, {TAB}
 send, {DOWN}

;	Gui,1: Show, x110 y31 w565 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if showMsgBoxTest#854a
msgbox,,% a_lineNumber, % "showMsgBoxTest#854a = " showMsgBoxTest#854a "`n" test#854a

;settimer, sekundenTrigger, 1000
;settimer, Sondermeldung, -5000
;setTimer, ^F10, -100			; GUI maximal vergrößern für debug view





; clipboard := MainArray["nextScheduledAction"]
settimer, showhideListView1, 500
settimer, BeimStartUebernehmen, -100

thisListViewAnsichtErweiternProgressModus := 1  ; blinken aus für zurück zum hauptmenü oben
settimer, BlinkenFuerthisListViewAnsichtErweiternProgress, -1

if kontextabhängigeHilfeViaTooltip
OnMessage(0x0200, "WM_MOUSEMOVE")

CB_SETDROPPEDWIDTH := 0x0160
;SendMessage, CB_SETDROPPEDWIDTH, 150, 0, ,% "ahk_id " %hDDL1%
;SendMessage, CB_SETDROPPEDWIDTH, 150, 0, , ahk_id %hDDL1%
SendMessage, 0x14F, 1, 0,, % "ahk_id " %hDDL1% ; CB_SHOWDROPDOWN = 0x14F

HideFocusBorder(GUIHWND)

/*
if throwLaeis		; GUI auf Monitor rechts
x:=(wa*-65)/xx,	y:=(ha*0)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
   else
x:=(wa*29)/xx,	y:=(ha*10)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
   gui,1: show, x%x% y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
;   gui,show,x-1650 y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
}
; gui,show,x%x% y%y% w%w% h%h% ,TEST	
;GuiControl,1: Focus,T1			
GuiControl,1: Focus, ListView2
;	GuiControl,1:    hide, 			ListView1
;GuiControl,1: focus, ListeImportieren
} else {   ; #################################################################################################################################################################################################################################
sleep 1111
} ; showGUI2 }
*/



return 	; firstreturn









MsgBoxTimeOut() {
WinMove,msgbox1, ,100,300, 400,
}








ListView1:
Gui, Submit, Nohide
gui, ListView, ListView1
;SplashTextOn, 400, 300, Zwischenablage, Lade Daten...
SplashTextOn, , , Zwischenablage, Lade Daten...
 if (A_GuiEvent = "DoubleClick")
{
;ControlGet, AusgabeVar, List,, SysListView321, Sound, Wiedergabe
ControlGet, AusgabeVar, List,, SysListView321
msgbox,% clipboard := AusgabeVar
;	ControlGet, AusgabeVar, Hwnd ,, Steuerelement, FensterTitel, FensterText, AusnahmeTitel, AusnahmeText
	Gui +LastFound
	ControlGet, thisHWND, Hwnd ,,, % a_ScriptName ; FensterTitel
	WinGetPos, MsgBoxX, MsgBoxY, MsgBoxWidth, MsgBoxHoehe,% "ahk_id " thisHWND
	msgbox,% clipboard := 	  MsgBoxx "`n"
				. MsgBoxy "`n"
				. MsgBoxWidth "`n"
				. MsgBoxHoehe
}
SplashTextOff
return

ListView2:
Gui, Submit, Nohide
gui, ListView, ListView2
DetectHiddenWindows, On
if (A_GuiEvent = "DoubleClick")
{
;SplashTextOn, , , Lade Daten...
ControlGet, AusgabeVar, List,, SysListView322
msgbox,,thisMsgBox,% clipboard := AusgabeVar
;	ControlGet, AusgabeVar, Hwnd ,, Steuerelement, FensterTitel, FensterText, AusnahmeTitel, AusnahmeText
	Gui +LastFound
	WinExistA := WinExist("A")
	ControlGet, thisHWND,% "ahk_id " WinExistA ,,,% x ; thisMsgBox ; % WinExist("A") ; FensterTitel
	WinGetPos, MsgBoxX, MsgBoxY, MsgBoxWidth, MsgBoxHoehe,% "ahk_id " thisHWND
	msgbox,% clipboard := 	  MsgBoxx "`n"
				. MsgBoxy "`n"
				. MsgBoxWidth "`n"
				. MsgBoxHoehe
msgBox,,% a_linenumber, % WinExist("A")
}
;MsgBox % "Die ID des aktiven Fensters ist " WinExist("A")
;splashTextOff
return
/*
GuiControl,, ahk_id #32770, X%MausX%, Y%MausY%
;MsgBox % "Die ID des aktiven Fensters ist " WinExist("A")
---------------------------
sunrise-sunset--DEV.0061.ahk
---------------------------
219
234
418
159
---------------------------
OK   
---------------------------
---------------------------
sunrise-sunset--DEV.0061.ahk oben
---------------------------
556
108
1254
893
---------------------------
OK   
---------------------------

*/


SonnenEditStunden:
SonnenEditMinuten:
return
gui,1: submit, nohide
GuiControlGet, SonnenEditMinuten
msgbox % SonnenEditMinuten
thisSonnenEditMinuten := (SonnenEditMinuten+1)
ControlSetText, SonnenEditMinuten,% thisSonnenEditMinuten
return

EM_SETCUEBANNER(HWND, Text) {
   ; EM_SETCUEBANNER = 0x1501 -> msdn.microsoft.com/en-us/library/bb761639(v=vs.85).aspx
return DllCall("SendMessage", "Ptr", HWND, "UInt", 0x1501, "Ptr", True, "WStr", Text, "Ptr")
}

LogListeExportieren:
msgbox  % a_space "a_LineNumber: " a_lineNumber
return
gui,1: submit, nohide
app   = C:\Windows\System32\notepad.exe
first = cr
Run, %app%
WinWaitActive, ahk_exe %app%,, 5
;If ErrorLevel
; MsgBox, 48, Error, An error occurred while waiting for the window.
ControlSetText, Edit1, %first%
return

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

RadioRnRoll:
return
	GuiControl,1: 	+cRed, 	RadioEinmal
	GuiControl,1: 	+cRed, 	RadioTäglich
	GuiControl,1: 	+cRed, 	RadioWöchendlich
	GuiControl,1: 	+cRed, 	RadioMonatlich
	GuiControl,1: 	+cRed, 	RadioJährlich
sleep, 2500
	GuiControl,1: 	+cBlack, RadioEinmal
	GuiControl,1: 	+cBlack, RadioTäglich
	GuiControl,1: 	+cBlack, RadioWöchendlich
	GuiControl,1: 	+cBlack, RadioMonatlich
	GuiControl,1: 	+cBlack, RadioJährlich
return


ListViewEinUndAusblenden: 	
gui, submit, nohide
thisListViewAnsichtErweiternProgressModus := (thisListViewAnsichtErweiternProgressModus:=!thisListViewAnsichtErweiternProgressModus)
;GuiControlGet, ListViewEinUndAusblenden
ListViewEinUndAusblenden := (ListViewEinUndAusblenden:=!ListViewEinUndAusblenden)
if !ListViewEinUndAusblenden
{
inclRadio := 0
if inclRadio
{
	GuiControl,1:    hide, 			GroupBoxAWiederholen 										; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			RadioEinmal 											; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			RadioTäglich 											; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			RadioWöchendlich 										; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			RadioMonatlich 											; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			RadioJährlich 											; ListViewEinUndAusblenden 1080
}
/*
	GuiControl,1: 	+cRed, 	RadioEinmal
	GuiControl,1: 	+cRed, 	RadioTäglich
	GuiControl,1: 	+cRed, 	RadioWöchendlich
	GuiControl,1: 	+cRed, 	RadioMonatlich
	GuiControl,1: 	+cRed, 	GroupBoxAWiederholen
	GuiControl,1: 	+cRed, 	RadioJährlich
	GuiControl,1: 	+cRed, 	GroupBoxÜberListView1
*/
	GuiControl,1:    hide, 			GroupBoxUnterListView1										; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			ListView1											; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			GroupBoxNächsteSystemAktion									; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			NächsteGeplanteSystemAction									; ListViewEinUndAusblenden 1080
	GuiControl,1: 	 hide, 			GroupBoxAWiederholen
	GuiControl,1:    hide, 			GroupBoxLOG											; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			GroupBoxUnterLOGListview									; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			LogListeExportieren										; ListViewEinUndAusblenden 1080
	GuiControl,1:    hide, 			ListView2												; ListViewEinUndAusblenden 1080
	GuiControl,1: ,  ListViewAnsichErweitern, 							zurück zum Hauptmenü				; ListViewEinUndAusblenden 1080

	GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(51.8) 	; ListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			ListView1
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1, 		% thisX(1.0) thisY(73.7) thisW(28.0) thisH(4.8) 	; ListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			GroupBoxUnterListView1
	GuiControl,1:    MoveDraw, 		mehr,					% thisX(25.0) thisY(75.2) thisW(3.5) thisH(2.6) 	; ListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		MarkierteLöschen,			% thisX(17.1) thisY(75.2) thisW(7.6) thisH(2.6) 	; ListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		ListeExportieren,			% thisX(9.3) thisY(75.2) thisW(7.4) thisH(2.6) 		; ListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(75.2) thisW(7.4) thisH(2.6) 		; ListViewEinUndAusblenden 1080
;	GuiControl,1: 	+BackgroundFF8987, 	ListView1
;	setTimer, AlarmBlinken, -1
;	setTimer, RadioRnRoll, -1
	ListView1Color=silver
	ListView2Color=silver

	Control ExStyle, -0x20000,, % "ahk_id" HthisListViewAnsichtErweiternProgress ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos *
;	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(12.2) thisY(17.5) thisW(10.4) thisH(3.9) ;  default
	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(12.35) thisY(17.8) thisW(9.8) thisH(2.99) ;  klein
;	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(12.4) thisY(17.8) thisW(9.71) thisH(2.99) ;  default

;	Control ExStyle, -0x20000,, % "ahk_id" HthisListViewAnsichtErweiternProgress ; https://www.autohotkey.com/boards/viewtopic.php?p=279363#p279363 by Ragnar <> progress rahmenlos

;	GuiControl,1: ,  TextStunden, % outputvar

;	thisListViewAnsichtErweiternProgressModus := 1 ; blinken aus
	GuiControl,1:    show, 			thisListViewAnsichtErweiternProgress
	GuiControl,1:    hide, 			LogListeAnsichtErweiternProgress

	GuiControl,1: 	+BackgroundLime, 	thisListViewAnsichtErweiternProgress
;	GuiControl,1:    show, 			LogListeAnsichtErweitern
	GuiControl,1:    hide, 			LogListeAnsichtErweitern
; settimer, BlinkenFuerthisListViewAnsichtErweiternProgress, off
	WinSet, Redraw
	GuiControl, +Redraw, ListView2
	GuiControl, +Redraw, ListView1
	nMalBlinkenContinue := 1
	 nMalBlinken(2)
} else {
	GuiControl,1:    MoveDraw, 		mehr,					% thisX(25.0) thisY(43.5) thisW(3.5) thisH(2.6)		;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		MarkierteLöschen,			% thisX(17.1) thisY(43.5) thisW(7.6) thisH(2.6) 	;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		ListeExportieren,			% thisX(9.3) thisY(43.5) thisW(7.4) thisH(2.6) 		;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		ListeImportieren,			% thisX(1.5) thisY(43.5) thisW(7.4) thisH(2.6)		;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		GroupBoxUnterListView1,			% thisX(1.0) thisY(42.0) thisW(28.0) thisH(4.8) 	;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    MoveDraw, 		ListView1, 				% thisX(1.0) thisY(23.0) thisW(28.0) thisH(20.0) 	;  ElseListViewEinUndAusblenden 1080
	GuiControl,1: ,  ListViewAnsichErweitern, 							Ansicht erweitern
	GuiControl,1:    show, 			GroupBoxÜberListView1 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			Übernehmen 											;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			GroupBoxUnterListView1 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			mehr 												;  ElseListViewEinUndAusblenden 1080								;  ElseListViewEinUndAusblenden
	GuiControl,1:    show, 			MarkierteLöschen 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			ListeExportieren 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			ListeImportieren 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			GroupBoxNächsteSystemAktion 									;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			NächsteGeplanteSystemAction 									;  ElseListViewEinUndAusblenden 1080
	GuiControl,1: 		 show, 			GroupBoxAWiederholen
	GuiControl,1:    show, 			GroupBoxLOG 											;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			GroupBoxUnterLOGListview 									;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			LogListeExportieren 										;  ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			ListView2 												;  ElseListViewEinUndAusblenden 1080
	GuiControl,1: 	+cBlack, RadioEinmal
	GuiControl,1: 	+cBlack, RadioTäglich
	GuiControl,1: 	+cBlack, RadioWöchendlich
	GuiControl,1: 	+cBlack, RadioMonatlich
	GuiControl,1: 	+cBlack, RadioJährlich
Blue = Blue ; test
	GuiControl,1: 	+c%Blue%, GroupBoxAWiederholen
	GuiControl,1: 	+cBlack, GroupBoxÜberListView1
if inclRadio
{
	GuiControl,1:    show, 			GroupBoxAWiederholen 										; ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			RadioEinmal 											; ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			RadioTäglich											; ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			RadioWöchendlich										; ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			RadioMonatlich											; ElseListViewEinUndAusblenden 1080
	GuiControl,1:    show, 			RadioJährlich											; ElseListViewEinUndAusblenden 1080
}
;	GuiControl,1: 	+BackgroundFF9977, 	ListView1
;	GuiControl,1: 	+BackgroundSilver, 	ListView1
;	setTimer, AlarmBlinken, -1
;	setTimer, RadioRnRoll, -1
	WinSet, Redraw

	GuiControl,1:    MoveDraw, 		thisListViewAnsichtErweiternProgress,			% thisX(0) thisY(0) thisW(0) thisH(0) ;  null
;	thisListViewAnsichtErweiternProgressModus := 0
	GuiControl,1:    disable, 		thisListViewAnsichtErweiternProgress

	GuiControl,1:    hide, 			thisListViewAnsichtErweiternProgress
	GuiControl,1:    show, 			LogListeAnsichtErweiternProgress

;	GuiControl,1: 	+BackgroundLime, 	thisListViewAnsichtErweiternProgress
	GuiControl,1: 	+BackgroundDefault, 	thisListViewAnsichtErweiternProgress

	GuiControl,1:    show, 			LogListeAnsichtErweitern
;	GuiControl,1:    hide, 			LogListeAnsichtErweitern

; settimer, BlinkenFuerthisListViewAnsichtErweiternProgress, off

	GuiControl, +Redraw, ListView2
	GuiControl, +Redraw, ListView1
	nMalBlinkenContinue := 1
 	 nMalBlinken(2)
	ListView1Color=silver
	ListView2Color=silver
}
;Menu, Ansicht, Show
return

BlinkenFuerthisListViewAnsichtErweiternProgress:
  if thisListViewAnsichtErweiternProgressModus
  {
	loop
	{
		GuiControl,1:    show, 			thisListViewAnsichtErweiternProgress
	sleep, 500
		GuiControl,1:    hide, 			thisListViewAnsichtErweiternProgress
	sleep, 500
	} 
} else {
	;msgbox,4096,% a_linenumber,% a_index,.1
	if thisListViewAnsichtErweiternProgressModus
	settimer, BlinkenFuerthisListViewAnsichtErweiternProgress, -1
;settimer, BlinkenFuerthisListViewAnsichtErweiternProgress, off
}
return


	loopProgress() {
	global
	GuiControl,1:    	 hide, 		GroupBoxLOG 
	GuiControl,1:    	 hide, 		GroupBoxNächsteSystemAktion 
	GuiControl,1:    	 hide, 		GroupBoxÜberListView1 
	GuiControl,1:    	 hide, 		GroupBoxUnterListView1
	GuiControl,1:    	 hide, 		GroupBoxUnterLOGListview
	GuiControl,1: 		 hide, 			GroupBoxAWiederholen
	GuiControl,1:    	 hide, 		ListeExportieren 
	GuiControl,1:    	 hide, 		ListeImportieren 
	GuiControl,1:    	 hide, 		ListView1
	GuiControl,1:    	 hide, 		LogListeExportieren 
	GuiControl,1:    	 hide, 		ListView2
	GuiControl,1:    	 hide, 		MarkierteLöschen 
	GuiControl,1:    	 hide, 		mehr 
	GuiControl,1:    	 hide, 		NächsteGeplanteSystemAction 
	GuiControl,1: 	 	 hide, 		TextEdit1
	GuiControl,1:    	 hide, 		Übernehmen 
	GuiControl,1:    	 show, 		thisLoopProgress

	items := 20
	Loop, % items
	{	
		GuiControl,1:, 	thisLoopProgress, % Round(100 * A_Index / items)
	Sleep, 30
	}

	GuiControl,1:    	 hide, 		thisLoopProgress
	GuiControl,1:    	 show, 		GroupBoxLOG 
	GuiControl,1:    	 show, 		GroupBoxNächsteSystemAktion 
	GuiControl,1:    	 show, 		GroupBoxÜberListView1 
	GuiControl,1:    	 show, 		GroupBoxUnterListView1
	GuiControl,1:    	 show, 		GroupBoxUnterLOGListview
	GuiControl,1: 		 show, 			GroupBoxAWiederholen
	GuiControl,1:    	 show, 		ListeExportieren 
	GuiControl,1:    	 show, 		ListeImportieren 
	GuiControl,1:    	 show, 		ListView1
	GuiControl,1:    	 show, 		LogListeExportieren 
	GuiControl,1:    	 show, 		ListView2
	GuiControl,1:    	 show, 		MarkierteLöschen 
	GuiControl,1:    	 show, 		mehr 
	GuiControl,1:    	 show, 		NächsteGeplanteSystemAction 
	GuiControl,1: 	 	 show, 		TextEdit1
	GuiControl,1:    	 show, 		Übernehmen 
	WinSet, Redraw
	}






ButtonMehr:
Menu, ButtonMehrMenue, Show
return

MenuHandlerBundesland:
thisFeiertagBundesland := A_ThisMenuItemPos
goTo, LVFeiertage_
; MsgBox,4096,% a_linenumber, %A_ThisMenu% %A_ThisMenuItemPos%
; MsgBox,4096,% a_linenumber, %A_ThisMenuItemPos%,1
; MsgBox,4096,% a_linenumber, %A_ThisMenu% 
Return

MenuHandler:
MsgBox,4096,% a_linenumber, %A_ThisMenu% %A_ThisMenuItemPos%
Return

;WinSet, Redraw

nMalBlinkenOFF:
gui,submit,nohide
nMalBlinkenContinue := (nMalBlinkenContinue:=!nMalBlinkenContinue)
;; nMalBlinken(1)
return

	nMalBlinken(n) {
	global
	Loop % n
	{
	if !nMalBlinkenContinue
	break
else
	{
	setTimer, AlarmBlinken, -1
	sleep, 300
	}}}

AlarmBlinken:
	GuiControl,1:    show,			ThisProgress#1a
	GuiControl,1:    show,			ThisProgress#1b
;	GuiControl,1:    show,			ThisProgress#1c
;	GuiControl,1:    show,			ThisProgress#1d
	sleep, 100
	GuiControl,1:    hide, 			ThisProgress#1a
	GuiControl,1:    hide, 			ThisProgress#1b
	GuiControl,1:    hide, 			ThisProgress#1c
	GuiControl,1:    hide, 			ThisProgress#1d
WinSet, Redraw
Return
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

	Gui,1: listview, listview2

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







;///////////////////////////////////////////////////////////////////////////////////////////////////////firstconvolution

LV_ADDListViewTrigger() {
	global
	Gui,1:ListView, ListView1 
	GuiControl, -Redraw, ListView1
	ADDListViewTriggerSplit := strSplit(ADDListViewTrigger,"`t")
	x:=LV_Modify(LV_Add("", ADDListViewTriggerSplit*), "Vis")
;	x:=LV_Add("", ADDListViewTriggerSplit*)
	LV_Modify(x, "+Focus")
	LV_Modify(x, "Vis")
	GuiControl, +Redraw, ListView1
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
;		LV_ModifyCol(4, 0)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	GuiControl, +Redraw, ListView1
	Gui,1:ListView, ListView2 
return x
}


apiGefahrenmeldung:
Gefahrenmeldung("Gefahrenmeldung") ; test
return

apixTrigger:
xTrigger("xTrigger") ; test
return


; ########################################################################						###############################################
; ########################################################################		Start				###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
start:	;									###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
; ########################################################################						###############################################
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

	MainArray["Aktuelle Zeit"] 	:= A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ; " Uhr" ; timestamp
;	MainArray["Aktuelle Zeit"] 	:= A_DD "." A_MM "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec " Uhr"




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


;	MainArray["thisRISECounter"] 	:= thisRISECounter ? thisRISECounter : 0
;	MainArray["thisSETCounter"] 	:= thisSETCounter  ? thisSETCounter  : 0
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
			if !triggerFilesOFF 
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

			if alleTriggerCounterAufNull
			{
			F1Counter(true) 				; nach mitternacht die counter für sonnenauf,- untergang in liestview 1zurücksetzen
			F1Counter(true) 
			SonnenuntergangNaechsterInIstLetzterVorCounter(true) 
			SonnenaufgangNaechsterInIstLetzterVorCounter(true) 
			SturmwarnungCounter(true)
		;	MainArray["SturmwarnungCounter"] := thisSturmwarnungCounter

			}

			if !triggerFilesOFF 
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
test#854a := ""
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
;msgboa_space 
; /////////////////////////////////////////////////////////////////////////////////////	updateGuiControl  firstUpdate	thisUpdate		Nächste System Aktion [NächsteGeplanteSystemAction]
	thisNextScheduledAction := MainArray["nextScheduledAction"]
	while instr(thisNextScheduledAction,a_space a_space)
	thisNextScheduledAction := strReplace(thisNextScheduledAction,a_space a_space,a_space)
	if !(LastNextScheduledAction=thisNextScheduledAction)
	{
;	GuiControl,1: , 			NächsteGeplanteSystemAction,		% Chr(176) a_space thisNextScheduledAction a_space Chr(176)
	GuiControl,1: , 			NächsteGeplanteSystemAction,		% a_space thisNextScheduledAction a_space 
	GuiControl,1: ,  			SonnenaufgangGUI2Zeit, 			%  MainArray["Stunden bis zum nächsten Sonnenaufgang"]
											 . MainArray["Minuten bis zum nächsten Sonnenaufgang"]
	GuiControl,1: ,  			SeitSonnenaufgangGUI2Zeit, 		% MainArray["Stunden seit letztem Sonnenaufgang"]  
									   		. MainArray["Minuten seit letztem Sonnenaufgang"]
	GuiControl,1: ,  			SonnenuntergangGUI2Zeit, 		% MainArray["Stunden bis zum nächsten Sonnenuntergang"]		
									 		. MainArray["Minuten bis zum nächsten Sonnenuntergang"]	
	GuiControl,1: ,  			SeitSonnenuntergangGUI2Zeit, 		% MainArray["Stunden seit letztem Sonnenuntergang"]
									     		. MainArray["Minuten seit letztem Sonnenuntergang"]
	GuiControl,1: ,  			GroupBoxSonneAuf,			% " Sonnenaufgang   " MainArray["Sonnenaufgang"] a_space
	GuiControl,1: ,  			GroupBoxSonneUnter,			% " Sonnenuntergang " MainArray["Sonnenuntergang"] a_space



	thisSonnenstunden  := "[ gestern: " MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1] " ]`t`t" MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"]


	thisSonnenstundenTRIMspace := " Sonnenstunden " MainArray["Sonnenstunden"] " Stunden " MainArray["Sonnenminuten"] a_space 

		while instr(thisSonnenstundenTRIMspace,a_tab)
		thisSonnenstundenTRIMspace := strReplace(thisSonnenstundenTRIMspace,a_tab,a_space)
		while instr(thisSonnenstundenTRIMspace,a_space a_space)
		thisSonnenstundenTRIMspace := strReplace(thisSonnenstundenTRIMspace,a_space a_space, a_space)

	GuiControl,1: ,  			GroupBoxSonnenstunden,					% thisSonnenstundenTRIMspace
;	GuiControl,1: ,  			GroupBoxSonnenstunden,					% "Sonnenstunden "  MainArray["SonnenstundenCalendarDayLTRIM", A_YDay] "`n" test




;		MainArray["SonnenstundenCalendarDayLTRIM", A_YDay]  := StimeStd ":" StimeMINNoLTRIM ; A_YDay-1


;	groupbox unter sonnenstunden

	GuiControl,1: ,  			TextInGroupBoxSonnenstunden,	%  " Woche: " SubStr(A_YWeek, -1) " - Tag: " MainArray["isSchaltjahr_dann_ab_28_februar_A_day_plus_eins"] 
										. "/" isSchaltjahr(A_Year) 
	GuiControl,1: ,  			GroupBoxUnterSonnenstunden,					% a_space TagNachtZeiten() a_space 
;soundbeep

; ///////////////////////////////////////////////////////////////////////////////////// mitte
		if 	(MainArray["Stunden bis zum nächsten Sonnenaufgang"] MainArray["Minuten bis zum nächsten Sonnenaufgang"]
			= MainArray["Stunden seit letztem Sonnenaufgang"] MainArray["Minuten seit letztem Sonnenaufgang"])
			xAuf := SonnenaufgangNaechsterInIstLetzterVor(risefile)

		if 	(MainArray["Stunden bis zum nächsten Sonnenuntergang"] MainArray["Minuten bis zum nächsten Sonnenuntergang"]
			= MainArray["Stunden seit letztem Sonnenuntergang"] MainArray["Minuten seit letztem Sonnenuntergang"])
			xUnter := SonnenuntergangNaechsterInIstLetzterVor(risefile)
; /////////////////////////////////////////////////////////////////////////////////////

		; letzte 24 stunden logfile

		KopfZeile = datumLang`tdatum`tSonnenaufgang`tZeit bis Sonnenaufgang`tZeit seit Sonnenaufgang`tSonnenuntergang`tZeit bis Sonnenuntergang`tZeit seit Sonnenuntergang`tSonnenstundenCalendarDayLTRIM A_YDay`tStimeStd : StimeMINNoLTRIM`tTagNachtZeiten()`txAuf`txUnter`tFileGetSize`n

		MainArray["MinutenLogFilefuer24stdMinusEinenTagGestern"] 	:= "MinutenLogFilefuer24std - " a_YYYY "." A_MM "." (A_DD-1)
		. A_SPACE (A_DD-1) A_SPACE Month(A_MM) A_SPACE a_YYYY ".csv"

		MainArray["MinutenLogFilefuer24std"] := filename 		:= "MinutenLogFilefuer24std - " a_YYYY "." A_MM "." A_DD 
		. A_SPACE A_DD     A_SPACE Month(A_MM) A_SPACE a_YYYY ".csv"

		FileGetSize, thisFileGetSize,% filename
;		if !(filenameOld=filename) && if (filenameSolo<>1) && !fileExist(filename) ; && if !(thisFileGetSize>10990)
		if !fileExist(filename)
		{
		fileappend,% KopfZeile,% filename 
	;	filenameSolo=1
		}



		filenameOld:=filename

		if !inStr(bigLife24stdLast, A_DDDD A_SPACE A_DD A_SPACE Month(A_MM) A_SPACE a_YYYY A_SPACE A_Hour A_SPACE A_Min) ; jede minute
		MinutenTimeStampSpeichern()
}
		GuiControl,1: ,  RiseCounterGUIanzeige,		%  MainArray["thisRISECounter"] ? MainArray["thisRISECounter"] : 0
		GuiControl,1: ,  SetCounterGUIanzeige,		%  MainArray["thisSETCounter"]  ? MainArray["thisSETCounter"] : 0
;	MainArray["SturmwarnungCounter"] := thisSturmwarnungCounter

		LastNextScheduledAction := thisNextScheduledAction
; ///////////////////////////////////////////////////////////////////////////////////// ; aktionen stündlich - screenshot vor und nach stundenwechsel
	 stündlich := 1, stündlichCount := 0 	;  = täglich
	; stündlich := 1 			;  = einmal
	if stündlich
	{
		MainArray["sollZeitVorstd"] 	:= 59 ":" 51
		MainArray["sollZeitNachstd"] 	:= 00 ":" 05

		MainArray["istZeitvorstd"] 	:= A_Min ":" A_Sec
		MainArray["istZeitnachstd"] 	:= A_Min ":" A_Sec

			if (MainArray["sollZeitVorstd"] 
				= MainArray["istZeitvorstd"])
			|| (MainArray["sollZeitNachstd"]
				= MainArray["istZeitnachstd"]) 
			{
			gui,1: show
			if !triggerFilesOFF 
			try run,%  A_ScriptDir "\screenshot 2 -direktauslösend 1 sekunde delay .ahk"
			MKPicCount++
		;	sleep, 2000
		;	gui,1: hide
			}
		if (stündlichCount=2)
		stündlich := false
	} 

; /////////////////////////////////////////////////////////////////////////////////////firstTooltip//
; GroupBoxUnterSonnenstunden


; ersteGUI

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
; https://www.autohotkey.com/boards/viewtopic.php?p=389921#p389921
WM_CTLCOLORSTATIC(Hello, World, wp, lp) {
   hDC := wp
   for k, v in [Hello, World] {
      if (lp = v.hwnd) {
         DllCall("SetTextColor", "Ptr", hDC, "UInt", v.textColor)
         DllCall("SetBkColor"  , "Ptr", hDC, "UInt", v.backColor)
         Return DllCall("GetStockObject", "Int", NULL_BRUSH := 0x5, "Ptr")
      }
   }
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
isSchaltjahr(AYear) {   ; TextInGroupBoxSonnenstunden
;global
return daysInYear := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) 
;			? ("Das Jahr " AYear " hat: " 365 " Tage ( kein Schaltjahr ) `n" NextSchaltjahrDIGIT()) 
;			: ("Das Jahr " AYear " hat: " 366 " Tage ( Schaltjahr ) `n" NextSchaltjahrDIGIT())
;			? ("Das Jahr " AYear " hat: " 365 " Tage - kein Schaltjahr`n" NextSchaltjahrDIGIT()) 
;			: ("Das Jahr " AYear " hat: " 366 " Tage - Schaltjahr`n" NextSchaltjahrDIGIT())
			? (365 " " NextSchaltjahrDIGIT()) 
			: (366 " " NextSchaltjahrDIGIT())
}

NextSchaltjahrDIGIT() {
loop
{
; ayear := (2024 + a_index) ; test
  ayear := (a_year + a_index)
schaltjahr := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : (1)
if schaltjahr 
;return daysInYear := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : ("[ nächstes Schaltjahr: " AYear " ]")
return daysInYear := Mod(AYear, 4) || ! Mod(AYear, 100) & Mod(AYear, 400) ? (0) : ("- nächstes Schaltjahr: " AYear)
}}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
; zoomfactor:=((A_ScreenWidth/1920)*(96/A_ScreenDPI))
;/////////////////////////////////////////////////////
thisZoomFactor(factor) {
global
return (factor*((A_ScreenWidth/1920)*(96/A_ScreenDPI)))
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
; wa:=A_screenwidth,ha:=A_screenHeight,xx:=100
;///////////////////////////////////////////////
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
;global
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
;F2Counter(init := false, lastCount := false)
RiseCounterGUIanzeige: ; counter reset = 0
MainArray["thisRISECounter"] := F1Counter(1,0)
return
SetCounterGUIanzeige: ; counter reset = 0
MainArray["thisSETCounter"] := F2Counter(1,0)
return
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
LVfeiertageON:
;msgbox test
GuiControl,1:    show, 			LVfeiertage
GuiControl,1:    hide, 			LVfeiertageON
return

LVfeiertage:
Menu, Bundeslaender, Show
return
; ////////////////////////////////////////////////////////////////////////////////////	feiertage
LVfeiertage_:

	if (thisFeiertagBundesland=20)
	{
	GuiControl,1:    hide, 			LVfeiertage
	sleep, 100
	GuiControl,1:    show, 			LVfeiertage
	sleep, 100
	GuiControl,1:    hide, 			LVfeiertage
	sleep, 100
	GuiControl,1:    show, 			LVfeiertage
	sleep, 100
	GuiControl,1:    hide, 			LVfeiertage
	GuiControl,1:    show, 			LVfeiertageON
	return
	}

;	thisMaxCount := 19
;	aindexMODListViewFeiertage++
;	thisFeiertagBundesland := thisMaxCount-Mod(thisMaxCount-Mod(aindexMODListViewFeiertage,thisMaxCount),thisMaxCount) ; zählt dauernd von 1 bis 19

	if (thisFeiertagBundesland=1)
	thisFeiertage := feiertage(a_yyyy,"dl","longdate") 	; alle Bundesländer 19 Feiertage
			, LVReihen = 10, thisH := thisH(35.0) , Bundesland := "alle Bundesländer"

	if (thisFeiertagBundesland=2)
	thisFeiertage := feiertage(a_yyyy,"bya","longdate") 	; bya=Bayern alle 16 Feiertage
			, LVReihen = 8, thisH := thisH(29.502) , Bundesland := "Bayern alle"

	if (thisFeiertagBundesland=3)
	thisFeiertage := feiertage(a_yyyy,"byk","longdate") 	; byk=Bayern kath. 15 Feiertage
			, LVReihen = 7, thisH := thisH(28.0), Bundesland := "Bayern kath."

	if (thisFeiertagBundesland=4)
	thisFeiertage := feiertage(a_yyyy,"byp","longdate") 	; byp=Bayern prot. 14 Feiertage
			, LVReihen = 7, thisH := thisH(26.5) , Bundesland := "Bayern prot."

	if (thisFeiertagBundesland=5)
	thisFeiertage := feiertage(a_yyyy,"be","longdate") 	; be=Berlin  10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Berlin"

	if (thisFeiertagBundesland=6)
	thisFeiertage := feiertage(a_yyyy,"bb","longdate") 	; bb=Brandenburg 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Brandenburg"

	if (thisFeiertagBundesland=7)
	thisFeiertage := feiertage(a_yyyy,"hb","longdate") 	; hb=Bremen 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Bremen"

	if (thisFeiertagBundesland=8)
	thisFeiertage := feiertage(a_yyyy,"hh","longdate") 	; hh=Hamburg 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Hamburg"

	if (thisFeiertagBundesland=9)
	thisFeiertage := feiertage(a_yyyy,"he","longdate") 	; he=Hessen 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Hessen"

	if (thisFeiertagBundesland=10)
	thisFeiertage := feiertage(a_yyyy,"mv","longdate") 	; mv=Mecklenburg-Vorpommern 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Mecklenburg-Vorpommern"

	if (thisFeiertagBundesland=11)
	thisFeiertage := feiertage(a_yyyy,"ni","longdate") 	; ni=Niedersachsen 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Niedersachsen"

	if (thisFeiertagBundesland=12)
	thisFeiertage := feiertage(a_yyyy,"nw","longdate") 	; nw=Nordrhein-Westfalen 11 Feiertage
			, LVReihen = 6, thisH := thisH(21.50) , Bundesland := "Nordrhein-Westfalen"

	if (thisFeiertagBundesland=13)
	thisFeiertage := feiertage(a_yyyy,"rp","longdate") 	; rp=Rheinland-Pfalz 11 Feiertage
			, LVReihen = 6, thisH := thisH(21.50) , Bundesland := "Rheinland-Pfalz"

	if (thisFeiertagBundesland=14)
	thisFeiertage := feiertage(a_yyyy,"sl","longdate") 	; sl=Saarland 12 Feiertage
			, LVReihen = 6, thisH := thisH(22.801) , Bundesland := "Saarland"

	if (thisFeiertagBundesland=15)
	thisFeiertage := feiertage(a_yyyy,"sn","longdate") 	; sn=Sachsen 11 Feiertage
			, LVReihen = 6, thisH := thisH(21.50) , Bundesland := "Sachsen"

	if (thisFeiertagBundesland=16)
	thisFeiertage := feiertage(a_yyyy,"st","longdate") 	; st=Sachsen-Anhalt 11 Feiertage
			, LVReihen = 6, thisH := thisH(21.50) , Bundesland := "Sachsen-Anhalt"

	if (thisFeiertagBundesland=17)
	thisFeiertage := feiertage(a_yyyy,"sh","longdate") 	; sh=Schleswig-Holstein 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Schleswig-Holstein"

	if (thisFeiertagBundesland=18)
	thisFeiertage := feiertage(a_yyyy,"th","longdate") 	; th=Thüringen 10 Feiertage
			, LVReihen = 5, thisH := thisH(19.50) , Bundesland := "Thüringen"

	if (thisFeiertagBundesland=19)
	thisFeiertage :=  feiertage(a_yyyy,"bw","longdate")  	; bw=Baden-Württemberg 12 Feiertage
			, LVReihen = 6, thisH := thisH(22.801), Bundesland := "Baden-Württemberg"

		while instr(thisFeiertage,a_tab)
		thisFeiertage := strReplace(thisFeiertage,a_tab,a_space)

		while instr(thisFeiertage,a_space a_space)
		thisFeiertage := strReplace(thisFeiertage,a_space a_space, a_space)

	reihenListViewFeiertage := strSplit(thisFeiertage,"`n","`r")

	Gui,1: listview, LVfeiertage
	Gui, ListView, -Redraw
	LV_Delete()
	Gui,1: Font,								% thisZoomFactorNormal(9.01)
	GuiControl,1:    MoveDraw, 		LVfeiertage,			% thisX(30.0) thisY(40.5) thisW(34.0) thisH
	GuiControl,1:    Font, 			LVfeiertage
	GuiControl,1:    show, 			LVfeiertage
;	GuiControl,1:    hide, 			LVfeiertage

	Gui,1: listview, LVfeiertage
	loop, parse, thisFeiertage, `n, `r 
	{
	if a_loopField {
	aloopField := RTRIM(a_loopField,",")
	ri:=LV_ADD("", (a_index-1), strSplit(aloopField,[":","`,"],,3)*)
	LV_ModifyCol(4, "AutoHdr", "Datum - " Bundesland " - " (reihenListViewFeiertage.length()-1) " Feiertage")
	}}
;	LV_ADD("", "#", reihenListViewFeiertage.length())
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
	Gui, ListView, +Redraw

	Gui,1: listview, listview2



return


;////////////////////////////////////////////////////////////////////////////////////////////////////////
;22 Wie entferne ich den gepunkteten Rand um das Steuerelement  AutoHotkeyCommunity und 3 weitere Seiten  Persönlich  Microsoft Edge
;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=9684

HideFocusBorder(wParam, lParam := "", uMsg := "", hWnd := "") {
   ; WM_UPDATEUISTATE = 0x0128
	Static Affected := [] ; affected controls / GUIs
        , HideFocus := 0x00010001 ; UIS_SET << 16 | UISF_HIDEFOCUS
	     , OnMsg := OnMessage(0x0128, Func("HideFocusBorder"))
	If (uMsg = 0x0128) { ; called by OnMessage()
      If (wParam = HideFocus)
         Affected[hWnd] := True
      Else If Affected[hWnd]
         PostMessage, 0x0128, %HideFocus%, 0, , ahk_id %hWnd%
   }
   Else If DllCall("IsWindow", "Ptr", wParam, "UInt")
	  PostMessage, 0x0128, %HideFocus%, 0, , ahk_id %wParam%
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////GroupBoxSonnenstunden GroupBoxSonnenstunden 
GroupBoxUnterSonnenstundenCSV:
try run % MainArray["MinutenLogFilefuer24std"]
try run % MainArray["MinutenLogFilefuer24stdMinusEinenTagGestern"]
;msgbox,,% a_lineNumber, % MainArray["MinutenLogFilefuer24stdMinusEinenTagGestern"] "`n" MainArray["MinutenLogFilefuer24std"]
return

GroupBoxSonnenstundenCSV:
try run sonnenuntergang-sonnenaufgang-sunrise-sunset.csv
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F1::
;msgbox % A_DefaultListView 
Gui,1: listview, ListView2
; nMalBlinkenContinue := 1
; nMalBlinken(5)
thisRISE(RISEfile)
MinutenTimeStampSpeichern()
;msgbox % A_DefaultListView 

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
		Gui,1: Show
	} 
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
	F2::
	; nMalBlinkenContinue := 1
	; nMalBlinken(5)
	thisSET(SETfile)
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2
	winset, redraw
MinutenTimeStampSpeichern()
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
		Gui,1: Show
	} 
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F3::
	nMalBlinkenContinue := 1
; nMalBlinken(5)
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
		Gui,1: Show
	}
return
;////////////////////////////////////////////////////////////////////////////////////////////////////////
F4::                                                             ; Toggle Gui
	nMalBlinkenContinue := 1
; nMalBlinken(5)
;	GuiControl, +Redraw, ListView2
;	GuiControl, +Redraw, LV2
	thisGuiUpdate := ""
	if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		atickCount := a_tickCount
		GuiLiveTime:=(1439.99*60*1000)
		thisGUITimeout()
		Gui,1: Show
	} else {
		atickCount := a_tickCount
		GuiLiveTime:=(.009*60*1000)
		thisGUITimeout()
}
return
;//////////////////////////////////////////////////////////////////////////////////////////////////////// 
F6:: 
gui, submit, nohide
msgbox % "A_Gui:`t`t" A_Gui "`n"
	. "A_DefaultListView:`t`t`t" A_DefaultListView "`n"
	. "A_DefaultGui:`t`t`t" A_DefaultGui "`n"
	. "A_GuiControl:`t`t" A_GuiControl "`n"
	. "A_GuiWidth:`t`t" A_GuiWidth "`n"
	. "A_GuiHeight:`t`t" A_GuiHeight "`n"
	. "A_GuiX:`t`t" A_GuiX "`n"
	. "A_GuiY:`t`t" A_GuiY "`n"
	. "A_GuiEvent:`t`t" A_GuiEvent "`n"
	. "A_EventInfo:`t`t`t" A_EventInfo "`n"
	. "A_ThisMenuItem:`t`t`t" A_ThisMenuItem "`n"
	. "A_ThisMenu:`t`t`t" A_ThisMenu "`n"
	. "A_ThisMenuItemPos:`t`t" A_ThisMenuItemPos "`n"
	. "A_ThisHotkey:`t`t`t" A_ThisHotkey "`n"
	. "A_EndChar:`t`t" A_EndChar "`n"
	. "A_BatchLines:`t`t`t" A_BatchLines "`n"
	. "A_TitleMatchMode:`t`t" A_TitleMatchMode "`n"
	. "A_DetectHiddenText:`t`t" A_DetectHiddenText "`n"
	. "A_FileEncoding:`t`t`t" A_FileEncoding "`n"
	. "A_CoordModeToolTip:`t`t" A_CoordModeToolTip "`n"
	. "A_CoordModePixel:`t`t" A_CoordModePixel "`n"
	. "A_CoordModeMouse:`t`t" A_CoordModeMouse "`n"
	. "A_CoordModeCaret:`t`t" A_CoordModeCaret "`n"
	. "A_CoordModeMenu:`t`t" A_CoordModeMenu "`n"
	. "A_IconHidden:`t`t`t" A_IconHidden "`n"
	. "A_IsAdmin:`t`t`t" A_IsAdmin "`n"
	. "A_ScreenDPI :`t`t`t" A_ScreenDPI  "`n"
;	. ":`t`t"  "`n"
return

F5:: 
;msgbox % A_DefaultListView 
;return
	nMalBlinkenContinue := 1
; nMalBlinken(5)
;	GuiControl, +Redraw, ListView2
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
	GewählterHotkey:
	Gui, Submit, nohide
	msgbox % GewählterHotkey
;	GuiControl,1:    hide, 			GewählterHotkey
	return

F10::

; nMalBlinkenContinue := 1
; nMalBlinken(1)
WinSet, Redraw
;	GuiControl, -Redraw, ListView2
LVModifyCol()
;	GuiControl, +Redraw, ListView2
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
 	 GuiControl,1:    show, 			thisLoopProgress
 	 loopProgress()
 	 GuiControl,1:    hide, 			thisLoopProgress
return

whatVars(vars) {
for all, var in vars
x .= all a_tab var "`n"
sort, x
return 
}
;//////////////////////////////////////////////////////////////////////////////////////////////////////// 
;///////////////////////////////////////////////
thisX_(factor) {
global
return	" " (wa*factor)/xx
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
thisY_(factor) {
global
return	" " (ha*factor)/xx 
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////
uebernehmen:
Gui, Submit, NoHide
;msgbox test
thisListViewAnsichtErweiternProgressModus := !(thisListViewAnsichtErweiternProgressModus:=!thisListViewAnsichtErweiternProgressModus)
; 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(2)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2


/*
;SetControlDelay -1  ; Kann Zuverlässigkeit erhöhen und Nebeneffekte reduzieren.
;ControlClick, Toolbar321,% strReplace((substr(a_scriptname,-11)),".ahk") ,,,, NA x192 y10
;ControlClick, x192 y10,% strReplace((substr(a_scriptname,-11)),".ahk")
; ControlClick, x192 y10
;Click,% thisX(9.3) thisY(43.5)
;Click,% (11.3*factor)/xx a_space (43.5*factor)/xx
; (ha*factor)/xx 
*/
OnMessage(0x0200, "")
tooltip
kontextabhängigeHilfeViaTooltip := 0
Click,% thisX_(14.3) thisY_(21.5)
sleep, 699
Click,% thisX_(18.3) thisY_(21.5)
sleep, 699
Click,% thisX_(14.3) thisY_(21.5)
sleep, 699
Click,% thisX_(19.3) thisY_(21.5)
sleep, 2699
kontextabhängigeHilfeViaTooltip := 1
OnMessage(0x0200, "WM_MOUSEMOVE")
return

if thisADDListViewTrigger
{
ADDListViewTrigger := thisADDListViewTrigger
LV_ADDListViewTrigger()
}
return

F12::    ; LV_ADDListViewTrigger() {
GuiControlGet, LVfeiertage, Pos
MsgBox Die X-Koordinate ist %LVfeiertageX%. Die Y-Koordinate ist %LVfeiertageY%. Die Breite ist %LVfeiertageW%. Die Höhe ist %LVfeiertageH%.

ADDListViewTrigger := ("00:01" a_tab "täglich" a_tab "vor Sonnenuntergang" a_tab "Soundplay Datei# F12")
LV_ADDListViewTrigger()
return

BeimStartUebernehmen:
ADDListViewTrigger := ("00:02" a_tab "täglich" a_tab "vor Sonnenuntergang" a_tab "Soundplay Datei# 2")
LV_ADDListViewTrigger()
ADDListViewTrigger := ("00:03" a_tab "täglich" a_tab "vor Sonnenuntergang" a_tab "Markiese einfahren")
LV_ADDListViewTrigger()
ADDListViewTrigger := ("00:01" a_tab "täglich" a_tab "nach Sturmwarnung" a_tab "Soundplay Datei# 3")
LV_ADDListViewTrigger()
 ;	 GuiControl,1:    show, 			thisLoopProgress
 ;	 loopProgress()
 ;	 GuiControl,1:    hide, 			thisLoopProgress
return


^F10::
 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2
;nMalBlinkenContinue := 1
; nMalBlinken(60)
return
;GuiControl,, EDIT2a,% MainArray["SommerWinterZeitAnzeige"]
;	GuiControl, +Redraw, ListView2
;	GuiControl, +Redraw, LV2

GUISizeToggle := (GUISizeToggle:=!GUISizeToggle)
if GUISizeToggle
{
	GuiControl, -Redraw, ListView2
	AScreenHeight300 := (A_ScreenHeight-300)
	AScreenWidth180  := (A_ScreenWidth-220)
	AScreenWidth200  := (A_ScreenWidth-200)
	GuiControl, Move,ListView2, w%AScreenWidth180%  r7
	GuiControl, +Redraw, ListView2

	Gui,1: Show, w%AScreenWidth200%  h%AScreenHeight300%
LVModifyCol()
} else {
	GuiControl, -Redraw, ListView2
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,ListView2, w545 r7
;	Gui,1: Show, w565 h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
;gui,show,x%x% y%y% w%w% h%h% ,TEST		
gui,show,x%x% y%y% w%w% h%h% ,TEST
LVModifyCol()
	GuiControl, +Redraw, ListView2
}
;	Gui,1: Show, x110 y31 h%AScreenHeight300%,% a_scriptName a_space hGUIA  
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST	
return


if GUISizeToggle____________test_______
{
AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
	GuiControl, Move,ListView2, w%AScreenWidth180%  r7
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
;	Gui,1: Show, w%AScreenWidth200%  h%AScreenHeight300%
x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
gui,show,x%x% y%y% w%w% h%h% ,TEST	
} else {
	AScreenHeight300 := (A_ScreenHeight-300)
	GuiControl, Move,ListView2, w545 r7
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
;	Gui,1: Show, w565 h%AScreenHeight300%
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

;return

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
Gui,1: Show, hide 
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
Gui,1: Show
sleep,% (min*60*1000)
;sleep,% GuiLiveTime:=(min*60*1000)
Gui,1: Show, hide
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
Gui,1: Show, hide
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
;//////////////////////////////////////////////////////////////////////////////////////////////////////// ;  halbe zeit seit; bis- sonnenaufgang, wenn nächster ist gleich letzter
	SonnenaufgangNaechsterInIstLetzterVor(RISEfile) { 
			global
;	if outOfOrder
		return
		ToggleGUI := 0
		NoTimeCounter := 1 ; unterbindet GUI Timeout
		if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		  if (NoTimeCounter=0)
		  {
		  atickCount := a_tickCount
		  GuiLiveTime:=(.299*60*1000)
		  Gui,1: Show
		  thisGUITimeout()
		}}
if !inStr(SonnenaufgangNaechsterInIstLetzterVorall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min) ; && (A_ThisLabel="start") { ; nur ein System trigger täglich möglich
		thisSonnenaufgangNaechsterInIstLetzterVorCounter := SonnenaufgangNaechsterInIstLetzterVorCounter()
		try run,% RISEfile,, hide, AusgabeVarPID
		SonnenaufgangNaechsterInIstLetzterVorall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, ListView2
		fileAppend,% "Halbe_Zeit_Last_Next_Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Halbe_Zeit_Last_Next_Sonnenaufgang (System) [ " thisSonnenaufgangNaechsterInIstLetzterVorCounter " ]`t"
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
							, ("Halbe_Zeit_Last_Next_Sonnenaufgang (System) [ " thisSonnenaufgangNaechsterInIstLetzterVorCounter " ]")
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
							, ("Halbe_Zeit_Last_Next_Sonnenaufgang (System) [ " thisSonnenaufgangNaechsterInIstLetzterVorCounter " ]")
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
		GuiControl, +Redraw, ListView2
		thisRISECounter++

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

	return ; 
	}

	SonnenaufgangNaechsterInIstLetzterVorCounter(init := false) {
	static SonnenaufgangNaechsterInIstLetzterVorCounter  := 0
	return (init 
		?   SonnenaufgangNaechsterInIstLetzterVorCounter := 0
		: ++SonnenaufgangNaechsterInIstLetzterVorCounter)
}

;////////////////////////////////////////////////////////////////////////////////////////////////////////
	SonnenuntergangNaechsterInIstLetzterVor(RISEfile) { ; halbe zeit seit; bis- sonnenuntergang, wenn nächster ist gleich letzter
			global
;	if outOfOrder
		return
		ToggleGUI := 0
		NoTimeCounter := 1 ; unterbindet GUI Timeout
		if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		  if (NoTimeCounter=0)
		  {
		  atickCount := a_tickCount
		  GuiLiveTime:=(.299*60*1000)
		  Gui,1: Show
		  thisGUITimeout()
		}}
if !inStr(SonnenuntergangNaechsterInIstLetzterVorall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min) ; && (A_ThisLabel="start") { ; nur ein System trigger täglich möglich
		thisSonnenuntergangNaechsterInIstLetzterVorCounter := SonnenuntergangNaechsterInIstLetzterVorCounter()
		try run,% RISEfile,, hide, AusgabeVarPID
		SonnenuntergangNaechsterInIstLetzterVorall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, ListView2
		fileAppend,% "Halbe_Zeit_Last_Next_Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Halbe_Zeit_Last_Next_Sonnenuntergang (System) [ " thisSonnenuntergangNaechsterInIstLetzterVorCounter " ]`t"
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
							, ("Halbe_Zeit_Last_Next_Sonnenuntergang (System) [ " thisSonnenuntergangNaechsterInIstLetzterVorCounter " ]")
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
							, ("Halbe_Zeit_Last_Next_Sonnenuntergang (System) [ " thisSonnenuntergangNaechsterInIstLetzterVorCounter " ]")
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
		GuiControl, +Redraw, ListView2
		thisRISECounter++

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

	return ; " `tSUNRISE" 
	}

	SonnenuntergangNaechsterInIstLetzterVorCounter(init := false) {
	static SonnenuntergangNaechsterInIstLetzterVorCounter  := 0
	return (init 
		?   SonnenuntergangNaechsterInIstLetzterVorCounter := 0
		: ++SonnenuntergangNaechsterInIstLetzterVorCounter)
}
;////////////////////////////////////////////////////////////////////////////////////////////////////////			; Direktive thisRISE(RISEfile)
; der USER kann den trigger (F1) ohne einschränkung mehrmals betätigen
; wenn der user auslösetaste betätigt hat, kann der trigger nach diesem zeitpunkt nur einmal vom System gesetzt werden
	thisRISE(RISEfile) {
			global
	if outOfOrder
		return

	Gui,1: listview, listview2

		ToggleGUI := 0
		NoTimeCounter := 1 ; unterbindet GUI Timeout
		if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		  if (NoTimeCounter=0)
		  {
		  atickCount := a_tickCount
		  GuiLiveTime:=(.299*60*1000)
		  Gui,1: Show
		  thisGUITimeout()
		}}
	if !inStr(timeStampRISEall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min) && (A_ThisLabel="start") {			; nur ein System trigger täglich möglich
	;	thisF1Counter := F1Counter()
	;	MainArray["thisRISECounter"] := F1Counter(0,1)
		try run,% RISEfile,, hide, AusgabeVarPID
		timeStampRISEall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Sonnenaufgang (System) [ " F1Counter(0,0) " ]`t"
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
							, ("Sonnenaufgang (System) [ " F1Counter(0,1) " ]")
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
							, ("Sonnenaufgang (System) [ " F1Counter(0,1) " ]")
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
		GuiControl, +Redraw, ListView2
		thisRISECounter++
		MainArray["thisRISECounter"] := F1Counter(0,1) 

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

	return " `tSUNRISE" 
	} else {
	if (A_ThisLabel="F1") {
	;	thisF1Counter := F1Counter()
	;	MainArray["thisRISECounter"] := F1Counter(0,1) 
		try run,% RISEfile,, hide, AusgabeVarPID
		timeStampRISEall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenaufgang (User) [ " F1Counter(0,0) " ]") "`t"
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
							, ("Sonnenaufgang (User) [ " F1Counter(0,1) " ]")
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
							, ("Sonnenaufgang (User) [ " F1Counter(0,1) " ]")
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
		GuiControl, -Redraw, ListView2
		thisRISECounter++
		MainArray["thisRISECounter"] := F1Counter(0,1) 

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

		return " `tSUNRISE"
	} else { 															; nur ein trigger täglich möglich
	if !inStr(timeStampRISEall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min) && (A_ThisLabel="start") {
	;	thisF1Counter := F1Counter()
	;	MainArray["thisRISECounter"] := F1Counter(0,1) 
		try run,% RISEfile,, hide, AusgabeVarPID
		timeStampRISEall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenaufgang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenaufgang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenaufgang (System) [ " F1Counter(0,0) " ]") "`t" ; wenn vorher User F1 gedrückt hat
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
							, ("Sonnenaufgang (System) [ " F1Counter(0,1) " ]")
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
							, ("Sonnenaufgang (System) [ " F1Counter(0,1) " ]")
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
		GuiControl, -Redraw, ListView2
		thisRISECounter++
		MainArray["thisRISECounter"] := F1Counter(0,1) ; F1Counter(init := false, lastCount := false) {

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

		return " `tSUNRISE"
}}}}

	_F1Counter(init := false) {
	static thisF1Counter  := 0
	return (init 
		?   thisF1Counter := 0
		: ++thisF1Counter)
}
	F1Counter(init := false, lastCount := false) {
	static thisF1Counter  := 0
	return 	(   init 
		?   thisF1Counter := 0
		:   lastCount
		?   thisF1Counter
		: ++thisF1Counter)
	}


;////////////////////////////////////////////////////////////////////////////////////////////////////////			; Direktive thisSET(SETfile)

; der USER kann den trigger (F2) ohne einschränkung mehrmals betätigen
; wenn der user auslösetaste betätigt hat, kann der trigger nach diesem zeitpunkt nur einmal vom System gesetzt werden
	thisSET(SETfile) {
			global

	if outOfOrder
		return

	Gui,1: listview, listview2

		ToggleGUI := 0
		NoTimeCounter := 1 ; unterbindet GUI Timeout
		if ToggleGUI := (ToggleGUI:=!ToggleGUI)
		{
		  if (NoTimeCounter=0)
		  {
		  atickCount := a_tickCount
		  GuiLiveTime:=(.299*60*1000)
		  Gui,1: Show
		  thisGUITimeout()
		}}
	if !inStr(timeStampSETall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min) && (A_ThisLabel="start") {			; nur ein System trigger täglich möglich
	;	thisF2Counter := F2Counter()
	;	MainArray["thisSETCounter"] := thisF2Counter 
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Sonnenuntergang (System) [ " F2Counter() " ]`t"
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
							, ("Sonnenuntergang (System) [ " F2Counter(0,1) " ]")
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
							, ("Sonnenuntergang (System) [ " F2Counter(0,1) " ]")
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
		GuiControl, +Redraw, ListView2
		thisSETCounter++
		MainArray["thisSETCounter"] := F2Counter(0,1)
if gutenMorgen
try	soundplay ,% a_scriptDir "\gutenMorgen.mp3"

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

	return " `tSUNSET" 
	} else {
	if (A_ThisLabel="F2") {
	;	thisF2Counter := F2Counter()
	;	MainArray["thisSETCounter"] := thisF2Counter 
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenuntergang (User) [ " F2Counter() " ]") "`t"
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
							, ("Sonnenuntergang (User) [ " F2Counter(0,1) " ]")
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
							, ("Sonnenuntergang (User) [ " F2Counter(0,1) " ]")
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
		GuiControl, -Redraw, ListView2
		thisSETCounter++
		MainArray["thisSETCounter"] := F2Counter(0,1)
if gutenMorgen
try	soundplay ,% a_scriptDir "\gutenMorgen.mp3"

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2

		return " `tSUNSET"
	} else { 															; nur ein trigger täglich möglich
	if !inStr(timeStampSETall, A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min) && (A_ThisLabel="start") {
	;	thisF2Counter := F2Counter()
	;	MainArray["thisSETCounter"] := thisF2Counter 
		try run,% SETfile,, hide, AusgabeVarPID
		timeStampSETall .= A_DD "." Month(A_MM) "." a_YYYY " Sonnenuntergang " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, ListView2
		fileAppend,% "Sonnenuntergang:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. ("Sonnenuntergang (System) [ " F2Counter() " ]") "`t" ; wenn vorher User F2 gedrückt hat
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
							, ("Sonnenuntergang (System) [ " F2Counter(0,1) " ]")
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
							, ("Sonnenuntergang (System) [ " F2Counter(0,1) " ]")
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
		GuiControl, -Redraw, ListView2
		thisSETCounter++
		MainArray["thisSETCounter"] := F2Counter(0,1)
if gutenMorgen
try	soundplay ,% a_scriptDir "\gutenMorgen.mp3"

 	loopProgress()
	nMalBlinkenContinue := 1
	nMalBlinken(1)
	Winset, redraw
	GuiControl, +Redraw, ListView1
	GuiControl, +Redraw, ListView2
MinutenTimeStampSpeichern()
		return " `tSUNSET"
}}}}

	_F2Counter(init := false) {
	static thisF2Counter  := 0
	return (init 
		?   thisF2Counter := 0
		: ++thisF2Counter)
	}

	F2Counter(init := false, lastCount := false) {
	static thisF2Counter  := 0
	return 	(   init 
		?   thisF2Counter := 0
		:   lastCount
		?   thisF2Counter
		: ++thisF2Counter)
	}
/*
;msgBox % _F2Counter(init := false, lastCount := false)
msgBox % _F2Counter(0,1) 	; LastCount
msgBox % _F2Counter(1,0) 	; ResetCount = 0
msgBox % _F2Counter() 		; counter +1
msgBox % _F2Counter() 		; counter +1
msgBox % _F2Counter(0,1) 	; LastCount = 2
msgBox % _F2Counter(1,0) 	; ResetCount = 0
*/


;//////////////////////////////////////////////////////////////////////////////////////////////////////// wird jede minute von updateGuiControl (a_lineNumber = 3066) aufgerufen
MinutenTimeStampSpeichern() {
global
		if !inStr(bigLife24stdLast, A_DDDD A_SPACE A_DD A_SPACE Month(A_MM) A_SPACE a_YYYY A_SPACE A_Hour A_SPACE A_Min A_SPACE A_Sec)
		{
		bigLife24std :=   A_DDDD a_space A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec a_tab
		. a_YYYY A_SPACE A_MM A_SPACE A_DD a_tab
		. MainArray["Sonnenaufgang"] a_tab
		. ((thisx := MainArray["Stunden bis zum nächsten Sonnenaufgang"]) ? thisx : "empty ")
		. ((thisx := MainArray["Minuten bis zum nächsten Sonnenaufgang"]) ? thisx : "empty")  a_tab
		. ((thisx := MainArray["Stunden seit letztem Sonnenaufgang"]) ? thisx : "empty ")
		. ((thisx := MainArray["Minuten seit letztem Sonnenaufgang"]) ? thisx : "empty")  a_tab
		. ((thisx := MainArray["Sonnenuntergang"]) ? thisx : "empty ") a_tab
		. ((thisx := MainArray["Stunden bis zum nächsten Sonnenuntergang"]) ? thisx : "empty ")
		. ((thisx := MainArray["Minuten bis zum nächsten Sonnenuntergang"]) ? thisx : "empty")  a_tab	
		. ((thisx := MainArray["Stunden seit letztem Sonnenuntergang"]) ? thisx : "empty ")
		. ((thisx := MainArray["Minuten seit letztem Sonnenuntergang"]) ? thisx : "empty")  a_tab
		. ((thisx := MainArray["SonnenstundenCalendarDayLTRIM", A_YDay-1]) ? thisx : "empty")  a_tab
		. StimeStd ":" StimeMINNoLTRIM a_tab
		. TagNachtZeiten() a_tab
		. xAuf  a_tab
		. xUnter  a_tab
		. thisFileGetSize a_tab
		. thisNextScheduledAction a_tab
		. (A_ThisLabel?A_ThisLabel:"empty") "`t"
		. (A_ThisFunc?A_ThisFunc:"empty") "`t"
		. (A_ThisHotkey?A_ThisHotkey:"empty") "`t"
		. (A_PriorHotkey?A_PriorHotkey:"empty") "`t"
		. (A_PriorKey?A_PriorKey:"empty") "`t"
		. (A_TimeSinceThisHotkey?ATimeSinceThisHotkey:"empty") "`t"
		. (A_TimeSincePriorHotkey?ATimeSincePriorHotkey:"empty") "`t"
		. (A_GuiControl?A_GuiControl:"empty") "`t"
		. (A_GuiEvent?A_GuiEvent:"empty") "`t"
		. (A_EventInfo?A_EventInfo:"empty")
		. "`n"
		}

		bigLife24stdLast := A_DDDD A_SPACE A_DD A_SPACE Month(A_MM) A_SPACE a_YYYY A_SPACE A_Hour A_SPACE A_Min

		thisSplit := strSplit(bigLife24std, a_tab)
		if !(inStr(thisSplit.4,"empty")
		&& inStr(thisSplit.5,"empty")
		&& inStr(thisSplit.7,"empty")
		&& inStr(thisSplit.8,"empty"))
		|| if inStr(bigLife24std,"SUNSET")
		|| if inStr(bigLife24std,"SUNRISE")
		{
		if !(bigLife24stdOLD=bigLife24std)
		fileappend,% bigLife24std,% filename 
		bigLife24stdOLD := bigLife24std
	} }


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
		  Gui,1: Show
		  thisGUITimeout()
		}}
	if !inStr(timeStampGefahrenmeldungall, A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung") {
		try run,% Gefahrenmeldungfile,, hide, AusgabeVarPID
		timeStampGefahrenmeldungall .= A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
		thisSturmwarnungCounter := SturmwarnungCounter()
		MainArray["SturmwarnungCounter"] := thisSturmwarnungCounter

	GuiControl, -Redraw, ListView2
		fileAppend,% "Gefahrenmeldung:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							. "Sturmwarnung (System) [ " thisSturmwarnungCounter " ]`t"
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
							, ("Sturmwarnung (System) [ " thisSturmwarnungCounter " ]")
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
							, ("Sturmwarnung (System) [ " thisSturmwarnungCounter " ]")
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
	GuiControl, +Redraw, ListView2
		thisGefahrenmeldungCounter++
	return " `tSturmwarnung" 
	}  else {
;	if (A_ThisLabel="Gefahrenmeldung") || (A_ThisLabel="apiGefahrenmeldung") || (A_ThisLabel=!"") {
;	if (A_ThisLabel=!"") {
	thisSturmwarnungCounter := SturmwarnungCounter()
	MainArray["SturmwarnungCounter"] := thisSturmwarnungCounter
		try run,% Gefahrenmeldungfile,, hide, AusgabeVarPID
		timeStampGefahrenmeldungall .= A_DD "." Month(A_MM) "." a_YYYY " Gefahrenmeldung " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)
	GuiControl, -Redraw, ListView2
		fileAppend,% "Sturmwarnung:`t" A_DD "." Month(A_MM) "." a_YYYY "  " A_Hour ":" A_Min ":" A_Sec ":" A_MSec " Uhr`t"
							. (A_ThisLabel?A_ThisLabel:"System") "`t"
							, ("Sturmwarnung (System) [ " thisSturmwarnungCounter " ]")  "`t"
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
							, ("Sturmwarnung (System) [ " thisSturmwarnungCounter " ]")
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
							, ("Sturmwarnung (System) [ " thisSturmwarnungCounter " ]")
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
	GuiControl, +Redraw, ListView2
		thisGefahrenmeldungCounter++
		return " `tSturmwarnung"
	}   }  ; }

	SturmwarnungCounter(init := false) {
	static SturmwarnungCounter  := 0
	return (init 
		?   SturmwarnungCounter := 0
		: ++SturmwarnungCounter)
	}

;////////////////////////////////////////////////////////////////////////////////////////////////////////
F8:
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
		  Gui,1: Show
		  thisGUITimeout()
		}}
	if !inStr(timeStampxTriggerall, A_DD "." Month(A_MM) "." a_YYYY " xTrigger") {
		try run,% xTriggerfile,, hide, AusgabeVarPID
		timeStampxTriggerall .= A_DD "." Month(A_MM) "." a_YYYY " xTrigger " A_Hour ":" A_Min ":" A_Sec "`n"

		thisATimeSinceThisHotkey := A_TimeSinceThisHotkey
		ATimeSinceThisHotkey := subStr(ConvertToHHMMSSMS(thisATimeSinceThisHotkey),1,8)

		thisATimeSincePriorHotkey := A_TimeSincePriorHotkey
		ATimeSincePriorHotkey := subStr(ConvertToHHMMSSMS(thisATimeSincePriorHotkey),1,8)

	GuiControl, -Redraw, ListView2
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
	GuiControl, +Redraw, ListView2
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
	GuiControl, -Redraw, ListView2
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
	GuiControl, +Redraw, ListView2
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
;Gui,1: Show, hide
;return
if GUISizeToggle 
{
	GuiControl, -Redraw, ListView2
	AScreenWidth180 := (A_ScreenWidth-220)
	AScreenWidth200 := (A_ScreenWidth-200)
;	GuiControl, Move,ListView2, w%AScreenWidth180%  r7
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
/*
	LV_ModifyCol(1,(wa*1.9)/xx)
	LV_ModifyCol(2,(wa*1.9)/xx)
	LV_ModifyCol(3,(wa*6)/xx)
	LV_ModifyCol(4,(wa*14)/xx)
;		LV_ModifyCol(3, (wa*13.5)/xx)	; Name
;		LV_ModifyCol(3, (3, (wa*14.)/xx))	; Name
;		LV_ModifyCol(4, 0)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
*/
	GuiControl, +Redraw, ListView2
	Gui,1: Show ; , w%AScreenWidth200%  h%AScreenHeight300%
;x:=(wa*10)/xx,y:=(ha*10)/xx,w:=(wa*65)/xx,h:=(ha*80)/xx
;gui,show,x%x% y%y% w%w% h%h% ,TEST		
} else {
	GuiControl, -Redraw, ListView2
	AScreenHeight300 := (A_ScreenHeight-300)
;	GuiControl, Move,ListView2, w545 r7
	Loop, % LV_GetCount("Columns")
	LV_ModifyCol(A_Index, "AutoHdr")
/*
;	LV_ModifyCol(1,(wa*1.9)/xx)
;	LV_ModifyCol(2,(wa*1.9)/xx)
;	LV_ModifyCol(3,(wa*6)/xx)
;	LV_ModifyCol(4,(wa*14)/xx)
;		LV_ModifyCol(1, "AutoHdr")	; Timestamp
;		LV_ModifyCol(2, "AutoHdr")	; Action
;		LV_ModifyCol(3, (wa*13.5)/xx)	; Name
*/

		LV_ModifyCol(4, 0)	; A_ThisFunc
		LV_ModifyCol(5, 0)	; A_ThisHotkey
		LV_ModifyCol(6, 0)	; A_PriorHotkey
		LV_ModifyCol(7, 0)	; A_PriorKey
		LV_ModifyCol(8, 0)	; A_TimeSinceThisHotkey
		LV_ModifyCol(9, 0)	; A_TimeSincePriorHotkey
		LV_ModifyCol(10, 0)	; A_GuiControl
		LV_ModifyCol(11, 0)	; A_GuiEvent
		LV_ModifyCol(12, 0)	; A_EventInfo
	GuiControl, +Redraw, ListView2
;	Gui,1: Show, w565 h%AScreenHeight300%
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

_TagNachtZeiten() {
global
; LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10") 
return 	(IsSummerTime(A_YYYY A_MM A_DD)=1) 

	? TagNachtZeitenMEZ() " MEsZ bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) " <> " 
 	. "MESZ bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2))

	: TagNachtZeitenMEZ() " MEsZ bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2)) " <> "
	. "MEZ bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) 
}

TagNachtZeiten__() {
global
; LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10") 
return 	(IsSummerTime(A_YYYY A_MM A_DD)=1) 
	? TagNachtZeitenMEZ()  " [ ME Sommer Z bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) " ] <> " 
				.  " [ ME Winter Z bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2)) " ]"
	: TagNachtZeitenMEZ()  " [ ME Winter Z bis " SubStr(LastSunday(A_YYYY "03"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "03"), 5, 2)) " ] <> "
				. " [ ME Sommer Z bis " SubStr(LastSunday(A_YYYY "10"), 7, 2) "." Month(SubStr(LastSunday(A_YYYY "10"), 5, 2)) " ]" 
}

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
;	? "Sommerzeit [ MESZ ]"
;	: "Winterzeit [ MEZ ]"
	? "[ MESZ Sommerzeit ]"
	: "[ MEZ Winterzeit ]"
}
JahresZeitSommerOderWinterZeit() {
global
; LastSunday(A_YYYY "03") "`n" LastSunday(A_YYYY "10") 
return 	(IsSummerTime(A_YYYY A_MM A_DD)=1) 
	? "Sommerzeit"
	: "Winterzeit"
;	? "Sommerzeit [ MESZ ]"
;	: "Winterzeit [ MEZ ]"
;	? "[ MESZ Sommerzeit ]"
;	: "[ MEZ Winterzeit ]"
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
return MainArray["TagNachtZeit"] := "Mittags 13 bis 15 Uhr"
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


SonnenaufgangGUI2Zeit_gLabel:
ThrowLaeis: 									; Monitorauswahl
; msgbox SonnenaufgangGUI2Zeit_gLabel:
 x:=(wa*-65)/xx,	y:=(ha*0)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
;  x:=(wa*29)/xx,	y:=(ha*10)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
  gui,show,x%x% y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
return
ThrowTouch:
;  x:=(wa*-65)/xx,	y:=(ha*0)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
 x:=(wa*29)/xx,	y:=(ha*10)/xx,	w:=(wa*65)/xx,	h:=(ha*80)/xx
  gui,show,x%x% y%y% w%w% h%h% ,% strReplace((substr(a_scriptname,-11)),".ahk")
return



WM_MOUSEMOVE()
{
    static AktStrlmnt, VorStrlmnt, _TT  ; _TT bleibt für den unteren ToolTip-Befehl leer.
    global AktStrlmntx
    global AktStrlmnty
    global AktStrlmntw
    global AktStrlmnth
    AktStrlmnt := A_GuiControl
; GuiControlGet, AktStrlmnt, Pos
    if (AktStrlmnt != VorStrlmnt and not InStr(AktStrlmnt, " "))
    {
        ToolTip  ; Versteckt den vorherigen Tooltip.
        SetTimer, ZeigeToolTip, 100
        VorStrlmnt := AktStrlmnt
    }
    return

    ZeigeToolTip:
    SetTimer, ZeigeToolTip, Off

 GuiControlGet, AktStrlmnt, Pos
   ToolTip % %AktStrlmnt%_TT
;   ToolTip % %AktStrlmnt%_TT "`n" SteuerelementIDData(AktStrlmnt)
;   ToolTip % %AktStrlmnt%_TT "`n" AktStrlmnt
;   ToolTip % %AktStrlmnt%_TT "`n" "x" %AktStrlmntX% " y" AktStrlmntY " w" AktStrlmntW " h" AktStrlmntH "  " SteuerelementIDX "  " %SteuerelementIDX%
;    ToolTip % %AktStrlmnt%_TT "`n" AktStrlmntX a_space AktStrlmntY a_space AktStrlmntW a_space AktStrlmntH
    SetTimer, EntferneToolTip,% (1.5*60*1000)
    return

    EntferneToolTip:
    SetTimer, EntferneToolTip, Off
    ToolTip
    return
}

SteuerelementIDData(SteuerelementID) {
    global SteuerelementIDX
    global SteuerelementIDY
    global SteuerelementIDW
    global SteuerelementIDH
GuiControlGet,SteuerelementID, Pos
 return "x" %SteuerelementIDX% " y" %SteuerelementIDY% " w" %SteuerelementIDW% " h" %SteuerelementIDH%
 ; return "x" SteuerelementIDX " y" SteuerelementIDY " w" SteuerelementIDW " h" SteuerelementIDH
} 
;//////////////////////////////////////////////////////////////////////////////////// feiertage
/*
; func feiertage(jahr,land,timestrg)
; https://www.autohotkey.com/boards/viewtopic.php?f=10&t=61733 by haichen 5. Februar 2019 15:33 Uhr
#SingleInstance force
#NoEnv
#Persistent
FileEncoding, UTF-8
SetBatchLines, -1
SetTitleMatchMode, 2
SetKeyDelay 20
SetWorkingDir, %A_ScriptDir%
ANow := A_Now
If !FileExist(A_ScriptDir "\save\")
FileCreateDir,% A_ScriptDir "\save\"
FileCopy, % A_ScriptFullPath, % A_ScriptDir "\save\" A_ScriptName " save " A_Now " .ahk"


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Als test alle Feiertage in Deutschland mit Benennung
msgbox, % feiertage(a_yyyy,"dl","longdate")

;Immer-Sonntage sind nicht dabei
msgbox, % feiertage(a_yyyy,"ni","longdate")

return
*/

feiertage(jahr,land,timestrg){
;https://autohotkey.com/board/topic/97400-feiertage-berechnen-osterformel-nach-heiner-lichtenberg/
;https://www.excel-coach.com/excel-und-die-feiertage/
;https://www.dagmar-mueller.de/wdz/html/feiertagsberechnung.html
;https://www.ferienwiki.de/feiertage/2019/de
; ==============    
;timestrg:="yyyyMMdd"
;timestrg:="longdate"

; Ostersonntag
ttos:="`nOstersonntag:                 "
    X := jahr                                              ; Jahreszahl, für die Ostern berechnet werden soll
    K  := Floor(X/100)                                      ; Säkularzahl
    M  := 15+Floor((3*K+3)/4)-Floor((8*K+13)/25)            ; säkulare Mondschaltung
    S  := 2-Floor((3*K+3)/4)                                ; säkulare Sonnenschaltung
    A  := Mod(X,19)                                         ; Mondparameter
    D  := Mod(19*A+M,30)                                    ; Keim für den ersten Vollmond im Frühling
    R  := Floor(D/29)+(Floor(D/28)-Floor(D/29))*Floor(A/11) ; kalendarische Korrekturgröße (beseitigt die Gaußschen Ausnahmeregeln)
    OG := 21+D-R                                            ; Ostergrenze (Märzdatum des Ostervollmonds)
    SZ := 7-Mod(X+Floor(X/4)+S,7)                           ; Erster Sonntag im März
    OE := 7-Mod(OG-SZ,7)                                    ; Entfernung des Ostersonntag von der Ostergrenze in Tagen
    OS := OG+OE                                             ; Märzdatum (ggf. in den April verlängert) des Ostersonntag, (32. März = 1. April usw.)
    Os:= x . (OS > 31 ? "04" SubStr("0"OS-31,-1) : "03" OS)
    FormatTime, oss,% os, % timestrg
 ; ==============       
 ;Buß- und Bettag                                           ;Mittwoch vor dem 23. November
  tbbt:="`nBuß- und Bettag:             "
  md := OG+OE              
  tOs:= md > 31 ? SubStr("0"md-31,-1) :  md                   ;tag des Ostersonntags für die Berechnung des Buß und Bettags https://www.dagmar-mueller.de/wdz/html/feiertagsberechnung.html     
  tz:= md > 31 ?  Mod((30 - tos), 7)  :  Mod((33 - tos), 7)
  bbt:="20191122"
  bbt += -tz, days
  FormatTime, bbt,% bbt, % timestrg
 ; ==============   
 ; NeuJahr
  tnj:="`nNeuJahr:                           "
  nj:=  jahr . "0101"
  FormatTime, nj,% nj, % timestrg
 ; ==============   
 ; Heilige Drei Könige
   thdk:="`nHeilige Drei Könige:        "
   hdk:=  jahr . "0106"
   FormatTime, hdk,% hdk, % timestrg
 ; ==============   
 ; Internationaler Frauentag (nur Berlin)
   tift:="`nInternationaler Frauentag:         "
   ift:= jahr . "0308"
   FormatTime, ift,% ift, % timestrg
 ; ============== 
  ; Tag der Arbeit  
   ttda:="`nTag der Arbeit:                "
   tda:=  jahr . "0501"
   FormatTime, tda,% tda, % timestrg
 ; ==============   
 ;  Augsburger Friedensfest
    taff:="`nAugsburger Friedensfest:   "
    aff:=  jahr . "0808"
    FormatTime, aff,% aff, % timestrg
 ; ==============   
 ; Mariä Himmelfahrt
   tmhf:="`nMariä Himmelfahrt:            "
   mhf:=  jahr . "0815"
   FormatTime, mhf,% mhf, % timestrg
 ; ==============   
 ; Tag der Deutschen Einheit  
   ttdde:="`nTag der Deutschen Einheit:   "
   tdde:=  jahr . "1003" 
   FormatTime, tdde,% tdde, % timestrg
 ; ==============   
 ; Reformationstag
   trt:="`nReformationstag:           "
   rt:=  jahr . "1031"
   FormatTime, rt,% rt, % timestrg
 ; ==============   
 ; Allerheiligen
   tah:="`nAllerheiligen:                "
   ah:=  jahr . "1101"
   FormatTime, ah,% ah, % timestrg
 ; ==============   
 ; 1. Weihnachtsfeiertag  
   tw1:="`n1. Weihnachtsfeiertag:        "
   w1:=  jahr . "1225" 
   FormatTime, w1,% w1, % timestrg
 ; ==============   
 ; 2. Weihnachtsfeiertag  
   tw2:="`n2. Weihnachtsfeiertag:        "
   w2:=  jahr . "1226"
   FormatTime, w2,% w2, % timestrg
 ; ==============   
; Karfreitag                      Freitag vor Ostersonntag                           = OS – 2
tkfr:="`nKarfreitag:                        " 
  kfr:=os
  kfr += -2, days
  FormatTime, kfr,% kfr, % timestrg
 ; ==============   
;Ostermontag                    Montag nach Ostersonntag                        = OS + 1
  tosm:="`nOstermontag:                  " 
  osm:=os
  osm += 1, days
  FormatTime, osm,% osm, % timestrg
 ; ==============   
;Christi Himmelfahrt          39 Tage nach Ostersonntag                       = OS + 39
  tchf:="`nChristi Himmelfahrt:       " 
  chf:=os
  chf += 39, days
  FormatTime, chf,% chf, % timestrg
 ; ==============   
;Pfingstsonntag                49 Tage nach Ostersonntag                        = OS + 49
  tpfs:="`nPfingstsonntag:             " 
  pfs:=os
  pfs += 49, days
  FormatTime, pfs,% pfs, % timestrg
 ; ==============   
;Pfingstmontag                 50 Tage nach Ostersonntag                        = OS + 50
  tpfm:="`nPfingstmontag:              " 
  pfm:=os
  pfm += 50, days
  FormatTime, pfm,% pfm, % timestrg
 ; ==============   
;Fronleichnam                   60 Tage nach Ostersonntag                       = OS + 60
  tfl:="`nFronleichnam:               " 
  fl:=os
  fl += 60, days
  FormatTime, fl,% fl, % timestrg
 ; ==============   
 
 ; alle (dl)
  ;ft:= nj "," hdk "," ift "," kfr "," os  "," osm "," tda "," chf "," pfs  "," pfm "," fl "," aff "," mhf "," tdde "," rt "," ah "," bbt ","  w1 "," w2 
   ;ft:= tnj nj "," thdk hdk "," tift ift "," tkfr kfr "," ttos oss  "," tosm osm "," ttda tda "," tchf chf "," tpfs pfs  "," tpfm pfm "," tfl fl "," taff aff "," tmhf mhf "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2    
   ;return ft

if (land = "dl") ;test alle
  ft:= tnj nj "," thdk hdk "," tift ift "," tkfr kfr "," ttos oss  "," tosm osm "," ttda tda "," tchf chf "," tpfs pfs  "," tpfm pfm "," tfl fl "," taff aff "," tmhf mhf "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2  
else if (land = "bw") ;Feiertage Baden-Württemberg
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl  fl  "," ttdde  tdde  "," tah  ah  ","  tw1 w1 "," tw2 w2 
else if  (land = "by") ;Feiertage Bayern alle
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," taff aff "," tmhf mhf "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2 
else if  (land = "bya") ;Feiertage Bayern alle
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," taff aff "," tmhf mhf "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2 
else if  (land = "byk") ;Feiertage Bayern kath.
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," tmhf mhf "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2 
else if  (land = "byp") ;Feiertage Bayern prot.
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl  fl  "," ttdde tdde "," trt rt "," tah ah "," tbbt bbt ","  tw1 w1 "," tw2 w2 
else if  (land = "be") ;Feiertage Berlin
  ft:= tnj nj "," tift ift "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde ","  tw1 w1 "," tw2 w2 
else if  (land = "bb") ;Feiertage Brandenburg
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2
else if  (land = "hb") ;Feiertage Bremen
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "hh") ;Feiertage Hamburg
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "he") ;Feiertage Hessen
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," ttdde tdde ","  tw1 w1 "," tw2 w2 
else if  (land = "mv") ;Feiertage Mecklenburg-Vorpommern
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "ni") ;Feiertage Niedersachsen
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "nw") ;Feiertage Nordrhein-Westfalen
   ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," ttdde tdde "," tah ah ","  tw1 w1 "," tw2 w2
else if  (land = "rp") ;Feiertage Rheinland-Pfalz
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," ttdde tdde "," tah ah ","  tw1 w1 "," tw2 w2 
else if  (land = "sl") ;Feiertage Saarland
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," tfl fl "," tmhf mhf "," ttdde tdde "," tah ah ","  tw1 w1 "," tw2 w2 
else if  (land = "sn") ;Feiertage Sachsen
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "st") ;Feiertage Sachsen-Anhalt
  ft:= tnj nj "," thdk hdk "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2
else if  (land = "sh") ;Feiertage Schleswig-Holstein
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2 
else if  (land = "th") ;Feiertage Thüringen
  ft:= tnj nj "," tkfr kfr "," tosm osm "," ttda tda "," tchf chf "," tpfm pfm "," ttdde tdde "," trt rt ","  tw1 w1 "," tw2 w2

 return ft
}

/*
^F1::
WinWait, sunrise-sunset--DEV.0063.ahk - Editor, 
IfWinNotActive, sunrise-sunset--DEV.0063.ahk - Editor, , WinActivate, sunrise-sunset--DEV.0063.ahk - Editor, 
WinWaitActive, sunrise-sunset--DEV.0063.ahk - Editor, 
Sleep, 100
Send, {HOME}
Sleep, 100
Send, {CTRLDOWN}{RIGHT}{RIGHT}{SHIFTDOWN}{RIGHT}{SHIFTUP}{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}c{CTRLUP}
Sleep, 100
Send, t
Sleep, 100
Send, {CTRLDOWN}vv{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}{RIGHT}{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}{SHIFTDOWN}{RIGHT}{CTRLUP}{SHIFTUP}
return
^F2::
WinWait, sunrise-sunset--DEV.0063.ahk - Editor, 
IfWinNotActive, sunrise-sunset--DEV.0063.ahk - Editor, , WinActivate, sunrise-sunset--DEV.0063.ahk - Editor, 
WinWaitActive, sunrise-sunset--DEV.0063.ahk - Editor, 
Sleep, 100
Send, {CTRLDOWN}c{CTRLUP}
Sleep, 100
Send, t
Sleep, 100
Send, {CTRLDOWN}vv{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}{RIGHT}{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}{SHIFTDOWN}{RIGHT}{CTRLUP}{SHIFTUP}
return
*/
; ///////////////////////////////////////////////////////////////////////////////////////////
/*

dl=alle
bw=Baden-Württemberg
by=Bayern alle
bya=Bayern alle
byk=Bayern kath.
byp=Bayern prot.
be=Berlin
bb=Brandenburg
hb=Bremen
hh=Hamburg
he=Hessen
mv=Mecklenburg-Vorpommern
ni=Niedersachsen
nw=Nordrhein-Westfalen
rp=Rheinland-Pfalz
sl=Saarland
sn=Sachsen
st=Sachsen-Anhalt
sh=Schleswig-Holstein
th=Thüringen

*/