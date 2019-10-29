`timescale 1 ps / 100 fs

module Add(S,A,B);

output [7:0] S;
input [7:0] A,B;
wire [7:0] C;

adder adder0(S[0],C[0],A[0],B[0],1'b0);
adder adder1(S[1],C[1],A[1],B[1],C[0]);
adder adder2(S[2],C[2],A[2],B[2],C[1]);
adder adder3(S[3],C[3],A[3],B[3],C[2]);
adder adder4(S[4],C[4],A[4],B[4],C[3]);
adder adder5(S[5],C[5],A[5],B[5],C[4]);
adder adder6(S[6],C[6],A[6],B[6],C[5]);
adder adder7(S[7],C[7],A[7],B[7],C[6]);
adder adder8(S[8],C[8],A[8],B[8],C[7]);

endmodule


`timescale 1 ps / 100 fs

module adder(sum,cout,a,b,cin);
input a,b,cin;
output cout,sum;

// sum = a xor b xor cin

xor #(50) (sum,a,b,cin);

//cout = a.b + cin.(a+b)

and #(50) and1(c1,a,b);
or #(50) or1(c2,a,b);
and #(50) and2(c3,c2,cin);
or #(50) or2(cout,c1,c3);

endmodule