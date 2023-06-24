`timescale 1ns/1ps

module MainUwUtb;
  reg clk;
  reg rst;
  reg sw;
  wire [7:0] out;

  MainUwU uut (
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .out(out)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Initialize inputs
  initial begin
    clk = 0;
    rst = 1;
    sw = 1;

    // Reset simulation
    #10 rst = 0;
  end

  // Stimulus
  initial begin
    #20 sw = 1; // Set sw to 1
    #50 sw = 0; // Set sw to 0
    #100 $finish; // End simulation
  end

  // Monitor
  always @(posedge clk) begin
    $display("Output: %h", out);
  end
endmodule
