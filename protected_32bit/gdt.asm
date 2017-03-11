
; GDT

gdt_start:

gdt_null: ; null descriptor
    dd 0x0 ; dd = define double word ( 4 bytes )
    dd 0x0

gdt_code: ; code segment descriptor
    ; base = 0x0, limit = 0xf.ffff
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

gdt_data: ; data segment descriptor
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end: ; included so the assembler can calculate size of gdt

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

; Some handy constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start


