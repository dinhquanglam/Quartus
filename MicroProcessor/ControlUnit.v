module ControlUnit(Opcode, ALUop, regDest, regW, ALUsrc, memread, memwrite, memToReg, bne, beq, jump);
	input [3:0] Opcode;
	output reg [1:0] ALUop;
	output reg regDest, regW, ALUsrc, memread, memwrite, memToReg, bne, beq, jump;
	
	always @(*) begin
		case(Opcode)
			4'b0000: begin //lw
				ALUop <= 2'b10;
				regDest <= 0;
				regW <= 1;
				ALUsrc <= 1;
				memread <= 1;
				memwrite <= 0;
				memToReg <= 1;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0001: begin //sw
				ALUop <= 2'b10;
				regDest <= 0;
				regW <= 0;
				ALUsrc <= 1;
				memread <= 0;
				memwrite <= 1;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0010: begin //add
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0011: begin //sub
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0100: begin //sll
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0101: begin //srl
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b0110: begin //and
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
			end
			4'b0111: begin //or
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b1000: begin //xor
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b1001: begin //not
				ALUop <= 2'b00;
				regDest <= 1;
				regW <= 1;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 0;
			end
			4'b1010: begin //beq
				ALUop <= 2'b01;
				regDest <= 0;
				regW <= 0;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 1;
				jump = 0;
			end
			4'b1011: begin //bne
				ALUop <= 2'b01;
				regDest <= 0;
				regW <= 0;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 1;
				beq <= 0;
				jump = 0;
			end
			4'b1100: begin //jump
				ALUop <= 2'b11;
				regDest <= 0;
				regW <= 0;
				ALUsrc <= 0;
				memread <= 0;
				memwrite <= 0;
				memToReg <= 0;
				bne <= 0;
				beq <= 0;
				jump = 1;
			end
		endcase
	end
endmodule