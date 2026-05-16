.data
	msg1: .asciiz"\nIndique um valor maior que 2 e menor que 20: "
	msg2: .asciiz"\nO resultado da multiplicacao dos "
	msg3: .asciiz" primeiros termos da sequencia de Fibonacci e igual a "
	msg4: .asciiz"."
	msgErro: .asciiz"\nValor invalido, favor inserir novamente."
.text	
	
main:
	li $t1, 1 #valorFib1
	li $t2, 1 #valorFib2	
	li $t4, 1 #valorFibProduto
	li $t8, 0 #contador
	
	li $v0, 4
	la $a0, msg1 #mensagem de inserção do valor
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 #inserção do valor para uso na busca de números na sequência fibonacci
	
	ble $t0, 2, valorInvalido #validação se número é menor ou igual a 2
	bge $t0, 20, valorInvalido #validação se número é maior ou igual a 20
	j calculo
	
valorInvalido:
	li $v0, 4
	la $a0, msgErro #mensagem de valor fora do intervalo permitido
	syscall
	j main #volta ao começo da main
	
calculo:
	mul $t4, $t4, $t1 #multiplica o número atual pelo próximo da sequência
	
	add $t3, $t1, $t2 #gera o próximo número da sequência
	move $t1, $t2 #substitui o valor do número pelo a seguir na sequência
	move $t2, $t3 #substitui o valor do número pelo a seguir na sequência
	add $t8, $t8, 1 #adiciona um ao contador
	blt $t8, $t0, calculo #laço de repetição enquanto contador for menor que o valor inserido
	
return:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, msg4
	syscall	
	
	
	
end:
	li $v0, 10
	syscall
