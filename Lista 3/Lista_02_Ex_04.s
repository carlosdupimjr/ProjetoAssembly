# 4.O proprietário da empresa ABC LTDA precisa de um programa de computador para calcular o 
# novo salário que seus funcionários irão receber a partir do mês que vem.
# Sabendo que o aumento de salário para todos os funcionários será de 25%,
# faça um programa que lê o valor do salário atual do funcionário e
# informa o seu novo salário acrescido de 25%
# (Por se tratar de apenas número inteiros, para calcular 25% deve-se multiplicar o valor por 25 e dividir por 100).

.data
	msg1: .asciiz"\nIndique o valor inteiro do salario atual em reais (R$): "
	msg2: .asciiz"\nO novo valor do salario e igual a R$ "
	msg3: .asciiz"."
	msgErro: .asciiz"\nValor negativo, favor inserir novamente."

.text
	li $t5, 25
	li $t6, 100
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 0, erroSalario
	j calculo

erroSalario:
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

calculo:
	mul $t1, $t0, $t5
	div $t1, $t1, $t6
	add $t2, $t0, $t1
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 10
	syscall