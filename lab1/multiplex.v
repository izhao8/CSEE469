module multiplex (in, out, read);
	output [63:0] out;

	input [4:0] read;
	input [31:0][63:0] in;

	//assign out = in[read];
	wire [63:0][31:0] temp; 

	generate
		genvar i, j;
		for (i = 0; i < 64; i = i + 1) begin 
			for (j = 0; j < 32; j = j + 1) begin
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
		for (i = 0; i < 8; i = i + 1) begin
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

	assign temp[0] = in[0] & ~sel[0] & ~sel[1];
	assign temp[1] = in[1] & sel[0] & ~sel[1];
	assign temp[2] = in[2] & ~sel[0] & sel[1];
	assign temp[3] = in[3] & sel[0] & sel[1];

	assign out = temp[0] | temp[1] | temp[2] | temp[3];

endmodule


module mux2to1other (in, out, sel);
	output wire out;

	input [1:0] in;
	input sel;

	assign out = (in[1] & sel) | (in[0] & ~sel);
endmodule