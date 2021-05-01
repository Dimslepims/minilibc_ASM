BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strchr

strchr:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    XOR RCX, RCX
    XOR R8, R8
    XOR RAX, RAX

loop:
    MOV R8B, [RDI + RCX]
    CMP R8B, SIL
    JE end
    CMP R8B, 0
    JE end_str
    INC RCX
    JMP loop


end:
    ADD RDI, RCX
    MOV RAX, RDI
    LEAVE
    RET

end_str:
    MOV RAX, 0
    LEAVE
    RET