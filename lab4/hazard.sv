`timescale 1ns/10ps

module hazard(PCwrite, IfIdwrite, csel, exflush, Rn, Rm, IdExRn, memRead, clk);
	output reg IfIdwrite, PCwrite, csel, exflush;
	
	input [4:0] Rn, Rm, IdExRn;
	input memRead, clk;
	
	logic check;
	
	assign check = (IdExRn == Rn) | (IdExRn == Rm);
	
	always_ff @(posedge clk) begin
		if (check && memRead) begin
			IfIdwrite = 1;
			PCwrite = 0;
			csel = 0;
			exflush = 0;
		end
		else begin
			IfIdwrite = 1;
			PCwrite = 1;
			csel = 1;
			exflush = 1;
		end
	end

endmodule