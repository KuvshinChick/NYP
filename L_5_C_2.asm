.model tiny 					;Модель памяти, используемая для СОМ.
.code 							;Начало сегмента кода.
org 100h 						;Начальное значение счетчика - 100h.
start:  mov ah,3Dh				;Номер функции DOS - в АН.
		mov al,0				;Открыть для чтения
		mov dx,offset filename 	;Указатель на имя файла
        int 21h 				;Вызов обработчика прерывания
        ret 					;Завершение СОМ-программы.
filename db '3.txt',0 			;Имя файла
end start 						;Конец программы.
