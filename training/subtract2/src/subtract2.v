// -------------------------------------------------------
// substract2.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This program implements a full-subtractor. Input signals
// are generated with slide switch stswi[0] as signal ‘A’,
// and stswi[1] as signal ‘B’. The input signals are shown
// on the correlating LEDs stled[0] and stled[1], with the
// output signal ‘D’ shown on stled[8], ‘Bout’ on stled[9].
//
// Requires: 4x signal leds, 2x DIP switches
// -------------------------------------------------------

module subtract2(
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
  // create full-substractor with switch inputs to A, B, Bin
  // -------------------------------------------------------
  full_subtract fs(stswi[0], stswi[1], stswi[2], stled[8], stled[9]);
  
endmodule
