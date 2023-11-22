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

	thisClipBoard := ""
	ClipBoardold 	:= clipboard
		fileRead, getguicontrols,% a_scriptDir "\" a_scriptName
		
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`;")
			if instr(ClipBoard, aloopField)
			continue
			ClipBoard .= aloopField "`n"
			}
exitapp
/*

O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)
	thisClipBoard := ""
	ClipBoardold 	:= clipboard
		fileRead, getguicontrols,% a_scriptDir "\" a_scriptName
		
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`")
			if instr(ClipBoard, aloopField)
			continue
			ClipBoard .= aloopField "`n"
			}
		sort, clipboard
exitapp
/*
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
if((A_PtrSize=8&&A_IsCompiled="")||!A_IsUnicode){ 32 bit=4  64 bit=8
	thisClipBoard := ""
	ClipBoardold 	:= clipboard
		fileRead, getguicontrols,% a_scriptDir "\" a_scriptName
		
		loop, parse, getguicontrols, `n 
			{
			aloopField := strReplace(a_loopField, "`")
			if instr(ClipBoard, aloopField)
			continue
			ClipBoard .= aloopField "`n"
			}
/*
O:\untertitel 2023\sunrise sunset sonnenaufgang sonnenuntergang\Neuer Ordner (2)-20231108T211454Z-001\Neuer Ordner (2)
		sort, clipboard
GuiControl,1: show, 	TextEdit1
GuiControl,1: show, 	SonnenEditStunden
GuiControl,1: show, 	TextStunden
GuiControl,1: show, 	SonnenEditMinuten
GuiControl,1: show, 	TextMinuten
GuiControl,1: show, 	ddl1
GuiControl,1: show, 	ddl3
GuiControl,1: show, 	GroupBoxAWiederholen
GuiControl,1: show, 	RadioEinmal
GuiControl,1: show, 	RadioTÃ¤glich
GuiControl,1: show, 	RadioWÃ¶chendlich
GuiControl,1: show, 	RadioMonatlich
GuiControl,1: show, 	RadioJÃ¤hrlich
GuiControl,1: show, 	GroupBoxÃœberListView1
GuiControl,1: show, 	triggerSuche
GuiControl,1: show, 	ListViewAnsichErweitern
GuiControl,1: show, 	Ãœbernehmen
GuiControl,1: show, 	GroupBoxUnterListView1
GuiControl,1: show, 	ListView1
GuiControl,1: show, 	mehr
GuiControl,1: show, 	MarkierteLÃ¶schen
GuiControl,1: show, 	ListeExportieren
GuiControl,1: show, 	ListeImportieren
GuiControl,1: show, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: show, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: show, 	GroupBoxLOG
GuiControl,1: show, 	GroupBoxUnterLOGListview
GuiControl,1: show, 	LogListeExportieren
GuiControl,1: show, 	LogListeAnsichtErweiternProgress
GuiControl,1: show, 	LogListeAnsichtErweitern
GuiControl,1: show, 	LV1
GuiControl,1: show, 	ActiveXA
GuiControl,1: show, 	GroupBoxScreenSaver
GuiControl,1: show, 	AlertConfig
GuiControl,1: show, 	ScreenSaver
GuiControl,1: show, 	TriggerDateien
GuiControl,1: show, 	SonnenaufgangGUI2Text
GuiControl,1: show, 	SonnenaufgangGUI2Zeit
GuiControl,1: show, 	SeitSonnenaufgangGUI2Text
GuiControl,1: show, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: show, 	SonnenuntergangGUI2Text
GuiControl,1: show, 	SonnenuntergangGUI2Zeit
GuiControl,1: show, 	SeitSonnenuntergangGUI2Text
GuiControl,1: show, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: show, 	GroupBoxSonneAuf
GuiControl,1: show, 	GroupBoxSonneUnter
GuiControl,1: show, 	thisListViewAnsichtErweiternProgress
GuiControl,1: show,	ThisProgress#1a
GuiControl,1: show,	ThisProgress#1b
GuiControl,1: show,	ThisProgress#1c
GuiControl,1: show,	ThisProgress#1d
GuiControl,1: hide, 	TextEdit1
GuiControl,1: hide, 	SonnenEditStunden
GuiControl,1: hide, 	TextStunden
GuiControl,1: hide, 	SonnenEditMinuten
GuiControl,1: hide, 	TextMinuten
GuiControl,1: hide, 	ddl1
GuiControl,1: hide, 	ddl3
GuiControl,1: hide, 	GroupBoxAWiederholen
GuiControl,1: hide, 	RadioEinmal
GuiControl,1: hide, 	RadioTÃ¤glich
GuiControl,1: hide, 	RadioWÃ¶chendlich
GuiControl,1: hide, 	RadioMonatlich
GuiControl,1: hide, 	RadioJÃ¤hrlich
GuiControl,1: hide, 	GroupBoxÃœberListView1
GuiControl,1: hide, 	triggerSuche
GuiControl,1: hide, 	thisListViewAnsichtErweiternProgress
GuiControl,1: hide, 	Ãœbernehmen
GuiControl,1: hide, 	GroupBoxUnterListView1
GuiControl,1: hide, 	ListView1
GuiControl,1: hide, 	mehr
GuiControl,1: hide, 	MarkierteLÃ¶schen
GuiControl,1: hide, 	ListeExportieren
GuiControl,1: hide, 	ListeImportieren
GuiControl,1: hide, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: hide, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: hide, 	GroupBoxLOG
GuiControl,1: hide, 	GroupBoxUnterLOGListview
GuiControl,1: hide, 	LogListeExportieren
GuiControl,1: hide, 	LogListeAnsichtErweiternProgress
GuiControl,1: hide, 	LogListeAnsichtErweitern
GuiControl,1: hide, 	LV1
GuiControl,1: hide, 	ActiveXA
GuiControl,1: hide, 	GroupBoxScreenSaver
GuiControl,1: hide, 	AlertConfig
GuiControl,1: hide, 	ScreenSaver
GuiControl,1: hide, 	TriggerDateien
GuiControl,1: hide, 	SonnenaufgangGUI2Text
GuiControl,1: hide, 	SonnenaufgangGUI2Zeit
GuiControl,1: hide, 	SeitSonnenaufgangGUI2Text
GuiControl,1: hide, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: hide, 	SonnenuntergangGUI2Text
GuiControl,1: hide, 	SonnenuntergangGUI2Zeit
GuiControl,1: hide, 	SeitSonnenuntergangGUI2Text
GuiControl,1: hide, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: hide, 	GroupBoxSonneAuf
GuiControl,1: hide, 	GroupBoxSonneUnter
GuiControl,1: hide, 	thisLoopProgress
GuiControl,1: hide, 	ThisProgress#1a
GuiControl,1: hide, 	ThisProgress#1b
GuiControl,1: hide, 	ThisProgress#1c
GuiControl,1: hide, 	ThisProgress#1d
GuiControl,1: MoveDraw, 	TextEdit1,	% thisX(1) thisY(0.9) thisW(28.0) thisH(3.6) default
GuiControl,1: MoveDraw, 	SonnenEditStunden,	% thisX(1.1) thisY(5.0) thisW(2.9) thisH(2.2) <-- hier doro :-)
GuiControl,1: MoveDraw, 	SonnenEditStundenUpDown, 	% thisW(2.2) thish(2.20)
GuiControl,1: MoveDraw, 	TextStunden,	% thisX(5.65) thisY(5.45) thisW(3.1) thisH(2) " cBLUE " default
GuiControl,1: MoveDraw, 	SonnenEditMinuten,	% thisX(8.8) thisY(5) thisW(2.9) thisH(2.2) default
GuiControl,1: MoveDraw, 	SonnenEditMinutenUpDown, 	% thisW(2.2) thish(2.20)
GuiControl,1: MoveDraw, 	TextMinuten,	% thisX(13.3) thisY(5.45) thisW(3.39) thisH(2) default
GuiControl,1: MoveDraw, 	ddl1, 	% thisX(16.7) thisY(5) thisW(12.3) thisH(2.2) default
GuiControl,1: MoveDraw, 	ddl3, 	% thisX(1.0) thisY(8.5) thisW(28.0) thisH(2.2) default
GuiControl,1: MoveDraw, 	GroupBoxAWiederholen, 	% thisX(1.0) thisY(12.1) thisW(28.0) thisH(4.8) default
GuiControl,1: MoveDraw, 	RadioEinmal, 	% thisX(1.5) thisY(14.2) thisW(4.0) thisH(2.0) default
GuiControl,1: MoveDraw, 	RadioTÃ¤glich, 	% thisX(6.3) thisY(14.2) thisW(4.0) thisH(2.0) default
GuiControl,1: MoveDraw, 	RadioWÃ¶chendlich, 	% thisX(11.0) thisY(14.2) thisW(5.6) thisH(2.0) default
GuiControl,1: MoveDraw, 	RadioMonatlich, 	% thisX(17.5) thisY(14.2) thisW(4.5) thisH(2.0) default
GuiControl,1: MoveDraw, 	RadioJÃ¤hrlich, 	% thisX(23.5) thisY(14.2) thisW(4.0) thisH(2.0) default
GuiControl,1: MoveDraw, 	GroupBoxÃœberListView1, 	% thisX(1.0) thisY(21.2) thisW(28.0) thisH(2.0) default
GuiControl,1: MoveDraw, 	triggerSuche, 	% thisX(1.5) thisY(18.0) thisW(10.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	thisListViewAnsichtErweiternProgress,	% thisX(0) thisY(0) thisW(0) thisH(0) default
GuiControl,1: MoveDraw, 	thisListViewAnsichtErweiternProgress,	% thisX(12.4) thisY(17.9) thisW(9.8) thisH(2.9) klein
GuiControl,1: MoveDraw, 	thisListViewAnsichtErweiternProgress,	% thisX(12.2) thisY(17.5) thisW(10.4) thisH(3.9) default
GuiControl,1: MoveDraw, 	thisListViewAnsichtErweiternProgress,	% thisX(12.0) thisY(17.3) thisW(10.6) thisH(4.1) big
GuiControl,1: MoveDraw, 	ListViewAnsichErweitern, 	% thisX(12.5) thisY(18.0) thisW(9.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	Ãœbernehmen, 	% thisX(22.5) thisY(18.0) thisW(5.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	GroupBoxUnterListView1, 	% thisX(1.0) thisY(42.0) thisW(28.0) thisH(4.8) default
GuiControl,1: MoveDraw, 	ListView1, 	% thisX(1.0) thisY(23.0) thisW(28.0) thisH(20.0) default
GuiControl,1: MoveDraw, 	mehr,	% thisX(25.0) thisY(43.5) thisW(3.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	MarkierteLÃ¶schen,	% thisX(17.1) thisY(43.5) thisW(7.6) thisH(2.6) default
GuiControl,1: MoveDraw, 	ListeExportieren,	% thisX(9.3) thisY(43.5) thisW(7.4) thisH(2.6) default
GuiControl,1: MoveDraw, 	ListeImportieren,	% thisX(1.5) thisY(43.5) thisW(7.4) thisH(2.6) default
GuiControl,1: MoveDraw, 	GroupBoxNÃ¤chsteSystemAktion, 	% thisX(1.0) thisY(47.5) thisW(28.0) thisH(4.6) default
GuiControl,1: MoveDraw, 	NÃ¤chsteGeplanteSystemAction,	% thisX(1.5) thisY(49.5) thisW(26.9) thisH(2) default
GuiControl,1: MoveDraw, 	GroupBoxLOG, 	% thisX(1.0) thisY(52.8) thisW(28.0) thisH(2.11) default
GuiControl,1: MoveDraw, 	GroupBoxUnterLOGListview, 	% thisX(1.0) thisY(73.7) thisW(28.0) thisH(4.8) default
GuiControl,1: MoveDraw, 	LogListeExportieren, 	% thisX(19.5) thisY(75.2) thisW(8.9) thisH(2.6) default
GuiControl,1: MoveDraw, 	LogListeAnsichtErweiternProgress,	% thisX(0) thisY(0) thisW(0) thisH(0) default
GuiControl,1: MoveDraw, 	LogListeAnsichtErweiternProgress,	% thisX(8.9) thisY(75.0) thisW(10.4) thisH(3.0) klein
GuiControl,1: MoveDraw, 	LogListeAnsichtErweiternProgress,	% thisX(12.2) thisY(17.5) thisW(10.4) thisH(3.9) default
GuiControl,1: MoveDraw, 	LogListeAnsichtErweiternProgress,	% thisX(12.0) thisY(17.3) thisW(10.6) thisH(4.1) big
GuiControl,1: MoveDraw, 	LogListeAnsichtErweitern, 	% thisX(9.1) thisY(75.2) thisW(9.9) thisH(2.6) default
GuiControl,1: MoveDraw, 	LV1, 	% thisX(1.0) thisY(54.8) thisW(28.0) thisH(20.0) default
GuiControl,1: MoveDraw, 	ActiveXA,	% thisX(0) thisY(0) thisW(65) thisH(-1) default
GuiControl,1: MoveDraw, 	ActiveXA,	% thisX(30) thisY(28) thisW(34) thisH(50) default
GuiControl,1: MoveDraw, 	ActiveXA,	% thisX(0) thisY(5) thisW(34) thisH(73) default
GuiControl,1: MoveDraw, 	GroupBoxScreenSaver,	% thisX(30.0) thisY(.5) thisW(34.0) thisH(13.6) default
GuiControl,1: MoveDraw, 	AlertConfig,	% thisX(53.3) thisY(1.9) thisW(10.0) thisH(10.6) default
GuiControl,1: MoveDraw, 	ScreenSaver,	% thisX(30.5) thisY(2.5) thisW(11.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	TriggerDateien,	% thisX(30.5) thisY(5.5) thisW(11.5) thisH(2.6) default
GuiControl,1: MoveDraw, 	SonnenaufgangGUI2Text,	% thisX(31.5900) thisY(4.9) thisW(11) thisH(2.6) default
GuiControl,1: MoveDraw, 	SonnenaufgangGUI2Zeit,	% thisX(43.0) thisY(4.9) thisW(20.1111) thisH(2.6) default
GuiControl,1: MoveDraw, 	SeitSonnenaufgangGUI2Text,	% thisX(31.5900) thisY(8.6) thisW(11) thisH(2.6) default
GuiControl,1: MoveDraw, 	SeitSonnenaufgangGUI2Zeit,	% thisX(43.0) thisY(8.6) thisW(20.1111) thisH(2.6) default
GuiControl,1: MoveDraw, 	SonnenuntergangGUI2Text,	% thisX(31.5900) thisY(17.8500) thisW(11) thisH(2.6) default
GuiControl,1: MoveDraw, 	SonnenuntergangGUI2Zeit,	% thisX(43.0) thisY(17.8500) thisW(20.1111) thisH(2.6) default
GuiControl,1: MoveDraw, 	SeitSonnenuntergangGUI2Text,	% thisX(31.5900) thisY(21.5500) thisW(11) thisH(2.6) default
GuiControl,1: MoveDraw, 	SeitSonnenuntergangGUI2Zeit,	% thisX(43.0) thisY(21.5500) thisW(20.1111) thisH(2.6) default
GuiControl,1: MoveDraw, 	GroupBoxSonneAuf,	% thisX(30.0) thisY(.5) thisW(34.0) thisH(13.01) default
GuiControl,1: MoveDraw, 	GroupBoxSonneUnter,	% thisX(30.0) thisY(13.5) thisW(34.0) thisH(13.1) default
GuiControl,1: MoveDraw, 	ThisProgress#1a,	% thisX(.5) thisY(.5) thisW(65) thisH(.01) default
GuiControl,1: MoveDraw, 	thisLoopProgress,	% thisX(0) thisY(0) thisW(65) thisH(80) default
GuiControl,1: MoveDraw, 	ThisProgress#1c,	% thisX(.05) thisY(.5) thisW(.5) thisH(79.1) default
GuiControl,1: MoveDraw, 	ThisProgress#1d,	% thisX(64.5) thisY(.5) thisW(.5) thisH(79.1) default
GuiControl,1: MoveDraw, 	ThisProgress#1a,	% thisX(.6) thisY(.5) thisW(63.9) thisH(1.01) default
GuiControl,1: MoveDraw, 	ThisProgress#1b,	% thisX(.5) thisY(78.5) thisW(63.9) thisH(1.01) default
GuiControl,1: MoveDraw, 	thisListViewAnsichtErweiternProgress,	% thisX(12.4) thisY(17.8) thisW(9.71) thisH(2.99) default
GuiControl,1: Font, 	TextEdit1	
GuiControl,1: Font, 	SonnenEditStunden
GuiControl,1: Font, 	TextStunden
GuiControl,1: Font, 	SonnenEditMinuten
GuiControl,1: Font, 	TextMinuten
GuiControl,1: Font, 	ddl1
GuiControl,1: Font, 	ddl3
GuiControl,1: Font, 	GroupBoxAWiederholen
GuiControl,1: Font, 	RadioEinmal
GuiControl,1: Font, 	RadioTÃ¤glich
GuiControl,1: Font, 	RadioWÃ¶chendlich
GuiControl,1: Font, 	RadioMonatlich
GuiControl,1: Font, 	RadioJÃ¤hrlich
GuiControl,1: Font, 	GroupBoxÃœberListView1
GuiControl,1: Font, 	triggerSuche
GuiControl,1: Font, 	ListViewAnsichErweitern
GuiControl,1: Font, 	Ãœbernehmen
GuiControl,1: Font, 	GroupBoxUnterListView1
GuiControl,1: Font, 	ListView1
GuiControl,1: Font, 	mehr
GuiControl,1: Font, 	MarkierteLÃ¶schen
GuiControl,1: Font, 	ListeExportieren
GuiControl,1: Font, 	ListeImportieren
GuiControl,1: Font, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: Font, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: Font, 	GroupBoxLOG
GuiControl,1: Font, 	GroupBoxUnterLOGListview
GuiControl,1: Font, 	LogListeExportieren
GuiControl,1: Font, 	LogListeAnsichtErweitern
GuiControl,1: Font, 	LV1
GuiControl,1: Font, 	ActiveXA
GuiControl,1: Font, 	GroupBoxScreenSaver
GuiControl,1: Font, 	AlertConfig
GuiControl,1: Font, 	ScreenSaver
GuiControl,1: Font, 	TriggerDateien
GuiControl,1: Font, 	SonnenaufgangGUI2Text
GuiControl,1: Font, 	SonnenaufgangGUI2Zeit
GuiControl,1: Font, 	SeitSonnenaufgangGUI2Text
GuiControl,1: Font, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: Font, 	SonnenuntergangGUI2Text
GuiControl,1: Font, 	SonnenuntergangGUI2Zeit
GuiControl,1: Font, 	SeitSonnenuntergangGUI2Text
GuiControl,1: Font, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: Font, 	GroupBoxSonneAuf
GuiControl,1: Font, 	GroupBoxSonneUnter
GuiControl,1: focus, 	TextEdit1
GuiControl,1: focus, 	SonnenEditStunden
GuiControl,1: focus, 	TextStunden
GuiControl,1: focus, 	SonnenEditMinuten
GuiControl,1: focus, 	TextMinuten
GuiControl,1: focus, 	ddl1
GuiControl,1: focus, 	ddl3
GuiControl,1: focus, 	GroupBoxAWiederholen
GuiControl,1: focus, 	RadioEinmal
GuiControl,1: focus, 	RadioTÃ¤glich
GuiControl,1: focus, 	RadioWÃ¶chendlich
GuiControl,1: focus, 	RadioMonatlich
GuiControl,1: focus, 	RadioJÃ¤hrlich
GuiControl,1: focus, 	GroupBoxÃœberListView1
GuiControl,1: focus, 	triggerSuche
GuiControl,1: focus, 	Ãœbernehmen
GuiControl,1: focus, 	GroupBoxUnterListView1
GuiControl,1: focus, 	ListView1
GuiControl,1: focus, 	mehr
GuiControl,1: focus, 	MarkierteLÃ¶schen
GuiControl,1: focus, 	ListeExportieren
GuiControl,1: focus, 	ListeImportieren
GuiControl,1: focus, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: focus, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: focus, 	GroupBoxLOG
GuiControl,1: focus, 	GroupBoxUnterLOGListview
GuiControl,1: focus, 	LogListeExportieren
GuiControl,1: focus, 	LogListeAnsichtErweitern
GuiControl,1: focus, 	LV1
GuiControl,1: focus, 	ActiveXA
GuiControl,1: focus, 	GroupBoxScreenSaver
GuiControl,1: focus, 	AlertConfig
GuiControl,1: focus, 	ScreenSaver
GuiControl,1: focus, 	TriggerDateien
GuiControl,1: focus, 	SonnenaufgangGUI2Text
GuiControl,1: focus, 	SonnenaufgangGUI2Zeit
GuiControl,1: focus, 	SeitSonnenaufgangGUI2Text
GuiControl,1: focus, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: focus, 	SonnenuntergangGUI2Text
GuiControl,1: focus, 	SonnenuntergangGUI2Zeit
GuiControl,1: focus, 	SeitSonnenuntergangGUI2Text
GuiControl,1: focus, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: focus, 	GroupBoxSonneAuf
GuiControl,1: focus, 	GroupBoxSonneUnter
GuiControl,1: disable, 	TextEdit1
GuiControl,1: disable, 	SonnenEditStunden
GuiControl,1: disable, 	TextStunden
GuiControl,1: disable, 	SonnenEditMinuten
GuiControl,1: disable, 	TextMinuten
GuiControl,1: disable, 	ddl1
GuiControl,1: disable, 	ddl3
GuiControl,1: disable, 	GroupBoxAWiederholen
GuiControl,1: disable, 	RadioEinmal
GuiControl,1: disable, 	RadioTÃ¤glich
GuiControl,1: disable, 	RadioWÃ¶chendlich
GuiControl,1: disable, 	RadioMonatlich
GuiControl,1: disable, 	RadioJÃ¤hrlich
GuiControl,1: disable, 	GroupBoxÃœberListView1
GuiControl,1: disable, 	triggerSuche
GuiControl,1: disable, 	thisListViewAnsichtErweiternProgress
GuiControl,1: disable, 	Ãœbernehmen
GuiControl,1: disable, 	GroupBoxUnterListView1
GuiControl,1: disable, 	ListView1
GuiControl,1: disable, 	mehr
GuiControl,1: disable, 	MarkierteLÃ¶schen
GuiControl,1: disable, 	ListeExportieren
GuiControl,1: disable, 	ListeImportieren
GuiControl,1: disable, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: disable, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: disable, 	GroupBoxLOG
GuiControl,1: disable, 	GroupBoxUnterLOGListview
GuiControl,1: disable, 	LogListeExportieren
GuiControl,1: disable, 	LogListeAnsichtErweiternProgress
GuiControl,1: disable, 	LogListeAnsichtErweitern
GuiControl,1: disable, 	LV1
GuiControl,1: disable, 	ActiveXA
GuiControl,1: disable, 	GroupBoxScreenSaver
GuiControl,1: disable, 	AlertConfig
GuiControl,1: disable, 	ScreenSaver
GuiControl,1: disable, 	TriggerDateien
GuiControl,1: disable, 	SonnenaufgangGUI2Text
GuiControl,1: disable, 	SonnenaufgangGUI2Zeit
GuiControl,1: disable, 	SeitSonnenaufgangGUI2Text
GuiControl,1: disable, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: disable, 	SonnenuntergangGUI2Text
GuiControl,1: disable, 	SonnenuntergangGUI2Zeit
GuiControl,1: disable, 	SeitSonnenuntergangGUI2Text
GuiControl,1: disable, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: disable, 	GroupBoxSonneAuf
GuiControl,1: disable, 	GroupBoxSonneUnter
GuiControl,1: enable, 	TextEdit1
GuiControl,1: enable, 	SonnenEditStunden
GuiControl,1: enable, 	TextStunden
GuiControl,1: enable, 	SonnenEditMinuten
GuiControl,1: enable, 	TextMinuten
GuiControl,1: enable, 	ddl1
GuiControl,1: enable, 	ddl3
GuiControl,1: enable, 	GroupBoxAWiederholen
GuiControl,1: enable, 	RadioEinmal
GuiControl,1: enable, 	RadioTÃ¤glich
GuiControl,1: enable, 	RadioWÃ¶chendlich
GuiControl,1: enable, 	RadioMonatlich
GuiControl,1: enable, 	RadioJÃ¤hrlich
GuiControl,1: enable, 	GroupBoxÃœberListView1
GuiControl,1: enable, 	triggerSuche
GuiControl,1: enable, 	Ãœbernehmen
GuiControl,1: enable, 	GroupBoxUnterListView1
GuiControl,1: enable, 	ListView1
GuiControl,1: enable, 	mehr
GuiControl,1: enable, 	MarkierteLÃ¶schen
GuiControl,1: enable, 	ListeExportieren
GuiControl,1: enable, 	ListeImportieren
GuiControl,1: enable, 	GroupBoxNÃ¤chsteSystemAktion
GuiControl,1: enable, 	NÃ¤chsteGeplanteSystemAction
GuiControl,1: enable, 	GroupBoxLOG
GuiControl,1: enable, 	GroupBoxUnterLOGListview
GuiControl,1: enable, 	LogListeExportieren
GuiControl,1: enable, 	LogListeAnsichtErweitern
GuiControl,1: enable, 	LV1
GuiControl,1: enable, 	ActiveXA
GuiControl,1: enable, 	GroupBoxScreenSaver
GuiControl,1: enable, 	AlertConfig
GuiControl,1: enable, 	ScreenSaver
GuiControl,1: enable, 	TriggerDateien
GuiControl,1: enable, 	SonnenaufgangGUI2Text
GuiControl,1: enable, 	SonnenaufgangGUI2Zeit
GuiControl,1: enable, 	SeitSonnenaufgangGUI2Text
GuiControl,1: enable, 	SeitSonnenaufgangGUI2Zeit
GuiControl,1: enable, 	SonnenuntergangGUI2Text
GuiControl,1: enable, 	SonnenuntergangGUI2Zeit
GuiControl,1: enable, 	SeitSonnenuntergangGUI2Text
GuiControl,1: enable, 	SeitSonnenuntergangGUI2Zeit
GuiControl,1: enable, 	GroupBoxSonneAuf
GuiControl,1: enable, 	GroupBoxSonneUnter
