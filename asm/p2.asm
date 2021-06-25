COMMENT ! Descripción del programa:
        SUMAR DOS NUMEROS
        Autor: Andrés Valenzuela Ramos
        Fecha: 19/05/2021
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        Message DB 'Programa que suma dos numeros', 13, 10, '$'
        msgResultado DB 'La suma es: ',13,10, '$'
        resultadoSuma DB '0'
.CODE 
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

                mov dx, OFFSET Message
                mov ah, 9h   
                int 21h 

                MOV CL, 3 ;Asignando los valores
                MOV DL, 2 ;Asignando los valores
                ADD CL, DL ;Realizando la operación aritmética

                mov dx, OFFSET msgResultado
                mov ah, 9h   
                int 21h 

                ADD CL, 48 ;48 para desplazarlos en los caracteres imprimibles del codigo ASCII
                MOV resultadoSuma, CL 
                
                MOV AH, 2h ;Imprimir en pantalla un caracter según el registro DL
                MOV DL, resultadoSuma
                INT 21h

                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
