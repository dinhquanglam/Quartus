module fulladder_1_tb_1;
	reg a, b, cin;
	wire s, cout;
	fulladder A0(.a(a), .b(b), .cin(cin), .sum(s), .cout(cout));
	initial begin
		a = 0; b = 0; cin = 0;
		#100;
		a = 0; b = 0; cin = 1;
		#100;
		a = 0; b = 1; cin = 0;
		#100;
		a = 0; b = 1; cin = 1;
		#100;
		a = 1; b = 0; cin = 0;
		#100;
		a = 1; b = 0; cin = 1;
		#100;
		a = 1; b = 1; cin = 0;
		#100;
		a = 1; b = 1; cin = 1;
		#100;
	end
endmodule
