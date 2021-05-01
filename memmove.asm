BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL memmove

memmove:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    MOV R8, RDI

loop:
    CMP RDI, 0
    JE end
    CMP RSI, 0
    JE end
    CMP RDX, 0
    JE end
    MOV BH, [RSI]
    MOV [RDI], BH
    DEC RDX
    INC RDI
    INC RSI
    JMP loop

end:
    MOV RAX, R8
    LEAVE
    RET