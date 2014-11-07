<<<<<<< HEAD
module signExt (result, dIn, sign);
	input [15:0] dIn;
	input sign;
	output [31:0] result;
	wire [31:0] result;
	
	assign result = (sign == 1 && dIn[15] == 1) ? {{16{1'b1}}, dIn[15:0]}:{{16{1'b0}}, dIn[15:0]};
=======
module signExt (resultd, dIn, sign);
	output wire [31:0] resultd;
	input [15:0] dIn;
	input sign;
	
	assign resultd = (sign && dIn[15] == 1) ? {16'b1111111111111111, dIn[15:0]}:{16'b0, dIn[15:0]};
>>>>>>> 14f980056707609f192789c3457eade4c2ae4280

endmodule
