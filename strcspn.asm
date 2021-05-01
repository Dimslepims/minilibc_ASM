BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL strcspn

strcspn:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    XOR RCX, RCX
    XOR RDX, RDX

loop:
    MOV R8B, [RDI, RDX]
    CMP R8B, 0
    JE end
    JMP loop_sec

loop_sec:
    MOV R9B, [RSI, RCX]
    CMP R9B, R8B
    JE end
    CMP R9B, 0
    JE remake
    INC RCX
    JMP loop_sec

remake:
    XOR RCX, RCX
    INC RDX
    JMP loop

end:
    MOV RAX, RDX
    LEAVE
    RET