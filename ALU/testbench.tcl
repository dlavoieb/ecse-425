proc AddWaves {} {
	;#Add waves we're interested in to the Wave window
    add wave -position end sim:/testbench/aclock
     add wave -position end sim:/testbench/sclock
    add wave -position end sim:/testbench/aRSD
    add wave -position end sim:/testbench/aRTD
    add wave -position end sim:/testbench/aIMM
    add wave -position end sim:/testbench/aRDD
    add wave -position end sim:/testbench/aFCode
    add wave -position end sim:/testbench/aPCEI
    add wave -position end sim:/testbench/aD1Sel0 
    add wave -position end sim:/testbench/aD1Sel1 
    add wave -position end sim:/testbench/aD2Sel0 
    add wave -position end sim:/testbench/aD2Sel1 
    add wave -position end sim:/testbench/aBE 
    add wave -position end sim:/testbench/aBT 
    add wave -position end sim:/testbench/aZERO

   
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