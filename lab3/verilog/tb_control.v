`include "control.v"

module tb_control();
	wire [1:0] ALUOp;
	wire RegWrite, Reg2Loc, Branch, MemWrite, 
		MemtoReg, ALUSrc, MemRead;

	reg [10:0] instruct;

	control dut (instruct, Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	initial begin
		$dumpfile("control_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	initial begin
		instruct <= 11'b10101011000;
		#10;
		instruct <= 11'b11111000010;
		#10;
		instruct <= 11'b11111000000;
		#10;
		instruct <= 11'b10110100010;
		#10;					
		$stop;
	end

endmodule