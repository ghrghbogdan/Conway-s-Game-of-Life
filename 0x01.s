.data
	m: .space 4
	n: .space 4
	p: .space 4
	x: .space 4
	y: .space 4
	k: .space 4
	vecIndex: .long 0
	par: .long 2
	elem: .space 4
	o: .space 4
	i: .long 8
	j: .long 4
	cifra: .space 4
	matrix: .zero 1600
	matrixAux: .zero 1600
	index: .long 0
	index3: .long 0
	lineIndex: .long 0
	columnIndex: .long 0
	nrchr: .long 0
    nrchrcpy: .long 0
    index1 : .long 0
	indexor: .long 0
    vector: .space 2000
    vectorbin: .space 2000
	vectorhexa: .space 2000
    vectorhexaaux: .space 2000
    index2: .space 4
	adresa_mat: .space 8
	len_mat: .long 0
	len_msj: .long 0
	hexa: .asciz "0x"
	formatScanf: .asciz "%ld"
	formatPrintf: .asciz "%ld "
	newLine: .asciz "\n"
    formatScanfs: .asciz "%s"
	formatPrintfc: .asciz "%c"
	formatPrintfs: .asciz "%s"
	formatPrintfx: .asciz "%X"

	

.text
.global main
main:

	lea matrixAux, %esi
	lea matrix, %edi
	movl %edi, adresa_mat

	pushl $m
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $p
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	movl m, %eax
	addl $2, %eax
	movl %eax, m

	movl n, %eax
	addl $2, %eax
	movl %eax, n

	movl m, %eax
	mull n
	movl %eax, len_mat

et_forcitire:

	movl index, %ecx
	cmp p, %ecx
	je et_citire_k

	pushl $x
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $y
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	incl x
	incl y

	movl x, %eax
	xor %edx, %edx
	mull n
	addl y, %eax

	
	movl $1,(%edi,%eax,4)

	incl index
	jmp et_forcitire

et_citire_k:

	pushl $k
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $o
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $0, index

