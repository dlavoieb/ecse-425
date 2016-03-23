proc AddWaves {} {
	;#Add waves we're interested in to the Wave window
    add wave -position end sim:/testbench/sclock
    add wave -position end sim:/testbench/sFC
    add wave -position end sim:/testbench/sRS
    add wave -position end sim:/testbench/sRT
    add wave -position end sim:/testbench/sRES
    add wave -position end sim:/testbench/sZERO
    add wave -position end sim:/testbench/st
   
}

vlib work

;# Compile components if any
vcom ALU.vhd
vcom mux41.vhd
vcom testbench.vhd
vcom EX.vhd


;# Start simulation
vsim testbench

;# Generate a clock with 1ns period
force -deposit sclock 0 0 ns, 1 0.5 ns -repeat 1 ns

;# Add the waves
AddWaves

;# Run for 50 ns
run 50ns