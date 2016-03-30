jump: add $9 $10 $11
addi $2, $4, 138
lw $25, 17($7)
beq $3, $18, jump
sw $8, 38($4)
lui $30, 0x1382
and $1, $2, $3
jr $8
nor $4, $7, $9
or $14, $15, $16
sll $8, $4, $1
banana: slt $1, $2, $3
srl $8, $5, $1
sub $14, $8, $3
div $0, $4
mflo $27
mfhi $30
mult $9, $17
xor $7, $16, $9
sra $19, $6, $23
addi $6, $4, 0x75
andi $1, $2, banana
bne $8, $3, banana
lb $19, ($4) 
