`timescale 1ns / 1ps

module EXMEM_tb;

  reg clock;
  reg enable;
  reg [31:0] iIR, iPC, iResult, iBranch, iJump;
  reg iZero, iRegWrite, iMemRead, iMemWrite, iMemToReg, iBranchs, iJumps;
  reg [4:0] iRegDest;
  wire [31:0] oIR, oPC, oResult, oBranch, oJump;
  wire oZero, oRegWrite, oMemRead, oMemWrite, oMemToReg, oBranchs, oJumps;
  wire [4:0] oRegDest;
  
  EXMEM uut (
    .clock(clock),
    .enable(enable),
    .iIR(iIR),
    .iPC(iPC),
    .iResult(iResult),
    .iBranch(iBranch),
    .iJump(iJump),
    .iZero(iZero),
    .iRegWrite(iRegWrite),
    .iMemRead(iMemRead),
    .iMemWrite(iMemWrite),
    .iMemToReg(iMemToReg),
    .iBranchs(iBranchs),
    .iJumps(iJumps),
    .iRegDest(iRegDest),
    .oIR(oIR),
    .oPC(oPC),
    .oResult(oResult),
    .oBranch(oBranch),
    .oJump(oJump),
    .oZero(oZero),
    .oRegWrite(oRegWrite),
    .oMemRead(oMemRead),
    .oMemWrite(oMemWrite),
    .oMemToReg(oMemToReg),
    .oBranchs(oBranchs),
    .oJumps(oJumps),
    .oRegDest(oRegDest)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, EXMEM_tb);

    // Initialize inputs
    clock = 0;
    enable = 0;
    iIR = 32'b0;
    iPC = 32'b0;
    iResult = 32'b0;
    iBranch = 32'b0;
    iJump = 32'b0;
    iZero = 0;
    iRegWrite = 0;
    iMemRead = 0;
    iMemWrite = 0;
    iMemToReg = 0;
    iBranchs = 0;
    iJumps = 0;
    iRegDest = 5'b0;

    // Apply input values
    #10;
    enable = 1;
    iIR = 32'b10101010101010101010101010101010;
    iPC = 32'b01010101010101010101010101010101;
    iResult = 32'b11110000111100001111000011110000;
    iBranch = 32'b11001100110011001100110011001100;
    iJump = 32'b00110011001100110011001100110011;
    iZero = 1;
    iRegWrite = 1;
    iMemRead = 1;
    iMemWrite = 1;
    iMemToReg = 1;
    iBranchs = 1;
    iJumps = 1;
    iRegDest = 5'b10101;

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
