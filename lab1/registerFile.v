`include "multiplex.v"
`include "decoder.v"
`include "register.v"

module registerFile (data, DRA, DRB, RA, RB, RW, en, clk, reset);
	
	output [63:0] DRA, DRB;
	input [63:0] data;
	input [4:0] RA, RB, RW;
	input en, clk, reset;

	wire [31:0] wr;
	wire [63:0] outwr;

	decoder start (.in(RW), .out(wr), .en(en));

	generate
		genvar i;
		for (i = 0; i < 32: i = i + 1'b1) begin
			register set (.in(data), .out(outwr), .en(en), .reset(reset), .clk(clk));
		end
	endgenerate

	multiplex one (.in(outwr), .out(DRA), .read(RA), .clk(clk), .reset(reset));
	multiplex two (.in(outwr), .out(DRB), .read(RB), .clk(clk), .reset(reset));

endmodule