`timescale 1ns/10ps

module CPU ();
	logic [63:0] addr;
	logic [63:0] PCaddr;
	logic [31:0] instruction;
	logic RegWrite, Reg2Loc, Branch, MemWrite, 
			MemtoReg, ALUSrc, MemRead, PCsr,
			negative, zero, overflow, carry_out;
			
	logic [4:0] Read2;
	logic [63:0] ReadData1, ReadData2, WriteData, Extend, alusrc, 
						result, dataread;
	logic [3:0] control;		
	logic clk, reset;
	
	and #50 (PCsr, zero, Branch);
	
	programCounter grabAddr (PCaddr, PCsr, addr, clk, reset);
	instructmem instruc (addr, instruction, clk);
	
	control signals (instruction[31:21], Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	ALUcontrol signal (instruction[31:21], ALUOp, control);
	
	lsl (instruction, addr);
	
	generate
		genvar i;
		for (i = 0; i < 5; i++) begin : RB
			mux2to1 sel0 (instruction[i], instruction[i+16], Read2, Reg2Loc);
		end
	endgenerate
	
	regfile reading (instruction[9:5], Read2, WriteData, ReadData1, ReadData2,
							instruction[4:0], RegWrite, clk);
							
	signExtend extend (instruction, Extend);
	
	generate
		genvar j;
		for (j = 0; j < 64; j++) begin : aluin
			mux2to1 sel1 (extend[i], ReadData2[i], alusrc[i], ALUSrc);
		end
	endgenerate
	
	alu magic (ReadData1, alusrc, control, result, negative, zero, overflow, carry_out); 
	
	datamem data (result, MemWrite, MemRead, ReadData2, clk, 4, dataread);
	
	generate
		genvar k;
		for (k = 0; k < 64; k++) begin : readata
			mux2to1 sel2 (dataread[i], result[i], WriteData, MemtoReg);
		end
	endgenerate
	
endmodule