# 4. Receba 4 notas bimestrais de um aluno. Calcule e mostre a média aritmética. Mostre a mensagem de acordo com a média:
# a. Se a média for >= 6,0 exibir “APROVADO”;
# b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”;
# c. Se a média for < 3,0 exibir “RETIDO”.

.data
	msg1: .asciiz"\nInsira a primeira nota: "
	msg2: .asciiz"\nInsira a segunda nota: "
	msg3: .asciiz"\nInsira a terceira nota: "
	msg4: .asciiz"\nInsira a quarta nota: "
	msgAP: .asciiz"\nAPROVADO"
	msgEX: .asciiz"\nEXAME"
	msgRT: .asciiz"\nRETIDO"

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t4, $v0, 0
	
	add $t0, $t1, $t2
	add $t0, $t0, $t3
	add $t0, $t0, $t4
	div $t0, $t0, 4
	
	bge $t0, 6, Aprovado
	blt $t0, 3, Retido
	j Exame

Aprovado:
	li $v0, 4
	la $a0, msgAP
	syscall
	j FimSe

Retido:
	li $v0, 4
	la $a0, msgRT
	syscall
	j FimSe

Exame:
	li $v0, 4
	la $a0, msgEX
	syscall
	j FimSe

FimSe:
	li $v0, 10
	syscall