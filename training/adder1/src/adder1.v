// -------------------------------------------------------
// adder1.v  gm-study-max training         @20230401 fm4dd
//
// Description:
// ------------
// This program implements a half-adder. The input signals
// are generated with slide switch stswi[0] as signal ‘A’,
// and stswi[1] as signal ‘B’. The input signals are shown
// on the correlating LEDs stled[0] and stled[1], with the
// output signal ‘C’ shown on stled[8] and ‘S’ on stled[9]
//
// Requires: 4x signal leds, 2x DIP switches
// -------------------------------------------------------

module adder1(
  input wire [1:0] stswi,
  output wire [15:0] stled
);

  // -------------------------------------------------------
  // set unused LED's to 'off', assign input switches to led
  // -------------------------------------------------------
  assign {stled[7:2], stled[15:10]} = {12{1'b0}};
  assign stled[0] = stswi[0];
  assign stled[1] = stswi[1];

  // -------------------------------------------------------
  // create half-adder, feed input switches into A and B
  // -------------------------------------------------------
  half_adder ha(stswi[0], stswi[1], stled[8], stled[9]);
  
endmodule
