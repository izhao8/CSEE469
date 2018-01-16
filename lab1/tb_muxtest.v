`include "muxtest.v"

module tb_muxtest();
	reg [31:0] in;
	reg [4:0] sel;

	wire out;

	muxtest dut (in, out, sel);

	initial begin
		$dumpfile("tb_multiplex.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	initial begin
		sel <= 5'd3;
		for (i = 0; i < 10; i = i + 1) begin
			in <= 32'd25 * i;
			#5;
		end

		$stop;
	end

endmodule