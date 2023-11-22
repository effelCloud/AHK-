;https://www.autohotkey.com/boards/viewtopic.php?f=6&t=67778
;https://www.autohotkey.com/boards/viewtopic.php?&t=67716
#SingleInstance force
#NoEnv
SetKeyDelay 20
SetTitleMatchMode, 2
#NoTrayIcon


;msgbox %  A_Args[1]
runFile := A_Args[1]?A_Args[1]:0
sleep 2100





;F12:: ; je bildschirm ein screenshot
   File := A_Now "-Monitor-1.jpg"
  hBM := hWnd_to_hBmp()  ; Capture fullscreen
;SysGet, X, MonitorWorkArea, 1
;SysGet, X, MonitorWorkArea, 2
Array := [XLEFT, XTOP, XRIGHT-XLEFT, XBOTTOM-XTOP]
hBM := hWnd_to_hBmp( -1, False, Array )
   GDIP("Startup")
   SavePicture(hBM, File)
   GDIP("Shutdown")
   DllCall("DeleteObject", "Ptr", hBM)
if runFile 
try   Run %File%
exitapp
Return





/*

F11::  ; Suffers from Aero effects
   File := A_Now ".jpg"
   hBM := hWnd_to_hBmp(WinExist("A"))  ; Capture active window
   GDIP("Startup")
   SavePicture(hBM, File)
   GDIP("Shutdown")
   DllCall("DeleteObject", "Ptr", hBM)
if runFile 
   Run %File%
Return


res := hWnd_to_hBmp( -1 )                                   ; Fullscreen capture. 
hWnd_to_hBmp()                                       ; Same as above
hWnd_to_hBmp( WinExist("A") )                        ; Capture active window
hWnd_to_hBmp( WinExist("A"), True )                  ; Capture active window. Client area
hWnd_to_hBmp( WinExist("A"), True, [0,0,64,64] )     ; Capture active window. Part of client area

; Capturing owner window in fullscreen mode
WinGetPos, X, Y, W, H, PSPad
Array := [X,Y,W,H]
hBM := hWnd_to_hBmp(-1, False, Array ) 

; Capturing secondary monitor
SysGet, X, MonitorWorkArea, 2
Array := [XLEFT, XTOP, XRIGHT-XLEFT, XBOTTOM-XTOP]
hBM := hWnd_to_hBmp( -1, False, Array )
*/



hWnd_to_hBmp( hWnd:=-1, Client:=0, A:="", C:="" ) {      ; By SKAN C/M on D295|D299 @ bit.ly/2lyG0sN

; Capture fullscreen, Window, Control or user defined area of these

  A      := IsObject(A) ? A : StrLen(A) ? StrSplit( A, ",", A_Space ) : {},     A.tBM := 0
  Client := ( ( A.FS := hWnd=-1 ) ? False : !!Client ), A.DrawCursor := "DrawCursor"
  hWnd   := ( A.FS ? DllCall( "GetDesktopWindow", "UPtr" ) : WinExist( "ahk_id" . hWnd ) )

  A.SetCapacity( "WINDOWINFO", 62 ),  A.Ptr := A.GetAddress( "WINDOWINFO" ) 
  A.RECT := NumPut( 62, A.Ptr, "UInt" ) + ( Client*16 )  

  If  ( DllCall( "GetWindowInfo",   "Ptr",hWnd, "Ptr",A.Ptr )
    &&  DllCall( "IsWindowVisible", "Ptr",hWnd )
    &&  DllCall( "IsIconic",        "Ptr",hWnd ) = 0 ) 
    {
        A.L := NumGet( A.RECT+ 0, "Int" ),     A.X := ( A.1 <> "" ? A.1 : (A.FS ? A.L : 0) )  
        A.T := NumGet( A.RECT+ 4, "Int" ),     A.Y := ( A.2 <> "" ? A.2 : (A.FS ? A.T : 0 )) 
        A.R := NumGet( A.RECT+ 8, "Int" ),     A.W := ( A.3  >  0 ? A.3 : (A.R - A.L - Round(A.1)) ) 
        A.B := NumGet( A.RECT+12, "Int" ),     A.H := ( A.4  >  0 ? A.4 : (A.B - A.T - Round(A.2)) )
        
        A.sDC := DllCall( Client ? "GetDC" : "GetWindowDC", "Ptr",hWnd, "UPtr" )
        A.mDC := DllCall( "CreateCompatibleDC", "Ptr",A.sDC, "UPtr")
        A.tBM := DllCall( "CreateCompatibleBitmap", "Ptr",A.sDC, "Int",A.W, "Int",A.H, "UPtr" )

        DllCall( "SaveDC", "Ptr",A.mDC )
        DllCall( "SelectObject", "Ptr",A.mDC, "Ptr",A.tBM )
        DllCall( "BitBlt",       "Ptr",A.mDC, "Int",0,   "Int",0, "Int",A.W, "Int",A.H
                               , "Ptr",A.sDC, "Int",A.X, "Int",A.Y, "UInt",0x40CC0020 )  

        A.R := ( IsObject(C) || StrLen(C) ) && IsFunc( A.DrawCursor ) ? A.DrawCursor( A.mDC, C ) : 0
        DllCall( "RestoreDC", "Ptr",A.mDC, "Int",-1 )
        DllCall( "DeleteDC",  "Ptr",A.mDC )   
        DllCall( "ReleaseDC", "Ptr",hWnd, "Ptr",A.sDC )
    }        
Return A.tBM
}










SavePicture(hBM, sFile) {                                            ; By SKAN on D293 @ bit.ly/2krOIc9
Local V,  pBM := VarSetCapacity(V,16,0)>>8,  Ext := LTrim(SubStr(sFile,-3),"."),  E := [0,0,0,0]
Local Enc := 0x557CF400 | Round({"bmp":0, "jpg":1,"jpeg":1,"gif":2,"tif":5,"tiff":5,"png":6}[Ext])
  E[1] := DllCall("gdi32\GetObjectType", "Ptr",hBM ) <> 7
  E[2] := E[1] ? 0 : DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "Ptr",hBM, "UInt",0, "PtrP",pBM)
  NumPut(0x2EF31EF8,NumPut(0x0000739A,NumPut(0x11D31A04,NumPut(Enc+0,V,"UInt"),"UInt"),"UInt"),"UInt")
  E[3] := pBM ? DllCall("gdiplus\GdipSaveImageToFile", "Ptr",pBM, "WStr",sFile, "Ptr",&V, "UInt",0) : 1
  E[4] := pBM ? DllCall("gdiplus\GdipDisposeImage", "Ptr",pBM) : 1
Return E[1] ? 0 : E[2] ? -1 : E[3] ? -2 : E[4] ? -3 : 1  
}

GDIP(C:="Startup") {                                      ; By SKAN on D293 @ bit.ly/2krOIc9
  Static SI:=Chr(!(VarSetCapacity(Si,24,0)>>16)), pToken:=0, hMod:=0, Res:=0, AOK:=0
  If (AOK := (C="Startup" and pToken=0) Or (C<>"Startup" and pToken<>0))  {
      If (C="Startup") {
               hMod := DllCall("LoadLibrary", "Str","gdiplus.dll", "Ptr")
               Res  := DllCall("gdiplus\GdiplusStartup", "PtrP",pToken, "Ptr",&SI, "UInt",0)
      } Else { 
               Res  := DllCall("gdiplus\GdiplusShutdown", "Ptr",pToken)
               DllCall("FreeLibrary", "Ptr",hMod),   hMod:=0,   pToken:=0
   }}  
Return (AOK ? !Res : Res:=0)    
}