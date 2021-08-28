    org 07c00h
    mov ax, cs
    mov ds, ax
    mov es, ax
    call DispStr    ;调用显示字符串
    jmp $           ;无限循环
DispStr:
    mov ax, BootMessage
    mov bp, ax      ;es:bp = 串地址
    mov cx, 16      ;cx = 串长度
    mov ax, 01301h ;ah = 13,al = 01h
    mov bx, 0000ch ;页号为0(bh = 0) 黑低红字(bl = 00ch,高亮)
    mov dl, 0
    int 10h         ;10号中断
    ret
BootMessage:    db "Hello, My OS!"
times 510-($-$$) db 0   ;填充剩下的空间
dw  0xaa55          ;结束标志