module relaAdrsShifter(result, dataIn);
	input [31:0] dataIn;
	output [31:0] result;
	assign result = dataIn * 4;
endmodule