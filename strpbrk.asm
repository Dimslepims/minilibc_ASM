BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strpbrk

strpbrk:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    XOR RCX, RCX
    CMP RDI, 0
    JE end_str

loop:
    MOV R8B, BYTE[RDI]
    CMP R8B, 0
    JE end_str

sec_loop:
    MOV R9B, [RSI + RCX]
    CMP R9B, 0
    JE remake
    CMP R9B, R8B
    JE end
    INC RCX
    JMP sec_loop

remake:
    INC RDI
    XOR RCX, RCX
    JMP loop

end_str:
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    LEAVE
    RET