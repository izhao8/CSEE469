`timescale 1ns/10ps

module forwardUnit(forA, forB, Rn, Rm, EXmemrd, MEMwbrd, memWB, exWB);
	output reg [1:0] forA, forB;
	
	input [4:0] Rn, Rm, EXmemrd, MEMwbrd;
	input [1:0] memWB, exWB;
	
	logic en0, checkA, checkB, en1;
	
	assign en0 = exWB[1] & (EXmemrd != 31);
	assign en1 = memWB[1] & (MEMwbrd != 31);
	assign checkA = ~(exWB[1] && (EXmemrd != 31) && (MEMwbrd != Rn));
	assign checkB = ~(exWB[1] && (EXmemrd != 31) && (MEMwbrd != Rm));
	
	always_comb begin
		//control for data 1
		if (en0 && (EXmemrd == Rn)) begin
			forA = 2'b10;
		end
		else if (en1 && (MEMwbrd == Rn) && checkA) begin
			forA = 2'b01;
		end
		
		else begin
			forA = 0;
		end
		
		//control for data 2
		if (en0 && (EXmemrd == Rm)) begin
			forB = 2'b10;
		end
		else if (en1 && (MEMwbrd == Rm) && checkB) begin
			forB = 2'b01;
		end	
		else begin
			forB = 0;
		end
	end

endmodule