Init32 equ 7bh
ChGet equ 9fh
BinarySize
    size 8000h
StartAddress
    org 4000h

RomInit
    db "AB"
    dw Start
    dw 0,0,0
    dw 0,0,0
ClearScreen
    xor A
    call 00C3h
    ret

Start
    call Init32
    call ClearScreen
    call Run
    call ChGet
    call ClearScreen
    ret

Run
    call TextModeOne
    ret

TextModeOne
    ld a, 00000000b
    di
    out (99h), a
    ld a, 0+128
    ei
    out (99h), a

    ld a, 00010000b
    di
    out (99h), a
    ld a, 1+128
    ei
    out (99h), a

    ld a, 00000000b
    di
    out (99h), a
    ld a, 8+128
    ei
    out (99h), a

    ld a, 00000000b
    di
    out (99h), a
    ld a, 9+128
    ei
    out (99h), a

    ret 
