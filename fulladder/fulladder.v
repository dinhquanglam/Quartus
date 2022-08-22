module fulladder(
	input cin, a, b,
	output s, cout);
	
	wire n1,n2,n3;

	xor x1(n1,a,b); // n1 = a XOR B

	xor x2(s,n1,cin); // s = n1 XOR cin

	and a1(n2,n1,cin); //n2 = n1 AND cin

	and a2(n3,a,b); // n3 = a AND b

	or o1(cout,n2,n3); // cout = n2 OR n3

endmodule