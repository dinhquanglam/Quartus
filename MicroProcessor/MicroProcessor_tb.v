module MicroProcessor_tb();
	reg clock, clr, clockPC;
	wire [15:0] ALUresult, PC, inst, rdata1, rdata2, memToRegData, dataMemRead;
	
	MicroProcessor MP(.clock(clock), .clockPC(clockPC), .clr(clr), .ALUresult(ALUresult), .PC(PC), .inst(inst), .rdata1(rdata1), .rdata2(rdata2), .memToRegData(memToRegData), .dataMemRead(dataMemRead));
	initial begin
	clock = 0;
	forever #100 clock = ~clock;
	end
	
	initial begin
	clockPC = 0;
	forever #800 clockPC = ~clockPC;
	end
	
	initial begin
		clr = 1;
		#850;
		clr = 0;
	end
endmodule