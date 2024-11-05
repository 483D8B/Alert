#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Input"
SetTitleMatchMode 2

TraySetIcon "favicon.ico"
newIconFile := "favicon.ico"

title := "~~"
chromePaths := ["C:\Program Files\Google\Chrome\Application\chrome.exe ", "chrome.exe "]

if !WinExist(title) {
    for index, path in chromePaths {
        try {
            Run(path . "--app=https://483d8b.github.io/Alert/")
            WinWait(title)

            ; Change the window icon using the Windows API
            hIcon := DllCall("LoadImage", "Ptr", 0, "Str", newIconFile, "UInt", 1, "Int", 0, "Int", 0, "UInt", 0x10)
            DllCall("SetClassLong", "Ptr", WinGetID(title), "Int", -14, "Ptr", hIcon)

            WinMove(0, 0, 500, 900, title)
            WinSetAlwaysOnTop 1, title
            break
        }
        catch {
        }
    }

}
