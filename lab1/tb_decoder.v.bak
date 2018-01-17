`include "decoder.v"

module tb_decoder ();
	reg [4:0] in;
	reg en;
	wire [31:0] out;
	
	decoder dut (.in(in), .out(out), .en(en));

	initial begin
		$dumpfile("tb_decoder.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	initial begin
		$display("cycles through all possible 32 outputs");
		en <= 1;
		for (i = 0; i < 32; i = i + 1) begin
			in <= i; #10; #10;
		end
		$stop;
	end

endmodule