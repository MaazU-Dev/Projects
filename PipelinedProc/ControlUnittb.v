`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:08:48 06/19/2023
// Design Name:   controlUnit
// Module Name:   C:/Users/vboxuser/Desktop/MIPS/PipelinedProc/ControlUnittb.v
// Project Name:  PipelinedProc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnittb;

	// Inputs
	reg clk;
	reg [5:0] opcode;
	reg [5:0] funct;
	reg [31:0] IR;

	// Outputs
	wire [2:0] ALUOp;
	wire RegDest;
	wire RegWrite;
	wire ALUSrc;
	wire MemRead;
	wire MemWrite;
	wire MemToReg;
	wire Branch;
	wire Jump;

	// Instantiate the Unit Under Test (UUT)
	controlUnit uut (
		.clk(clk), 
		.opcode(opcode), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.RegDest(RegDest), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemToReg(MemToReg), 
		.Branch(Branch), 
		.Jump(Jump), 
		.IR(IR)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		opcode = 0;
		funct = 0;
		IR = 2;

		// Wait 100 ns for global reset to finish
		#100;
       clk = 0;
    opcode = 6'b000100; 
    funct = 6'b100000; // Example function code
    
    
    #5;
    clk = 1;
    #5;
    
    // Add more test cases here...
    
    $finish;
  end
  
  always begin
    #5;
    clk = ~clk;
  end
      
endmodule

