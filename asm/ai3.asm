COMMENT ! Descripción del programa:
        Calculadora
        
        Autor: Andrés Valenzuela Ramos
        Fecha: 24/06/2021
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        Message DB 'Bienvenido!', 13, 10, '$'
        OtroTipoMsg DB 'Otro forma de cadena',0DH,0ah,'$' 
        Cadena DB 13,10,'Es una cadena de tipo DB = BYTE','$'

        msg1 DB '_____________MENU____________', 0AH,0DH, '$'
        msg2 DB '1] Suma                     |', 0AH,0DH, '$'
        msg3 DB '2] Resta                    |', 0AH,0DH, '$'
        msg4 DB '3] Multiplicacion           |', 0AH,0DH, '$'
        msg5 DB '4] Division                 |', 0AH,0DH, '$'
        msg6 DB '5] Salir                    |', 0AH,0DH, '$'
        msg7 DB '____________________________|', 0AH,0DH, '$'
        msg8 DB 'Seleccione la opcion', 0AH,0DH, '$'

        m1 DB 13,10,'Introducir primer numero: $'
        m2 DB 13,10,'Introducir segundo numero: $'

        num1 DB '0'
        num2 DB '0'

        msgResultadoSuma DB 'La suma es: ',13,10,'$'
        resultadoSuma DB '0'

        msgResultadoResta DB 'La resta es:',13,10,'$'
        resultadoResta DB '0'

        msgResultadoMultiplicacion DB 'La multiplicacion es:',13,10,'$'
        resultadoMultiplicacion DB '0'

        msgResultadoDivision DB 'La division es:',13,10,'$'
        resultadoDivision DB '0'

        saltoLinea DB 10,13,'$'
        
.CODE 
imprimir macro cadena
    mov ah, 09h
    mov dx, OFFSET cadena
    int 21h
endm
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

            menu:
                imprimir saltoLinea
                ;--------IMPRIMIR MENU
                imprimir msg1
                imprimir msg2
                imprimir msg3
                imprimir msg4
                imprimir msg5
                imprimir msg6
                imprimir msg7
                imprimir msg8
                imprimir saltoLinea
                ;---------
                ;Leer la opcion tecleada
                mov ah, 0DH ;Esperar a un caracter del usuario
                int 21h
                mov ah, 01h ;Leer que caracter regresó
                int 21h
                cmp al, 31h
                je suma
                cmp al, 32h
                je resta
                cmp al, 33h
                je multiplicacion
                cmp al, 34h
                je division
                cmp al, 35h
                je salir

            suma:
                imprimir saltoLinea
                ;---------Mensaje pidiendo que de primer numero
                imprimir m1

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                mov num1, al
                mov ch, num1

                ;----------Mensaje pidiendo segundo numero
                imprimir m2

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                mov num2, al
                mov bl, num2

                ;Haciendo la suma
                ADD ch, bl
                ADD ch, 30h
                mov resultadoSuma, ch

                imprimir saltoLinea
                imprimir msgResultadoSuma

                mov dl, resultadoSuma
                mov ah, 02H
                int 21h
                jmp menu
            
            resta:
                imprimir saltoLinea
                ;---------Mensaje pidiendo que de primer numero
                imprimir m1

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                mov num1, al
                mov ch, num1

                ;----------Mensaje pidiendo segundo numero
                imprimir m2

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                mov num2, al
                mov bl, num2

                ;Haciendo la resta
                SUB ch, bl
                ADD ch, 30h
                mov resultadoResta, ch

                imprimir saltoLinea
                imprimir msgResultadoResta

                mov dl, resultadoResta
                mov ah, 02H
                int 21h

                jmp menu

            multiplicacion:
                imprimir saltoLinea
                ;---------Mensaje pidiendo que de primer numero
                imprimir m1

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                MOV bl, al

                ;----------Mensaje pidiendo segundo numero
                imprimir m2

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H

                MUL bl

                imprimir saltoLinea
                imprimir msgResultadoMultiplicacion

                MOV ah, 2
                MOV dl, al
                ADD dl, 30H
                int 21h
                
                
                jmp menu


            division:
               imprimir saltoLinea
                ;---------Mensaje pidiendo que de primer numero
                imprimir m1

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                MOV num1, al

                ;----------Mensaje pidiendo segundo numero
                imprimir m2

                ;Espera de entrada de usuario y se guarda en al
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                MOV num2, al

                AND AX, 0ffh

                MOV AL, num1
                MOV BL, num2
                
                DIV bl

                ADD AL, 30h
                MOV resultadoDivision, AL

                imprimir saltoLinea
                imprimir msgResultadoDivision
                imprimir resultadoDivision

                jmp menu

            salir:
                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
