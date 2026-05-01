.data
	msg1: .asciiz"\n Insira um número inteiro entre 0 e 100: "
	msg2: .asciiz"\n A quantidade de números inserido que pertence ao intervalo 0-25 é: "
	msg3: .asciiz"\n A quantidade de números inserido que pertence ao intervalo 26-50 é: "
	msg4: .asciiz"\n A quantidade de números inserido que pertence ao intervalo 51-75 é: "
	msg5: .asciiz"\n A quantidade de números inserido que pertence ao intervalo 76-100 é: "
	msgErro: .asciiz"\n Valor superior a 100 digitado, favor tentar novamente."
	
.text
variaveis:
	#declaração variáveis count
	li $t1, 0 #count de valors de 0-25
	li $t2, 0 #count de valores de 26-50
	li $t3, 0 #count de valores de 51-75
	li $t4, 0 #count de valores de 76-100
main:	
	#mensagem leitura
	li $v0, 4
	la $a0, msg1
	syscall
	#leitura
	li $v0, 5
	syscall
	add $t0, $v0, 0
	#validação 0 a 100
	bgt $t0, 100, mensagemErro #se valot superior a 100, mensagem de erro
	blt $t0, 0, finalCount #se valor inferior a 0, para o count
	#validação 0 a 25
	bge $t0, 0, reviewCount #se valor maior ou igual a 0, vai para o direcionador de count
	
mensagemErro:
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

reviewCount:
	ble $t0, 25, addCount0to25 #se valor for menor ou igual a 25, direciona para add count até 25
	ble $t0, 50, addCount26to50 #se valor for menor ou igual a 50, direciona para add count 26-50
	ble $t0, 75, addCount51to75 #se valor for menor ou igual a 75, direciona para add count 51-75
	ble $t0, 100, addCount76to100 #se valor for menor ou igual 100, direciona para add count 76-100
	j main

addCount0to25:
	add $t1, $t1, 1 #add 1 no count
	j main

addCount26to50:
	add $t2, $t2, 1 #add 1 no count
	j main

addCount51to75:
	add $t3, $t3, 1 #add 1 no count
	j main

addCount76to100:
	add $t4, $t4, 1 #add 1 no count
	j main

finalCount:
	#mensagem intervalo 0-25
	li $v0, 4
	la $a0, msg2
	syscall
	#valor intervalo 0-25
	li $v0, 1
	add $a0, $t1, 0
	syscall
	#mensagem intervalo 26-50
	li $v0, 4
	la $a0, msg3
	syscall
	#valor intervalo 26-50
	li $v0, 1
	add $a0, $t2, 0
	syscall
	#mensagem intervalo 51-75
	li $v0, 4
	la $a0, msg4
	syscall
	#valor intervalo 51-75
	li $v0, 1
	add $a0, $t3, 0
	syscall
	#mensagem intervalo 76-100
	li $v0, 4
	la $a0, msg5
	syscall
	#valor intervalo 76-100
	li $v0, 1
	add $a0, $t4, 0
	syscall
	
	#Finalização
	li $v0, 10
	syscall