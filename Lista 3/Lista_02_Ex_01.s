# 1.Elaborar um programa que apresente o valor da conversão em real (R$) de um valor lido em dólar (US$).
# O programa deve considerar a cotação do dólar em R$5 (Usar apenas números inteiros).

.data
	msg1: .asciiz"\nIndique o valor inteiro em reais (R$) a ser convertido: "
	msg2: .asciiz"\nO valor equivalente em dolares (USD) e igual a: "
.text
	li $t5, 5
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	mul $t1, $t0, $t5
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall