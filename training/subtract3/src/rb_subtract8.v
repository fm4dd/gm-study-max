// -------------------------------------------------------
// rb_subtract8.v  gm-study-max training   @20230420 fm4dd
//
// Description:
// ------------
// This module implements an 8-bit ripple-borrow subtractor
// The input signals ‘A’ and ‘B’ bits are chained through 8x
// 1-bit full-subtractors.
// -------------------------------------------------------

module rb_subtract8(
  input wire [7:0] A,
  input wire [7:0] B,
  input wire Bin,
  output wire Bout,
  output wire [7:0] D
);

  // -------------------------------------------------------
  // create B_fsX interim borrow signals for full-subractors
  // -------------------------------------------------------
  wire B_fs1, B_fs2, B_fs3, B_fs4, B_fs5, B_fs6, B_fs7;

  // -------------------------------------------------------
  // create fulladder 1-8, feed input bits to A, B & chain C
  // -------------------------------------------------------
  full_subtract fs1(A[0], B[0], Bin,   B_fs1, D[0]);
  full_subtract fs2(A[1], B[1], B_fs1, B_fs2, D[1]);
  full_subtract fs3(A[2], B[2], B_fs2, B_fs3, D[2]);
  full_subtract fs4(A[3], B[3], B_fs3, B_fs4, D[3]);
  full_subtract fs5(A[4], B[4], B_fs4, B_fs5, D[4]);
  full_subtract fs6(A[5], B[5], B_fs5, B_fs6, D[5]);
  full_subtract fs7(A[6], B[6], B_fs6, B_fs7, D[6]);
  full_subtract fs8(A[7], B[7], B_fs7, Bout,  D[7]);

endmodule
