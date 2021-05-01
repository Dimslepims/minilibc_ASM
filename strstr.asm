BITS 64 

SECTION .text

GLOBAL strstr

strstr:
    PUSH    RBP
    MOV RBP, RSP
    MOV R8, RDI

loop:
    CMP BYTE[RDI], 0
    JE end_str
    MOV R9, RSI
    JMP check

check:
    MOV BL, BYTE[R8]
    CMP BYTE[R9], 0
    JE end
    CMP BYTE[R9], BL
    JNE remake
    INC R9
    INC R8
    JMP check

remake:
    INC RDI
    MOV R8, RDI
    JMP loop

end:
    MOV RAX, RDI
    LEAVE
    RET

end_str:
    MOV RAX, 0
    LEAVE
    RET