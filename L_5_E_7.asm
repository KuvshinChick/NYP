.model small						;Модель памяти, используемая для EXE.
.stack 100h							;Сегмент стека размеров в 256 байт
.code 								;Начало сегмента кода.
start:  mov ax,@data 				; в регистра AX смещение для данных
	    mov ds,ax 					; установить регистр DS равный AX то ест теперь там смещение.
		
		mov ah,41h  				;Del File
		mov dx,offset filename
		int 21h
		
	    mov ax,4C00h
        int 21h 					; Функция DOS "завершить программу".
.data
filename db '10.txt',0 				; Имя файла
end start 							;Конец программы.
