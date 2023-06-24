`timescale 1ns / 1ps

module ALUtb;
  reg [31:0] data1;
  reg [31:0] data2;
  reg [3:0] aluoperation;
  wire [31:0] result;
  wire zero;

  ALU uut(data1, data2, aluoperation, result, zero);

  initial begin
    $monitor("ALUResult = %x, Zero = %b", result, zero);

    // Test 1: ADD operation
    data1 = 32'd10;
    data2 = 32'd20;
    aluoperation = 4'b0000; // ADD
    #10;

    // Test 2: SUB operation
    data1 = 32'd50;
    data2 = 32'd30;
    aluoperation = 4'b0001; // SUB
    #10;

    // Test 3: AND operation
    data1 = 32'd5;
    data2 = 32'd3;
    aluoperation = 4'b0010; // AND
    #10;

    // Test 4: OR operation
    data1 = 32'd8;
    data2 = 32'd6;
    aluoperation = 4'b0011; // OR
    #10;

    // Test 5: XOR operation
    data1 = 32'd7;
    data2 = 32'd2;
    aluoperation = 4'b0100; // XOR
    #10;

    // Test 6: Default (ADD) operation
    data1 = 32'd15;
    data2 = 32'd25;
    aluoperation = 4'b1111; // Unrecognized operation, default to ADD
    #10;

    $finish;
  end
endmodule

