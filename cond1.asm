section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 416
	mov esi, 5
	mov [rbp-144], esi
	mov esi, 2
	mov [rbp-208], esi
	mov esi, 3
	mov [rbp-200], esi
	mov esi, [rbp-208]
	mov [rbp-192], esi
	mov edi, [rbp-200]
	mov eax, [rbp-192]
	imul eax, edi
	mov [rbp-192], eax
	mov esi, [rbp-144]
	mov [rbp-184], esi
	mov edi, [rbp-192]
	mov eax, [rbp-184]
	sub eax, edi
	mov [rbp-184], eax
	mov esi, 0
	mov [rbp-40], esi
	mov edi, [rbp-40]
	mov eax, [rbp-184]
	cmp eax, edi
	mov [rbp-184], eax
	jz lab1276
	jmp lab1278
lab1276:	mov esi, 1
	mov [rbp-128], esi
	mov esi, [rbp-128]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1278:	mov esi, 2
	mov [rbp-176], esi
	mov esi, 3
	mov [rbp-112], esi
	mov esi, [rbp-176]
	mov [rbp-168], esi
	mov edi, [rbp-112]
	mov eax, [rbp-168]
	add eax, edi
	mov [rbp-168], eax
	mov esi, 0
	mov [rbp-56], esi
	mov edi, [rbp-56]
	mov eax, [rbp-168]
	cmp eax, edi
	mov [rbp-168], eax
	jz lab1282
	jmp lab1284
lab1282:	mov esi, 2
	mov [rbp-88], esi
	mov esi, [rbp-88]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1284:	mov esi, 5
	mov [rbp-64], esi
	mov esi, 2
	mov [rbp-48], esi
	mov esi, -2
	mov [rbp-160], esi
	mov esi, [rbp-48]
	mov [rbp-32], esi
	mov edi, [rbp-160]
	mov eax, [rbp-32]
	add eax, edi
	mov [rbp-32], eax
	mov esi, [rbp-64]
	mov [rbp-152], esi
	mov edi, [rbp-32]
	mov eax, [rbp-152]
	imul eax, edi
	mov [rbp-152], eax
	mov esi, 0
	mov [rbp-72], esi
	mov edi, [rbp-72]
	mov eax, [rbp-152]
	cmp eax, edi
	mov [rbp-152], eax
	jz lab1290
	jmp lab1292
lab1290:	mov esi, 3
	mov [rbp-16], esi
	mov esi, [rbp-16]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1292:	mov esi, 4
	mov [rbp-136], esi
	mov esi, [rbp-136]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 416
	leave 
	ret 

