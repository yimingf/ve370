<<<<<<< HEAD
module mux5 (result, dIn0, dIn1, selectD);
	output [4:0] result;
	input [4:0] dIn0, dIn1;
	input selectD;

	assign result = selectD ? dIn1 : dIn0;
endmodule
=======
module mux5 (result, dIn0, dIn1, selectd);
	output [4:0] result;
	input [4:0] dIn0, dIn1;
	input selectd;

	assign result = selectd ? dIn1 : dIn0;
endmodule
>>>>>>> 14f980056707609f192789c3457eade4c2ae4280
