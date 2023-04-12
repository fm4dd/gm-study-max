// -------------------------------------------------------
// cl_adder4.v  gm-study-max training     @20230401 fm4dd
//
// Description:
// ------------
// This module implements an 4-bit carry-lookahead adder.
// -------------------------------------------------------

module cl_adder4(
  input wire [3:0] A,
  input wire [3:0] B,
  input wire Cin,
  output wire Cout,
  output wire [3:0] S
);

  // -------------------------------------------------------
  // 1st level: Create propagate, generate and intermediate
  // carry signals
  // -------------------------------------------------------
  wire [3:0] P;  /* Carry Propagate */
  wire [3:0] G;  /* Carry Generate */
  wire [4:0] C;  /* Intermediate Carry */
  assign P = A ^ B; // Create Propagate whenever A=1 or B=1
  assign G = A & B; // Create Generate whenever A=1 & B=1
 
  // -------------------------------------------------------
  // 2nd level: Create carry signals (C0, C1, C2, and C4)
  // -------------------------------------------------------
  assign C[0] = Cin;
  assign C[1] = G[0] | (P[0] & Cin);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
  assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | 
            (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);

  // -------------------------------------------------------
  // 3rd level: Create four SUM signals (S[0..3], and Cout
  // -------------------------------------------------------
  assign S = P ^ C[3:0];
  assign Cout = C[4];

endmodule
