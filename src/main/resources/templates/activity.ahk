#NoTrayIcon
#SingleInstance force
FileDelete, %A_AppData%\\activity
Loop
{
    If A_TimeIdlePhysical > 300000
        {
            FileDelete, %A_AppData%\\activity
            loop
            {
                If A_TimeIdlePhysical > 300000
                    Sleep 1000
                else
                    break
            }
        }
    else
    {
        IfExist, %A_AppData%\\activity
            Sleep 10000
        else
            FileAppend, YES, %A_AppData%\\activity
    }
}