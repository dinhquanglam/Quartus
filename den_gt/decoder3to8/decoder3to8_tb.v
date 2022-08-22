module decorder3to8_tb;
reg [2:0] in;
wire [7:0] out;
decoder3to8 tb(
	.in(in),
	.out(out)
		);

initial begin
	in = 3'b000;
	#100;
	in = 3'b001;
	#100;
	in = 3'b010;
	#100;
	in = 3'b011;
	#100;
	in = 3'b100;
	#100;
	in = 3'b101;
	#100;
	in = 3'b110;
	#100;
	in = 3'b111;
	#100;
	end

 endmodule