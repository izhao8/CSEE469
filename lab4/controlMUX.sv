`timescale 1ns/10ps

module controlMUX(sel, WB, M, EX, wb, m, ex);
	output [1:0] wb;
	output [2:0] m;
	output [6:0] ex;
	
	input [1:0] WB;
	input [2:0] M;
	input [6:0] EX;
	
	if (sel) begin
		wb = WB;
		m = M;
		ex = EX;
	else
		wb = 0;
		m = 0;
		ex = 0;
		
	end
endmodule