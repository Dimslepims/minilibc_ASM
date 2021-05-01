BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL memset

memset:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    MOV R8, RDI

loop:
    CMP RDX, 0
    JE end
    MOV [RDI], SIL
    DEC RDX
    INC RDI
    JMP loop

end:
    MOV RAX, R8
    LEAVE
    RET