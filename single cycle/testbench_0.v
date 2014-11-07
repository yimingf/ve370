// by ccpizzadaisuki, modified 141107
`define CYCLE_TIME 200

module TestBench;

reg         clk;
integer     i, counter;

always #(`CYCLE_TIME/2) clk = ~clk;    

cpu cpu_sc(
    .clk  (clk)
);
  
initial begin
    // Initialize data memory
    for(i=0; i<32; i=i+1) begin
        cpu_sc.DataMem.mem[i] =32'b1;
    end    
       
    // initialize Register File
    for(i=0; i<32; i=i+1) begin
        cpu_sc.RegFile.register_file[i] = 32'b0;
    end
    counter = 0;
    clk = 0;
	 cpu_sc.rst=1;
end
  
always@(posedge clk) begin
    if(counter == 20)   
        $stop;
  /////////////////////////////////////////////
	 $display($time,,"PC=",cpu_sc.PC);
	 $display($time,,"rst=",cpu_sc.rst);
	  $display($time,,"IM=%b",cpu_sc.Instruction);
	  $display($time,,"ALUIN1=%b",cpu_sc.ALUControlIn);
	  $display($time,,"ALUIResult=%b",cpu_sc.ALUResult);
	   $display($time,,"ALUIOp=%b",cpu_sc.ALUOp);
	   $display($time,,"PC+4=",cpu_sc.PCPlusFour);
		$display($time,,"ALUIn1=",cpu_sc.ALUIn1);
		$display($time,,"AluIn2=",cpu_sc.ALUIn2);
		$display($time,,"WB=",cpu_sc.WB);
		$display($time,,"RDMem=",cpu_sc.RDMem);
		$display($time,,"MemWrite=",cpu_sc.MemWrite);
	////////////////////////////////////////////////
    $display($time,,"R0(r0) =%d, R8 (t0) =%b, R16(s0) =%d, R24(t8) =%d", cpu_sc.RegFile.register_file[0], cpu_sc.RegFile.register_file[8] , cpu_sc.RegFile.register_file[16], cpu_sc.RegFile.register_file[24]);
    $display($time,,"R1(at) =%d, R9 (t1) =%b, R17(s1) =%b, R25(t9) =%d", cpu_sc.RegFile.register_file[1], cpu_sc.RegFile.register_file[9] , cpu_sc.RegFile.register_file[17], cpu_sc.RegFile.register_file[25]);
    $display($time,,"R2(v0) =%d, R10(t2) =%d, R18(s2) =%b, R26(k0) =%d", cpu_sc.RegFile.register_file[2], cpu_sc.RegFile.register_file[10], cpu_sc.RegFile.register_file[18], cpu_sc.RegFile.register_file[26]);
    $display($time,,"R3(v1) =%d, R11(t3) =%d, R19(s3) =%d, R27(k1) =%d", cpu_sc.RegFile.register_file[3], cpu_sc.RegFile.register_file[11], cpu_sc.RegFile.register_file[19], cpu_sc.RegFile.register_file[27]);
    $display($time,,"R4(a0) =%d, R12(t4) =%d, R20(s4) =%d, R28(gp) =%d", cpu_sc.RegFile.register_file[4], cpu_sc.RegFile.register_file[12], cpu_sc.RegFile.register_file[20], cpu_sc.RegFile.register_file[28]);
    $display($time,,"R5(a1) =%d, R13(t5) =%d, R21(s5) =%d, R29(sp) =%d", cpu_sc.RegFile.register_file[5], cpu_sc.RegFile.register_file[13], cpu_sc.RegFile.register_file[21], cpu_sc.RegFile.register_file[29]);
    $display($time,,"R6(a2) =%d, R14(t6) =%d, R22(s6) =%d, R30(s8) =%d", cpu_sc.RegFile.register_file[6], cpu_sc.RegFile.register_file[14], cpu_sc.RegFile.register_file[22], cpu_sc.RegFile.register_file[30]);
    $display($time,,"R7(a3) =%d, R15(t7) =%d, R23(s7) =%d, R31(ra) =%d", cpu_sc.RegFile.register_file[7], cpu_sc.RegFile.register_file[15], cpu_sc.RegFile.register_file[23], cpu_sc.RegFile.register_file[31]);

    // print Data Memory
    $display($time,,"Data mem.: 0x00 =%x", {cpu_sc.DataMem.mem[3] , cpu_sc.DataMem.mem[2] , cpu_sc.DataMem.mem[1] , cpu_sc.DataMem.mem[0] });
    $display($time,,"Data mem.: 0x04 =%x", {cpu_sc.DataMem.mem[7] , cpu_sc.DataMem.mem[6] , cpu_sc.DataMem.mem[5] , cpu_sc.DataMem.mem[4] });
    $display($time,,"Data mem.: 0x08 =%x", {cpu_sc.DataMem.mem[11], cpu_sc.DataMem.mem[10], cpu_sc.DataMem.mem[9] , cpu_sc.DataMem.mem[8] });
    $display($time,,"Data mem.: 0x0c =%x", {cpu_sc.DataMem.mem[15], cpu_sc.DataMem.mem[14], cpu_sc.DataMem.mem[13], cpu_sc.DataMem.mem[12]});
    $display($time,,"Data mem.: 0x10 =%x", {cpu_sc.DataMem.mem[19], cpu_sc.DataMem.mem[18], cpu_sc.DataMem.mem[17], cpu_sc.DataMem.mem[16]});
    $display($time,,"Data mem.: 0x14 =%x", {cpu_sc.DataMem.mem[23], cpu_sc.DataMem.mem[22], cpu_sc.DataMem.mem[21], cpu_sc.DataMem.mem[20]});
    $display($time,,"Data mem.: 0x18 =%x", {cpu_sc.DataMem.mem[27], cpu_sc.DataMem.mem[26], cpu_sc.DataMem.mem[25], cpu_sc.DataMem.mem[24]});
    $display($time,,"Data mem.: 0x1c =%x", {cpu_sc.DataMem.mem[31], cpu_sc.DataMem.mem[30], cpu_sc.DataMem.mem[29], cpu_sc.DataMem.mem[28]});
	
    $fdisplay("\n");
    
    counter = counter + 1;
end

  
endmodule