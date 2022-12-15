.model tiny 						;Модель памяти, используемая для СОМ.
.code 								;Начало сегмента кода.
org 100h 							;Начальное значение счетчика - 100h.
start:  
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
		
        ret 						;Завершение СОМ-программы.
filename db '7.txt',0 				;Имя файла
buffer   db '123', 0				; Буфер .
handle dw 0 						; под дескриптор (идентификатор)
end start 							;Конец программы.
