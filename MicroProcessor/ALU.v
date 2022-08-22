module ALU(inA, inB, ALUcontrol, ALUresult, isZero);
	input [15:0] inA, inB;
	input [2:0] ALUcontrol;
	output [15:0] ALUresult;
	output isZero;
	
	reg [15:0] ALUresult;
	wire isZero;
	always @(*) begin
		case(ALUcontrol)
			3'b000: //addition
				ALUresult = inA + inB;
			3'b001: //subtraction
				ALUresult = inA - inB;
			3'b010: //sll
				ALUresult = inA << inB;
			3'b011: //srl 
				ALUresult = inA >> inB;
			3'b100: //and
				ALUresult = inA & inB;
			3'b101: //or
				ALUresult = inA | inB;
			3'b110: //xor
				ALUresult = inA ^ inB;
			3'b111: //not
				ALUresult = ~inA;
		endcase
	end
	
	assign isZero = (ALUresult == 16'd0) ? 1 : 0;
endmodule