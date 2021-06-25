.MODEL

.STACK

.DATA

    mensaje DB 'Bienvenido, a ensamblador', 13, 10, '$'

.CODE

.STARTUP

    mov ax, @data
    mov ds, ax

    mov dx, OFFSET Message
    mov ah, 9h
    int 21h

.EXIT
END