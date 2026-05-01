.data
	msg1: .asciiz"\n Digite um numero inteiro: "
	msg2: .asciiz"\n Soma do valor par + 5 = "
	msg3: .asciiz"\n Soma do valor impar + 8 = "
.text
main:
	#ler mensagem
	li $v0, 4
	la $a0, msg1
	syscall
	#obter valor
	li $v0, 5
	syscall
	add $t0, $v0, 0	
	#validar se e par ou impar
	rem $t1, $t0, 2 #resto da divisao do valor por 2
	beq $t1, 0, seSomaPar #se resto igual a 0, pula para soma quando numero par
	j seSomaImpar #senao, pula para soma quando numero impar

seSomaPar:
	add $t2, $t0, 5 #soma 5 ao valor par
	#mensagem de retorno
	li $v0, 4
	la $a0, msg2
	syscall
	#resultado soma par
	li $v0, 1
	add $a0, $t2, 0
	syscall
	j FimSe
	
seSomaImpar:
	add $t3, $t0, 8 #soma 8 ao valor impar
	#mensagem de retorno
	li $v0, 4
	la $a0, msg3
	syscall
	#resultado soma impar
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j FimSe

FimSe:
	#Finalizar
	li $v0, 10
	syscall
	