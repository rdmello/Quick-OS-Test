
; Question 3
mov bx, 30 ; Move the value 30 into the bx register

cmp bx, 4
jle lt_block

cmp bx, 40
jl lt2_block

mov al, 'C'
jmp end_block

lt_block:
mov al, 'A'
jmp end_block

lt2_block:
mov al, 'B'

end_block:
mov ah, 0x0e
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55

