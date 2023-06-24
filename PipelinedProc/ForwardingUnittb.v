`timescale 1ns / 1ps

module ForwardingUnittb;

  // Inputs
  reg EX_MEM_RegWrite;
  reg [4:0] EX_MEM_RegisterRd;
  reg [4:0] ID_EX_RegisterRs;
  reg [4:0] ID_EX_RegisterRt;
  reg MEM_WB_RegWrite;
  reg [4:0] MEM_WB_RegisterRd;

  // Outputs
  wire [1:0] ForwardA;
  wire [1:0] ForwardB;

  // Instantiate the ForwardingUnit module
  ForwardingUnit dut (
    .EX_MEM_RegWrite(EX_MEM_RegWrite),
    .EX_MEM_RegisterRd(EX_MEM_RegisterRd),
    .ID_EX_RegisterRs(ID_EX_RegisterRs),
    .ID_EX_RegisterRt(ID_EX_RegisterRt),
    .MEM_WB_RegWrite(MEM_WB_RegWrite),
    .MEM_WB_RegisterRd(MEM_WB_RegisterRd),
    .ForwardA(ForwardA),
    .ForwardB(ForwardB)
  );

  // Clock
  reg clk;
  always #5 clk = ~clk;  // Toggle clock every 5 time units

  // Test stimulus
  initial begin
    clk = 0;  // Initialize clock

    // Initialize inputs
    EX_MEM_RegWrite = 0;
    EX_MEM_RegisterRd = 0;
    ID_EX_RegisterRs = 0;
    ID_EX_RegisterRt = 0;
    MEM_WB_RegWrite = 0;
    MEM_WB_RegisterRd = 0;

    // Wait for some time for stability
    #10;

    // Test case 1: No hazards
    #5;  // Wait for one clock cycle

    // Test case 2: EX hazard (ForwardA = 10)
    EX_MEM_RegWrite = 1;
    EX_MEM_RegisterRd = 3'b101;  // Random non-zero value
    ID_EX_RegisterRs = 3'b101;  // Same value as EX_MEM_RegisterRd
    #5;  // Wait for one clock cycle

    // Test case 3: EX hazard (ForwardB = 10)
    ID_EX_RegisterRs = 3'b010;  // Different value from EX_MEM_RegisterRd
    ID_EX_RegisterRt = 3'b101;  // Same value as EX_MEM_RegisterRd
    #5;  // Wait for one clock cycle
	 
	 // Test case 4: MEM hazard (ForwardA = 01)
    EX_MEM_RegWrite = 0;
    EX_MEM_RegisterRd = 3'b010;  // Different value from ID_EX_RegisterRs
    MEM_WB_RegWrite = 1;
    MEM_WB_RegisterRd = 3'b101;  // Same value as ID_EX_RegisterRs
    #5;  // Wait for one clock cycle

    // Test case 5: MEM hazard (ForwardB = 01)
    ID_EX_RegisterRt = 3'b010;  // Different value from ID_EX_RegisterRs
    MEM_WB_RegisterRd = 3'b101;  // Same value as ID_EX_RegisterRt
    #5;  // Wait for one clock cycle
	 
   

    $finish;
  end

endmodule
