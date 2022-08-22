module den_gt_tb;
reg clk;
reg reset;
wire [5:0] light;
// clock
always #100 clk = ~clk;
den_gt u0 (
				.clk(clk),
				.reset(reset),
				.light(light)
				);
initial 
	begin
		clk <= 0; reset <= 0;
	repeat (15) @ ( posedge clk );
	reset <= 1;
	repeat (35) @ ( posedge clk );
	reset <= 0;
	repeat (15) @ ( posedge clk );
	reset <= 1;
	repeat (40) @ ( posedge clk );
	reset <= 0;
	repeat (10) @ ( posedge clk );
	$finish;
	end
endmodule