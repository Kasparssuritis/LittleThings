.model small
.stack 200h
.DATA

Buffer DB 6, ?,6  dup (?)
string DB 5 dup(?)



A DW ?
B DW ?
C DW ?

.CODE

ProgramStart:   
    mov AX, @DATA
    mov DS, AX

    mov AH, 0Fh ; очистка экрана
    int 10h
    mov AH,0
    int 10h
                
    mov AH, 0Ah ; ввод пользователя
    mov DX, offset Buffer
    int 21h
                
    mov AH, 0Fh ; очистка экрана
    int 10h
    mov AH,0
    int 10h
                
    mov CL, Buffer[1] ; счетчик
    mov AX, 0 ; очистка AX
    mov SI, 2 ; итератор
    
    ; A
First: ; первый цикл перевод введённой строки в число
    mov BX, 10
    mul BX
    mov BL, Buffer[SI]
    mov BH, 0
    add AX, BX
    sub AX,'0'
    add SI, 1
    sub CL, 1
    cmp CL, 0
    jne First
	
	mov A, AX ; первое число в А

    mov AH, 0Fh ; очистка экрана
    int 10h
    mov AH,0
    int 10h
                
    mov AH, 0Ah ; ввод пользователя
    mov DX, offset Buffer
    int 21h
                
    mov CL, Buffer[1] ; счетчик
    mov AX, 0 ; очистка AX
    mov SI,2 ; итератор

    ; B
Second: ; второй цикл перевод введённой строки в число
    mov BX, 10
    mul BX
    mov BL, Buffer[SI]
    mov BH, 0
    add AX, BX
    sub AX, '0'
    add SI, 1
    sub CL, 1
    cmp CL, 0
    jne Second

	mov B, AX ; второе число в B
    
    
	mov AX, A ; складываем A и B
	add AX, B
	mov C, AX ; результат суммы в С

    mov CL, 0


Third: ; делим С на цифры и записываем в строку(массив символов string)
    mov DX, 0 ; очищаем DX
    mov BX, 10
    div BX
    add CL, 1 ; счётчик количества символов
    cmp AX, 0
    jne Third
                
    mov BL, CL
    mov BH, 0
    mov AX, C ; помещаем в AX результат(число С)
    mov SI, BX ; количество символов результата помещаем в SI
    mov string[SI], '$' ; в конец ставим символ конца строки
    
Fourth: ;
    sub SI, 1 ; позиция конца строки --, то есть string[SI] сейчас указывает на последний элемент строки
    mov DX, 0
    mov BX, 10 
    ; делим AX на BX, остаток от деления DL
    div BX
    mov BL, DL ; премещаем остаток от деления в BL
    add BL, '0' ; конвертируем число в символ
    mov string[SI], BL ; перемещаем число(символ) в нашу строку
    cmp AX, 0
    jne Fourth
                
    mov DL, 10 ; переход на следующую строку
    mov AH, 02h
    int 21h
    
    mov AH, 9 ; вывод результата
    mov DX, offset string
    int 21h

    mov AH, 4Ch ; конец программы
    int 21h
                
end ProgramStart 
                