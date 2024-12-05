.MODEL small
.STACK 200h
.DATA
    star db "*$"
    x DB 3, 4, 4 dup(?)
    y DB 3, 4, 4 dup(?)
    numberx DB ?
    numbery DB ?
.CODE

ProgramStart:
    mov AX, @DATA
    mov DS, AX
;ekrana attirišana
    mov AH, 0Fh
    int 10h
    mov AH, 0
    int 10h
;ievadišana x
    mov AH, 0Ah
    mov DX, offset x
    int 21h
;parveidošana x uz num
    mov Al, x[2]
    sub Al, '0'
    mov BH, 10
    mul BH
    add Al, x[3]
    sub Al, '0'
    mov numberx, Al
;ievadišana y
    mov AH, 0Ah
    mov DX, offset y
    int 21h
;parveidošana y uz num
    mov Al, y[2]
    sub Al, '0'
    mov BH, 10
    mul BH
    add Al, y[3]
    sub Al, '0'
    mov numbery, Al
;ekrana attirišana
    mov AH, 0Fh
    int 10h
    mov AH, 0
    int 10h
;kursora parvietošana
    mov AH, 2h  
    mov BH, 0
    mov Dh, numbery
    mov Dl, numberx
    int 10h

;izvadišana
    mov AH, 9h
    mov DX, offset star
    int 21h
;pabeigšana
    mov ah, 4ch
    int 21h

END ProgramStart