`timescale 1ns/10ps

module controlMUX(sel, WB, M, EX, wb, m, ex);
	output reg [1:0] wb;
	output reg [3:0] m;
	output reg [5:0] ex;
	
	input [1:0] WB;
	input [3:0] M;
	input [5:0] EX;
	input sel;
	
	always_comb begin
		if (sel) begin
			wb = WB;
			m = M;
			ex = EX;
		end
		else begin
			wb = 0;
			m = 0;
			ex = 0;
		end
	end
endmodule