proc AddWaves {} {
    ;#Add waves we're interested in to the Wave window
    add wave -position end sim:/PROCv2/clock
    add wave -position end  sim:/PROCv2/reset

    add wave -group "INPUTS" sim:/PROCv2/we\
       -radix unsigned sim:/PROCv2/radd\
        -radix decimal sim:/PROCv2/rdat\
       
    add wave -group "OUTPUTS" -radix decimal sim:/PROCv2/res\
    -radix unsigned sim:/PROCv2/destregadd\
    sim:/PROCv2/loaden\
    sim:/PROCv2/storeen\
    sim:/PROCv2/regen\
    -radix decimal sim:/PROCv2/memdat

add wave -group "EX in Buffers" -radix decimal sim:/PROCv2/ex_r1_in_buffer\
    -radix decimal sim:/PROCv2/ex_r2_in_buffer\
    -radix decimal sim:/PROCv2/ex_imm_in_buffer\
    -radix unsigned sim:/PROCv2/ex_dest_regadd_in_buffer\
    sim:/PROCv2/ex_alu_op_in_buffer\
    sim:/PROCv2/ex_loaden_in_buffer\
    sim:/PROCv2/ex_storeen_in_buffer\
    sim:/PROCv2/ex_ALUData2_selector0_in_buffer

add wave -group "Decode Out" sim:/PROCv2/id_alu_op_out\
-radix decimal sim:/PROCv2/id_r1_out\
-radix decimal sim:/PROCv2/id_r2_out\
-radix decimal sim:/PROCv2/id_imm_out\
-radix decimal sim:/PROCv2/id_pc_out\
-radix unsigned sim:/PROCv2/id_dest_regadd_out

add wave -group "IF Out" -radix decimal sim:/PROCv2/if_pc_out\
-radix binary sim:/PROCv2/if_inst_out

add wave -group "IF IN" -radix decimal sim:/PROCv2/if_pc_in_buffer\
-radix decimal sim:/PROCv2/if_pc_sel_in_buffer\
-radix unsigned sim:/PROCv2/if_pc_enable_in_buffer




    
    
    
    
}
;

proc loadInstructions {} {
  force -deposit PROCv2/IFstage/instruction_memory/initialize 0 0 ns, 1 1 ns, 0 2 ns
  run 2 ns ;#Force signals to update right away
}

proc GenerateCPUClock {} { 
    force -deposit /PROCv2/clock 0 0 ns, 1 0.5 ns -repeat 1 ns
}


proc Init {} {
    vlib work

    #Compile
vcom ../assignment3-mem_arbiter/Memory_in_Byte.vhd
vcom ../assignment3-mem_arbiter/memory_arbiter_lib.vhd
vcom ../assignment3-mem_arbiter/Main_Memory.vhd
vcom fetch.vhd
vcom shifter.vhd
vcom comparator.vhd
vcom Register.vhd
vcom PC.vhd
vcom decode.vhd
vcom ALU.vhd
vcom mux41.vhd
vcom EX.vhd
vcom PROCv2.vhd

    ; # Start Simulation

    vsim PROCv2
    
    AddWaves
run 1 ns
  force -deposit /PROCv2/if_pc_enable_in_buffer 0 0 ns



    GenerateCPUClock

    force -deposit /PROCv2/reset 0 0 ns, 1 1 ns 
    run 1 ns

  loadInstructions
  run 1 ns
  force -deposit /PROCv2/if_pc_in_buffer "00000000000000000000000000110000" 0
  run 1 ns
    force -deposit /PROCv2/if_pc_enable_in_buffer 1 0 ns
    run 10 ns

}

Init

run 10 ns
