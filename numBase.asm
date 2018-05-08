MODEL small
.STACK 100h
INCLUDE procs.inc
LOCALS
.DATA
    mens_base db "El valor en AX en la base seleccionada:", 0
    nueva_linea db 13, 10, 0
.CODE
Principal   PROC
            mov ax, @data ;Inicializar DS a la direccion
            mov ds, ax    ;del segmento de datos(.DATA)
            call clrscr

            mov ax, 20h
            mov bx, 17
            mov dx, offset mens_base
            call puts
            call printNumBase

            mov dx, offset nueva_linea
            call puts

            mov ah, 04ch ;fin de programa
            mov al, 0
            int 21h
            ret
            ENDP

printNumBase  PROC
            push ax
            push bx
            push cx
            push dx
            mov cx, 4
    @@nxt:  mov dx, 0
    		div bx
    		push ax
    		mov ax, dx
    		cmp ax, 10
            jb @@print
            add ax, 7
   @@print: add ax, 30h
            call putchar
            pop ax
            loop @@nxt
            pop dx
            pop cx
            pop bx
            pop ax
            ret
            ENDP
END
