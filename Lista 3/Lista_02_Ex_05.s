# 5.Escreva um programa que pergunte os coeficientes de uma equação de segundo grau (A, B e C) e:
# a) se DELTA for maior que zero: imprima “DUAS RAÍZES REAIS”;
# b) se DELTA for igual a zero: imprima apenas “UMA RAÍZ REAL”;
# c) se DELTA menor que zero: imprima a mensagem “NÃO EXISTEM RAÍZES REAIS”.
# (Não é necessário calcular as raízes caso existam).

.data
	msg1: .asciiz"\nIndique o coeficiente A da equação: "
	msg2: .asciiz"\nIndique o coeficiente B da equação: "
	msg3: .asciiz"\nIndique o coeficiente C da equação: "
	msg4: .asciiz"\nDUAS RAÍZES REAIS"
	msg5: .asciiz"\nUMA RAIZ REAL"
	msg6: .asciiz"\nNAO EXISTEM RAÍZES REAIS"

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
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	
delta:
	mul $t3, $t1, $t1
	mul $t4, $t0, $t2
	mul $t4, $t4, 4
	sub $t3, $t3, $t4
	bgt $t3, 0, duasRaizes
	beqz $t3, umaRaiz
	j semRaiz
	
duasRaizes:
	li $v0, 4
	la $a0, msg4
	syscall
	j fimSe
	
umaRaiz:
	li $v0, 4
	la $a0, msg5
	syscall
	j fimSe
	
semRaiz:
	li $v0, 4
	la $a0, msg6
	syscall

fimSe:
	li $v0, 10
	syscall