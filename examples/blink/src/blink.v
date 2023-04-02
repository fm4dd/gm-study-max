// -------------------------------------------------------
// blink.v    gm-study-max demo program    @20230319 fm4dd
//
// Requires: 16x LEDs, 6x 7-segment digits, system clock
//
// Description:
// ------------
// This program blinks alternately the even and odd LEDs.
// A 2Hz blink pulse derived from the 10MHz signal SB_A8:
// 10MHz clock needs breakpoint at 23'd2499999 (gatemate)
// -------------------------------------------------------

module blink(
  input wire clk,
  input wire rst,
  output wire [7:0] sthex0,
  output wire [7:0] sthex1,
  output wire [7:0] sthex2,
  output wire [7:0] sthex3,
  output wire [7:0] sthex4,
  output wire [7:0] sthex5,
  output wire [15:0] stled
);

reg clk_2hz, clk_1hz;
reg [22:0] count;
reg [2:0] segment;
reg [7:0] pattern;

assign {stled[0], stled[2], stled[4], stled[6], stled[8], stled[10], stled[12], stled[14]} = {8{clk_1hz}};
assign {stled[1], stled[3], stled[5], stled[7], stled[9], stled[11], stled[13], stled[15]} = {8{~clk_1hz}};
assign {sthex0, sthex1, sthex2, sthex3, sthex4, sthex5} = {6{pattern}};

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    clk_1hz = 1'b1;
    clk_2hz = 1'b1;
    count = 23'd0;
    pattern = 8'b11111111;
    segment = 3'd0;
  end
  else begin 
    count <= count + 1;
    if(count == 23'd2499999) begin
      count <= 0;
      clk_2hz <= ~clk_2hz;
      if(clk_2hz == 1) begin
        clk_1hz <= ~clk_1hz;
        segment <= segment + 1;
        case (segment)
          3'd0: pattern <= 8'b11111110;
          3'd1: pattern <= 8'b11101101;
          3'd2: pattern <= 8'b10111011;
          3'd3: pattern <= 8'b11010111;
          3'd4: pattern <= 8'b11101101;
          3'd5: pattern <= 8'b11010111;
          3'd6: pattern <= 8'b10111011;
          3'd7: pattern <= 8'b01111111;
        endcase
      end
    end
  end
end
endmodule
