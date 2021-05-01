BITS 64

GLOBAL strcasecmp

SECTION .text

strcasecmp:
    XOR RCX, RCX
    XOR R8, R8
    XOR R9, R9

loop:
    MOV R8B, BYTE[RDI+RCX]
    MOV R9B, BYTE[RSI+RCX]
    CMP R9B, 0
    JE return
    CMP R8B, 0
    JE return
    CMP R8B, 96
    JG second_loop
    CMP R9B, 96
    JG third_loop
    CMP R8B, R9B
    JNE return
    INC RCX
    JMP loop

second_loop:
    SUB R8B, 32
    CMP R9B, 96
    JG third_loop
    CMP R8B, R9B
    JNE return
    INC RCX
    JMP loop

third_loop:
    SUB R9B, 32
    CMP R8B, R9B
    JNE return
    INC RCX
    JMP loop

return:
    SUB R8, R9
    MOV RAX, R8
    RET