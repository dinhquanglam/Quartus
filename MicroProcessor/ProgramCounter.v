module ProgramCounter(clock, clr, PCsource, data, PC);
	input clock, clr, PCsource;
	input [15:0] data;
	output [15:0] PC;
	
	reg [15:0] PC;
	
	always @(posedge clock) begin 
		if(clr == 1) begin
			PC <= 16'd0;
		end
		else begin
			if(PCsource) begin
				PC <= PC + 1 + data;
			end
			else begin
				PC <= PC + 1;
			end
		end
	end
endmodule