.data
    endl:    .asciiz  "\n"   # used for cout << endl;
    sumlbl:    .asciiz  "Sum: " # label for sum
    revlbl:    .asciiz  "Reversed Number: " # label for rev
    pallbl:    .asciiz  "Is Palindrome: " # label for isPalindrome
    sumarr:    .word 1
               .word 3
               .word 44
               .word 66
               .word 88
               .word 90
               .word 9
               .word 232
               .word 4325
               .word 2321
    arr:       .word 1
               .word 2
               .word 3
               .word 4
               .word 5
               .word 4
               .word 3
               .word 2
               .word 1

.text

# sum               --> $s0
# address of sumarr --> $s1
# rev               --> $s2
# num               --> $s3
# isPalindrome      --> $s4
# address of arr    --> $s5
# i                 --> $t0
# beg               --> $s6
# end               --> $s7
# d                 --> $t1
# 10                --> $t2
# 100               --> $t3
main:


       

       la $s1, sumarr  # array

       li $s0, 0       # sum = 0
       li $t0, 0       # i = 0
       li $t2, 10      # size = 10

       loop1:
             bge $t0, $t2 exit1
             lw  $t4, ($s1)
             add $s0, $s0, $t4
	     add $t0, $t0, 1		
	     add $s1, $s1, 4
        j loop1
        exit1:




	li $s3, 45689			# num = 45689
	li $s2, 0			# rev = 0
	li $t1, -1			# d = -1
	
	      
          ble $s3, $zero, exit2

       loop2:
	     divu $s3, $t2	
	     mfhi $t1		
	     mflo $t5		
	     mul $t4, $s2, 10	      
	     add $s2, $t4, $t1	     
	     move $s3, $t5		
	     bgt $s3, $zero, loop2	
	exit2:
	
	
	
	la $s5, arr			
	li $s6, 0			
	li $s7, 8		
	li $s4, 1			
	
	bge $s6, $s7 exit3
		
	loop3:
	     mul $t4, $s6, 4
	     mul $t5, $s7, 4
	     add $t4, $t4, $s5	
	     add $t5, $t5, $s5	
	     lw $t4, ($t4)	
	     lw $t5, ($t5)		
	     beq $t4, $t5 skip	
	     li $s4, -1		
	     j exit3
	skip:
			
            addi $s6, $s6, 1
	    addi $s7, $s7, -1
	    blt $s6, $s7 loop3
	exit3:



exit:
  la   $a0, sumlbl    # puts sumlbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
  syscall             # make a syscall to system

  move $a0, $s0       # puts sum into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall

  la   $a0, revlbl    # puts revlbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing an string
  syscall             # make a syscall to system

  move $a0, $s2       # puts rev into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall

  la   $a0, pallbl    # puts pallbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
  syscall             # make a syscall to system

  move $a0, $s4       # puts isPalindrome into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall


  addi $v0,$0, 10
  syscall
