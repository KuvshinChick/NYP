.model tiny 					;Модель памяти, используемая для СОМ.
.code 							;Начало сегмента кода.
org 100h 						;Начальное значение счетчика - 100h.
start: 
begin:
    ;открываем файл
    mov ah,3Dh        ; открываем для чтения
	mov al,00h
    lea dx,path     ; DS:dx указатель на имя файла
    int 21h     ; в ax деcкриптор файла
    jc exit     ; если поднят флаг С, то ошибка открытия
    
    mov bx,ax       ; копируем в bx указатель файла
    xor cx,cx
    xor dx,dx
    mov ax,4200h
    int 21h     ; идем к началу файла
   out_str:
    mov ah,3fh      ; будем читать из файла
    mov cx,1        ; 1 байт
    lea dx,buf      ; в память buf
    int 21h         
    cmp ax,cx       ; если достигнуть EoF или ошибка чтения
    jnz close       ; то закрываем файл закрываем файл
    mov dl,buf
    mov ah,2        ; выводим символ в dl
    int 21h     ; на стандартное устройство вывода
    jmp out_str
close:           ; закрываем файл, после чтения
    mov ah,3Eh
    int 21h
   exit:           ; закрываем файл, после чтения
        int 21h 				;Вызов обработчика прерывания
        ret 					;Завершение СОМ-программы.
path db '3.txt',0 			;Имя файла
buf  db ?
end start 						;Конец программы.
