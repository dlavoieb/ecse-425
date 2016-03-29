
;# This function is responsible for adding to the Waves window
;# the signals that are relevant to the memory arbiter. This
;# allows the developers to inspect the behavior of the memory
;# arbiter component as it is being simulated.
proc AddWaves {} {

	;#Add the following signals to the Waves window
	add wave -position end  -radix binary sim:/Data_Memory/clk
	add wave -position end  -radix binary sim:/Data_Memory/n_rst

  ;#These signals will be contained in a group named "Port 1"
	add wave -group "Port 1"  -radix binary sim:/Data_Memory/write_enable\
                            -radix hex sim:/Data_Memory/write_in\
                            -radix hex sim:/Data_Memory/write_adr\
                            -radix decimal sim:/Data_Memory/port_adr\
                            -radix hex sim:/Data_Memory/port_out\
                            -radix binary sim:/Data_Memory/byte

  configure wave -namecolwidth 250
	WaveRestoreZoom {0 ns} {8 ns}
}

proc InitDataMem {} {
  ;#Create the work library, which is the default library used by ModelSim
  vlib work

  ;#Compile the memory arbiter and its subcomponents
  vcom ../assignment3-mem_arbiter/memory_arbiter_lib.vhd
  vcom Data_Mem.vhd

  ;#Start a simulation session with the memory_arbiter component
  vsim -t ps Data_Memory

  ;#Add the memory_arbiter's input and ouput signals to the waves window
  ;#to allow inspecting the module's behavior
	AddWaves

  force -deposit /Data_Memory/n_rst 0 0 ns, 1 1 ns
  force -deposit /Data_Memory/write_enable 0 0
  force -deposit /Data_Memory/write_in "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" 0
  force -deposit /Data_Memory/write_adr 0 0
  force -deposit /Data_Memory/port_adr 0 0
  force -deposit /Data_Memory/port_out 0 0
  force -deposit /Data_Memory/byte 0 1


  ;#Generate a CPU clock
	GenerateCPUClock

  run 1.5 ns
}

;#Generates a clock of period 1 ns on the clk input pin of the mem stage
proc GenerateCPUClock {} {
	force -deposit /Data_Memory/clk 0 0 ns, 1 0.5 ns -repeat 1 ns
}

proc TestReadandWrite {} {
  ;# Initiate a write to the same address on both ports
  PlaceWrite 1 12345678

  PlaceRead 0
  run 1 ns
  PlaceRead 1
  run 1 ns
}

proc TestEverything {} {
  PlaceWrite 1 12345678

  PlaceRead 0
  force -deposit /Data_Memory/byte 1 0

  PlaceWrite 0 87654321
  PlaceRead 0

  force -deposit /Data_Memory/byte 0 0
  PlaceWrite 4 12345678

  run 4 ns

}

proc PlaceRead {addr} {
  force -deposit /Data_Memory/port_adr 16#$addr 0 0
  run 0 ;#Force signals to update right away
}

proc PlaceWrite {addr data} {
  force -deposit /Data_Memory/write_enable 1 0
  force -deposit /Data_Memory/write_adr 16#$addr 0 0
  force -deposit /Data_Memory/write_in 16#$data 0 0
  run 1ns ;#Force signals to update right away
  force -deposit /Data_Memory/write_enable 0 0
}