et_evolutie:
	
	movl index, %ecx
	cmp k, %ecx
	je et_0x01

		et_parcurgere:

		
		movl $1, lineIndex

		for_lines1:

			
			movl lineIndex, %ecx
			inc %ecx
			cmp %ecx, m
			je et_evolutie_cont



			movl $1, columnIndex

			for_columns1:

				movl columnIndex, %ecx
				inc %ecx
				cmp %ecx, n
				je et_cont1

				
				movl lineIndex, %eax
				movl $0, %edx
				mull n
				addl columnIndex, %eax
							
				et_ifsection:
				movl vecIndex, %ecx
				xor %ecx, %ecx
				movl %ecx, vecIndex
				
				et_1:

					incl %eax
					movl (%edi, %eax, 4), %ebx
					decl %eax

					cmp $1, %ebx
					jne et_2

					incl vecIndex
				et_2:

					decl %eax
					movl (%edi, %eax, 4), %ebx
					incl %eax
					
					cmp $1, %ebx
					jne et_3

					incl vecIndex


				et_3:

					addl n, %eax
					movl (%edi, %eax, 4), %ebx
					subl n, %eax
					
					cmp $1, %ebx
					jne et_4

					incl vecIndex



				et_4:

					subl n, %eax
					movl (%edi, %eax, 4), %ebx
					addl n, %eax
					
					cmp $1, %ebx
					jne et_5

					incl vecIndex



				et_5:

					decl n
					subl n, %eax
					movl (%edi, %eax, 4), %ebx
					addl n, %eax
					incl n
					
					cmp $1, %ebx
					jne et_6

					incl vecIndex


				et_6:

					incl n
					subl n, %eax
					movl (%edi, %eax, 4), %ebx
					addl n, %eax
					decl n
					
					cmp $1, %ebx
					jne et_7

					incl vecIndex


				et_7:

					incl n
					addl n, %eax
					movl (%edi, %eax, 4), %ebx
					subl n, %eax
					decl n
					
					cmp $1, %ebx
					jne et_8

					incl vecIndex


				et_8:

					decl n
					addl n, %eax
					movl (%edi, %eax, 4), %ebx
					subl n, %eax
					incl n
					
					cmp $1, %ebx
					jne et_conditii

					incl vecIndex

				et_conditii:
					movl vecIndex, %ecx
					movl (%edi, %eax, 4), %ebx
					cmp $0, %ebx
					je et_cond0
					cmp $1, %ebx
					je et_cond1

				et_cond1:

					cmp $2, %ecx
					jl et_sub_cont

					cmp $3, %ecx
					jg et_sub_cont

					
					movl $1, (%esi,%eax,4)
					jmp et_next1 


					et_sub_cont:
						
						movl $0, (%esi,%eax,4)
						jmp et_next1 
					
				jmp et_next1 

				et_cond0:

					cmp $3, %ecx
					je et_creare

					
					movl $0, (%esi, %eax, 4)
					jmp et_next1 

					et_creare:

						
						movl $1, (%esi, %eax, 4)

				
				et_next1 :

				incl columnIndex
				jmp for_columns1

	et_cont1:

		
		incl lineIndex
		jmp for_lines1

	et_evolutie_cont:
		movl %esi, %ecx
		movl %edi, %esi
		movl %ecx, %edi
		movl %edi, adresa_mat
		incl index
		jmp et_evolutie



		
	et_0x01:

		xor %eax, %eax
		movl o, %ecx
		cmp $1, %ecx
		je et_decriptare
 

		et_criptare:
			xor %edi, %edi
			lea vector, %edi
			lea vectorbin, %esi

			pushl %edi
			pushl $formatScanfs
			call scanf
			add $8, %esp

			
			xor %eax, %eax
			movl $7, %edx

			read_loop:
				movl (%edi, %eax, 1), %ebx
				incl nrchr

				cmp $0, %ebx
				je next1 


				movl $7,  %ecx
				movl %ecx, index1

				et_addinvec:
					
					movl %ebx, %ecx
					and $1, %ecx
					movl %ecx, (%esi, %edx, 4)
					shr %ebx
					decl %edx        

					decl index1
					movl index1, %ecx
					cmp $0, %ecx
					je et_cont
					
					jmp et_addinvec



				et_cont:

				addl $15, %edx
				incl %eax

				jmp read_loop


		
		next1:
			movl nrchr, %ecx
			movl %ecx, nrchrcpy
			movl adresa_mat, %edi

			
			xor %edx, %edx
			movl nrchr, %eax
			decl %eax
			mull i
			movl %eax, len_msj

			


		for_xor:
			xor %ebx, %ebx
			xor %ecx, %ecx
			xor %edx, %edx
			movl indexor, %eax
			cmp len_msj, %eax
			je afis0x
			
			
			mov (%esi, %eax, 4), %ebx
			idivl len_mat
			et_edx:
			mov (%edi, %edx, 4), %ecx
			xor %ebx, %ecx
			movl indexor, %eax
			movl %ecx, (%esi, %eax, 4)
			incl indexor
			jmp for_xor


		afis0x:
			


			push $hexa
			push $formatPrintfs
			call printf
			pop %ebx
			pop %ebx

			pushl $0
			call fflush
			pop %ebx
			
			movl $0, %eax
			movl $0, index
		
		for_afis:
			movl index, %eax
			xor %ebx, %ebx
			cmp len_msj, %eax
			je et_exit
			xor %ecx, %ecx
			
			mov (%esi, %eax, 4), %ebx

			shl %ecx
			addl %ebx, %ecx
			incl %eax
			
			mov (%esi, %eax, 4), %ebx

			shl %ecx
			addl %ebx, %ecx
			incl %eax
			mov (%esi, %eax, 4), %ebx

			shl %ecx
			addl %ebx, %ecx
			incl %eax
			mov (%esi, %eax, 4), %ebx

			shl %ecx
			addl %ebx, %ecx
			incl %eax
			movl %eax, index
			

			mov %ecx, cifra
			push cifra
			push $formatPrintfx
			call printf 
			pop %ebx
			pop %ebx

			push $0
			call fflush
			pop %ebx

			jmp for_afis


			
			




			
 


		et_decriptare:

			

			xor %edi, %edi
			lea vectorhexa, %edi
			lea vectorhexaaux, %esi
			
			push %edi
			push $formatScanfs
			call scanf
			pop %ebx
			pop %ebx
			movl $2, %eax
			movl $3, %edx
			xor %ebx, %ebx
		read_loop2:
				
        movb (%edi, %eax, 1), %bl
		incl nrchr
       
        cmp $0, %ebx
        je next2
        

                cmp $58, %ebx
                jl et_cif
                
                
                subl $55, %ebx
                jmp et_next2

                et_cif:
                    subl $48, %ebx

        et_next2:
                    

        
			movl $4, %ecx
			movl %ecx, index2

			et_addinvec2:
				xor %ecx, %ecx
				movl %ebx, %ecx
				and $1, %ecx
				
				movl %ecx, (%esi, %edx, 4)
				shr %ebx
				decl %edx 

				
				movl index2, %ecx
				decl %ecx
				movl %ecx, index2
				
				cmp $0, %ecx
				je et_cont2
				
				
				jmp et_addinvec2



				et_cont2:

					addl $8, %edx
					incl %eax

					jmp read_loop2

		next2:
			movl nrchr, %ecx
			movl %ecx, nrchrcpy
			movl adresa_mat, %edi

						
			xor %edx, %edx
			movl nrchr, %eax
			decl %eax
			mull j
			movl %eax, len_msj

		for_xor2:
			xor %ebx, %ebx
			xor %ecx, %ecx
			xor %edx, %edx
			movl indexor, %eax
			cmp len_msj, %eax
			je afismsj
			
			
			mov (%esi, %eax, 4), %ebx
			idivl len_mat

			mov (%edi, %edx, 4), %ecx
			xor %ebx, %ecx
			movl indexor, %eax
			movl %ecx, (%esi, %eax, 4)
			incl indexor
			jmp for_xor2


		
		
		afismsj:
			xor %ecx, %ecx
			movl index3, %eax
			cmp len_msj, %eax
			je et_exit


			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax

			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax

			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax

			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax
			
			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax

			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax
			
			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			shl %ecx
			incl %eax

			movl (%esi, %eax, 4), %ebx
			
			and $1, %ebx
			addl %ebx, %ecx
			incl %eax



			movl %eax, index3

			push %ecx
			push $formatPrintfc
			call printf
			pop %ebx
			pop %ebx

			push $0
			call fflush
			pop %ebx

			boss:

			jmp afismsj












et_exit:




	movl $4, %eax
	movl $1, %ebx
	movl $newLine, %ecx
	movl $2, %edx
	int $0x80

	push $0
	call fflush
	pop %ebx


	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
