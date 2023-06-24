`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:19 06/19/2023
// Design Name:   DataMem
// Module Name:   C:/Users/vboxuser/Desktop/MIPS/PipelinedProc/DataMemtb.v
// Project Name:  PipelinedProc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemtb;

	// Inputs
	reg memread;
	reg memwrite;
	reg [31:0] address;
	reg [31:0] writedata;

	// Outputs
	wire [31:0] readdata;

	// Instantiate the Unit Under Test (UUT)
	DataMem uut (
		.memread(memread), 
		.memwrite(memwrite), 
		.address(address), 
		.writedata(writedata), 
		.readdata(readdata)
	);

	initial begin
		// Initialize Inputs
		memread = 0;
		memwrite = 0;
		address = 0;
		writedata = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 // Read test
    memread = 1;
    address = 5;
    #10; // Wait for one clock cycle
    memread = 0;
    #10; // Wait for one clock cycle
    // Expected read data at address 5 is 50

    // Write test
    memwrite = 1;
    address = 10;
    writedata = 100;
    #10; // Wait for one clock cycle
    memwrite = 0;
    #10; // Wait for one clock cycle
    // Expected write of 100 at address 10

    // Read after write test
    memread = 1;
    address = 10;
    #10; // Wait for one clock cycle
    memread = 0;
    #10; // Wait for one clock cycle
    // Expected read data at address 10 is 100

    $finish; // End simulation
  end
  
  // Display readdata on each clock cycle
  always @(readdata)
    $display("Read Data: %d", readdata);
      
endmodule

