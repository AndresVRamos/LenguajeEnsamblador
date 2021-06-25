COMMENT ! Descripción del programa:
        Sumar y restar
        Autor: Andrés Valenzuela Ramos
        Fecha: 19/05/2021
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        Message DB 'Programa que suma y resta dos numeros', 13, 10, '$'
        msgResultadoSuma DB 'La suma es: $'
        msgResultadoResta DB 'La resta es: $'
        msglineaVacia DB ' ',13,10, '$'
        resultadoSuma DB '0'
        resultadoResta DB '0'
        lineaVacia DB ' '
.CODE 
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

                mov dx, OFFSET Message
                mov ah, 9h   
                int 21h 

                ;Operación 1 ADD
                MOV CL, 2 ;Asignando los valores
                MOV DL, 5 ;Asignando los valores
                ADC CL, DL ;Realizando la operación aritmética

                mov dx, OFFSET msgResultadoSuma
                mov ah, 9h
                int 21h

                ADD CL, 48 ;48 para desplazarlos en los caracteres imprimibles del codigo ASCII
                MOV resultadoSuma, CL 
                
                MOV AH, 2h ;Imprimir en pantalla un caracter según el registro DL
                MOV DL, resultadoSuma
                INT 21h

                ;Salto de Línea
                mov dx, OFFSET msglineaVacia
                mov ah, 9h
                int 21h

                ;Operación 2 SUB
                MOV CL, 5 ;Asignando los valores
                MOV DL, 2 ;Asignando los valores
                SBB CL, DL ;Realizando la operación aritmética

                mov dx, OFFSET msgResultadoResta
                mov ah, 9h
                int 21h

                ADD CL, 48 ;48 para desplazarlos en los caracteres imprimibles del codigo ASCII
                MOV resultadoResta, CL 
                
                MOV AH, 2h ;Imprimir en pantalla un caracter según el registro DL
                MOV DL, resultadoResta
                INT 21h

                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
