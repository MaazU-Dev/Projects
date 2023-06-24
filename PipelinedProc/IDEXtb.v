`timescale 1ns / 1ps

module IDEX_tb;

  reg clock;
  reg enable;
  reg [31:0] iIR, iA, iB, iBranch, iJump;
  reg [3:0] iPC, iALUCtrl, iRegDest;
  reg iRegDests, iRegWrite, iALUSrc, iMemRead, iMemWrite, iMemToReg, iBranchs, iJumps;
  reg [31:0] iNextInstr;
  wire [31:0] oIR, oA, oB, oBranch, oJump;
  wire [3:0] oPC, oALUCtrl, oRegDest;
  wire oRegDests, oRegWrite, oALUSrc, oMemRead, oMemWrite, oMemToReg, oBranchs, oJumps;
  wire [31:0] oNextInstr;
  
  IDEX uut (
    .clock(clock),
    .iRegDests(iRegDests),
    .iRegWrite(iRegWrite),
    .iALUSrc(iALUSrc),
    .iMemRead(iMemRead),
    .iMemWrite(iMemWrite),
    .iMemToReg(iMemToReg),
    .iBranchs(iBranchs),
    .iJumps(iJumps),
    .iALUCtrl(iALUCtrl),
    .iIR(iIR),
    .iNextInstr(iNextInstr),
    .iPC(iPC),
    .iA(iA),
    .iB(iB),
    .iRegDest(iRegDest),
    .iBranch(iBranch),
    .iJump(iJump),
    .oRegDests(oRegDests),
    .oRegWrite(oRegWrite),
    .oALUSrc(oALUSrc),
    .oMemRead(oMemRead),
    .oMemWrite(oMemWrite),
    .oMemToReg(oMemToReg),
    .oBranchs(oBranchs),
    .oJumps(oJumps),
    .oALUCtrl(oALUCtrl),
    .oPC(oPC),
    .oA(oA),
    .oB(oB),
    .oRegDest(oRegDest),
    .oBranch(oBranch),
    .oJump(oJump),
    .oIR(oIR),
    .oNextInstr(oNextInstr),
    .enable(enable)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, IDEX_tb);

    // Initialize inputs
    clock = 0;
    enable = 0;
    iIR = 32'b0;
    iA = 32'b0;
    iB = 32'b0;
    iBranch = 32'b0;
    iJump = 32'b0;
    iPC = 4'b0;
    iALUCtrl = 4'b0;
    iRegDest = 5'b0;
    iRegDests = 0;
    iRegWrite = 0;
    iALUSrc = 0;
    iMemRead = 0;
    iMemWrite = 0;
    iMemToReg = 0;
    iBranchs = 0;
    iJumps = 0;
    iNextInstr = 32'b0;

    // Apply input values
    #10;
    enable = 1;
    iIR = 32'b10101010101010101010101010101010;
    iA = 32'b01010101010101010101010101010101;
    iB = 32'b11110000111100001111000011110000;
    iBranch = 32'b11001100110011001100110011001100;
    iJump = 32'b00110011001100110011001100110011;
    iPC = 4'b0101;
    iALUCtrl = 4'b1010;
    iRegDest = 5'b10101;
    iRegDests = 1;
    iRegWrite = 1;
    iALUSrc = 1;
    iMemRead = 1;
    iMemWrite = 1;
    iMemToReg = 1;
    iBranchs = 1;
    iJumps = 1;
    iNextInstr = 32'b01010101010101010101010101010101;

    #20;

    // Disable the module 
    enable = 0;

    // Finish the simulation
    #10;
    $finish;
  end
  
  // Toggle clock
  always #5 clock = ~clock;

endmodule
