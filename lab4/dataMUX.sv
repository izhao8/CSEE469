`timescale 1ns/10ps

module dataMUX (data, result, regData, out, sel);
	output reg [63:0] out;
	
	input [63:0] data, result, regData;
	input [1:0] sel;
	
	always_comb begin
		if (sel == 2'b01) out = data;
		else if (sel == 2'b10) out = result;
		else out = regData;
	end

endmodule