COMMENT ! Resta de dos numeros introducidos por teclado:
        
        Autor: Andrés Valenzuela Ramos
        Fecha: 28/05/2021
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        titulo DB 'Programa para restar 3 numeros por teclado $'
        msgit DB 10,13, 'Iteracion numero $'
        m1 DB 13,10,'Introducir primer numero: $'
        m2 DB 13,10,'Introducir segundo numero: $'
        m3 DB 13,10,'Introducir segundo numero: $'
        num1 DB '0'
        num2 DB '0'
        num3 DB '0'
        resultadoResta DB '0'
        msgResta DB 13,10,'La resta es: $'
        contador DB 0
.CODE 
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

    ;             mov dx, OFFSET titulo
    ;             mov ah, 9h   
    ;              int 21h 

    ;             mov cx, 0000h ; O XOR CX, CX
    ;             mov cx, 6
    ; ciclo:
    ;             INC contador
    ;             MOV AH, 9
    ;             LEA DX, msgit
    ;             INT 21h

    ;             mov dl, contador
    ;             ADD DL, 30H
    ;             mov ah, 02H
    ;             int 21h

    ;             ;---------Mensaje pidiendo que de primer numero
    ;             mov dx, OFFSET m1
    ;             mov ah, 9h   
    ;             int 21h 

    ;             ;Espera de entrada de usuario y se guarda en al
    ;             MOV AH, 01H
    ;             INT 21H
    ;             SUB AL, 30H
    ;             mov num1, al
    ;             mov ch, num1

    ;             ;----------Mensaje pidiendo segundo numero
    ;             mov dx, OFFSET m2
    ;             mov ah, 9h   
    ;             int 21h 

    ;             ;Espera de entrada de usuario y se guarda en al
    ;             MOV AH, 01H
    ;             INT 21H
    ;             SUB AL, 30H
    ;             mov num2, al
    ;             mov bl, num2

    ;             ;----------Mensaje pidiendo tercer numero
    ;             mov dx, OFFSET m3
    ;             mov ah, 9h   
    ;             int 21h 

    ;             ;Espera de entrada de usuario y se guarda en al
    ;             MOV AH, 01H
    ;             INT 21H
    ;             SUB AL, 30H
    ;             mov num3, al
    ;             mov cl, num3
                

    ;             SUB ch, bl
    ;             SUB ch, cl
    ;             ADD ch, 30h
    ;             mov resultadoResta, ch

    ;             mov dx, OFFSET msgResta
    ;             mov ah, 9h   
    ;             int 21h 

    ;             mov dl, resultadoResta
    ;             mov ah, 02H
    ;             int 21h

    ;             INC CX
    ;             LOOP ciclo

                ;;;
                mov dx, OFFSET titulo
                mov ah, 9h   
                int 21h 

    ciclo2:

                INC contador
                MOV AH, 9
                LEA DX, msgit
                INT 21h

                mov dl, contador
                ADD DL, 30H
                mov ah, 02H
                int 21h

                 ;---------Mensaje pidiendo que de primer numero
                mov dx, OFFSET m1
                mov ah, 9h   
                int 21h 

                 ;Espera de entrada de usuario y se guarda en al
                 MOV AH, 01H
                 INT 21H
                 SUB AL, 30H
                 mov num1, al
                 mov ch, num1

                 ;----------Mensaje pidiendo segundo numero
                 mov dx, OFFSET m2
                 mov ah, 9h   
                 int 21h 

                 ;Espera de entrada de usuario y se guarda en al
                 MOV AH, 01H
                 INT 21H
                 SUB AL, 30H
                 mov num2, al
                 mov bl, num2

                 ;----------Mensaje pidiendo tercer numero
                 mov dx, OFFSET m3
                 mov ah, 9h   
                 int 21h 

                 ;Espera de entrada de usuario y se guarda en al
                 MOV AH, 01H
                 INT 21H
                 SUB AL, 30H
                 mov num3, al
                 mov cl, num3
                

                 SUB ch, bl
                 SUB ch, cl
                 ADD ch, 30h
                 mov resultadoResta, ch

                 mov dx, OFFSET msgResta
                 mov ah, 9h   
                 int 21h 

                 mov dl, resultadoResta
                 mov ah, 02H
                 int 21h

                 
                 CMP contador, 6
                 JNE ciclo2
                 ;;;

                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
