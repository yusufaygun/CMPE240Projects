`timescale 1ns / 1ns
module source(c, a, b);

input wire [1:0] a; // 2 bit
input wire [1:0] b; // 2 bit
output wire [1:0] c; // 2 bit

// Fill here for the gates

wire not_p;
wire not_q;
wire not_r;

wire not_pqnot_r_and;
wire pr_and;

wire pqr_or;
wire pqs_or;
wire prs_or;
wire not_pnot_qnot_rs_or;

not(not_p, a[1]);
not(not_q, a[0]);
not(not_r, b[1]);

and(not_pqnot_r_and, not_p, a[0], not_r);
and(pr_and, a[1], b[1]);

or(pqr_or, a[1], a[0], b[1]);
or(pqs_or, a[1], a[0], b[0]);
or(prs_or, a[1], b[1], b[0]);
or(not_pnot_qnot_rs_or, not_p, not_q, not_r, b[0]);

or(c[1], not_pqnot_r_and, pr_and);
and(c[0], pqr_or, pqs_or, prs_or, not_pnot_qnot_rs_or);

endmodule
