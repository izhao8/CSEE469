## CS/EE 469 LAB PROJECTS

This repository holds the several projects done in the class CSEE 469. The labs will involve ARM assembly, Verilog, and C languages to program and develop the ARM microprocessor. Labs are compiled and simulated using Icarus Verilog before being imported into Quartus.

## LAB 1

This lab involves creating a 32 by 64 bit register file for the processor on a gate level structure. The project involves using D-flipfops, a 5:32 enabled decoder, and two large 32x64 bit to 64 multiplexors.

##LAB 2

This lab involves creating an ALU that will be used to by the register file made in the previous lab. The ALU takes in two 64 bit register addresses and 3 bit control signal, and outputs a single 64 bit signal along with carry out, overflow, zero, and negative flags. The ALU contains a ripple adder to compute both subtraction and addition, and a 5:1 mux that determines the 64 bit output signal.