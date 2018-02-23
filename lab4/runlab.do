# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
#vlog "./alustim.sv"
vlog "./alu.v"
vlog "./arithmetic.v"
vlog "./mux5to1.v"
vlog "./mux2to1.v"
vlog "./gatelogic.v"
vlog "./regstim.sv"
vlog "./register.v"
vlog "./regfile.sv"
vlog "./decoder.v"
vlog "./D_FF.v"
vlog "./multiplex.sv"
vlog "./CPU.sv"
vlog "./programCounter.v"
vlog "./control.v"
vlog "./ALUcontrol.v"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./math.sv"
vlog "./submodules.v"
vlog "./hazard.sv"
vlog "./regForwarding.sv"
vlog "./forwardUnit.sv"
vlog "./controlMUX.sv"
vlog "./dataMUX.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CPU_testbench
# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
