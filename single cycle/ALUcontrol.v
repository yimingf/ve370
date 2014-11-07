`timescale 1ns / 1ps
module ALUcontrol1(Operation,ALUop,instruction);
output wire [3:0]Operation;
input wire [1:0]ALUop;
input wire [31:0]instruction;
wire [5:0]funct;
assign funct[5:0]=instruction[5:0];
wire w1,w2,w3,w4,w5,w6,w7,w8;
//I use the disjucnctive normal form to define each control output
//I refer to the truth table in textbook page 318, figure 4.13 with my modification

//The disjuctive form of each operation
assign w1=((~ALUop[1])&(~ALUop[0]));
assign w2=((~ALUop[1])&(ALUop[0]));
assign w3=((ALUop[1])&(~ALUop[0])&(~funct[3])&(~funct[2])&(~funct[1])&(~funct[0]));
assign w4=((ALUop[1])&(~ALUop[0])&(~funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
assign w5=((ALUop[1])&(~ALUop[0])&(~funct[3])&(funct[2])&(~funct[1])&(~funct[0]));
assign w6=((ALUop[1])&(~ALUop[0])&(~funct[3])&(funct[2])&(~funct[1])&(funct[0]));
assign w7=((ALUop[1])&(~ALUop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
assign w8=((ALUop[1])&(ALUop[0]));//Used for andi
//Start defining the control output
assign Operation[3]=0;
assign Operation[2]=(w2|w4|w7);
assign Operation[1]=(w1|w2|w3|w4|w7);
assign Operation[0]=(w6|w7);
endmodule