# This example shows an implementation of the mathematical
# factorial function (! function) to find the factorial value of !7 = 5040.

.data
seed:   .word   44 # Letter M
mempos:   .word 256 # Memory position
.text

main:
        jal ra, shift_lfsr_init       # Jump-and-link to the 'shift_lfsr_init' label
        jal ra, shift_lfsr
        ecall

 shift_lfsr_init:   
    lw  t0, mempos   # Load mempos from static data
    mv	t1, t0       # Move to mempos
    lw t1, seed      # Load seed value
    lw t2, seed      # Result
    li a2,0          # Iter initialize
    li t6,100        # Stop value
    ret
    
shift_lfsr:
    srli t3,t2,3     # Get x^5
    andi t3,t3,1     #    
    srli t4,t2,2     # Get x^6
    andi t4,t4,1
    xor  t5,t4,t3    # Xor Operation to MSB
    srli t2,t2,1     # Shift Right 1 position
    slli t4,t4,7     # Shift Left 7 positions
    or   t2,t4,t2    # Update seed_temp
    addi a2,a2, 1    # Add 1 to iter
    #j shift_lfsr
    blt a2,t6,shift_lfsr
    j exit
# --- printResult ---

exit:
        li a7, 10
        ecall
        ret
