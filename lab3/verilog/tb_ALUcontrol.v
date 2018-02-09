`include "ALUcontrol.v"

module tb_ALUcontrol();
	wire [3:0] out;

	reg [10:0] instruct;
	reg [1:0] Op;

	ALUcontrol dut (instruct, Op, out);

	initial begin
		$dumpfile("ALUcontrol_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i, j;
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			Op <= i;
			instruct <= 11'b1xx0101x000;
			#5;
			instruct <= 11'b11111000010;
			#5;
			instruct <= 11'b11111000000;
			#5;
			instruct <= 11'b10110100xxx;
			#5;	
		end		
		$stop;
	end
endmodule