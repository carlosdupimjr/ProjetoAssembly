.data
	msg1: .asciiz"\n Indique a quantidade de horas regulares trabalhadas: "
	msg2: .asciiz"\n Indique a quantidade de horas extras trabalhadas: "
	msg3: .asciiz"\n Indique se existe algum desconto a ser aplicado no salario: "
	msg4: .asciiz"\n O salario bruto equivale a R$"
	msg5: .asciiz"\n O salario liquido equivale a R$"

.text
main:
	li $t0, 10 #valor hora normal
	li $t1, 15 #valor hora extra
	
	#mensagem horas normais
	li $v0, 4
	la $a0, msg1
	syscall
	#quantidade horas normais
	li $v0, 5
	syscall
	add $t2, $v0, 0
	#mensagem horas extras
	li $v0, 4
	la $a0, msg2
	syscall
	#quantidade horas extras
	li $v0, 5
	syscall
	add $t3, $v0, 0
	#mensagem descontos
	li $v0, 4
	la $a0, msg3
	syscall
	#valor desconto
	li $v0, 5
	syscall
	add $t4, $v0, 0
	
	#calculo salario bruto
	mul $t5, $t0, $t2
	mul $t6, $t1, $t3
	add $t7, $t5, $t6
	#calculo salario liquido
	sub $t8, $t7,$t4
	
	#mensagem salario bruto
	li $v0, 4
	la $a0, msg4
	syscall
	#valor salario bruto
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	#mensagem salario liquido
	li $v0, 4
	la $a0, msg5
	syscall
	#valor salario liquido
	li $v0, 1
	add $a0, $t8, 0
	syscall
	
	#Finalizar
	li $v0, 10
	syscall