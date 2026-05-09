#6.Escreva um programa que pergunte dois números e indique se são iguais ou diferentes.
# Caso sejam diferentes, mostre o maior e o menor (nesta ordem).

.data

	msg1: .asciiz"\nIndique o primeiro numero: "
	msg2: .asciiz"\nIndique o segundo numero: "
	msgIguais: .asciiz"\nOs numeros sao iguais."
	msgDif: .asciiz"\nOs numeros sao diferentes e, em ordem descrescente, são: "
	msgAdd: .asciiz", "
	msgAdd2: .asciiz"."

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
	
	beq $t1, $t0, iguais
	bgt $t1, $t0, segundoMaior
	j primeiroMaior
	
iguais:
	li $v0, 4
	la $a0, msgIguais
	syscall
	j fim

segundoMaior:
	li $v0, 4
	la $a0, msgDif
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msgAdd
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msgAdd2
	syscall	
	j fim

primeiroMaior:
	li $v0, 4
	la $a0, msgDif
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msgAdd
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msgAdd2
	syscall

fim:
	li $v0, 10
	syscall