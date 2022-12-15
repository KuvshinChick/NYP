.model small						;Модель памяти, используемая для EXE.
.stack 100h							;Сегмент стека размеров в 256 байт
.code 								;Начало сегмента кода.
start:  mov ax,@data 				; в регистра AX смещение для данных
	    mov ds,ax 					; установить регистр DS равный AX то ест теперь там смещение.
		
		mov ah,39h					;Номер функции DOS - в АН. (открытие)
		mov dx,offset path 			;Указатель на путь
		int 21h
		
	    mov ax,4C00h
        int 21h 					; Функция DOS "завершить программу".
.data
path db '\new', 0 					;Путь к директории
end start 							;Конец программы.