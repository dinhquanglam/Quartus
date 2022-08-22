// ALU decoder 
// 04/12/2021
// Dinh Quang Lam-UET

module ALUdecoder(
	input ALUop, 
	input [3:0] funct_cmd, 
	input funct_s,
	output [1:0] ALUcontrol, flagW);

	reg[1:0] ALUresult, tmp;
	assign ALUcontrol = ALUresult;
	assign flagW = tmp;

always @(ALUop or funct_cmd or funct_s)
	begin
		if ( ALUop == 0) 
		begin
		ALUresult = 00;
		tmp = 00;
		end
		
		else begin
		case (funct_cmd) 
		4'b0100: begin
		ALUresult = 00;
		
			if(funct_s == 0) begin
				tmp = 00;
				end
			else begin
				tmp = 11 ;end
		end
		
		4'b0010: begin
		ALUresult = 01;
		
			if(funct_s == 0) begin
			tmp = 00;
			end
			else begin
			tmp = 11; end
		end
		
			4'b0000:begin
		ALUresult = 10;
		
			if(funct_s == 0) begin
			tmp = 00;
			end
			else begin
			tmp = 10;end
		end
		
			4'b1100: begin
		ALUresult = 11;
		
			if(funct_s == 0) begin
			tmp = 00;
			end
			else begin
			tmp = 10; 
			end
		end
		
		default : begin
			ALUresult = 00;
			end
		endcase
		end
		end
		endmodule
		
		
		
		 
		
