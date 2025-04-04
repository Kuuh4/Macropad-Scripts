#Requires AutoHotkey v2.0

currentMode := 1 ; Start in Mode 1

; Function to switch modes
SetMode(mode) {
    global currentMode
    currentMode := mode
    if (currentMode = 1)
        ToolTip("Mode set to B")
    else
        ToolTip("Mode set to A")
    SetTimer(RemoveToolTip, -2000) ; Remove tooltip after 2 seconds
}

RemoveToolTip() {
    ToolTip()
}

; Mode-specific hotkeys
$Volume_Down:: {
    if (currentMode = 1)
        Send("{Media_Prev}")
    else if (currentMode = 2)
        Send("{Volume_Down}")
}

$Media_Play_Pause:: {
    Send("{Media_Play_Pause}")
}

$Volume_Up:: {
    if (currentMode = 1)
        Send("{Media_Next}")
    else if (currentMode = 2)
        Send("{Volume_Up}")
}

$Media_Prev:: {
    if (currentMode = 1)
        Send("{Volume_Down}")
    else if (currentMode = 2)
        Send("{Media_Prev}")
}

$Media_Next:: {
    if (currentMode = 1)
        Send("{Volume_Up}")
    else if (currentMode = 2)
        Send("{Media_Next}")
}

$Volume_Mute:: {
    if (currentMode = 1)
        SetMode(2)
    else if (currentMode = 2)
        SetMode(1)
}