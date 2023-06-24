`timescale 1ns / 1ps

module HazardDetectionUnit_tb;

  // Inputs
  reg [4:0] ID_EX_RegisterRt;
  reg [4:0] IF_ID_RegisterRs;
  reg [4:0] IF_ID_RegisterRt;
  reg ID_EX_MemRead;

  // Outputs
  wire IFID_write;
  wire PC_write;
  wire ControlU_Write;

  // Instantiate the HazardDetectionUnit module
  HazardDetectionUnit dut (
    .ID_EX_RegisterRt(ID_EX_RegisterRt),
    .IF_ID_RegisterRs(IF_ID_RegisterRs),
    .IF_ID_RegisterRt(IF_ID_RegisterRt),
    .ID_EX_MemRead(ID_EX_MemRead),
    .IFID_write(IFID_write),
    .PC_write(PC_write),
    .ControlU_Write(ControlU_Write)
  );

  // Clock generation
  reg clk;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize inputs
    ID_EX_RegisterRt = 5'b00000;
    IF_ID_RegisterRs = 5'b00000;
    IF_ID_RegisterRt = 5'b00000;
    ID_EX_MemRead = 0;

 

    // Apply test cases
    #10;
    ID_EX_RegisterRt = 5'b00000;
    IF_ID_RegisterRs = 5'b00000;
    IF_ID_RegisterRt = 5'b00000;
    ID_EX_MemRead = 1;

    #10;
    ID_EX_RegisterRt = 5'b00000;
    IF_ID_RegisterRs = 5'b00001;
    IF_ID_RegisterRt = 5'b00000;
    ID_EX_MemRead = 0;

    #10;
    ID_EX_RegisterRt = 5'b00010;
    IF_ID_RegisterRs = 5'b00011;
    IF_ID_RegisterRt = 5'b00010;
    ID_EX_MemRead = 1;

    // End simulation
    #10;
    $finish;
  end

  // Toggle the clock
  always #1 clk = ~clk;

endmodule
