.data
	msg1: .asciiz"\n Informe o primeiro cateto do triangulo: "
	msg2: .asciiz"\n Informe o segundo cateto do triangulo: "
	msg3: .asciiz"\n O valor da hipotenusa e igual a: "	
	
.text

main:
	#mensagem cateto 1
	li $v0, 4
	la $a0, msg1
	syscall
	#valor cateto 1
	li $v0, 6
	syscall
	mov.s $f2, $f0
	#mensagem cateto2
	li $v0, 4
	la $a0, msg2
	syscall
	#valor cateto 2
	li $v0, 6
	syscall
	mov.s $f4, $f0
	#calculo hipotenusa
	mul.s $f6, $f2, $f2
	mul.s $f8, $f4, $f4
	add.s $f10, $f6, $f8
	sqrt.s $f12, $f10
	#mensagem resultado
	li $v0, 4
	la $a0, msg3
	syscall
	#valor resultado
	li $v0, 2
	syscall
	#finalizar
	li $v0, 10
	syscall