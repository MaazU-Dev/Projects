`timescale 1ns / 1ps

`timescale 1ns / 1ps

module RegFiletb;
  
  reg clk;
  reg [4:0] readreg1, readreg2, writereg;
  reg [31:0] writedata;
  reg RegWrite;
  wire [31:0] readdata1, readdata2;
  
  RegFile uut (
    .clk(clk),
    .readreg1(readreg1),
    .readreg2(readreg2),
    .writereg(writereg),
    .writedata(writedata),
    .RegWrite(RegWrite),
    .readdata1(readdata1),
    .readdata2(readdata2)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, RegFiletb);
    
	 #10
    clk = 0;
    readreg1 = 5;
    readreg2 = 10;
    writereg = 15;
    writedata = 123;
    RegWrite = 1;
    
    #5;
    clk = 1;
    #5;
	 
	 #10
	 readreg1 = 15;
    readreg2 = 15;
    writereg = 16;
    writedata = 123;
    RegWrite = 1;
    
    // Add more test cases here...
    
    $finish;
  end
  
  always begin
    #5;
    clk = ~clk;
  end
  
endmodule


