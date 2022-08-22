module RegFile(clock, rr1, rr2, wr, regW, dataW, read1, read2);
	input clock;
	input [2:0] rr1, rr2, wr;
	input regW;
	input [15:0]dataW;
	output [15:0] read1, read2;
	
	wire [15:0] read1, read2;
	reg [15:0] rf [7:0]; //3 bits address => array of 8 register.
	initial begin 
		//$readmemb("RegisterSet.txt", rf);
		rf[0] = 16'b0000000000000000;
		rf[1] = 16'b0000000000000001;
		rf[2] = 16'b0000000000000010;
		rf[3] = 16'b0000000000000011;
		rf[4] = 16'b0000000000000100;
		rf[5] = 16'b0000000000000101;
		rf[6] = 16'b0000000000000110;
		rf[7] = 16'b0000000000000111;
	end
	always @ (posedge clock) begin
		if(regW == 1) begin
			rf[wr] <= dataW; 
		end
	end
	assign read1 = rf[rr1];
	assign read2 = rf[rr2];

endmodule