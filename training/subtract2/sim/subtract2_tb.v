`include "src/full_subtract.v"
`include "src/half_subtract.v"
`timescale 100 ns / 100 ns

module tb;
reg A, B, Bin, Bout, D;

  initial begin
  `ifdef CCSDF
    $sdf_annotate("full_subtract_00.sdf", dut);
  `endif
    $dumpfile("sim/full_subtract_tb.vcd");
    $dumpvars(0, tb);
  end
  
  full_subtract dut(A, B, Bin, Bout, D);
  
  initial begin
    $display("\nA-bit - B-bit = Bout: b / D: d");
    $display("--------------------------------");
    $monitor("A-%b - B-%b, Bin-%b = Bout-%b / D-%b", A, B, Bin, Bout, D);
    #10;
    A = 0; B = 0; Bin = 0;
    #20;
    A = 0; B = 1; Bin = 0;
    #30
    A = 1; B = 0; Bin = 0;
    #40
    A = 1; B = 1; Bin = 0;
    #50;
    A = 0; B = 0; Bin = 1;
    #60;
    A = 0; B = 1; Bin = 1;
    #70;
    A = 1; B = 0; Bin = 1;
    #80;
    A = 1; B = 1; Bin = 1;
    $finish;
  end
endmodule
