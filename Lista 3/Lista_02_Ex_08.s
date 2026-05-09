# 8.Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja Vende Tudo.
# A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser validado na entrada).
# A loja permite pagar o valor em parcelas fixas.
# O algoritmo deve ler também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00
# (Que deve ser validado na entrada).
#O algoritmo, sabendo que a última parcela pode ser de valor inferior às anteriores, deve calcular quantas parcelas serão pagas.

.data
	msg1: .asciiz"\n Informe o valor da compra, em reais (R$), e número inteiro de 1000 a 9999: "
	msg2: .asciiz"\n Deseja que o valor seja parcelado? Digite 1 para 'SIM' ou 2 para 'NAO': "
	msg3: .asciiz"\n Indique o valor fixo das parcelas que deseja pagar, entre 100 e 500 reais: "
	msg4: .asciiz"\n O número total de parcelas a serem pagas é de: "
	msg5: .asciiz" parcelas."
	msgErro: .asciiz"\n Valor inválido para a compra, favor informar novamente."
	msgErroQ: .asciiz"\n Valor inválido para opção de parcela, favor informar novamente."
	msgErroP: .asciiz"\nValor inválida para a parcela, favor informar novamente. "
	
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 1000, erroCompra
	bgt $t0, 9999, erroCompra
	j perguntaParcela

erroCompra:
	li $v0, 4
	la $a0, msgErro
	syscall
	j main

perguntaParcela:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	beq $t1, 1, valorParcela
	beq $t1, 2, calculoVista
	j erroOpcao

erroOpcao:
	li $v0, 4
	la $a0, msgErroQ
	syscall
	j perguntaParcela

calculoVista:
	div $t3, $t0, $t0
	j resposta

valorParcela:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	blt $t2, 100, erroParcela
	bgt, $t2, 500, erroParcela
	j calculoParcela

erroParcela:
	li $v0, 4
	la $a0, msgErroP
	syscall
	j valorParcela

calculoParcela:
	div $t3, $t0, $t2
	mfhi $t4
	bgt $t4, 0, addParcela 
	j resposta

addParcela:
	add $t3, $t3, 1
	j resposta

resposta:
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 10
	syscall