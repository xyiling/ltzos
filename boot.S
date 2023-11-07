org 0x7c00      ; 
jmp entry       ; entry point

entry:
; initialize registers and call the string display function
    mov ax, 0   
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov sp, 0x7c00
    mov si, msg
    call putloop

msg:
; msg displayed on the screen
    db 0x0a, 0x0a
    db "hello os world"
    db 0x0a
    db 0

putloop:
; msg-display function
    mov al, [si]
    add si, 1
    cmp al, 0
    je fin
    
    mov ah, 0x0e
    mov bx, 15
    int 0x10
    jmp putloop

bye:
; another msg
    db "bye!"

saybye:
; another function
    mov si, saybye
    call putloop

fin:
; end, also a function
    hlt
    call saybye
    jmp fin

; one sect is 512 bytes, fill the unused space with 0, and the last two bytes with 0x55, 0xaa(it should be and must be)
times 510-($ - $$)  db 0
db 0x55, 0xaa