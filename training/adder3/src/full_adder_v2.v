// -------------------------------------------------------
// full_adder.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This module implements a full-adder. The input signals
// ‘A’ and ‘B’ feed into the 1st half-adder, while Cin and
// S_ha1 feed into the 2nd half-adder. The final Cout gets
// created through an OR gate of both C_ha1 and C_ha2.
// This version implements the two halfadders in one file.
// -------------------------------------------------------

module full_adder(
  input wire A,
  input wire B,
  input wire Cin,
  output wire Cout,
  output wire S
);

  wire C_ha1, S_ha1, C_ha2;

  xor(S_ha1, A, B);       // half-adder 1 SUM
  and(C_ha1, A, B);       // half-adder 1 CARRY
  xor(S, S_ha1, Cin);     // half-adder 2 SUM
  and(C_ha2, S_ha1, Cin); // half-adder 2 CARRY
  or(Cout, C_ha1, C_ha2); // Final OR creates Cout
  
endmodule
