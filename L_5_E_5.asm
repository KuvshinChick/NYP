.model small						;Модель памяти, используемая для EXE.
.stack 100h							;Сегмент стека размеров в 256 байт
.code 								;Начало сегмента кода.
start:  mov ax,@data 				; в регистра AX смещение для данных
	    mov ds,ax 					; установить регистр DS равный AX то ест теперь там смещение.
		
		mov ah,3Dh					;Номер функции DOS - в АН. (открытие)
		mov al, 2					;режим доступа
		mov dx,offset filename 		;Указатель на имя файла
        int 21h 					;Вызов обработчика прерывания
		mov ax, handle
		
		mov AH, 40h 				; функция записи в файл
		mov BX, handle				; идентификатор
		mov CX, 3				    ; запись 3х байт
		lea DX, buffer 		        ; из buffer
		int 21h
		
	    mov ax,4C00h
        int 21h 					; Функция DOS "завершить программу".
.data
filename db '8.txt',0 				; Имя файла
buffer   db '456', 0				; Буфер .
handle dw 0 						; под дескриптор(идентификатор)
end start 							;Конец программы.
