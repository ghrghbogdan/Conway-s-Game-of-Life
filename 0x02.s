.data
	m: .space 4
	n: .space 4
	p: .space 4
	x: .space 4
	y: .space 4
	k: .space 4
	vecIndex: .long 0
	elem: .space 4
	matrix: .zero 1600
	matrixAux: .zero 1600
	index: .long 0
	lineIndex: .long 0
	columnIndex: .long 0
	inpointer: .space 4
	outpointer: .space 4

	infile: .asciz "in.txt"
	outfile: .asciz "out.txt"
	inmode: .asciz "r"
	outmode: .asciz "w"
	formatScanf: .asciz "%ld"
	formatPrintf: .asciz "%ld "
	newLine: .asciz "\n"
.text
.global main
main:

	lea matrixAux, %esi
	lea matrix, %edi

	pushl $inmode
	pushl $infile
	call fopen
	pop %ebx
	pop %ebx
	movl %eax, inpointer

	pushl $outmode
	push $outfile
	call fopen
	pop %ebx
	pop %ebx
	movl %eax, outpointer


	pushl $m
	pushl $formatScanf
	pushl inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx

	pushl $n
	pushl $formatScanf
	pushl inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx

	pushl $p
	pushl $formatScanf
	pushl inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx

	movl m, %eax
	addl $2, %eax
	movl %eax, m

	movl n, %eax
	addl $2, %eax
	movl %eax, n

et_forcitire:

	movl index, %ecx
	cmp p, %ecx
	je et_citire_k

	pushl $x
	pushl $formatScanf
	pushl inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx

	pushl $y
	pushl $formatScanf
	pushl inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx

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
	push inpointer
	call fscanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	movl $0, index

et_evolutie:
	
	movl index, %ecx
	cmp k, %ecx
	je et_afis_matr

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
					jmp et_next


					et_sub_cont:
						
						movl $0, (%esi,%eax,4)
						jmp et_next
					
				jmp et_next

				et_cond0:

					cmp $3, %ecx
					je et_creare

					
					movl $0, (%esi, %eax, 4)
					jmp et_next

					et_creare:

						
						movl $1, (%esi, %eax, 4)

				
				et_next:

				incl columnIndex
				jmp for_columns1

	et_cont1:

		
		incl lineIndex
		jmp for_lines1

	et_evolutie_cont:
		movl %esi, %ecx
		movl %edi, %esi
		movl %ecx, %edi
		incl index
		jmp et_evolutie



et_afis_matr:

	
	movl $1, lineIndex

	for_lines:

		
		movl lineIndex, %ecx
		inc %ecx
		cmp %ecx, m
		je et_exit



		movl $1, columnIndex

		for_columns:

			movl columnIndex, %ecx
			inc %ecx
			cmp %ecx, n
			je et_cont

			
			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
						
			
			movl (%edi, %eax, 4), %ebx

			pushl %ebx
			pushl $formatPrintf
			pushl outpointer
			call fprintf
			popl %ebx
			popl %ebx
			popl %ebx

			pushl $0
			call fflush
			popl %ebx
			incl columnIndex

			jmp for_columns

et_cont:
	
	pushl $newLine
	pushl outpointer
	call fprintf
	popl %ebx
	popl %ebx

	
	incl lineIndex
	jmp for_lines

et_closefiles:

	pushl inpointer
	call fclose
	pop %ebx

	pushl outpointer
	call fclose
	pop %ebx


et_exit:

	mov $1, %eax
	mov $0, %ebx
	int $0x80
