#Requires AutoHotkey v2.0

currentMode := 1 ; Start in Mode 1
previousMode := 0 ; Initialize previous mode to 0

; Function to switch modes
SetMode(mode) {
    global currentMode, previousMode
    if (mode = 0 and currentMode = 0) {
        mode := previousMode ; Return to previous mode if already in Mode 0
    } else {
        previousMode := currentMode ; Update previous mode
    }
    currentMode := mode
    if (currentMode = 0)
        ToolTip("Please select mode")
    else
        ToolTip("Mode set to " currentMode)
    SetTimer(RemoveToolTip, -2000) ; Remove tooltip after 2 seconds
}

RemoveToolTip() {
    ToolTip()
}

; Mode-specific hotkeys
$Volume_Down:: {
    if (currentMode = 0)
        SetMode(1)
    else if (currentMode = 1)
        Send("{Media_Prev}")
    else if (currentMode = 2)
        Send("{Volume_Down}")
}

$Media_Play_Pause:: {
    if (currentMode = 0)
        SetMode(2)
    else
        Send("{Media_Play_Pause}")
}

$Volume_Up:: {
    if (currentMode = 0)
        SetMode(3)
    else if (currentMode = 1)
        Send("{Media_Next}")
    else if (currentMode = 2)
        Send("{Volume_Up}")
}

$Media_Prev:: {
    if (currentMode = 0)
        SetMode(4)
    else if (currentMode = 1)
        Send("{Volume_Down}")
    else if (currentMode = 2)
        Send("{Media_Prev}")
}

$Media_Next:: {
    if (currentMode = 0)
        SetMode(5)
    else if (currentMode = 1)
        Send("{Volume_Up}")
    else if (currentMode = 2)
        Send("{Media_Next}")
}

$Volume_Mute:: {
    SetMode(0) ; Return to Mode 0 (mode selection)
}