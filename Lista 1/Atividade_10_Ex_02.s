.data
	msg1: .asciiz"\n Informe a quantidade de camisetas pequenas vendidas: "
	msg2: .asciiz"\n Informe a quantidade total de camisetas medias vendidas: "
	msg3: .asciiz"\n Informe a quantidade total de camisetas grandes vendidas: "
	msg4: .asciiz"\n O valor da venda totaliza R$"

.text

main:
	li $t0, 10 #preço camiseta pequena
	li $t1, 12 #preço camiseta media
	li $t2, 15 #preço camiseta grande
	
	#chamar mensagem quantidade camisetas pequenas
	li $v0, 4
	la $a0, msg1
	syscall
	#gravar quantidade camisetas pequenas
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	#chamar mensagem quantidade camisetas medias
	li $v0, 4
	la $a0, msg2
	syscall
	#gravar quantidade camisetas medias
	li $v0, 5
	syscall
	add $t4, $v0, 0
	
	#chamar mensagem quantidade camisetas grandes
	li $v0, 4
	la $a0, msg3
	syscall
	#gravar quantidade camisetas grandes
	li $v0, 5
	syscall
	add $t5, $v0, 0
	
	#Calculo
	mul $t6, $t0, $t3
	mul $t7, $t1, $t4
	mul $t8, $t2, $t5
	add $t9, $t6, $t7
	add $t9, $t9, $t8
	
	#print mensagem resultado
	li $v0, 4
	la $a0, msg4
	syscall
	
	#print valor resultado
	li $v0, 1
	add $a0, $t9, 0
	syscall
	
	#Finalizar
	li $v0, 10
	syscall
	