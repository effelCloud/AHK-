ScaleW := A_ScreenWidth / 1920 ; Breite
ScaleH := A_ScreenHeight / 1080 ; Höhe
ScaleW_ := A_ScreenWidth / A_ScreenWidth ; Breite
ScaleH_ := A_ScreenHeight / A_ScreenHeight ; Höhe
ScaleF := 96 / A_ScreenDPI ; erforderlichenfalls Schriftgröße#zoomfactor:=((A_ScreenWidth/1920)*(96/A_ScreenDPI))

msgbox %  A_ScreenWidth "`n" 
	. ScaleW 	"`n"
	. ScaleH 	"`n"
	. ScaleW_ 	"`n"
	. ScaleH_ 	"`n" 
	. ((A_ScreenWidth/A_ScreenWidth)*(96/A_ScreenDPI))

;Fs10:= Round(10 * ZoomFactor, 0)
;Fs10 :=(10*zoomfactor)
;Fs16 :=(16*zoomfactor)
;Gui, Font, s%fs16% cYellow Bold, Verdana  
;...