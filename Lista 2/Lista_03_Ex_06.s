# 6. Receba 10 números inteiros reais. Verifique e mostre o maior e o menor valor.
# Obs.: somente valores positivos. Se o número for negativo, deve ser desconsiderado e solicitado novamente.

.data
	msg1: .asciiz"\n Digite um valor posistivo: "
	msgMaior: .asciiz"\n O maior valor e igual a: "
	msgMenor: .asciiz"\n O menor valor e igual a: "
	msgErro: .asciiz"\n Valor negativo digitado, favor inserir novamente: "
.text
	li $t0, 0
	li $t6, 0
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	blt $t1, 0, validaNegativo
	
	beq $t0, $t6, maiorMenorPrime
	ble $t1, $t2, newMenor
	bge $t1, $t3, newMaior
	j count

maiorMenorPrime:
	move $t2, $t1 # menor
	move $t3, $t1 # maior
	j count
count:
	add $t0, $t0, 1
	blt $t0, 10, main
	j FimSe
	
newMenor:
	move $t2, $t1
	j count
newMaior:
	move $t3, $t1
	j count

validaNegativo:
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

FimSe:
	li $v0, 4
	la $a0, msgMaior
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, msgMenor
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	