BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strncmp

strncmp:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    xor RAX, RAX
    xor RBX, RBX

loop:
    MOV al, [RDI]
    MOV bl, [RSI]
    CMP RDX, 0
    JE end_int
    CMP al, 0
    JE end
    CMP bl, 0
    JE end
    CMP al, bl
    JNE end
    DEC RDX
    INC RSI
    INC RDI
    JMP loop

end:
    SUB RAX, RBX
    LEAVE
    RET

end_int:
    MOV RAX, 0
    LEAVE
    RET