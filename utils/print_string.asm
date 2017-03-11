
; Null-terminated string printing function
; Place string address in bx before calling.
; To define string, use:
; HELLO_MSG:
;     db 'Hello, World!', 0;
;
; mov bx, HELLO_MSG
; call print_string



print_string:
    pusha

print_string_main_routine:
    mov ax, [bx]
    mov ah, 0x0e
    cmp al, 0x00
    je print_string_end_fcn
    int 0x10 
    add bx, 1 
    jmp print_string_main_routine

print_string_end_fcn:
    popa
    ret

