`include "multiplex.v"
`include "decoder.v"
`include "register.v"

module regfile (data, DRA, DRB, RA, RB, RW, en, clk);
	
	output [63:0] DRA, DRB;
	input [63:0] data;
	input [4:0] RA, RB, RW;
	input en, clk;

	wire [31:0] dec;
	wire [31:0][63:0] outwr;

	decoder start (.in(RW), .out(dec), .en(en));
	assign dec[31] = 1'b0;

	generate
		genvar i;
		for (i = 0; i < 31; i = i + 1'b1) begin
			register set (.in(data), .out(outwr[i]), .en(dec[i]), .clk(clk));
		end
	endgenerate

	multiplex one (.in(outwr), .out(DRA), .read(RA), .clk(clk), .reset(reset));
	multiplex two (.in(outwr), .out(DRB), .read(RB), .clk(clk), .reset(reset));

endmodule