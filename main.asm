# main.asm
# author Julia Frances <jrf343@drexel.edu>
# date August 22, 2022  
        
        .data
prompt: .asciiz "Enter the maximum value in the table: "
value:  .word 0
count:  .word 1
nl:     .asciiz "\n"
tab:    .asciiz "\t"

        .text
        .globl main
main:
        li $v0, 4       # print prompt
        la $a0, prompt
        syscall
        la $t0, value   # read user input
        li $v0, 5
        syscall
        sw $v0, 0($t0)
        la $t0, count   # load counter
        lw $s0, 0($t0)
        la $t0, value   # load value
        lw $s1, 0($t0)

loop:
        li $v0, 1       # print counter
        or $a0, $s0, $zero
        syscall
        li $v0, 4       # print tab
        la $a0, tab
        syscall
        la $t0, $s0     # find square of counter
        lw $t1, 0($t0)
        mul $t2, $t1, $t1
        mul $t3, t2, t1 #find cube of counter
        li $v0, 1       # print square
        move $a0, $t2
        syscall
        li $v0, 4       # print tab
        la $a0, tab
        syscall
        li $v0, 1       # print cube
        move $a0, $t3
        syscall
        li $v0, 4       # print newline
        la $a0, nl
        syscall
        bne $s0, $s1, continue  # if counter != value, go to continue
        li $v0, 10      # exit
        syscall


continue:
        addi $s0, $s0, 1        # increase counter by 1
        b loop
