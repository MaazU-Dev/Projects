`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:11:21 06/20/2023
// Design Name:   MEMWB
// Module Name:   C:/Users/vboxuser/Desktop/MIPS/PipelinedProc/MEMWBtb.v
// Project Name:  PipelinedProc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEMWB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEMWBtb;

	// Inputs
	reg clock;
	reg iRegWrite;
	reg iMemToReg;
	reg iJumps;
	reg [31:0] iIR;
	reg [31:0] iReadData;
	reg [31:0] iResult;
	reg [4:0] iRegDest;
	reg enable;

	// Outputs
	wire oRegWrite;
	wire oMemToReg;
	wire oJumps;
	wire [31:0] oIR;
	wire [31:0] oReadData;
	wire [31:0] oResult;
	wire [4:0] oRegDest;

	// Instantiate the Unit Under Test (UUT)
	MEMWB uut (
		.clock(clock), 
		.iRegWrite(iRegWrite), 
		.iMemToReg(iMemToReg), 
		.iJumps(iJumps), 
		.iIR(iIR), 
		.iReadData(iReadData), 
		.iResult(iResult), 
		.iRegDest(iRegDest), 
		.oRegWrite(oRegWrite), 
		.oMemToReg(oMemToReg), 
		.oJumps(oJumps), 
		.oIR(oIR), 
		.oReadData(oReadData), 
		.oResult(oResult), 
		.oRegDest(oRegDest), 
		.enable(enable)
	);

	// Clock generator
  always #5 clock = ~clock;

  // Stimulus
  initial begin
    clock = 0;
    enable = 0;
    iIR = 32'b0;
    iReadData = 32'b0;
    iResult = 32'b0;
    iRegWrite = 0;
    iMemToReg = 0;
    iJumps = 0;
    iRegDest = 0;

    // Apply stimulus
    #10 enable = 1;
    #10 iIR = 32'b10101010101010101010101010101010;
    #10 iReadData = 32'b01010101010101010101010101010101;
    #10 iResult = 32'b00110011001100110011001100110011;
    #10 iRegWrite = 1;
    #10 iMemToReg = 1;
    #10 iJumps = 1;
    #10 iRegDest = 5'b11111;

    // Add more test cases or stimuli here

    #10 enable = 0;
    #100 $finish;
  end

  // Monitor
  always @(posedge clock) begin
    // Add any necessary monitoring code here
  end
      
endmodule

