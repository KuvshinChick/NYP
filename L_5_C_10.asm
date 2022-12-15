.model tiny 						;Модель памяти, используемая для СОМ.
.code 								;Начало сегмента кода.
org 100h 							;Начальное значение счетчика - 100h.
start:  
		mov ah,47h					;Номер функции DOS - в АН. 
		mov si,offset buffer   		;Адрес буфера
		mov dl,00h					;номер диска (текущий)
		int 21h
        
		mov ah,9        			;Выводим строку, которая содержит
		mov dx,offset buffer  		;путь к текущей директории
		int 21h
		
		ret 						;Завершение СОМ-программы.
buffer db 64 dup('$')
;buffer label byte 					;Буфер за концом программы
end start 							;Конец программы.
