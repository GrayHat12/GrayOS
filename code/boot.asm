mov ah, 0x0e
mov al, 'H'
int 0x10
jmp $
times 510-($-$$) db 0 ; this lines fills all remaining blocks with 0 (kinda like padding) 
db 0x55, 0xaa ; this is the magical number which tells that the code is for boot sector
