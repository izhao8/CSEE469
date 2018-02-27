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
	logic [1:0] WB0;
	logic [3:0] M0;
	logic [5:0] EX0;
	logic csel;
	logic [31:0] instructOUT;
	logic [63:0] instructPC0;
	logic ifidwrite, flush;
	logic [63:0] exto;
	logic [1:0] WB1;
	logic [3:0] M1;
	logic [63:0] exto0, A, Bother;
	logic [10:0] OP0;
	logic [4:0] Rd0, Rn0, Rm0;
	logic [1:0] aluop0; 
	logic [2:0] alusrc0;
	logic RegDst;
	logic [1:0] forA, forB;
	logic [63:0] F1, F2, t0;
	logic [1:0] WB2;
	logic [4:0] Rd1;
	logic [63:0] result0, B0;
	logic zout, MemWrite0, MemRead0, branch0;
	logic [4:0] Rd2;
	logic [63:0] result1, data0;
	logic RegWrite0, MemtoReg0, bout0;
	
	//Branch signals 
	and #50 (B, zero, Branch); //B and CBZ
	and #50 (Blt, Branch, negwire); //B.LT
	mux2to1 sel2 (Blt, B, PCsr, Bout);
	lsl shift (condB, PCaddr);
	
	/* HAZARD MODULE */
	logic PCen;
	hazard safe (PCen, ifidwrite, csel, instructOUT[9:5], instructOUT[20:16], Rd0, M0[1]);
	/* HAZARD MODULE */	
	
	//Main control and ALU control signal modules
//	logic [1:0] WB0;
//	logic [2:0] M0;
//	logic [5:0] EX0;
//	logic csel;
	
	control signals (instructOUT[31:21], Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, UncondB, Bout);			
	ALUcontrol signal (OP0, aluop0, control); //change instruction input with ID/EX output
	controlMUX stall0 (csel, {RegWrite, MemtoReg}, {MemWrite, MemRead, Branch, Bout}, //csel --> 1
							{ALUOp, ALUSrc, Reg2Loc}, WB0, M0, EX0);
	
	//Unconditional Branching
	generate
		genvar l;
		for (l = 0; l < 64; l++) begin : branc
			mux2to1 Bcond (Extend[l], uncondB[l], condB[l], UncondB); //For Branching
		end
	endgenerate 
	
	//Program counter and instruction modules
	assign pc = PCaddr + instructPC0;
	// logic [63:0] t0; //temp in programCounter output
	programCounter grabAddr (pc, PCsr, addr, clk, reset, t0, PCen); //PCen --> 1; PCsr --> Branch
	instructmem instruc (addr, instruction, clk);
	
	/* IF/ID register goes between here BEGIN */
//	logic [31:0] instructOUT;
//	logic [63:0] instructPC0;
//	logic ifidwrite, flush;
	
	assign flush = (ReadData1 == ReadData2);
	regIdIf IFnID (instruction, flush, ifidwrite, t0, instructOUT, instructPC0, clk); //ifidwrite -> 1
	
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
							Rd2, RegWrite0, clk);
	
	//Sign Extending module for multiple instructions using parameters
	signExtend #(.width(26)) extend (instructOUT[25:0], Extend); //Branching
	signExtend0 #(.width(12)) addI (instructOUT[21:10], addi); //for ADDI instruction
	signExtend #(.width(19)) cond (instructOUT[23:5], uncondB); //Uncond Branching
	signExtend #(.width(9)) ldurstur (instructOUT[20:12], ldst); //LDUR and STUR
	
//	logic [63:0] exto;
	always_comb begin
		if (instructOUT[31:21] >= 1160 && instructOUT[31:21] <= 1161) begin //ADDI
			exto = addi;
		end
		// else if (instructOUT[31:21] >= 672 && instructOUT[31:21] <= 679) begin //B.LT
		// 	exto = uncondB;
		// end
		// else if (instructOUT[31:21] >= 160 && instructOUT[31:21] <= 191) begin
		// 	exto = Extend;
		// end
		else 
			exto = ldst;
	end
	
	/* ID/EX register goes between here BEGIN	*/
//	logic [1:0] WB1;
//	logic [2:0] M1;
//	logic [63:0] exto0, A, Bother;
//	logic [10:0] OP0;
//	logic [4:0] Rd0, Rn0, Rm0;
//	logic [1:0] aluop0; 
//	logic [2:0] alusrc0;
//	logic RegDst; 
	
	/* (WB, M, EX, A, B, ADDI,  Rd, Ao, Bo, 
					Rdout, addIO, clk, Rn, Rm, Rno, Rmo, wb, m, Reg2Loc,
					ALUOp, ALUSrc, OP, Opout) */
	
	regExId IDnEX (WB0, M0, EX0, ReadData1, ReadData2, exto, instructOUT[4:0], A, Bother, 
						Rd0, exto0, clk, instructOUT[9:5], Read2, Rn0, Rm0, WB1,
						M1, RegDst, aluop0, alusrc0, instructOUT[31:21], OP0);
	/* ID/EX register goes between here END */
	
	/* FORWARDING UNIT */
//	logic [1:0] forA, forB;
//	logic [63:0] F1, F2;
	
	forwardUnit forward (forA, forB, Rn0, Rm0, Rd1, Rd2, WB2, WB1);
	dataMUX consider0 (WriteData, result0, A, F1, forA); //A
	dataMUX consider1 (WriteData, result0, Bother, F2, forB); //Bother
	/* FORWARDING UNIT */
	
	//ALU input decider
	always_comb begin
		if(reset)
			alusrc = 0;
		else if (alusrc0 == 3'b010)
			alusrc = exto0;
		else if (alusrc0 == 3'b001)
			alusrc = 64'b0;
		else if (alusrc0 == 3'b011)
			alusrc = uncondB;
		else if (alusrc0 == 3'b100)
			alusrc = exto0;
		else 
			alusrc = F2;
	end
	
	alu magic (F1, alusrc, control, result, negative, zero, overflow, carry_out, instructOUT[15:10]); 
	
	//Stores negative flag for B.LT
	mux2to1 choose ((neg & ~of), negwire, reggin, (control == 4'b011));
	D_FF negFlag (negwire, reggin, 1'b0, clk);
	
	/* EX/MEM register goes between here BEGIN */
//	logic [1:0] WB2;
//	logic [4:0] Rd1;
//	logic [63:0] result0, B0;
//	logic zout, MemWrite0, MemRead0, branch0;
						
	regExMem ExnMem (WB1, M1, zero, result, Bother, result0, B0, zout, Rd0, Rd1, WB2, 
							MemWrite0, MemRead0, branch0, clk, bout0);
	
	/* EX/MEM register goes between here END */
	
	datamem data (result0, MemWrite0, MemRead0, B0, clk, 4'd8, dataread);
	
	/* MEM/WB register goes between here BEGIN */
//	logic [4:0] Rd2;
//	logic [63:0] result1, data0;
//	logic RegWrite0, MemtoReg0;
	
	regMemWb MEMnWB (WB2, dataread, result0, Rd1, Rd2, RegWrite0, MemtoReg0, result1, data0, clk);
	
	/* MEM/WB register goes between here END */
	
	//data mux
	generate
		genvar k;
		for (k = 0; k < 64; k++) begin : readata
			mux2to1 sel2 (data0[k], result1[k], WriteData[k], MemtoReg0);
		end
	endgenerate
	
endmodule




module CPU_testbench();
	logic clk, reset;
	
	CPU dut (clk, reset);
	
	parameter clocks = 120;
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