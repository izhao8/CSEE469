`timescale 1ns/10ps

module forwardUnit(forA, forB, Rn, Rm, regRd, EXmemrd, MEMwbrd, memWB, exWB);
	output [1:0] forA, forb;
	
	input [4:0] Rn, Rm, EXmemrd, MEMwbrd;
	input [1:0] memWB, exWB;
	
	logic en, checkA, checkB;
	
	assign en = memWB[1] & (MEMwbrd != 31);
	assign checkA = (EXmemrd != Rn) | (exWB[1] = 0);
	assign checkB = (EXmemrd != Rm) | (exWB[1] = 0);
	
	always_comb begin
		//control for data 1
		if (en && (MEMwbrd == Rn) && checkA);
			forA = 2'b10;
		else if (en && (MEMwbrd == Rm) && checkB)
			forA = 2'b01;
		else 
			forA = 0;
		//control for data 2
		if (en && (MEMwbrd == Rm) && checkB);
			forB = 2'b10;
		else if (en && (MEMwbrd == Rn) && checkA)
			forA = 2'b01;
		else 
			forA = 0;
	end

endmodule