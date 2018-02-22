`timescale 1ns/10ps

module hazard(PCwrite, IfIdwrite, csel, Rn, Rm, IdExRn, memRead);
	output IfIdwrite, PCwrite, csel;
	
	input [4:0] Rn, Rm, IdExRn;
	input memRead;
	
	logic check;
	
	assign check = (IdExRn = Rn) | (IdExRn = Rm);
	
	always_comb begin
		if (memRead && check) begin
			IfIdwrite = 0;
			PCwrite = 0;
			csel = 0;
		end
		else begin
			IfIdwrite = 1;
			PCwrite = 1;
			csel = 1;
		end
	end

endmodule