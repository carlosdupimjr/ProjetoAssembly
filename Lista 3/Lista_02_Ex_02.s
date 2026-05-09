# 2.Ler dois valores para 2 registradores e efetuar a troca dos valores de forma que o valor do primeiro registrador passe ao segundo e o segundo passe ao primeiro.
# Apresentar os valores após a efetivação do processamento da troca.

.data

	msg1: .asciiz"\nInsira o primeiro valor: "
	msg2: .asciiz"\nInsira o segundo valor: "
	msg3: .asciiz"\nO primeiro valor é igual a: "
	msg4: .asciiz"\nO segundo valor é igual a: "

.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall