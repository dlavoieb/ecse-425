proc AddWaves {} {
    ;#Add waves we're interested in to the Wave window
    add wave -position end sim:/decode/clk
    add wave -position end  sim:/decode/instruction_in
    add wave -position end  sim:/decode/n_reset
    add wave -position end  -radix decimal sim:/decode/dest_register_address
    add wave -position end  -radix decimal sim:/decode/r1
    add wave -position end  -radix decimal sim:/decode/r2
    add wave -position end  sim:/decode/alu_op
    add wave -position end  sim:/decode/reg1_out
    add wave -position end  sim:/decode/reg2_out
    add wave -position end  -radix decimal sim:/decode/immediate_out
    add wave -position end  sim:/decode/branch_ctl
    add wave -position end  sim:/decode/use_imm
    add wave -position end  sim:/decode/use_pc
    add wave -position end  sim:/decode/load
    add wave -position end  sim:/decode/store
    add wave -position end  sim:/decode/shifter_input
    add wave -position end  sim:/decode/shifter_output
}

;#Generates a clock of period 1 ns on the clk input pin of the memory arbiter.
proc GenerateCPUClock {} { 
    force -deposit /decode/clk 0 0 ns, 1 0.5 ns -repeat 1 ns
}

proc Init {} {
    vlib work

    #Compile

    vcom ../ALU/ALU.vhd
    vcom ../assignment3-mem_arbiter/memory_arbiter_lib.vhd
    vcom shifter.vhd
    vcom PC.vhd
    vcom decode.vhd

    ; # Start Simulation

    vsim decode
    AddWaves
    GenerateCPUClock

    force -deposit /decode/n_reset 0 0 ns, 1 1 ns 
    run 1 ns

}

Init 

echo "add \$9 \$10 \$11"
force -deposit /decode/instruction_in "00000001010010110100100000100000" 0
run 1 ns

echo "addi \$9 \$10 138"
force -deposit /decode/instruction_in "00100001010010010000000010001010" 0 
run 1 ns
