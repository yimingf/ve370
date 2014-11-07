module aluAdder(resultd, pcFour, relaAddress);
	input [31:0] pcFour, relaAddress;
	output [31:0] resultd;
	assign resultd = pcFour + relaAddress;
endmodule