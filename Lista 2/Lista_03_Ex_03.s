# 3. Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor.

.data
	msg1: .asciiz"\n Indique o primeiro valor: "
	msg2: .asciiz"\n Indique o segundo valor: "
	msg3: .asciiz"\n A diferenca entre o maior valor e o menor valor e de: "
	msg4: .asciiz"\n Os valores sao identicos, portanto nao ha diferenca entre eles."

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bgt $t0, $t1, firstBGT
	bgt $t1, $t0, secondBGT
	j Else
	
firstBGT:
	sub $t2, $t0, $t1
	j FimSe

secondBGT:
	sub $t2, $t1, $t0
	j FimSe

Else:
	li $v0, 4
	la $a0, msg4
	syscall
	j end

FimSe:	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall

end:
	li $v0, 10
	syscall