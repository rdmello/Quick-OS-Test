
[org 0x7c00]

mov dx, 0xfcba
call print_hex
jmp $

%include "utils/print_hex.asm"

; Set section correctly
times 510-($-$$) db 0
dw 0xaa55

