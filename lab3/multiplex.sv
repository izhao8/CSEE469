`timescale 1ns/10ps
module multiplex (in, out, read);
	output [63:0] out;

	input [4:0] read;
	input [63:0] in [31:0];

	wire [31:0] temp[63:0]; 

	generate
		genvar i, j;
		for (i = 0; i < 64; i = i + 1) begin : loop1
			for (j = 0; j < 32; j = j + 1) begin : loop2
				assign temp[i][j] = in[j][i];
			end
			mux32to1 choose (.in(temp[i]), .out(out[i]), .sel(read));
		end
	endgenerate


endmodule


module mux32to1 (in, out, sel);
	output wire out;

	input [31:0] in;
	input [4:0] sel;

	wire [7:0] temp1;
	wire [1:0] temp2;

	generate
		genvar i;
		for (i = 0; i < 8; i = i + 1) begin : loop1
			mux4to1 base (.in(in[(i * 4) + 3: i * 4]), .out(temp1[i]), .sel(sel[1:0]));
		end
	endgenerate

	mux4to1 first (.in(temp1[3:0]), .out(temp2[0]), .sel(sel[3:2]));
	mux4to1 second (.in(temp1[7:4]), .out(temp2[1]), .sel(sel[3:2]));

	mux2to1other last (.in(temp2), .out(out), .sel(sel[4]));
endmodule


module mux4to1 (in, out, sel);
	output wire  out;

	input [3:0] in;
	input [1:0] sel;

	wire [3:0] temp;
	wire [1:0] rsel;

	not #50 rsel0 (rsel[0], sel[0]);
	not #50 rsel1 (rsel[1], sel[1]);

	and #50 temp0 (temp[0], in[0], rsel[0], rsel[1]);
	and #50 temp1 (temp[1], in[1], sel[0], rsel[1]);
	and #50 temp2 (temp[2], in[2], rsel[0], sel[1]);
	and #50 temp3 (temp[3], in[3], sel[0], sel[1]);

	or #50 out0 (out, temp[0], temp[1], temp[2], temp[3]);

endmodule


module mux2to1other (in, out, sel);
	output wire out;

	input [1:0] in;
	input sel;

	wire rsel;
	wire [1:0] con;

	not #50 rsel0 (rsel, sel);

	and #50 con0 (con[0], in[1], sel);
	and #50 con1 (con[1], in[0], rsel);

	or #50 out0 (out, con[0], con[1]);

endmodule