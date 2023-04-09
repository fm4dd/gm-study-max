`include "src/rc_adder8.v"
`include "src/full_adder.v"
`include "src/half_adder.v"
`timescale 100ms/100ms

module tb;

  reg [7:0] A, B, S;
  reg Cout;

  initial begin
  `ifdef CCSDF
    $sdf_annotate("adder3_00.sdf", dut);
  `endif
    $dumpfile("sim/adder3_tb.vcd");
    $dumpvars(0, tb);
  end
  
  rc_adder8 dut(A, B, 1'b0, Cout, S);
  
  initial begin
    $display("\nA-bits (8) + B-bits (8) = S-bits (8) (dec) Cout: b");
    $display("----------------------------------------------------");
    $monitor("A-%b + B-%b = S-%b (%d) Cout: %b", A, B, S, S, Cout);
    A = 8'b00000000; B = 8'b00000000;
    #10;
    A = 8'b00000001; B = 8'b00000001;
    #10;
    A = 8'b00000011; B = 8'b00000001;
    #10
    A = 8'b00000011; B = 8'b00000101;
    #10
    A = 8'b00000111; B = 8'b00000101;
    #10;
    A = 8'b00000111; B = 8'b00000111;
    #10;
    A = 8'b00000100; B = 8'b00001100;
    #10;
    A = 8'b00000100; B = 8'b00001101;
    #10;
    A = 8'b10000100; B = 8'b00001101;
    #10;
    A = 8'b11110110; B = 8'b01111101;
    #10;
    $finish;
  end
endmodule
