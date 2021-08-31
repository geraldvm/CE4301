			;Instrucciones
			
			
set_values
			MOV		R1, #0X0100	; Move to 0X200 Address
			;LDR		,[R1]
			MOV		R2, #2		;Número inicial
			STR		R2,[R1]
			MOV		R5,#3		; Temp
			MOV		R6,R1		; Mult
			MOV		R7, #2		;i
			MOV		R3,#0		;Max
			
			
			
multiply
			LDR		R9,[R6]		; Mult
			MOV		R10,R7		; i
			MOV		R8,#0
			
multiply_loop
			ADD		R8,R8,R9
			SUBS		R10,R10,#1
			BNE		multiply_loop
			MOV		R10,R8
			
calculate
			CMP		R5,R10
			BGT		up_i
			BLT		up_mult
			BEQ		not_prime
			
			
			
up_i
			ADD		R7,R7,#1		;R7=i+1
			BNE		multiply
			
up_mult
			ADD		R6,R6,#4		;R7=mult+1  ESTA MALO
			ADD		R11,R1,R3		;R11=R1+MAX_MEM
			CMP		R6,R11
			MOV		R7,#2
			BLT		multiply
			B		is_prime
			
not_prime
			MOV		R6,#0X0100	; Mult=2
			MOV		R7,#2		; i=2
			ADD		R5,R5,#1		; Temp=Temp+1
			B		multiply
			
is_prime
			ADD		R3,R3,#4
			ADD		R2,R1,R3
			STR		R5,[R1,R3]
			ADD		R5,R5,#1		; Temp=Temp+1
			MOV		R6,#0X0100
			CMP		R2,#0X0124
			BEQ		_end
			BNE		multiply
			
_end
