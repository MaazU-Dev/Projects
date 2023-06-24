`timescale 1ns / 1ps

module MainUwU (clk, rst, sw,  out);
  input clk, rst;
  output[7:0] out;
  input sw;
 
  //IF  
  wire [3:0] nextPCID;
  wire [31:0] instrWire;
  wire [31:0] nextInstrWire;
  wire [31:0] instrWireID;
  wire [31:0] nextInstrWireID;
  //ID
  wire [4:0] writeRegWire/*DestinationReg*/ /*writeRegWireWB*/ /*DestinationRegFromWB*/;
  wire[31:0] /*WBData,*/ readData1, readData2;
  wire [2:0]ALUOp;
  wire RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump; 
  wire[3:0] ALUCtrl;
  wire[31:0] outSignEXT;
  //EX 
  wire RegDestEX,RegWriteEX,ALUSrcEX,MemReadEX,MemWriteEX,MemToRegEX,BranchEX,JumpEX;
  wire [3:0]ALUCtrlEX;
  wire[31:0] instrWireEX, nextInstrWireEX, readData1EX,readData2EX, outSignEXTEX, jumpEX;
  wire[3:0] nextPCEX;
  wire[4:0] writeRegWireEX;  
  wire[31:0] ALUSrcOutput; 
  wire ZeroOut;
  wire[31:0] branchAddress;
  //MEM
  wire RegWriteMEM, MemReadMEM, MemWriteMEM, MemToRegMEM, BranchMEM, JumpMEM;
  wire[31:0] instrWireMEM, nextInstrWireMEM, readData2MEM, ALUResultMEM;
  wire[3:0] nextPCMEM;
  wire[4:0] writeRegWireMEM;
  wire[31:0] branchAddressMEM, jumpAddressMEM; //jumpAddressMEM
  wire ZeroOutMEM;
  //MEM
  wire branchEnable;
  wire[31:0] outputData;
  wire[31:0] PCAddress, loadIntoPC;
  wire RegWriteWB, MemToRegWB, JumpWB;
  wire[31:0] instrWireWB, outputDataWB, ALUResultWB;
  wire[4:0] writeRegWireWB;
  //WB
  wire[31:0] WBData;
  //Forwarding & stall
  wire IFID_write;
  wire PC_write;
  wire CU_Write;
  wire[31:0] ForwardedAResult, ForwardedBResult;
  wire[1:0] forwardA, forwardB;

  ForwardingUnit a2(RegWriteMEM, writeRegWireMEM, instrWireEX[25:21], instrWireEX[20:16], RegWriteWB, writeRegWireWB, forwardA, forwardB);
  HazardDetectionUnit m1(instrWireEX[20:16], instrWireID[25:21], instrWireID[20:16], MemReadEX, IFID_write, PC_write, CU_Write);

  //IF
  //PCAdder u4(1'b0, PC, nextPC);
  wire[3:0] nextPC;
  
  PCModule p400(clk,rst, PC_write,nextPC);
  
  InstrMem u0(1'b1, nextPC, finalPCAddress, branchEnable, JumpMEM, instrWire, nextInstrWire);

  IFID p1(clk,  nextPC, instrWire, nextInstrWire, nextPCID, instrWireID, nextInstrWireID, IFID_write);
  
  //ID
  //HazardDetectionUnit m1(instrWireEX[20:16], instrWireID[25:21], instrWireID[20:16], MemReadEX, IFID_write, PC_write, ControlU_Write);
  
  wire [27:0]nextPCJump;
  shiftLeftForJump u7(instrWireID[25:0],nextPCJump);
  
  wire [31:0] jumpAddress;
  jumpAddressJoin u20(nextInstrWireID[31:28],nextPCJump, jumpAddress);
	 
  controlUnit u1(clk,instrWireID[31:26],instrWireID[5:0], ALUOp,RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump,instrWireID, 1'b1);
  
  mux5b u10(RegDest, instrWireID[20:16], instrWireID[15:11], writeRegWire);
  
  RegFile u11(clk, rst, instrWireID[25:21], instrWireID[20:16], writeRegWireWB, WBData, RegWriteWB, readData1, readData2);/*ID*//*WB*/
  
  signExt u2(instrWireID[15:0],outSignEXT);
  
  ALUcontrol u13(clk,instrWireID[5:0],ALUOp,ALUCtrl);
  
  wire[31:0] jumpAddressEX;
  IDEX p2(clk,RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump,ALUCtrl,
  instrWireID, nextInstrWireID, nextPCID,readData1,readData2,writeRegWire,outSignEXT, jumpAddress,
  RegDestEX,RegWriteEX,ALUSrcEX,MemReadEX,MemWriteEX,MemToRegEX,BranchEX,JumpEX,ALUCtrlEX,
  instrWireEX, nextInstrWireEX, nextPCEX,readData1EX,readData2EX,writeRegWireEX,outSignEXTEX, jumpAddressEX, 1'b1);
   
  //EX
  mux32b u12(ALUSrcEX,readData2EX,outSignEXTEX,ALUSrcOutput);
 
  
  //ForwardingUnit a26(RegWriteMEM, writeRegWireMEM, instrWireEX[25:21], instrWireEX[20:16], RegWriteWB, writeRegWireWB, forwardA, forwardB);
  
  mux3x1 a1(forwardA, readData1EX, ALUResultMEM, WBData, ForwardedAResult);
  mux3x1 a69(forwardB, ALUSrcOutput, ALUResultMEM, WBData, ForwardedBResult);
  
  wire[31:0] ALUResult;
  //ALU u14(readData1EX, ALUSrcOutput, ALUCtrlEX, ALUResult, ZeroOut);
  ALU u14(ForwardedAResult, ForwardedBResult, ALUCtrlEX, ALUResult, ZeroOut);
 
  BranchComputation u69(nextInstrWireEX, outSignEXTEX, branchAddress);
  
  EXMEM p3(clk, RegWriteEX, MemReadEX, MemWriteEX, MemToRegEX, BranchEX, JumpEX, instrWireEX, nextInstrWireEX, nextPCEX, readData2EX, ALUResult, writeRegWireEX, branchAddress, jumpAddressEX, ZeroOut,
  RegWriteMEM, MemReadMEM, MemWriteMEM, MemToRegMEM, BranchMEM, JumpMEM, instrWireMEM, nextInstrWireMEM, nextPCMEM, readData2MEM, ALUResultMEM, writeRegWireMEM, branchAddressMEM, jumpAddressMEM, ZeroOutMEM, 1'b1);
  
  //MEM
  DataMem u15(MemReadMEM, MemWriteMEM, ALUResultMEM, readData2MEM, outputData);
 
  assign branchEnable = ZeroOutMEM & BranchMEM;
  
  mux32b u70(branchEnable, branchAddress, nextInstrWire/*MEM*/, PCAddress);
  
 // wire [31:0] finalPCAddress;
  mux32b u900(JumpMEM, PCAddress, jumpAddressMEM, finalPCAddress);
  
  //PCRegWrite u71(clk, PCAddress, loadIntoPC, 1'b1); //check PCRegWrite and loadIntoPC for branch 
 
  MEMWB p4(clk, RegWriteMEM, MemToRegMEM, JumpMEM, instrWireMEM, outputData, ALUResultMEM, writeRegWireMEM, 
  RegWriteWB, MemToRegWB, JumpWB, instrWireWB, outputDataWB, ALUResultWB, writeRegWireWB, 1'b1);
  
  //WB
  mux32b u73(MemToRegWB, ALUResult, outputData, WBData);
  
  assign out = sw ? nextPC : ALUResult[7:0];
  
 
  
endmodule
