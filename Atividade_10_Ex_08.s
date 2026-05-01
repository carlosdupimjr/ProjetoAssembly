.data
	msg1: .asciiz"\n Indique um numero: "
	msg2: .asciiz"\n O dobro de "
	msg3: .asciiz"\n O triplo de "
	msg4: .asciiz" é igual a "
	msg5: .asciiz"."
.text
main:
	#mensagem inserir numero
	li $v0, 4
	la $a0, msg1
	syscall
	#leitura numero
	li $v0, 5
	syscall
	add $t0, $v0, 0
	#validacao se positivo ou negativo
	bge $t0, 0, seDobroPositivo #verifica se numero e maior ou igual a 0
	j seTriploNegativo #senao, pula pra conta com negativo

seDobroPositivo:
	#duplica valor positivo
	mul $t1, $t0, 2
	#mensagem retorno - parte 1
	li $v0, 4
	la $a0, msg2
	syscall
	#valor original
	li $v0, 1
	add $a0, $t0, 0
	syscall
	#mensagem retorno - parte 2
	li $v0, 4
	la $a0, msg4
	syscall
	#valor resultado
	li $v0, 1
	add $a0, $t1, 0
	syscall
	#mensagem retorno - parte 3
	li $v0, 4
	la $a0, msg5
	syscall
	j fimSe

seTriploNegativo:
	#triplica valor negativo
	mul $t1, $t0, 3
	#mensagem retorno - parte 1
	li $v0, 4
	la $a0, msg3
	syscall
	#valor original
	li $v0, 1
	add $a0, $t0, 0
	syscall
	#mensagem retorno - parte 2
	li $v0, 4
	la $a0, msg4
	syscall
	#valor resultado
	li $v0, 1
	add $a0, $t1, 0
	syscall
	#mensagem retorno - parte 3
	li $v0, 4
	la $a0, msg5
	syscall
	j fimSe

fimSe:
	#Finalizar
	li $v0, 10
	syscall