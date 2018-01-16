`include "multiplex.v"

module tb_multiplex();
	reg [4:0] read;
	reg [31:0][63:0] in;

	wire [63:0] out;

	multiplex dut (.in(in), .out(out), .read(read));

	initial begin
		$dumpfile("tb_multiplex.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	initial begin
		read <= 5'd9;
		for (i = 0; i < 32; i = i + 1) begin
			in[i] <= 64'h0000010204080001 * i;
		end
		#5
		in[1] <= 64'd123434;
		#5;
		in[1] <= 64'd4523;
		#5;		
		for (i = 0; i < 32; i = i + 1) begin
			in[i] <= i*64'h0000010204080001 + i;
		end
		$stop;
	end
endmodule