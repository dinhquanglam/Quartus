module DataMemory(clock, address, wdata, memwrite, memread, rdata);
	input clock, memwrite, memread;
	input [15:0] address;
	input [15:0] wdata;
	output [15:0] rdata;
	
	wire [15:0] rdata;
	reg [15:0] dataMem [15:0];
	
	initial begin
		//$readmemb("DataSet.txt", dataMem);
		dataMem[0] = 16'b0000000000000000;
		dataMem[1] = 16'b0000000000000000;
		dataMem[2] = 16'b0000000000000000;
		dataMem[3] = 16'b0000000000000000;
		dataMem[4] = 16'b0000000000000000;
		dataMem[5] = 16'b0000000000000000;
		dataMem[6] = 16'b0000000000000000;
		dataMem[7] = 16'b0000000000000000;
		dataMem[8] = 16'b0000000000000000;
		dataMem[9] = 16'b0000000000000000;
		dataMem[10] = 16'b0000000000000000;
		dataMem[11] = 16'b0000000000000000;
		dataMem[12] = 16'b0000000000000000;
		dataMem[13] = 16'b0000000000000000;
		dataMem[14] = 16'b0000000000000000;
		dataMem[15] = 16'b0000000000000000;
	end
	
	always @(posedge clock) begin
		if(memwrite) begin
			dataMem[address] <= wdata;
		end
	end
	assign rdata = (memread) ? dataMem[address] : 16'd0;

endmodule