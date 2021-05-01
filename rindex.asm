BITS 64 ; 64-bit mode

SECTION .text ; Code section

GLOBAL rindex

rindex:
    PUSH    RBP ; Prologue:
    MOV RBP, RSP ; Stack frame setup
    MOV RCX, 0

loop:
    CMP BYTE[RDI + RCX], 0
    JE loop_sec
    INC RCX
    JMP loop

loop_sec:
    CMP BYTE[RDI + RCX], SIL
    JE end
    CMP RCX, 0
    JE end_string
    DEC RCX
    JMP loop_sec

end:
    ADD RDI, RCX
    MOV RAX, RDI
    LEAVE
    RET

end_string:
    MOV RAX, 0
    LEAVE
    RET