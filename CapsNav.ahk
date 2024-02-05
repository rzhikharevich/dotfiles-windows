; Activate CapsLock on CapsLock-V
SetCapsLockState AlwaysOff
CapsLock & v:: ToggleCapsLock()

ToggleCapsLock() {
    capsLock := GetKeyState("CapsLock", "T")
    if capsLock {
        SetCapsLockState AlwaysOff
    } else {
        SetCapsLockState AlwaysOn
    }
}

; Caps-IJKL Navigation
CapsLock & j:: MoveCursor("{LEFT}")
CapsLock & l:: MoveCursor("{RIGHT}")
CapsLock & i:: MoveCursor("{UP}")
CapsLock & k:: MoveCursor("{DOWN}")

MoveCursor(key) {
    sendString := ""
    modifierKeyToChar := {"SHIFT": "+", "CONTROL": "^", "ALT": "!"}
    for modifierKey, modifierChar in modifierKeyToChar {
        if GetKeyState(modifierKey, "P") {
            sendString .= modifierChar
        }
    }

    sendString .= key
    Send, %sendString%
}

; Misc
!-:: Send –
!+-:: Send —
