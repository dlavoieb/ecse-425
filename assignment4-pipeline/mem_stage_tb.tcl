
;# This function is responsible for adding to the Waves window
;# the signals that are relevant to the memory arbiter. This
;# allows the developers to inspect the behavior of the memory
;# arbiter component as it is being simulated.
proc AddWaves {} {

	;#Add the following signals to the Waves window
	add wave -position end  -radix binary sim:/MEM/clk
	add wave -position end  -radix binary sim:/MEM/n_reset

  ;#These signals will be contained in a group named "Port 1"
	add wave -group "Port 1"  -radix binary sim:/MEM/mem_access_write\
                            -radix hex sim:/MEM/address_in\
                            -radix hex sim:/MEM/data_in\
                            -radix hex sim:/MEM/data_out

  configure wave -namecolwidth 250
	WaveRestoreZoom {0 ns} {8 ns}
}

proc InitMEM {} {
  ;#Create the work library, which is the default library used by ModelSim
  vlib work

  ;#Compile the memory arbiter and its subcomponents
  vcom ../assignment3-mem_arbiter/memory_arbiter_lib.vhd
  vcom Data_Mem.vhd
  vcom MEM.vhd

  ;#Start a simulation session with the memory_arbiter component
  vsim -t ps MEM

  ;#Add the memory_arbiter's input and ouput signals to the waves window
  ;#to allow inspecting the module's behavior
	AddWaves

  force -deposit /MEM/n_reset 0 0 ns, 1 1 ns
  force -deposit /MEM/mem_access_write 0 0
  force -deposit /MEM/data_in "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" 0
  force -deposit /MEM/address_in 0 0
  force -deposit /MEM/data_out "00000000000000000000000000000000" 0


  ;#Generate a CPU clock
	GenerateCPUClock

  run 1.5 ns
}

;#Generates a clock of period 1 ns on the clk input pin of the mem stage
proc GenerateCPUClock {} {
	force -deposit /MEM/clk 0 0 ns, 1 0.5 ns -repeat 1 ns
}

proc TestWriteAndRead {} {
  ;# Initiate a write to the same address on both ports
  PlaceWrite 0 12345678
  PlaceRead 0
  run 1 ns
  PlaceWrite 1 87654321
  PlaceRead 4
  run 1 ns
}

proc PlaceRead {addr} {
  force -deposit /MEM/address_in 16#$addr 0 0
}

proc PlaceWrite {addr data} {
  force -deposit /MEM/mem_access_write 1 0
  force -deposit /MEM/address_in 16#$addr 0 0
  force -deposit /MEM/data_in 16#$data 0 0
  run 1 ns
  force -deposit /MEM/mem_access_write 0 0
}
