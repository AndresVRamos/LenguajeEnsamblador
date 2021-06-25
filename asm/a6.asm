COMMENT ! Descripción del programa:
        Programa para gestionar archivos.
        Autor: Andrés Valenzuela Ramos
        Fecha: 24/06/2021
        !
;DIRECTIVAS de ensmablador por acuerdo se escribiran en MAYUSCULAS y en la primera columna de la izquierda
.MODEL SMALL
.586
.STACK  100h
.DATA
        ;variables se definde dentro del .DATA 
        titulo DB 'Programa para manejar archivos',13,10,'$'
        nombreArchivo DB 'a6.txt',0
        handle DW 0
        lectura DB 110 DUP("$"),'$'
        msgCreado DB 13,10,'Archivo creado satisfactoriamente','$'
        msgEscrito DB 13,10,'Archivo escrito satisfactoriamente','$'
        
.CODE 
imprimir macro cadena
    mov ah, 09h
    mov dx, OFFSET cadena
    int 21h
endm
openArchivo proc
    mov ah, 3dh  ;Código para abrir (leer)
    mov al, 1h  ;0h es solo lectura, 1h es solo escritura, 2h es lectura Y escritura
    mov dx, OFFSET nombreArchivo
    int 21h
    ret
openArchivo endp
        .STARTUP ;DIRECTIVA para el inicio de ensamblador
                mov ax, @data
                mov ds, ax

                ;mov dx, OFFSET titulo
                ;mov ah, 9h   
                ;int 21h 
                imprimir titulo
                
                ;----------------------
                ;Crear el Archivo 3Ch
                mov ah, 3Ch
                mov cx,0  ;xor cx, cx
                mov dx, OFFSET nombreArchivo
                int 21h
                JC salir  ;Por si sucede un error

                imprimir msgCreado
                mov handle, ax
                mov bx, handle
                mov ah, 3eh
                int 21h

                
                ;Escribir en archivo
                ;mov ah, 3dh  ;Código para abrir (leer)
                ;mov al, 1h  ;0h es solo lectura, 1h es solo escritura, 2h es lectura Y escritura
                ;mov dx, OFFSET nombreArchivo
                ;int 21h
                call openArchivo
                JC salir
                mov handle, ax
                mov bx, handle
                mov ah, 40h  ;Código para escribir
                mov cx, 110
                mov dx, OFFSET titulo
                int 21h
                cmp cx, ax
                jne salir
                ;Mensaje de confirmación de escritura
                imprimir msgEscrito
                mov handle, ax
                mov ah, 3eh
                int 21h

                ;----------------------
        salir:

                mov ax, 4c00h
                int 21h
        .EXIT ;DIRECTIVA donde terminará el ensablador
END  
