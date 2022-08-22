module InstructionMemory(PC, instruction);
	input [15:0] PC;
	output [15:0] instruction;

	wire [15:0] instruction;
	wire [3:0] address = PC[3:0];
	reg [15:0] instructionSet [15:0];
	initial begin
		instructionSet[0] = 16'b0011110010000000; // rf[0] = rf[6] - rf[2]
		instructionSet[1] = 16'b0001101000000000; // sw, rf[5], rf[0], 0 
		instructionSet[2] = 16'b0000100010000001;	// lw, rf[4], rf[2], 1
		instructionSet[3] = 16'b1010100010000010;	// beq, rf[4], rf[2], 2
		instructionSet[4] = 16'b0010110010000000;
		instructionSet[5] = 16'b0010110010000000;
		instructionSet[6] = 16'b0010111010000000; // rf[0] = rf[7] + rf[2]
		instructionSet[7] = 16'b1100000000000100; // j, 4
		instructionSet[8] = 16'b0010110010000000;
		instructionSet[9] = 16'b0010110010000000;
		instructionSet[10] = 16'b0010110010000000;
		instructionSet[11] = 16'b0010110010000000;
		instructionSet[12] = 16'b0010110010000000;
		instructionSet[13] = 16'b0010110010000000;
		instructionSet[14] = 16'b0010110010000000;
		instructionSet[15] = 16'b0010110010000000;
		//$readmemb("InstructionSet.txt", instructionSet);
	end
	assign instruction = instructionSet[address];
endmodule