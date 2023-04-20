`include "src/half_subtract.v"
`timescale 100 ns / 100 ns

module tb;
reg A, B, Bout, D;

  initial begin
  `ifdef CCSDF
    $sdf_annotate("half_subtract_00.sdf", dut);
  `endif
    $dumpfile("sim/half_subtract_tb.vcd");
    $dumpvars(0, tb);
  end
  
  half_subtract dut(A, B, Bout, D);
  
  initial begin
    $display("\nA-bit - B-bit = Bout: b / D: d");
    $display("--------------------------------");
    $monitor("A-%b - B-%b = Bout-%b / D-%b", A, B, Bout, D);
    #10;
    A = 0; B = 0;
    #20;
    A = 1; B = 0;
    #30
    A = 0; B = 1;
    #40
    A = 1; B = 1;
    #50;
    $finish;
  end
endmodule
