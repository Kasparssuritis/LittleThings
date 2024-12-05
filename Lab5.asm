.MODEL small
.STACK 200h
.DATA

input DB 255, ?, 255 DUP(?)
output DB 4 DUP(?)

digits DB ?
N DB ?

.CODE

ProgramStart:
    mov AX, @DATA
    mov DS, AX

    mov AH, 0Fh ; clear screen
    int 10h
    mov AH, 0
    int 10h

    mov AH, 0Ah ; gets input
    mov DX, offset input
    int 21h

    mov CL, 0 ; counter variable = 0
    mov SI, 2 ; iterator starts at first element of input

Count: ; counting loop
    cmp input[SI], '*' ; compare input element at index SI with *
    jne Skip ; if input[SI] - '*' != 0 we skip counter++
    add CL, 1 ; counter++ if input[SI] - '*' == 0

Skip: ; skip scenario
    add SI, 1 ; SI++
    cmp input[SI], 13 ; we check if we are at the end of line, 13 = carriage return(CR)
    jne Count ; if we are not, we countinue counting

    mov N, CL ; move counted value to N


    ; next loop preparations
    mov AL, N
    mov AH, 0 ; clear
    mov CL, 0 ; clear

CountNum: ; now we have to count digits in N
    mov BX, 10
    div BX
    add CL, 1
    cmp AL, 0 ; if there is no more digits end loop
    jne CountNum

    mov digits, CL ; now move result to digits

    ; loop preparations
    mov AL, N
    mov AH, 0 ; clear
    mov CH, 0 ; CL = digits, CH = 0
    mov SI, CX ; so CX = digits
    mov output[SI], '$' ; set the end of output

convert:
    sub SI, 1 ; now we move one position back
    mov DX, 0 ; clear
    mov BX, 10
    div BX
    add DL, '0' ; convert whats left from division to char
    mov output[SI], DL ; add it to output buffer
    cmp AL, 0 ; compare do we still have digits
    jne convert ; so we repeat the loop untill we have digits

    mov AH, 0Fh ; clear screen
    int 10h
    mov AH,0
    int 10h

    mov AH, 09h ; output
    mov DX, offset output
    int 21h

    mov AH, 4Ch ; programm ends
    int 21h

END ProgramStart
