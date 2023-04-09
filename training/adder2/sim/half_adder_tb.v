`timescale 100 ns / 100 ns

module tb;

wire [15:0] led;
wire [1:0] swi;
reg A, B, C, S;

  // -------------------------------------------------------
  // set unused LED's to 'off'
  // -------------------------------------------------------
  assign {led[7:2], led[15:10]} = {12{1'b0}};

  // -------------------------------------------------------
  // assign input switches to A and B
  // -------------------------------------------------------
  assign swi[0] = A;
  assign swi[1] = B;

  // -------------------------------------------------------
  // assign LEDs to input A,B and output C,S
  // -------------------------------------------------------
  assign C = led[8];
  assign S = led[9];

  initial begin
  `ifdef CCSDF
    $sdf_annotate("half_adder_00.sdf", dut);
  `endif
    $dumpfile("sim/half_adder_tb.vcd");
    $dumpvars(0, tb);
  end
  
  half_adder dut(.stswi(swi), .stled(led));
  
  initial begin
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
  
  half_adder ha(swi, led);
endmodule
