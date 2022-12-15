.model tiny 						;Модель памяти, используемая для СОМ.
.code 								;Начало сегмента кода.
org 100h 							;Начальное значение счетчика - 100h.
start:  
		mov ah,3Dh					;Номер функции DOS - в АН. (открытие)
		mov al, 2					;режим доступа
		mov dx,offset filename 		;Указатель на имя файла
        int 21h 					;Вызов обработчика прерывания
		mov ax, handle
		
		mov ah,41h  				;Del File
		mov dx,offset filename
		int 21h

        ret 						;Завершение СОМ-программы.
filename db '9.txt',0 				;Имя файла
handle dw 0 						; под дескриптор (идентификатор)
end start 							;Конец программы.
