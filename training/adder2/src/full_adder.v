// -------------------------------------------------------
// full_adder.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This module implements a full-adder. The input signals
// ‘A’ and ‘B’ feed into the 1st half-adder, while Cin and
// S_ha1 feed into the 2nd half-adder. The final Cout gets
// created through an OR gate of both C_ha1 and C_ha2.
// -------------------------------------------------------

module full_adder(
  input wire A,
  input wire B,
  input wire Cin,
  output wire Cout,
  output wire S
);

  wire C_ha1, S_ha1, C_ha2;

  // -------------------------------------------------------
  // 1st half adder generates interim output C_ha1, S_ha1
  // -------------------------------------------------------
  half_adder ha1(A, B, C_ha1, S_ha1);
  
  // -------------------------------------------------------
  // 2nd half adder generates S, and C_ha2
  // -------------------------------------------------------
  half_adder ha2(S_ha1, Cin, C_ha2, S);
  
  // -------------------------------------------------------
  // Finally the OR gate generates Cout from C_ha1 and C_ha2
  // -------------------------------------------------------
  or(Cout, C_ha1, C_ha2);
  
endmodule
