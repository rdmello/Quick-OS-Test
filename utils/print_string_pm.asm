
; Null-terminated string printing function FOR PROTECTED MODE
; Place string address in bx before calling.
; To define string, use:
; HELLO_MSG:
;     db 'Hello, World!', 0;
;
; mov bx, HELLO_MSG
; call print_string

[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK
    cmp al, 0x00
    je print_string_pm_done
    
    mov [edx], ax
    add ebx, 1
    add edx, 2

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret

