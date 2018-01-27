`include "complement.v"

module tb_complement();
	wire [63:0] out;

	reg [63:0] in;
	reg en;

	complement dut(in, out, en);

	initial begin
		$dumpfile("complement_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i, j;
	initial begin
		en <= 1;
		for (i = 0; i < 10; i = i + 1) begin
			in <= i * 64'd1235312;
			#5;
		end
		en <= 0;
		for (j = 0; j < 10; j = j + 1) begin
			in <= j * 64'd1235312;
			#5;
		end
		$stop;
	end
endmodule