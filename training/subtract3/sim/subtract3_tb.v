`include "src/rb_subtract8.v"
`include "src/full_subtract.v"
`include "src/half_subtract.v"
`timescale 100ms/100ms

module tb;

  reg [7:0] A, B, D;
  reg Bout;
  int expected;

  initial begin
  `ifdef CCSDF
    $sdf_annotate("subtract3_00.sdf", dut);
  `endif
    $dumpfile("sim/subtract3_tb.vcd");
    $dumpvars(0, tb);
  end
  
  rb_subtract8 dut(A, B, 1'b0, Bout, D);
  
  initial begin
    $display("\nA-bits (8) - B-bits (8) = D-bits (8) (dec) Bout: b check --> expected result:");
    $display("-----------------------------------------------------------------------------");
    $monitor("A-%b - B-%b = D-%b (%d) Bout: %b check --> %d - %d = %s", A, B, D, D, Bout, A, B, expected);
    A = 8'b00000000; B = 8'b00000000; expected = "0";
    #10;
    A = 8'b00000001; B = 8'b00000001; expected = "0";
    #10;
    A = 8'b00000010; B = 8'b00000001; expected = "1";
    #10
    A = 8'b00001000; B = 8'b00000101; expected = "3";
    #10
    A = 8'b00100100; B = 8'b00001100; expected = "24";
    #10;
    A = 8'b11001000; B = 8'b10000000; expected = "72";
    #10;
    A = 8'b11111111; B = 8'b11000111; expected = "56";
    #10;
    A = 8'b00010100; B = 8'b00010101; expected = "-1";
    #10;
    A = 8'b00010100; B = 8'b00100000; expected = "-12";
    #10;
    A = 8'b00010100; B = 8'b10111100; expected = "-168";
    #10;
    $finish;
  end
endmodule
