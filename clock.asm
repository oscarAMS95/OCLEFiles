MODEL small
.STACK 100h
INCLUDE procs.inc
LOCALS
.DATA
    flag db 0
    contador db 0
    segundos dw (?)
    minutos db (?)
    horas db (?)
    signo db ":", 0
	nueva_linea db 13, 10, 0
.CODE

Principal		PROC
                mov ax, 0
                mov ds, ax
                mov bx, 70h
                mov word ptr[bx], offset RSI
                mov [bx+2], cs
                mov ax, @data
                mov ds, ax
@@verif:        cmp [flag], 1
                jne @@verif
                je @@imprime

@@imprime:      call ContSeg
                mov [contador], 0
                mov [flag], 0
                jmp @@verif
				ENDP


RSI             PROC   
                inc [contador]
                cmp [contador], 18
                jne @@salir
                je @@activa

@@activa:       mov [flag], 1
@@salir:        iret
                ENDP


ContSeg         PROC   ;print function
                mov al, '0'
                call putchar
                mov dx, offset nueva_linea
                call puts
                ret
                ENDP
END