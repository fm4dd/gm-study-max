// -------------------------------------------------------
// wavplay.v    gm-study-max demo program  @20230319 fm4dd
//
// Requires: LEDs, Buttons, 7-Segment modules, clk, audio
//
// Description:
// ------------
// This program plays a audio sample from memory when
// button PB0 is pressed. LED stled[0] lights up during
// the audio play, and the 7-segment digits show the 
// audio bytes, updating at slow speed to verify wav data
// was correctly loaded into memory and is processed.
//
// This example is adapted from Simon Monk:Programming
// FPGAs: Getting Started with Verilog, chapter 8.
// -------------------------------------------------------
module wavplay(
  input clk,
  input rst,
  input [1:0] stbtn,
  output wire [3:0] stled,
  output [7:0] sthex0,
  output [7:0] sthex1,
  output reg stau_r
);
	 
// -------------------------------------------------------
// Here we select the wav sample file for playing from
// versions having different length and mem requirements
// -------------------------------------------------------
localparam MEM_SIZE = 3901;  // 01_b3901.txt
initial $readmemh("01_b3901.txt", memory);

//localparam MEM_SIZE = 36130;  // 01_05_b36130.txt
//initial $readmemh("01_05_b36130.txt", memory);

//localparam MEM_SIZE = 75697;  // 01_10_b75697.txt
//initial $readmemh("01_10_b75697.txt", memory);

localparam FREQ_DIV = 5;      // 10Mhz clock
//localparam FREQ_DIV = 12;      // 25Mhz clock

reg [7:0] memory[MEM_SIZE-1];

assign {stled[3], stled[2], stled[1]} = 1'b0; // disable led1..3
assign stled[0] = play;

// -------------------------------------------------------
// Module debounce: get a clean push-button start signal
// -------------------------------------------------------
reg btn0;
wire btn0_down, btn0_up;
debounce d0 (stbtn[0], clk, btn0, btn0_down, btn0_up);

// -------------------------------------------------------
//  Module hexdigit: Creates the LED pattern from 3 args:
// in:  0-16 sets the hex value led segments, >16 disables
// dp:  0 or 1, disables/enables the decimal point led
// out: this is the bit pattern for the 7seg module leds
// -------------------------------------------------------
reg [18:0] prescaler_7s;
reg [4:0] h_0;
reg [4:0] h_1;
wire [4:0] data_0;
wire [4:0] data_1;
assign data_0 = h_0;
assign data_1 = h_1;
hexdigit h0 (data_0, 1'b0, sthex0);
hexdigit h1 (data_1, 1'b0, sthex1);

reg play;
reg [3:0] prescaler; 
reg [7:0] counter;
reg [19:0] address;
reg [7:0] value;

always @(posedge clk or negedge rst)
begin
  if(!rst) begin 
    play <= 0;
    prescaler <= 0;
    prescaler_7s <= 0;
    counter <= 0;
    address <= 0;
    value <= 0;
    h_0 <= 4'b0000;
    h_1 <= 4'b0000;
  end
  else begin
    if(btn0_down==1) play <= 1;         // on btn0 press enable play
    if(play) begin
      prescaler <= prescaler + 1;       // increment prescaler
      prescaler_7s <= prescaler_7s + 1; // increment prescaler
      if(prescaler_7s == 0) begin
        h_0 <= memory[address][3:0];
        h_1 <= memory[address][7:4];
      end
      if(prescaler == FREQ_DIV) begin   // 8kHz x 256 steps = 2.048 MHz
        prescaler <= 0;                 // reset prescaler
        counter <= counter + 1;         // increment bits in byte counter
        value <= memory[address];       // assign memory byte to value
        stau_r <= (value > counter);    // play value on right audio
        if(counter == 255) begin        // increment bits in byte counter
          counter <= 0;                 // reset bits in byte counter
          address <= address + 1;       // increment address counter
          if(address == MEM_SIZE) begin // finished song data in memory
            play <= 0;                  // disable play
            address <= 0;               // reset address value
          end                           // end if(address == MEM_SIZE)
        end                             // end if(counter == 255)
      end                               // end if(prescaler == 5)
    end                                 // end else if(play)
    else begin
      h_0 <= memory[0][3:0];
      h_1 <= memory[0][7:4];
    end
  end                                  // end else if(!rst)
end

endmodule
