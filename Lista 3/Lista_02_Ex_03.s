# 3. Crie um programa que lê o mês e o ano de nascimento de uma pessoa e o mês e ano atual.
# Calcule e mostre qual é: a idade da pessoa em meses.

.data

	msg1: .asciiz"\nIndique o mes de nascimento, com numeros de 1 a 12: "
	msg2: .asciiz"\nIndique o ano de nascimento: "
	msg3: .asciiz"\nIndique o mes atual, com numeros de 1 a 12: "
	msg4: .asciiz"\nIndique o ano atual: "
	msg5: .asciiz"\nSua idade em meses e igual a: "
	msg6: .asciiz" meses."
	msgErro: .asciiz"\nValor de mes invalido, favor inserir novamente."
	msgErro2: .asciiz"\nAno atual não pode ser inferior ao ano de nascimento, favor inserir novamente."
	msgErro3: .asciiz"\nQuando ano de nascimento e ano atual sao iguais, o mes de nascimento nao pode ser superior ao mes atual. Favor preencher novamente as informacoes."
	
.text
	li $t8, 12
	
mainNascimento:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 1, validaNascimento
	bgt $t0, 12, validaNascimento
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	j mainMesAtual

validaNascimento:
	li $v0, 4
	la $a0, msgErro
	syscall
	j mainNascimento	
			
mainMesAtual:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	blt $t2, 1, validaMesAtual
	bgt $t2, 12, validaMesAtual

mainAnoAtual:	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0	
	blt $t3, $t1, validaAnoAtual
	beq $t3, $t1, validaMesAnoIgual
	j calculoIdade
	
validaMesAtual:
	li $v0, 4
	la $a0, msgErro
	syscall
	j mainMesAtual
	
validaAnoAtual:
	li $v0, 4
	la $a0, msgErro2
	syscall
	j mainAnoAtual

validaMesAnoIgual:
	blt $t2, $t0, erroMesAnoIgual
	j calculoIdade

erroMesAnoIgual:
	li $v0, 4
	la $a0, msgErro3
	syscall
	j mainNascimento

calculoIdade:
	sub $t4, $t2, $t0
	sub $t5, $t3, $t1	
	mul $t5, $t5, $t8
	add $t6, $t4, $t5
	
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 10
	syscall	