module mux5 (result, dIn0, dIn1, selectD);
	output [4:0] result;
	input [4:0] dIn0, dIn1;
	input selectD;

	assign result = selectD ? dIn1 : dIn0;
endmodule
