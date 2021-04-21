assume cs:code, ds:data

data segment
	s db 1, 2, 3, 4
	ls EQU ($-s)
data ends

code segment
	start:
	mov ax, data
	mov ds, ax

	mov cx, ls
	mov si, 0
	repeta:
		mov bl, s[si]
		inc si
		mov ah, 02h
		mov di, 8
		print:
			clc
			sal bl, 1
			dec di
			jc print1
			jnc print0
			print1:
				mov dl, 31h
				int 21h
			jmp end_print
			print0:
				mov dl, 30h
				int 21h
			end_print:
				cmp di, 0
				jne print
		mov dl, 20h
		int 21h
	loop repeta

	mov ax, 4C00h
	int 21h
code ends
	end start