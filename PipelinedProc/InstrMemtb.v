`timescale 1ns / 1ps

module InstrMem_TB;
  reg memread, branchSignal, jumpSignal;
  reg [3:0] PC;
  reg [31:0] PCAddressInstr;
  wire [31:0] readdata, nextReadData;

  InstrMem dut (
    .memread(memread),
    .PC(PC),
    .PCAddressInstr(PCAddressInstr),
    .branchSignal(branchSignal),
    .jumpSignal(jumpSignal),
    .readdata(readdata),
    .nextReadData(nextReadData)
  );

  initial begin
    memread = 1;
    branchSignal = 0;
    jumpSignal = 0;
    PC = 0;
    PCAddressInstr = 0;

    #10; // Wait for some simulation time

    // Test case 1: Reading instruction at PC = 0
    memread = 1;
    branchSignal = 0;
    jumpSignal = 0;
    PC = 0;
    PCAddressInstr = 0;
    #5; // Wait for some simulation time
    $display("Read data: %h", readdata);

    // Test case 2: Reading instruction at PC = 1
    memread = 1;
    branchSignal = 0;
    jumpSignal = 0;
    PC = 1;
    PCAddressInstr = 0;
    #5; // Wait for some simulation time
    $display("Read data: %h", readdata);

    // Add more test cases as needed...

    $finish; // End simulation
  end
endmodule
