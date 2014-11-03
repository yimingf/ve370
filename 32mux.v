module mux32 (result, dIn0, dIn1, selectD);
	output [31:0] result;
	input [31:0] dIn0, dIn1;
	input selectD;

	assign result = selectD ? dIn1 : dIn0;
endmodule
