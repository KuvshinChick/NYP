.model small					;Модель памяти, используемая для EXE.
.stack 100h						;Сегмент стека размеров в 256 байт
.code 							;Начало сегмента кода.
start:  mov ax,@data 			; в регистра AX смещение для данных
	    mov ds,ax 				; установить регистр DS равный AX то ест теперь там смещение.
		mov ah,3Dh					;Номер функции DOS - в АН. (открытие)
		mov al, 0					;режим доступа
		mov dx,offset filename 		;Указатель на имя файла
        int 21h 					;Вызов обработчика прерывания
		mov handle, AX
		
		mov AH, 3Fh 				; функция чтения из файла
		mov BX, handle				; идентификатор
		mov CX, 2					; чтение 2х байт
		mov DX, offset buffer 		; прочитанное в buffer
		int 21h
    
		mov DI, offset buffer  		; адрес буфера с прочитанными данными
		mov BX, 2 					; BX = количеству символов в строке
		mov byte ptr [DI+BX], '$'   ; добавляем $ в конец строки
		
		mov AH, 9 					; выводим строку, считанную из файла
		mov DX, offset buffer
		int 21h
		
	    mov ax,4C00h
        int 21h 					;Функция DOS "завершить программу".
.data
filename db '6.txt',0 				;Имя файла
buffer   label byte					; Буфер за концом программы.
handle dw 0 						; под дескриптор()
end start 							;Конец программы.
