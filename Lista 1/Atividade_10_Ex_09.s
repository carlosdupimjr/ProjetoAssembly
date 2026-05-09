.data
	msg1: .asciiz"\n Insira o primeiro número: "
	msg2: .asciiz"\n Insira o segundo número: "
	msg3: .asciiz"\n O valor da divisão de "
	msg4: .asciiz" por "
	msg5: .asciiz" é igual a "
	msg6: .asciiz"."
	msgErro: .asciiz"\n Segundo número deve ser número inteiro diferente de 0, favor digitar novo número."
.text
main:
	#mensagem primeiro valor
	li $v0, 4
	la $a0, msg1
	syscall
	#leitura primeiro valor
	li $v0, 5
	syscall
	add $t0, $v0, 0

inserirSegundoValor:	
	#mensagem segundo valor
	li $v0, 4
	la $a0, msg2
	syscall
	#leitura segungo valor
	li $v0, 5
	syscall
	add $t1, $v0, 0
	#validação se o valor é diferente de zero
	bne $t1, 0, divisaoValores #se for maior que zero, vai para a divisão
	#se não for maior que zero, aparece a mensagem
	li $v0, 4
	la $a0, msgErro
	syscall
	j inserirSegundoValor #pula para o começo da inserção do segundo valor, até que seja correto

divisaoValores:
	div $t2, $t0, $t1
	#mostrar mensagem resultado - parte 1
	li $v0, 4
	la $a0, msg3
	syscall
	#mostrar valor 1
	li $v0, 1
	add $a0, $t0, 0
	syscall
	#mostrar mensagem resultado - parte 2
	li $v0, 4
	la $a0, msg4
	syscall
	#mostrar valor 3
	li $v0, 1
	add $a0, $t1, 0
	syscall
	#mostrar mensagem resultado - parte 3
	li $v0, 4
	la $a0, msg5
	syscall
	#mostrar resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall
	#mostrar mensagem resultado - parte 4
	li $v0, 4
	la $a0, msg6
	syscall

#Finalizar
li $v0, 10
syscall
	
	