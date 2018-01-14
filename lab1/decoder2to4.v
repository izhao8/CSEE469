module decoder2to4 (in, out, en);
	output wire [3:0] out;

	input en;
	input [1:0] in;

	if(en) begin
		assign out[3] = in[0] & in[1];
		assign out[2] = in[0] & ~in[1];
		assign out[1] = ~in[0] & in[1];
		assign out[0] = ~in[0] & ~in[1];
	end
endmodule