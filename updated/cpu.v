`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:18 11/07/2014 
// Design Name: 
// Module Name:    cpu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cpu(clk);
input clk;
wire [31:0]Instruction, ALUIn1, ALUIn2, PCPlusFour, JumpAddress, BranchShift, BranchPC, MM, NewPC, PC_IM, Extended, RD2, ALUResult, RDMem;
wire [4:0]Wrf;
wire IfBranch, RegDst, Branch, Jump, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Sign, Zero;
wire [1:0]ALUOp;
wire [3:0]ALUControlIn;

reg [31:0]PC;

jumpShifter jumpshifter (JumpAddress, Instruction[25:0], PCPlusFour);
and(IfBranch, Branch, Zero);
PCadder pcadder(PC_IM, PCPlusFour);
im instr(Instruction,clk, PC_IM);
control1 control(RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWirite, ALUSrc, RegWrite, Sign, Instruction);
mux5 MUX1(Wrf, Instruction[20:16], Instruction[15:11], RegDst);
rf_32 RegFile(ALUIn1, RD2, Instruction[25:21], Instruction[20:16], Wrf, WB, RegWrite, clk);
signExt Extension(Extended, Instruction[15:0], Sign);
relaAdrsShifter offset (BranchShift, Extended);
aluAdder PC_add_Offset(BranchPC, PCPlusFour, BranchShift);
mux32 MUX2(ALUIn2, RD2, Extended, ALUSrc);
ALUcontrol1 alucontrol (ALUControlIn, ALUOp, Instruction);
alu ALU(ALUResult, Zero, ALUControlIn,ALUIn1, ALUIn2);
mux32 MUX3 (MM, PCPlusFour, BranchPC, IfBranch);
dm DataMem(RDMem, clk, ALUResult, MemRead, MemWrite, RD2);
mux32 MUX5 (WB, ALUResult, RDMem);

always @(posedge clk)begin
if (Jump) PC = JumpAddress;
else PC = MM;
end
endmodule
