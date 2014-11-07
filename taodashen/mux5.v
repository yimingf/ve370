
module mux5 (result, dIn0, dIn1, selectd);
	output [4:0] result;
	input [4:0] dIn0, dIn1;
	input selectd;

	assign result = selectd ? dIn1 : dIn0;
endmodule

