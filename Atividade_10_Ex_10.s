.data
	msg1: .asciiz"\nInsira o primeiro valor inteiro: "
	msg2: .asciiz"n\Insira o segundo valor inteiro: "
	msg3: .asciiz"\nO resto da divisão do maior valor pelo menor é igual a: "
	msgErro: .asciiz"\n Os valores são iguais, favor inserir valores diferentes."
.text
main:
	#mensagem de leitura valor 1
	li $v0, 4
	la $a0, msg1
	syscall
	#leitura valor 1
	li $v0, 5
	syscall
	add $t0, $v0, 0
	#mensagem de leitura valor 2
	li $v0, 4
	la $a0, msg2
	syscall
	#leitura valor 2
	li $v0, 5
	syscall
	add $t1, $v0, 0
	#validação se valores são iguais
	beq $t0, $t1, erroIguais
	j validarMaiorMenor

erroIguais:
	#mensagem de erro
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

validarMaiorMenor:
	bgt $t0,$t1,opPrimeiroMaior
	j opSegundoMaior

opPrimeiroMaior:
	div $t2, $t0, $t1 #divide valor maior pelo menor
	mul $t3, $t2, $t1 #multiplica o resultado da divisão pelo denominador
	sub $t4, $t0, $t3 #subtrai o resultado da multiplicação do valor original
	#mensagem resultado
	li $v0, 4
	la $a0, msg3
	syscall
	#valor resultado
	li $v0, 1
	add $a0, $t4, 0
	syscall
	j fimSe

opSegundoMaior:
	div $t2, $t1, $t0 #divide valor maior pelo menor
	mul $t3, $t2, $t0 #multiplica o resultado da divisão pelo denominador
	sub $t4, $t1, $t3 #subtrai o resultado da multiplicação do valor original
	#mensagem resultado
	li $v0, 4
	la $a0, msg3
	syscall
	#valor resultado
	li $v0, 1
	add $a0, $t4, 0
	syscall
	j fimSe

fimSe:
	#finalizar
	li $v0, 10
	syscall
	