BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strcmp

strcmp:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    xor RAX, RAX
    xor RBX, RBX

loop:
    MOV al, [RDI]
    MOV bl, [RSI]
    CMP al, 0
    JE end
    CMP bl, 0
    JE end
    CMP al, bl
    JNE end
    INC RSI
    INC RDI
    JMP loop

end:
    SUB RAX, RBX
    LEAVE
    RET
