`timescale 1ns / 1ps

module IFIDtb;

  reg clk;
  reg [31:0] instr, nextInstr;
  reg [3:0] nextPC;
  wire [31:0] instrID, nextInstrID;
  wire [3:0] nextPCID;

  IFID uut (
    .clk(clk),
    .instr(instr),
    .nextInstr(nextInstr),
    .nextPC(nextPC),
    .instrID(instrID),
    .nextInstrID(nextInstrID),
    .nextPCID(nextPCID)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, IFIDtb);

    // Initialize inputs
    clk = 0;
    instr = 32'b0;
    nextInstr = 32'b0;
    nextPC = 4'b0;

    // Apply input values
    #10;
    instr = 32'b10101010101010101010101010101010;
    nextInstr = 32'b01010101010101010101010101010101;
    nextPC = 4'b0101;

    // Finish the simulation
    #20;
    $finish;
  end

  always #5 clk = ~clk;

endmodule
