<<<<<<< HEAD
module relaAdrsShifter(result, dataIn);
	input [31:0] dataIn;
	output [31:0] result;
	assign result = dataIn * 4;
	// one component for branch, output relative address * 4;
=======
module relaAdrsShifter(resultd, dataIn);
	input [31:0] dataIn;
	output [31:0] resultd;
	assign resultd = dataIn * 4;
>>>>>>> 14f980056707609f192789c3457eade4c2ae4280
endmodule