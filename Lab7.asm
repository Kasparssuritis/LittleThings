.386
.MODEL use16 small
.STACK 200h
.DATA

Mx DW 320
Ox DW 320
My DW 175
Oy DW 175
Astr DB 6, ?, 6 dup (?)
Bstr DB 6, ?, 6 dup (?)
A DW ?
B DW ?
t DW ?
X DW ?
Y DW ?
thousand DW 1000

.CODE 
Programm: mov AX, @DATA
	      mov DS, AX
		  
		  ;ekrana attirisanas
		  mov AH, 0FH
		  int 10h
		  mov AH, 0
		  int 10h
		  
		  ;pieprasit A
		  mov AH, 0AH
		  mov DX, offset Astr
		  int 21h
		  
		  ;parveidot A virkni uz skaitli
		  mov CL, Astr[1]
		  mov AX, 0
		  mov SI, 2
LoopA:		  
		  mov BX, 10
		  mul BX
		  mov BL, Astr[SI]
		  mov BH, 0
		  add AX, BX
		  sub AX, '0'
		  add SI, 1
		  sub CL, 1
		  cmp CL, 0
		  jne LoopA
		  mov A, AX
		  
		  ;ekrana attirisanas
		  mov AH, 0FH
		  int 10h
		  mov AH, 0
		  int 10h
		  
		  ;pieprasit B
		  mov AH, 0AH
		  mov DX, offset Bstr
		  int 21h
		  
		  ;parveidot B virkni uz skaitli
		  mov CL, Bstr[1]
		  mov AX, 0
		  mov SI, 2
LoopB:		  
		  mov BX, 10
		  mul BX
		  mov BL, Bstr[SI]
		  mov BH, 0
		  add AX, BX
		  sub AX, '0'
		  add SI, 1
		  sub CL, 1
		  cmp CL, 0
		  jne LoopB
		  mov B, AX
		  
		  mov AL, 10h
		  mov AH, 0
		  int 10h
		  
		  mov t, 0

Loopt:		  
		  ; Mx A t * 1000 / cos * Ox +
		  fild Mx
		  fild A
		  fild t
		  fmul 
		  fild thousand
		  fdiv
		  fcos
		  fmul
		  fild Ox
		  fadd
		  fistp X
		  
		  ; My B t * 1000 / sin * Oy +
		  fild My
		  fild B
		  fild t
		  fmul 
		  fild thousand
		  fdiv
		  fsin
		  fmul
		  fild Oy
		  fadd
		  fistp Y
		  
		  mov AH, 0Ch
		  ;piksela krasa
		  mov AL, 3 
		  ;horizontala piksela pozicija
		  mov CX, X
		  ;vertikala piksela pozicija
		  mov DX, Y 
		  int 10h
		  
		  add t, 1
		  cmp t, 6284
		  jne Loopt
		  
		  mov AH, 0
		  int 16h
		  
          mov AL, 03h
		  mov AH, 0
		  int 10h
		  
		  
		  mov AH, 0
		  int 16h
		  mov AH, 4Ch
		  int 21h
		  
END Programm