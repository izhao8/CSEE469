`timescale 1ns/10ps

module CPU (clk, reset);
	logic [63:0] addr;
	logic [63:0] PCaddr;
	logic [31:0] instruction;
	logic RegWrite, Reg2Loc, Branch, MemWrite, 
			MemtoReg, MemRead, PCsr, UncondB, negwire, reggin;
	logic negative, zero, overflow, carry_out, B, Blt, Bout;
	logic [4:0] Read2;
	logic [1:0] ALUOp;
	logic [2:0] ALUSrc;
	logic [63:0] ReadData1, ReadData2, WriteData, Extend, alusrc, 
						result, dataread, addi, condB, uncondB;
	logic [3:0] control;		
	input logic clk, reset;
	
	//Branch signals 
	and #50 (B, zero, Branch); //B and CBZ
	and #50 (Blt, Branch, negwire); //B.LT
	mux2to1 sel2 (Blt, B, PCsr, Bout);
	lsl shift (condB, PCaddr);
	
	//Program counter and instruction modules
	programCounter grabAddr (PCaddr, PCsr, addr, clk, reset);
	instructmem instruc (addr, instruction, clk);
	
	//Main control and ALU control signal modules
	control signals (instruction[31:21], Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, UncondB, Bout);			
	ALUcontrol signal (instruction[31:21], ALUOp, control);
	
//	lsl shift (condB, PCaddr);
	
	//Register input decider
	generate
		genvar i;
		for (i = 0; i < 5; i++) begin : RB
			mux2to1 sel0 (instruction[i], instruction[i+16], Read2[i], Reg2Loc);
		end
	endgenerate
	
	//Register module
	regfile reading (instruction[9:5], Read2, WriteData, ReadData1, ReadData2,
							instruction[4:0], RegWrite, clk);
	
	//Sign Extending module for multiple instructions using parameters
	signExtend #(.width(26)) extend (instruction[25:0], Extend); //Branching
	signExtend #(.width(12)) addI (instruction[21:10], addi); //for ADDI instruction
	signExtend #(.width(19)) cond (instruction[23:5], uncondB); //Uncond Branching
	//signExtend #(.width(9)) ldurstur (instruction[20:12], ldst); //LDUR and STUR
	
	//Unconditional Branching
	generate
		genvar l;
		for (l = 0; l < 64; l++) begin : branc
			mux2to1 Bcond (Extend[l], uncondB[l], condB[l], UncondB); //For Branching
		end
	endgenerate 
	
	//ALUsrc mux
//	generate
//		genvar j;
//		for (j = 0; j < 64; j++) begin : aluin
//			mux2to1 sel1 (addi[j], ReadData2[j], alusrc[j], ALUSrc);
//		end
//	endgenerate

	//ALU input decider
	always_comb begin
		if(reset)
			alusrc <= 0;
		else if (ALUSrc == 3'b010)
			alusrc <= addi;
		else if (ALUSrc == 3'b001)
			alusrc <= 64'b0;
		else if (ALUSrc == 3'b011)
			alusrc <= uncondB;
//		else if (ALUSrc == 3'b100)
//			alusrc <= ldst;
		else 
			alusrc <= ReadData2;
	end
	
	alu magic (ReadData1, alusrc, control, result, negative, zero, overflow, carry_out, instruction[15:10]); 
	
	datamem data (result, MemWrite, MemRead, ReadData2, clk, 4'd8, dataread);
	
	//data mux
	generate
		genvar k;
		for (k = 0; k < 64; k++) begin : readata
			mux2to1 sel2 (dataread[k], result[k], WriteData[k], MemtoReg);
		end
	endgenerate
	
	//Stores negative flag for B.LT
	mux2to1 choose (negative, negwire, reggin, (control == 4'b011));
	D_FF negFlag (negwire, reggin, 1'b0, clk);
endmodule




module CPU_testbench();
	logic clk, reset;
	
	CPU dut (clk, reset);
	
	parameter clocks = 100;
	parameter ClockDelay = 50000;
	
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		
		for (i = 0; i < clocks; i++) begin	
			@(posedge clk);
		end
		$stop;
	end
endmodule