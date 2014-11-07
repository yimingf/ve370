<<<<<<< HEAD
module aluAdder(result, pcFour, relaAddress);
	input [31:0] pcFour, relaAddress;
	output [31:0] result;
	assign result = pcFour + relaAddress;
	// for branch, if branch, new pc = result.
endmodule
=======
module aluAdder(resultd, pcFour, relaAddress);
	input [31:0] pcFour, relaAddress;
	output [31:0] resultd;
	assign resultd = pcFour + relaAddress;
endmodule
>>>>>>> 14f980056707609f192789c3457eade4c2ae4280
