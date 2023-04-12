`include "src/cl_adder4.v"
`timescale 100ms/100ms

module tb;

  reg [7:0] A, B, S;
  reg Cout;

  initial begin
  `ifdef CCSDF
    $sdf_annotate("adder4_00.sdf", dut);
  `endif
    $dumpfile("sim/adder4_tb.vcd");
    $dumpvars(0, tb);
  end
  
  // -------------------------------------------------------
  // Module cl_adder4: feed input switches to A, B, set Cin
  // Because the CLA logic uses 4-bit, we need two modules
  // -------------------------------------------------------
  wire C_cla1;
  cl_adder4 cla1(A[3:0], B[3:0], 1'b0, C_cla1, S[3:0]);
  cl_adder4 cla2(A[7:4], B[7:4], C_cla1, Cout, S[7:4]);

  
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
