.model small						;Модель памяти, используемая для EXE.
.stack 100h							;Сегмент стека размеров в 256 байт
.code 								;Начало сегмента кода.
start:  mov ax,@data 				; в регистра AX смещение для данных
	    mov ds,ax 					; установить регистр DS равный AX то ест теперь там смещение.
			mov ah,47h					;Номер функции DOS - в АН. 
		mov si,offset buffer   		;Адрес буфера
		mov dl,00h					;номер диска (текущий)
		int 21h
        
		mov ah,9        			;Выводим строку, которая содержит
		mov dx,offset buffer  		;путь к текущей директории
		int 21h
		
	    mov ax,4C00h
        int 21h 					; Функция DOS "завершить программу".
.data
buffer db 64 dup('$')
end start 							;Конец программы.
