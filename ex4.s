@ ARM Assembly - exercise 4

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
@ fact:

fact:
sub sp,sp,#8
str r6,[sp,#0]
str lr,[sp,#4]
    CMP r0, #0      
        MOVEQ r0, #1
        MOVEQ pc, lr
        MOV r6, r0     
        SUB r0, r0, #1  
        BL fact
        MUL r0, r6, r0  
            
ldr lr,[sp,#4]
ldr r6,[sp,#0]
add sp,sp,#8
 MOV pc, lr












@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "Factorial of %d is %d\n"

