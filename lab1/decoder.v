module decoder (in, out, en);
	output wire [31:0] out;

	input en;
	input [4:0] in;

	wire [3:0] dec;

	decoder2to4 first (.in(in[4:3]), .out(dec), .en(1'b1));

	decoder3to8 second (.in(in[2:0]), .out(out[7:0]), .en(dec[0]));
	decoder3to8 third (.in(in[2:0]), .out(out[15:8]), .en(dec[1]));
	decoder3to8 fourth (.in(in[2:0]), .out(out[23:16]), .en(dec[2]));
	decoder3to8 fifth (.in(in[2:0]), .out(out[31:24]), .en(dec[3]));
		
endmodule

module decoder3to8 (in, out, en);
	output wire [7:0] out;

	input en;
	input [2:0] in;

	assign out[0] = ~in[0] & ~in[1] & ~in[2] & en;
	assign out[1] = ~in[0] & ~in[1] & in[2] & en;
	assign out[2] = ~in[0] & in[1] & ~in[2] & en;
	assign out[3] = ~in[0] & in[1] & in[2] & en;
	assign out[4] = in[0] & ~in[1] & ~in[2] & en;
	assign out[5] = in[0] & ~in[1] & in[2] & en;
	assign out[6] = in[0] & in[1] & ~in[2] & en;
	assign out[7] = in[0] & in[1] & in[2] & en;
endmodule


module decoder2to4 (in, out, en);
	output wire [3:0] out;

	input en;
	input [1:0] in;

	assign out[3] = in[0] & in[1] & en;
	assign out[2] = in[0] & ~in[1] & en;
	assign out[1] = ~in[0] & in[1] & en;
	assign out[0] = ~in[0] & ~in[1] & en;
endmodule