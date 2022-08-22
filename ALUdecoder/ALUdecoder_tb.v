module ALUdecoder_tb;
	reg ALUop;
	reg [3:0] funct_cmd;
	reg funct_s;
	wire [1:0] ALUcontrol, flagW;
	
	ALUdecoder tb(
	.ALUop(ALUop),
	.funct_cmd(funct_cmd),
	.funct_s(funct_s),
	.ALUcontrol(ALUcontrol),
	.flagW(flagW));
	
	initial begin
		ALUop = 0; funct_cmd = 4'b0100; funct_s = 0;
		#100;
		ALUop = 0; funct_cmd = 4'b0100; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b0100; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b0100; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b0010; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b0010; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b0000; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b0000; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b1100; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b1100; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b0110; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b0110; funct_s = 1;
		#100;
		ALUop = 1; funct_cmd = 4'b1111; funct_s = 0;
		#100;
		ALUop = 1; funct_cmd = 4'b1111; funct_s = 1;
		#100;

	end
endmodule
	