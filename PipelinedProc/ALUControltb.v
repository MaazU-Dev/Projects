`timescale 1ns / 1ps


module ALUControltb;

	// Inputs
	reg clk;
	reg [5:0] funct;
	reg [2:0] ALUOp;

	// Outputs
	wire [3:0] ALUsignal;

	// Instantiate the Unit Under Test (UUT)
	ALUcontrol uut (
		.clk(clk), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUsignal(ALUsignal)
	);

	 initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ALUControltb);
    
    // Initialize inputs
    clk = 0;
    funct = 6'b000000;
    ALUOp = 3'b000;
    
    // Apply input values
    #10;
    funct = 6'b100101;
    ALUOp = 3'b010;
    
    // Wait for some time
    #20;
    
    // Add more test cases here...
    
    $finish;
  end
  
  always begin
    #5;
    clk = ~clk;
  end
      
endmodule

