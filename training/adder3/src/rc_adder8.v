// -------------------------------------------------------
// rc_adder8.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This module implements an 8-bit ripple-carry adder. The
// input signals ‘A’ and ‘B’ bits are chained through 8x
// 1-bit fulladders.
// -------------------------------------------------------

module rc_adder8(
  input wire [7:0] A,
  input wire [7:0] B,
  input wire Cin,
  output wire Cout,
  output wire [7:0] S
);

  // -------------------------------------------------------
  // create C_faX carry signals to chain between fulladders
  // -------------------------------------------------------
  wire C_fa1, C_fa2, C_fa3, C_fa4, C_fa5, C_fa6, C_fa7;

  // -------------------------------------------------------
  // create fulladder 1-8, feed input bits to A, B & chain C
  // -------------------------------------------------------
  full_adder fa1(A[0], B[0], Cin,   C_fa1, S[0]);
  full_adder fa2(A[1], B[1], C_fa1, C_fa2, S[1]);
  full_adder fa3(A[2], B[2], C_fa2, C_fa3, S[2]);
  full_adder fa4(A[3], B[3], C_fa3, C_fa4, S[3]);
  full_adder fa5(A[4], B[4], C_fa4, C_fa5, S[4]);
  full_adder fa6(A[5], B[5], C_fa5, C_fa6, S[5]);
  full_adder fa7(A[6], B[6], C_fa6, C_fa7, S[6]);
  full_adder fa8(A[7], B[7], C_fa7, Cout,  S[7]);

endmodule
