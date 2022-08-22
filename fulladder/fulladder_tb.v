module fulladder_tb;
	reg a_tb,b_tb,cin_tb;
	wire s_tb,cout_tb;
	
fulladder FA(.a(a_tb), .b(b_tb), .cin(cin_tb), .s(s_tb), .cout(cout_tb));

initial begin
	a_tb=0; b_tb=0 ; cin_tb=0;
	#100;
	a_tb=0; b_tb=0 ; cin_tb=1;
	#100;
	a_tb=0; b_tb=1 ; cin_tb=0;
	#100;
	a_tb=0; b_tb=1 ; cin_tb=1;
	#100;
	a_tb=1; b_tb=0 ; cin_tb=0;
	#100;
	a_tb=1; b_tb=0 ; cin_tb=1;
	#100;
	a_tb=1; b_tb=1 ; cin_tb=0;
	#100;
	a_tb=1; b_tb=1 ; cin_tb=1;
	#100;
	end
endmodule

	
 