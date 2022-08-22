module MicroProcessor(clock, clockPC, clr, ALUresult, PC, inst, rdata1, rdata2, memToRegData, dataMemRead);
	input clock, clockPC, clr;
	output [15:0] ALUresult, PC, inst, rdata1, rdata2, memToRegData, dataMemRead;
	
	wire [15:0] PC;
	wire PCsrc;
	wire regDest, regW, ALUsrc, memread, memwrite, memToReg, bne, beq, jump;
	wire [1:0] ALUop;
	wire [15:0] inst;
	wire [2:0] rr1, rr2, wr;
	wire [15:0] rdata1, rdata2;
	wire [15:0] immExt;
	wire [15:0] inALU2;
	wire [2:0] ALUcontrol;
	wire [15:0] ALUresult;
	wire isZero;
	wire [15:0] dataMemRead;
	wire [15:0] memToRegData;
	
	ProgramCounter PrC(.clock(clockPC), .clr(clr), .PCsource(PCsrc), .data(immExt), .PC(PC));
	
	InstructionMemory IM(.PC(PC), .instruction(inst));
	
	ControlUnit CU(.Opcode(inst[15:12]), .ALUop(ALUop), .regDest(regDest), .regW(regW)
	, .ALUsrc(ALUsrc), .memread(memread), .memwrite(memwrite)
	, .memToReg(memToReg), .bne(bne), .beq(beq), .jump(jump));
	
	assign rr1 = inst[11:9];
	assign rr2 = inst[8:6];
	assign wr = (regDest == 1) ? inst[5:3] : inst[8:6];
	
	RegFile RF(.clock(clock), .rr1(rr1), .rr2(rr2), .wr(wr), .regW(regW), .dataW(memToRegData), .read1(rdata1), .read2(rdata2));
	
	assign immExt = (jump == 1) ? {{4{inst[11]}},inst[11:0]} : {{10{inst[5]}},inst[5:0]};
	assign inALU2 = (ALUsrc == 1) ? immExt : rdata2;
	
	ALUcontrolUnit ACU(.ALUop(ALUop), .Opcode(inst[15:12]), .ALUcontrol(ALUcontrol));
	
	ALU AL(.inA(rdata1), .inB(inALU2), .ALUcontrol(ALUcontrol), .ALUresult(ALUresult), .isZero(isZero));
	
	assign PCsrc = (isZero & beq) | (~isZero & bne) | jump;
	
	DataMemory DM(.clock(clock), .address(ALUresult), .wdata(rdata2), .memwrite(memwrite), .memread(memread), .rdata(dataMemRead));
	
	assign memToRegData = (memToReg == 1)  ? dataMemRead : ALUresult; 
	
endmodule