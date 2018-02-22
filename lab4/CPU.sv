`timescale 1ns/10ps

module CPU (clk, reset);
	logic [63:0] addr;
	logic [63:0] PCaddr, pc;
	logic [31:0] instruction;
	logic RegWrite, Reg2Loc, Branch, MemWrite, 
			MemtoReg, MemRead, PCsr, UncondB, negwire, reggin;
	logic negative, zero, overflow, carry_out, B, Blt, Bout;
	logic [4:0] Read2;
	logic [1:0] ALUOp;
	logic [2:0] ALUSrc;
	logic [63:0] ReadData1, ReadData2, WriteData, Extend, alusrc, 
						result, dataread, addi, condB, uncondB, ldst;
	logic [3:0] control;		
	input logic clk, reset;
	
	//Branch signals 
	and #50 (B, zero, Branch); //B and CBZ
	and #50 (Blt, Branch, negwire); //B.LT
	mux2to1 sel2 (Blt, B, PCsr, Bout);
	lsl shift (jump0, PCaddr);
	
	//Main control and ALU control signal modules
	logic [1:0] WB0;
	logic [2:0] M0;
	logic [6:0] EX0;
	logic csel;
	
	control signals (instructOUT[31:21], Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, UncondB, Bout);			
	ALUcontrol signal (instruction[31:21], ALUOp, control); //change instruction input with ID/EX output
	controlMUX stall0 (csel, {regWrite, MemtoReg}, {MemWrite, MemRead, Branch}, 
							{ALUOp, ALUSrc}, WB0, M0, EX0);
	
	//Unconditional Branching
	generate
		genvar l;
		for (l = 0; l < 64; l++) begin : branc
			mux2to1 Bcond (Extend[l], uncondB[l], condB[l], UncondB); //For Branching
		end
	endgenerate 
	
	//Program counter and instruction modules
	assign pc = PCaddr + instructPC1;
	logic [64:0] t0; //temp in programCounter output
	programCounter grabAddr (pc, PCsr, addr, clk, reset, t0);
	instructmem instruc (addr, instruction, clk);
	
	/* IF/ID register goes between here BEGIN */
	logic [31:0] instructOUT;
	logic [63:0] instructPC0;
	logic ifidwrite, flush;
	
	regIfId IFnID (instruction, flush, ifidwrite, t0, instructOUT, instructPC0, clk);
	
	/* IF/ID register goes between here END */
	
	
	//Register input decider
	generate
		genvar i;
		for (i = 0; i < 5; i++) begin : RB
			mux2to1 sel0 (instructOUT[i], instructOUT[i+16], Read2[i], Reg2Loc);
		end
	endgenerate
	
	//Register module
	regfile reading (instructOUT[9:5], Read2, WriteData, ReadData1, ReadData2,
							instructOUT[4:0], RegWrite, clk);
	
	//Sign Extending module for multiple instructions using parameters
	signExtend #(.width(26)) extend (instructOUT[25:0], Extend); //Branching
	signExtend0 #(.width(12)) addI (instructOUT[21:10], addi); //for ADDI instruction
	signExtend #(.width(19)) cond (instructOUT[23:5], uncondB); //Uncond Branching
	signExtend #(.width(9)) ldurstur (instructOUT[20:12], ldst); //LDUR and STUR

	/* ID/EX register goes between here BEGIN	*/
	logic [1:0] WB1;
	logic [2:0] M1;
	logic [63:0] jump0, instructPC1, A, B;
	logic [10:0] OP0;
	logic [4:0] dest0
	
	//module regExId (WB, M, EX, PC, A, B, Branch, OP, Rd, Ao, Bo, Opout, 
					//Rdout, jump, pc, clk,);
	
	regExId IDnEX (WB0, M0, EX0, ReadData1, ReadData2, condB, instructOUT[31:21], 
						instructOUT[4:0], A, B, OP0, dest0, jump0, instructPC1, clk);
	/* ID/EX register goes between here END */
	
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
		else if (ALUSrc == 3'b100)
			alusrc <=ldst;
		else 
			alusrc <= ReadData2;
	end
	
	alu magic (ReadData1, alusrc, control, result, negative, zero, overflow, carry_out, instruction[15:10]); 
	
	//Stores negative flag for B.LT
	mux2to1 choose ((negative & ~overflow), negwire, reggin, (control == 4'b011));
	D_FF negFlag (negwire, reggin, 1'b0, clk);
	
	/* EX/MEM register goes between here BEGIN */
	
	
	/* EX/MEM register goes between here END */
	
	datamem data (result, MemWrite, MemRead, ReadData2, clk, 4'd8, dataread);
	
	/* MEM/WB register goes between here BEGIN */
	
	
	/* MEM/WB register goes between here END */
	
	//data mux
	generate
		genvar k;
		for (k = 0; k < 64; k++) begin : readata
			mux2to1 sel2 (dataread[k], result[k], WriteData[k], MemtoReg);
		end
	endgenerate
	
endmodule




module CPU_testbench();
	logic clk, reset;
	
	CPU dut (clk, reset);
	
	parameter clocks = 1500;
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