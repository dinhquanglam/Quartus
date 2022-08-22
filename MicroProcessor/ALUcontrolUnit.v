module ALUcontrolUnit(ALUop, Opcode, ALUcontrol);
	input [1:0] ALUop;
	input [3:0] Opcode;
	output [2:0] ALUcontrol;
	
	reg [2:0] ALUcontrol;
	wire [5:0] ALUcontrolIn;
	assign ALUcontrolIn = {ALUop, Opcode};
	always @(ALUcontrolIn) begin
		casex (ALUcontrolIn)
			6'b10xxxx: ALUcontrol <= 3'b000;
			6'b01xxxx: ALUcontrol <= 3'b001;
			6'b000010: ALUcontrol <= 3'b000;
			6'b000011: ALUcontrol <= 3'b001;
			6'b000100: ALUcontrol <= 3'b010;
			6'b000101: ALUcontrol <= 3'b011;
			6'b000110: ALUcontrol <= 3'b100;
			6'b000111: ALUcontrol <= 3'b101;
			6'b001000: ALUcontrol <= 3'b110;
			6'b001001: ALUcontrol <= 3'b111;
			6'b11xxxx: ALUcontrol <= 3'b000;
		endcase
	end
endmodule