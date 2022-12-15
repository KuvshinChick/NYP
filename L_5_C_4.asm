.model tiny 						;Модель памяти, используемая для СОМ.
.code 								;Начало сегмента кода.
org 100h 							;Начальное значение счетчика - 100h.
start:  mov ah,3Dh					;Номер функции DOS - в АН. (открытие)
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
		
        ret 						;Завершение СОМ-программы.
filename db '6.txt',0 				;Имя файла
buffer   label byte					; Буфер за концом программы.
handle dw 0 						; под дескриптор (идентификатор)
end start 							;Конец программы.
