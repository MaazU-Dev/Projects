`timescale 1ns / 1ps
//Increment PC by 1
	module InstrMem(memread, PC, PCAddressInstr, branchSignal, jumpSignal, readdata, nextReadData);
 
  input memread, branchSignal, jumpSignal;
  input [3:0] PC;
  input[31:0] PCAddressInstr;
  output reg [31:0] readdata;
  output reg [31:0] nextReadData;
  reg [31:0] mem_array [15:0];
  
  
  integer i;
  initial begin
 
   for (i=0; i<15; i=i+1)   
	begin
       	mem_array[i]=32'b0;
	end
   //mem_array[0]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add 
   //mem_array[1]={6'b0,5'b11,5'b1,5'b100,5'b0,6'b100010};//sub 
   //mem_array[2]={6'b0,5'b100,5'b1,5'b101,5'b0,6'b100101};//or 
	//mem_array[0]={6'b100011,5'b1010,5'b1100,16'b01};//lw 
	mem_array[0]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add 
	mem_array[1]={6'd0,5'b00010,5'b1,5'b100,5'b0,6'b100010};//sub
	mem_array[2]={6'b0,5'b10,5'b1,5'b101,5'b0,6'b100101};//or
	mem_array[3]={6'b0,5'b10,5'b1,5'b110,5'b0,6'b100100};//and 
   mem_array[4]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add 
	mem_array[5]={6'b0,5'b10,5'b1,5'b100,5'b0,6'b100010};//sub
	mem_array[6]={6'b0,5'b10,5'b1,5'b101,5'b0,6'b100101};//or 
	mem_array[7]={6'b0,5'b10,5'b1,5'b110,5'b0,6'b100100};//and 
  
	mem_array[12]={6'b101011,5'b10,5'b0,16'b1};//sw 
	mem_array[13]={6'b100011,5'b0,5'b1100,16'b0};
  end
  
  always@(*)
  begin
  
   if(branchSignal || jumpSignal)begin
		readdata = PCAddressInstr;
		end
		else begin
    if(memread)begin
      readdata = mem_array[PC];
		nextReadData = mem_array[PC+1];
		
    end
	 
	 end
    
  end
endmodule
