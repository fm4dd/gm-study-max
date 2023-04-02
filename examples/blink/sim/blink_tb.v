`timescale 100 ns / 100 ns

module tb;

reg clk;
reg rst;
reg clk_2hz, clk_1hz;
reg [2:0] segment;
reg [7:0] pattern;
wire [15:0] led;
wire [7:0] hex0;
wire [7:0] hex1;
wire [7:0] hex2;
wire [7:0] hex3;
wire [7:0] hex4;
wire [7:0] hex5;

initial begin
`ifdef CCSDF
  $sdf_annotate("blink_00.sdf", dut);
`endif
  $dumpfile("sim/blink_tb.vcd");
  $dumpvars(0, tb);
  clk = 0;
  rst = 0;
end

always clk = #1 ~clk;

blink dut (
  .clk(clk),
  .rst(rst),
  .sthex0(hex0),
  .sthex1(hex1),
  .sthex2(hex2),
  .sthex3(hex3),
  .sthex4(hex4),
  .sthex5(hex5),
  .stled(led)
);

initial begin
  #200;
  rst = 1;
  #80000000;
  $finish;
end

blink b(clk, rst, hex0, hex1, hex2, hex3, hex4, hex5, led);
endmodule
