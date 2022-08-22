module alu_dec_1
	(
	input ALUOp, 
	input	[3:0] Funct_cmd, 
	input	Funct_s,
	output [1:0] ALUControl,
	output [1:0] FlagW 
	);
	reg [1:0] ALUResult;
	reg [1:0] tmp;
	assign ALUControl = ALUResult;
	assign FlagW = tmp;
	always @( ALUOp or Funct_cmd or Funct_s )
	begin
		if ( ALUOp == 0 ) begin
			ALUResult = 00;
			end
		else begin
		case ( Funct_cmd )
		4'b0100 : begin
			ALUResult <= 00;
			if ( Funct_s == 0 )
				begin
				tmp = 00;
				end
			else begin
				tmp = 11;
				end 
			end
		4'b0010 : begin
			ALUResult <= 01;
			if ( Funct_s == 0 )
				begin
				tmp = 00;
				end
			else begin
				tmp = 11;
				end 
			end
		4'b0000 : begin
			ALUResult <= 10;
			if ( Funct_s == 0 )
				begin
				tmp = 00;
				end
			else begin 
				tmp = 10;
				end 
			end
		4'b1100 : begin
			ALUResult <= 11;
			if ( Funct_s == 0 )
				begin
				tmp = 00;
				end
			else begin
				tmp = 10;
				end 
			end
		default : begin
			ALUResult <= 00;
			end
		endcase
		end
	end
endmodule	
