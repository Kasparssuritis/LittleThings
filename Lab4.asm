.MODEL small
.STACK 200h
.DATA
    star DB "*$"
    N DB 6, 7, 7 dup(?)
    numberN DW ?
.CODE

ProgramStart:
    mov AX, @DATA
    mov DS, AX
;ekrana attirišana
    mov AH, 0Fh
    int 10h
    mov AH, 0
    int 10h
;ievadišana N
    mov AH, 0Ah
    mov DX, offset N
    int 21h
;ekrana attirišana
    mov AH, 0Fh
    int 10h
    mov AH, 0
    int 10h
;cikls parveidot N no rindas uz skaitli
    mov CL, N[1]
    mov AX, 0
    mov SI, 2
    first:
        mov BX, 10
        mul BX
        add BL, N[SI]
        mov BH, 0
        add AX, BX
        sub AX, '0'
        add SI, 1
        sub CL, 1 
        cmp CL, 0
        jne first
    mov numberN, AX
;cikls izvadīt N zvaigznītes uz ekrāna
    mov CX, numberN
    mov AH, 9h
    mov DX, offset star
    second:
        int 21h
        sub CX, 1
        cmp CX, 0
        jne second

;pabeigšana
    mov ah, 4ch
    int 21h
END ProgramStart