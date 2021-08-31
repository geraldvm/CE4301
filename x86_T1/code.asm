
.data
prime DWORD n DUP(?)

.code
main PROC
        mov ecx,100      ;Stop number
        mov esi, OFFSET prime

array_create:  mov eax,1
        mov [esi],eax
        mov eax,[esi]
        add esi,TYPE DWORD              
        loop array_create

    mov ebx,8
    mov edx,0
    mov ecx,100
    mov ebp,2
    mov esi,0

calc:  
		mov eax,prime[ebx]
        mov edx,ebx
        mov edi,ebx
        add edx,edi                 
        mov esi,ebp
        mov ecx,100
        sub ecx,ebp
        add ecx,2
        add ebx,TYPE DWORD
        cmp eax,1
        je change
        inc ebp
        loop calc
        jmp K

change:       mov eax,0
        mov prime[edx],eax
        add edx,edi
        cmp esi,100
        jg calc
        add esi,ebp
        loop change

K:

    mov esi, OFFSET prime
    mov ecx,100
    sub ecx,2   
    mov ebx,1
    mov edx,8          

print:  mov eax,prime[edx]         
        add edx,TYPE DWORD
        inc ebx
        cmp eax,1
        jne H
        mov eax,ebx
        call WriteDec
        call Crlf
        loop print
        jmp D
H: loop print
D:
    exit

main ENDP
END main