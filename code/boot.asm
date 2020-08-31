mov ah, 0x0e
;65 98 67 100
mov al, 97
mov eax, 0
mov ebx, 33
printSmall:
    int 0x10
    inc al
    mov eax, 1
    cmp al, 91
    je exit
    jmp loop
loop:
    cmp eax, 0
    je printSmall
    sub al, ebx
    int 0x10
    inc al
    mov ebx, 0
    cmp al, 122
    je exit
    jmp loop
exit:
    jmp $
times 510-($-$$) db 0 ; this lines fills all remaining blocks with 0 (kinda like padding) 
db 0x55, 0xaa ; this is the magical number which tells that the code is for boot sector