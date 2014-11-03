module PCadder(result, oldPC);
	input [31:0] oldPC;
	output [31:0] result;
	assign result = oldPC + 4;
endmodule
