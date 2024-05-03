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
	sub rsp, 240
	mov esi, 1
	mov [rbp-120], esi
	mov esi, 2
	mov [rbp-112], esi
	mov esi, [rbp-120]
	mov [rbp-104], esi
	mov edi, [rbp-112]
	mov eax, [rbp-104]
	imul eax, edi
	mov [rbp-104], eax
	mov esi, [rbp-104]
	mov [rbp-16], esi
	mov esi, [rbp-16]
	mov [rbp-96], esi
	mov edi, [rbp-16]
	mov eax, [rbp-96]
	imul eax, edi
	mov [rbp-96], eax
	mov esi, [rbp-16]
	mov [rbp-88], esi
	mov edi, [rbp-96]
	mov eax, [rbp-88]
	add eax, edi
	mov [rbp-88], eax
	mov esi, [rbp-88]
	mov [rbp-32], esi
	mov esi, 3
	mov [rbp-80], esi
	mov esi, [rbp-80]
	mov [rbp-72], esi
	mov edi, [rbp-16]
	mov eax, [rbp-72]
	imul eax, edi
	mov [rbp-72], eax
	mov esi, 2
	mov [rbp-64], esi
	mov esi, [rbp-32]
	mov [rbp-56], esi
	mov edi, [rbp-64]
	mov eax, [rbp-56]
	add eax, edi
	mov [rbp-56], eax
	mov esi, [rbp-72]
	mov [rbp-40], esi
	mov edi, [rbp-56]
	mov eax, [rbp-40]
	add eax, edi
	mov [rbp-40], eax
	mov esi, [rbp-40]
	mov [rbp-48], esi
	mov esi, [rbp-32]
	mov [rbp-24], esi
	mov edi, [rbp-48]
	mov eax, [rbp-24]
	add eax, edi
	mov [rbp-24], eax
	mov esi, [rbp-16]
	mov [rbp-8], esi
	mov edi, [rbp-24]
	mov eax, [rbp-8]
	add eax, edi
	mov [rbp-8], eax
	mov esi, [rbp-8]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 240
	leave 
	ret 

