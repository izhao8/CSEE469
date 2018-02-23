`timescale 1ns/10ps

module mux5to1 (ADD, AND, XOR, OR, B, MUL, LSL, LSR, out, sel);
	output reg [63:0] out;

	input [63:0] ADD, AND, XOR, OR, B, MUL, LSL, LSR;
	input [3:0] sel;

//	wire [2:0][63:0] t0;
//
//	generate
//		genvar i;
//		for (i = 0; i < 64; i = i + 1) begin : choose
//			mux2to1 ANDtoOR (OR[i], AND[i], t0[0][i], sel[0]);
//			mux2to1 XORsel (XOR[i], t0[0][i], t0[1][i], sel[1]);
//			mux2to1 BtoADD (ADD[i], B[i], t0[2][i], sel[1]);
//			mux2to1 finale (t0[1][i], t0[2][i], out[i], sel[2]);
//		end
//	endgenerate

	always @(*) begin
		case(sel)
			//previous control signals
			4'b0000: out = B;
			4'b0010: out = ADD;
			4'b0011: out = ADD;
			4'b0100: out = AND;
			4'b0101: out = OR;
			4'b0110: out = XOR;
			//new control signals
			4'b1000: out = MUL;
			4'b1001: out = LSL;
			4'b1010: out = LSR;
			default: out = out;
		endcase
	end

endmodule