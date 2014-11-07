`timescale 1ns / 1ps
// by ccpizzadaisuki, modified 141103
// partly copied from github.com/jmahler/mips-cpu/
// Instruction Memory(single cycle).

/*
 * im.v - instruction memory
 *
 * Given a 32-bit address the data is latched and driven
 * on the rising edge of the clock.
 *
 */

`ifndef _im
`define _im


module im(data, clk, addr);
	output wire [31:0] 	data;
	input wire			clk;
	input wire 	[31:0] 	addr;

	reg [31:0] Imemory [0:63];  // 32-bit memory with 64 entries
	reg [9:0] k;
	initial begin
		for (k = 0; k < 64; k = k+1) begin
			Imemory[k] = 32'b0;
		end
		
		Imemory[0] = 32'b00100000000010000000000000100000; //addi
		Imemory[1] = 32'b00100000000010010000000000110111; //addi
		Imemory[2] = 32'b00000001000010011000000000100000; //add
		Imemory[3] = 32'b00000001000010011000100000100010; //sub
		Imemory[4] = 32'b00000001000010011001000000100100; //and
		Imemory[5] = 32'b00000001000010011001100000100101; //or
		Imemory[6] = 32'b00000001000010011010000000101010; //slt
		Imemory[7] = 32'b00010010100000000000000000000110; //beq
		Imemory[8] = 32'b00000001000010010101000000100000; //add
		Imemory[9] = 32'b00000001010010010101000000100000; //add
		Imemory[10] = 32'b00000001010010000101100000100000; //add
		Imemory[11] = 32'b10001100000101010000000000000100; //lw
		Imemory[12] = 32'b00000001010101011010100000100000; //add
		Imemory[13] = 32'b00000010101010111011100000100000; //add
		Imemory[14] = 32'b10101100000101010000000000001000; //sw
		Imemory[15] = 32'b00001000000000000000000000000110; //j
	end
	assign data = Imemory[addr[7:2]][31:0];
endmodule


`endif

