#NoTrayIcon
#SingleInstance force


CoordMode, Mouse, Screen
   SetTimer, MouseWatch, 2000 ; 2 seconds
   return

MouseWatch:
    if (counter="")
    {
        FileDelete, %A_AppData%\\activity
        FileAppend, YES, %A_AppData%\\activity
    }
    MouseGetPos, x, y
    if (x = x_old) && (y = y_old){
         counter++
    }
    else {
        counter =
        FileDelete, %A_AppData%\\activity
        FileAppend, YES, %A_AppData%\\activity
    }
    if (counter = 150){
         MyFunc(), counter := 0
     }
    x_old := x, y_old := y
    return

~WheelDown::
~WheelUp::
~RButton::
~LButton::
    counter =
    return

MyFunc(){
    FileDelete, %A_AppData%\\activity
    FileAppend, NO, %A_AppData%\\activity
}

ExitApp