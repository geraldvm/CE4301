set_values:
    sw    s2,0X100(sp)
    sw    a2,2(sp)
    sw    a5,3(sp)
    mv    a6,ra   #MULT
    mv    a7,a2    #i
	li    a3,0    #MAX
    sw    s0,0X0124(sp)
multiply:
    mul  a0,a6,a7
    
calculate:
    beq a5,a0,not_prime
    bgt a5,a0,up_i     
    blt a5,a0,up_mult
    
not_prime:
    sw  a6,2(sp)
    sw  a7,2(sp)
    addi a5,a5,1
    j  multiply
    
up_i:
    addi a7,a7,1
    j multiply

up_mult:
    addi a6,a6,4
    add a4,a4,a3 #R11
    sw  a7,2(sp)
    blt a6,a4,multiply
    j   is_prime
    
is_prime:                           
    addi a3,a3,4
    add a2,a1,a3
    add t5,a3,ra
    addi a5,a5,1
    sw a6,0X0100(sp)
    beq a2,s0, _end
    j multiply
_end:
    ret