`timescale 1ns / 1ps

module BranchComputationtb;

  reg [31:0] nextInstr;
  reg [31:0] signExtOffset;
  wire [31:0] branchAddress;
  
  BranchComputation uut (
    .nextInstr(nextInstr),
    .signExtOffset(signExtOffset),
    .branchAddress(branchAddress)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, BranchComputationtb);

    // Initialize inputs
    nextInstr = 32'b0;
    signExtOffset = 32'b0;

    // Apply input values
    #10;
    nextInstr = 100;
    signExtOffset = 512;

    #20;

    // Finish the simulation
    #10;
    $finish;
  end

endmodule


