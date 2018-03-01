## CS/EE 469 LAB PROJECTS

This repository holds the several projects done in the class CSEE 469. The labs will involve ARM assembly, Verilog, and C languages to program and develop the ARM microprocessor. Labs are compiled and simulated using Icarus Verilog before being imported into Quartus.

## LAB 1

This lab involves creating a 32 by 64 bit register file for the processor on a gate level structure. The project involves using D-flipfops, a 5:32 enabled decoder, and two large 32x64 bit to 64 multiplexors.

##LAB 2

This lab involves creating an ALU that will be used to by the register file made in the previous lab. The ALU takes in two 64 bit register addresses and 3 bit control signal, and outputs a single 64 bit signal along with carry out, overflow, zero, and negative flags. The ALU contains a ripple adder to compute both subtraction and addition, and a 5:1 mux that determines the 64 bit output signal.

##LAB 3

This lab involves building a single-cycle CPU using the register file and the ALU built in the previous two labs. The instruction and memory modules were both given by the instructor. The entire CPU should be able to run multiple ARM instruction benchmarks labeled in the folder Benchmarks. These ARM instructions involve using condition and normal Branching, R-type arithmetic, loads and stores, and logical bit shifts. Some of the harder benchmarks involve running bubble sort and division instructions in multiple loops.

##LAB4

This lab involves pipelining the CPU built in the previous lab. The CPU is pipelined with 4 registers that stores data and control signals to pass along each pipeline. These pipelines are IF/ID, ID/EX, EX/MEM, and MEM/WB. All the same ARM instruction benchmarks that were ran in lab 3 are also used again in lab 4 with similar results. In addition, this pipelined CPU implements forwarding to avoid control and data hazards. A hazard, or stalling, unit was created, but never implemented due to how the ARM benchmarks were written.