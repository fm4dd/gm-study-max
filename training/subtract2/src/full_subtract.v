// -------------------------------------------------------
// full_subtract.v  gm-study-max training  @20230411 fm4dd
//
// Description:
// ------------
// This module implements a full-subtractor. Input signals
// ‘A’ and ‘B’ generate the outputs 'D' and 'Bout' through
// the logic implemented in half_subtract.v.
// -------------------------------------------------------

module full_subtract(
  input wire A,
  input wire B,
  input wire Bin,
  output wire Bout,
  output wire D
);

  wire B_hs1, D_hs1, B_hs2;

  // -------------------------------------------------------
  // 1st half subtract generates interim output B_hs1, D_hs1
  // -------------------------------------------------------
  half_subtract hs1(A, B, B_hs1, D_hs1);

  // -------------------------------------------------------
  // 2nd half subtract generates D, and B_hs2
  // -------------------------------------------------------
  half_subtract hs2(D_hs1, Bin, B_hs2, D);

  // -------------------------------------------------------
  // Finally the OR gate generates Bout from B_hs1 and C_hs2
  // -------------------------------------------------------
  or(Bout, B_hs1, B_hs2);

endmodule
