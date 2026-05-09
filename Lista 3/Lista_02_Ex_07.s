#7.Ler um número inteiro e imprimir a saída da seguinte forma:
#CENTENA = x
#DEZENA = y
#UNIDADE = z
#Exemplo:
#Entrada = 517
#Saída:
#CENTENA = 5
#DEZENA = 1
#UNIDADE = 7
#*Sabe-se que a entrada deve ser um número entre 100 e 999, validar a entrada para que não permita números fora deste intervalo

.data
	msg1: .asciiz"\nIndique um valor de 100 a 999: "
	msg2: .asciiz"\n CENTENA = "
	msg3: .asciiz"\n DEZENA = "
	msg4: .asciiz"\n UNIDADE = "
	msgErro: .asciiz"\n Valor fora do intervalo de 100 a 999. Favor digitar novamente."

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 100, valorErro
	bgt $t0, 999, valorErro
	j calculo

valorErro:
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

calculo:
	div $t1, $t0, 100 #centena divida por 100 - valor de X
	mul $t2, $t1, 100 #resultado multiplicado por 100
	sub $t2, $t0, $t2 #subtraindo multiplicado do original, para ficar apenas com a dezena
	div $t3, $t2, 10 #dezena dividida por 10 - valor de Y
	mul $t4, $t3, 10 #multiplicação do resultado por 10
	sub $t4, $t2, $t4 #subtraindo multiplicado do original - valor de Z
	
retorno:
	li $v0, 4
	la $a0, msg2
	syscall	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	move $a0, $t4
	syscall 
	
	
	li $v0, 10
	syscall	
