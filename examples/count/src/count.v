// -------------------------------------------------------
// count.v     gm-study-max demo program   @20230320 fm4dd
//
// Requires: LEDs, Slide Switches, 7-Segment modules, clk
//
// Description:
// ------------
// This program is a 1-byte binary counter, displayed in
// binary on 8xLED's, in hex on two 7-Segment digits, and
// in decimal on three leftmost 7-Segment digits.
// The hex digits are enabled/disabled by slide switches.
// The 7-segment decimal points pulse the counter clock.
// The count pulse is 1Hz, derived from the system clock:
// 10MHz clock: set breakpoint at 23'd4999999 (gatemate)
// 12MHz clock: set breakpoint at 23'd5999999 (icebreaker)
// 50MHz clock: set breakpoint at 25'd24999999 (de10-lite)
// -------------------------------------------------------

module count(
  input clk,
  input rst,
  input  [15:0] stswi,
  output [15:0] stled,
  output [7:0] sthex0,
  output [7:0] sthex1,
  output [7:0] sthex2,
  output [7:0] sthex3,
  output [7:0] sthex4,
  output [7:0] sthex5
);

parameter pulsebreak = 23'd4999999; // for 10MHz clock
//parameter pulsebreak = 25'd24999999; // for 50MHz clock

// -------------------------------------------------------
// The first 8x LED group shows the bit count up to 1 byte 
// while the second 8 LED are wired to the corresponding
// switch inputs. They light up when the switch is on. If
// we want to display the counter on the E1 onboard leds,
// we need to negate counter data: assign e1led = ~count;
// -------------------------------------------------------
assign stled[7:0] = count;
assign stled[15:8] = stswi[15:8];

// -------------------------------------------------------
//  REG/WIRE declarations
// -------------------------------------------------------
reg clk_1hz;
reg [7:0] count;
reg [24:0] pulse;
wire [4:0] data_0;
wire [4:0] data_1;
wire [4:0] data_2;
wire [4:0] data_3;
wire [4:0] data_4;
wire [4:0] data_5;

// -------------------------------------------------------
//  Module hexdigit: Creates the LED pattern from 3 args:
// in:  0-15 displays the hex value from 0..F
//      16 = all_on
//      17 = - (show minus sign)
//      18 = _ (show underscore)
//      19 = S
//     >19 = all_off
// dp:  0 or 1, disables/enables the decimal point led
// out: bit pattern result driving the 7seg module leds
// -------------------------------------------------------
hexdigit h0 (data_0, clk_1hz, sthex0);
hexdigit h1 (data_1, clk_1hz, sthex1);
hexdigit h2 (data_2, clk_1hz, sthex2);
hexdigit h3 (data_3, clk_1hz, sthex3);
hexdigit h4 (data_4, clk_1hz, sthex4);
hexdigit h5 (data_5, clk_1hz, sthex5);


reg [11:0] bcd;
bin2bcd dec (count, bcd);

// -------------------------------------------------------
// Construct hex digit number from the counter or disable
// the hex digit if the corresponding switch # is "off".
// -------------------------------------------------------
assign data_0 = stswi[0] ?count[3:0] :20; // low nibble
assign data_1 = stswi[1] ?count[7:4] :20; // high nibble
assign data_2 = stswi[2] ? 17        :20; // character '-'
assign data_3 = stswi[3] ?bcd[3:0]   :20; // decimal 1's
assign data_4 = stswi[4] ?bcd[7:4]   :20; // decimal 10's
assign data_5 = stswi[5] ?bcd[11:8]  :20; // decimmal 100's

always @(posedge clk_1hz or negedge rst)
begin
  if (!rst) count = 0;
  else count <= count + 1;
end

always @(posedge clk or negedge rst)
begin
  if (!rst) begin
    clk_1hz = 1'b1;
    pulse = 0;
  end
  else begin
    pulse <= pulse + 1;
    if(pulse == pulsebreak) begin
      pulse <= 0;
      clk_1hz <= ~clk_1hz;
    end
  end
end

endmodule

// -------------------------------------------------------
// Module bin2bcd: Binary to BCD converter. A 1-byte input
// bin is converted into 3x4 bit set of decimal digits bcd
// output: 100's = bcd[11:8] 10s = bcd[7:4] 1's = bcd[3:0]
//
// See https://verilogcodes.blogspot.com/2015/10
// /verilog-code-for-8-bit-binary-to-bcd.html
// -------------------------------------------------------
module bin2bcd(
  input [7:0] bin,
  output [11:0] bcd
);

//Internal variables
reg [11:0] bcd; 
reg [3:0] i;   
     
//Always block - implements the "Double Dabble" algorithm
always @(bin) begin
  bcd = 0;                      // initialize bcd to zero.
  for (i = 0; i < 8; i = i+1)   // run for 8 iterations
  begin
    bcd = {bcd[10:0],bin[7-i]}; // concatenation
                    
    // if a hex digit of 'bcd' is more than 4, add 3 to it:
    if(i < 7 && bcd[3:0] > 4) bcd[3:0] = bcd[3:0] + 3;
    if(i < 7 && bcd[7:4] > 4) bcd[7:4] = bcd[7:4] + 3;
    if(i < 7 && bcd[11:8] > 4) bcd[11:8] = bcd[11:8] + 3;  
  end
end     
endmodule
