module alu_dec_1_tb;
	reg ALUOp; 
	reg [3:0] Funct_cmd;
	reg Funct_s;
	wire [1:0] ALUControl; 
	wire [1:0] FlagW;
	alu_dec_1 TB
		(
			.ALUOp (ALUOp), 
			.Funct_cmd (Funct_cmd), 
			.Funct_s (Funct_s),
			.ALUControl (ALUControl),
			.FlagW (FlagW)
		);
	initial begin
		ALUOp = 0; Funct_cmd = 4'b0100; Funct_s = 0;
		#100;
		ALUOp = 0; Funct_cmd = 4'b0100; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0100; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0100; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0010; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0010; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0000; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0000; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b1100; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b1100; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0110; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b0110; Funct_s = 1;
		#100;
		ALUOp = 1; Funct_cmd = 4'b1111; Funct_s = 0;
		#100;
		ALUOp = 1; Funct_cmd = 4'b1111; Funct_s = 1;
		#100;
	end
endmodule
