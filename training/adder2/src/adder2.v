// -------------------------------------------------------
// adder2.v  gm-study-max training         @20230401 fm4dd
//
// Description:
// ------------
// This program implements a fulladder. The input signals
// are generated with slide switch stswi[0] as signal ‘A’,
// stswi[1] as signal ‘B’, and stswi[2] as 'Cin'. The input
// signals are shown on the correlating LEDs stled[0..2].
// The output signals ‘Cout’ is shown on stled[8], and 'S'
// is shown on stled[9].
//
// Requires: 5x signal leds, 3x DIP switches
// -------------------------------------------------------

module adder2(
  input wire [2:0] stswi,
  output wire [15:0] stled
);

  // -------------------------------------------------------
  // set unused LED's to 'off', assign input switches to led
  // -------------------------------------------------------
  assign {stled[7:3], stled[15:10]} = {12{1'b0}};
  assign stled[0] = stswi[0];
  assign stled[1] = stswi[1];
  assign stled[2] = stswi[2];

  // -------------------------------------------------------
  // create fulladder, feed input switches to A, B and Cin
  // -------------------------------------------------------
  full_adder fa1(stswi[0], stswi[1], stswi[2], stled[8], stled[9]);
  
endmodule
