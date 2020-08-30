mov ah, 0x0e
mov al, '1'
mov bh, 0
mov cl, 0
top:
    cmp bh, 20
    je rnsline
    inc bh
    int 0x10
    jmp top
rnsline:
    mov al, 10
    int 0x10
    mov al, '2'
    int 0x10
    mov bl, 0
    jmp rline
rline:
    cmp bl, 18
    je rneline
    mov al, '3'
    int 0x10
    inc bl
    jmp rline
rneline:
    mov al, '4'
    int 0x10
    cmp cl, 8
    je lastline
    inc cl
    jmp rnsline
lastline:
    mov al, 10
    int 0x10
    mov al, '5'
    jmp bottom
bottom:
    cmp bh, 40
    je exit
    int 0x10
    inc bh
    jmp bottom

exit:
    jmp $
times 510-($-$$) db 0 ; this lines fills all remaining blocks with 0 (kinda like padding) 
db 0x55, 0xaa ; this is the magical number which tells that the code is for boot sector