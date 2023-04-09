// -------------------------------------------------------
// half_adder.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This module implements a half-adder. The input signals
// ‘A’ and ‘B’ generate the outputs 'S' and 'C' through
// AND and XOR gates.
// -------------------------------------------------------

module half_adder(
  input wire A,
  input wire B,
  output wire C,
  output wire S
);

  // -------------------------------------------------------
  // use XOR gate to binary add A and B into SUM S
  // -------------------------------------------------------
  xor(S, A, B);
  
  // -------------------------------------------------------
  // use AND gate to create output CARRY C
  // -------------------------------------------------------
  and(C, A, B);
  
endmodule
