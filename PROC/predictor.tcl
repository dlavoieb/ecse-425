
;# This function is responsible for adding to the Waves window
;# the signals that are relevant to the fetch stage. This
;# allows the developers to inspect the behavior of the fetch stage
;# component as it is being simulated.
proc AddWaves {} {

	;#Add the following signals to the Waves window
	add wave -position end -radix binary sim:/predictor_1bit/clk
  add wave -position end -radix unsigned sim:/predictor_1bit/pc_in

  add wave -group "Output" -radix unsigned sim:/predictor_1bit/pc_target\
                           -radix binary sim:/predictor_1bit/prediction
  
  add wave -group "Record" -radix unsigned sim:/predictor_1bit/branch_instruction_pc\
                           -radix unsigned sim:/predictor_1bit/branch_target_pc\
                           -radix binary sim:/predictor_1bit/taken

  add wave -group "Learn" -radix unsigned sim:/predictor_1bit/branch_target\
                          -radix binary sim:/predictor_1bit/branch_taken\
                          -radix br_ctl sim:/predictor_1bit/branch_ctl
  ;#Set some formating options to make the Waves window more legible
	configure wave -namecolwidth 250
	WaveRestoreZoom {0 ns} {8 ns}
}

;#Generates a clock of period 1 ns on the clk input pin of the fetch stage.
proc GenerateCPUClock {} {
	force -deposit /predictor_1bit/clk 0 0 ns, 1 0.5 ns -repeat 1 ns
}

proc assert condition {
  if {![uplevel 1 expr $condition]} {
    return -code error "assertion failed: $condition"
  }
}

;#This function compiles the fetch stage and its components.
;#It initializes a fetch stage simulation session, and
;#sets up the Waves window to contain useful input/output signals
;#for debugging.
proc Init {} {
  ;#Create the work library, which is the default library used by ModelSim
  vlib work

  ;#Compile the fetch stage and its subcomponents
  vcom predictor_1bit.vhd

  ;#Start a simulation session with the fetch component
  vsim -t ps predictor_1bit 

  radix define br_ctl {
    2'b00 "NO",
    2'b01 "EQ",
    2'b10 "NE",
    2'b11 "J"
  }
  ;#Add the fetch stage's input and ouput signals to the waves window
  ;#to allow inspecting the module's behavior
	AddWaves

  ;#Generate a CPU clock
	GenerateCPUClock

   # DO STUFF
}

Init

#record some counter and prediction
force -deposit sim:/predictor_1bit/branch_instruction_pc "00000000000000000000011101011001" 0
force -deposit sim:/predictor_1bit/taken "1" 0

force -deposit /predictor_1bit/pc_in "00000000000000000000011101011000" 0
run 1 ns

force -deposit /predictor_1bit/pc_in "00000000000000000000011101011001" 0
run 1 ns

force -deposit /predictor_1bit/branch_ctl "01" 0
force -deposit /predictor_1bit/branch_taken "0" 0
force -deposit /predictor_1bit/branch_target "00000000000000000000011010110010" 0
run 1 ns