Init32 equ 7bh
ChPut equ #a2
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

Start
    call Init32
    ld a, (HelloString)
    call PrintString
    ret

PrintString
    cp 0 ; compare current char to NIL
    jp z, PrintStringEnd ; if it was NIL go to end
    call ChPut ; print the current char
    inc a ; go to next char
    jp PrintString ; go back to first line
PrintStringEnd
    ret

HelloString
    dc "Hello world\n"
