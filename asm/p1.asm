COMMENT ! Programa para imprimir en pantalla
        utilizando el codigo 9H de la interrupción 21H
        Autor: Mi nombre
        Fecha: Hoy en formato dd/MM/yyyy
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        Message DB 'Bienvenido, a ensamblador', 13, 10, '$'
        OtroTipoMsg DB 'Otro forma de cadena',0DH,0ah,'$' 
        Cadena DB 13,10,'Es una cadena de tipo DB = BYTE','$'
.CODE 
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

                mov dx, OFFSET Message
                mov ah, 9h   
                int 21h 

                lea dx, OtroTipoMsg
                mov ah, 9h ;Codigo de función para desplegar en pantalla
                int 21h ;   Interrupcion para llamada de msdos

                mov dx, OFFSET Cadena
                mov ah, 9h   
                int 21h 

                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
