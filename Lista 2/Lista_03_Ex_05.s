# 5. Receba 2 números inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da somatória dos números ímpares entre esses valores

.data
	msg1: .asciiz "\nInsira o primeiro numero: "
	msg2: .asciiz "\nInsira o segundo numero: "
	msg3: .asciiz "\nA soma dos numeros impares entre esses numeros e igual a: "
	msg4: .asciiz "\nOs numeros precisam ser diferentes, favor inserir novamente: "

.text

main:


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


	beq $t0, $t1, iguais


	blt $t0, $t1, primeiroMenor

	move $t2, $t1 # menor
	move $t3, $t0 # maior
	j iniciar

primeiroMenor:
	move $t2, $t0 # menor
	move $t3, $t1 # maior

iniciar:
	li $t4, 0
	add $t2, $t2, 1

loop:
	bge $t2, $t3, fim

	li $t6, 2
	div $t2, $t6
	mfhi $t5          

	beq $t5, $zero, proximo

	add $t4, $t4, $t2

proximo:
	add $t2, $t2, 1
	j loop

iguais:
	li $v0, 4
	la $a0, msg4
	syscall
	j main

fim:

	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 10
	syscall