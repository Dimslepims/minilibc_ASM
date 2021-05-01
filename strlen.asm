BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strlen

strlen:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    XOR RAX, RAX

loop:
    CMP BYTE[RDI], 0
    JE end
    INC RAX
    INC RDI
    JMP loop

end:
    LEAVE
    RET
