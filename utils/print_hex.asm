
; Prints 2 bytes from dx.
;
; mov dx, 0x1234
; call print_hex

print_hex:
    pusha

    mov bx, HEX_OUT ; move the address of HEX_OUT into bx
    add bx, 0x2 ; add 4 bytes to the address of HEX_OUT to ignore the '0x'
    mov ax, 0x0010 ; set loop variable

print_hex_loop:
    cmp ax, 0x0000
    je print_hex_end
    sub ax, 0x0004
    rol dx, 0x0004
    mov cx, dx
    and cx, 0x000f ; mask all but the last nibble
    cmp cx, 0x0009
    jg print_hex_text
    add cx, 0x0030 ; add hex value to low bit of HEX_OUT val
    jmp print_hex_next

print_hex_text:
    add cx, 0x0037

print_hex_next:
    mov [bx], cx ; move modified hex value to orig location
    add bx, 0x1
    jmp print_hex_loop

print_hex_end:
    mov bx, HEX_OUT
    call print_string
    popa
    ret

; %include "utils/print_string.asm"

; global variables
HEX_OUT: db '0x0000', 0


