module fsm_dgt_tb;
reg clk;
reg reset;
reg traffic;
wire [5:0] light;
// clock
always #100 clk = ~clk;
fsm_dgt u0 (
				.clk(clk),
				.reset(reset),
				.traffic(traffic),
				.light(light)
				);
initial 
	begin
		clk <= 0; reset <= 0; traffic <= 0;
	repeat (5) @ ( posedge clk );
	reset <= 1;
	repeat (15) @ ( posedge clk );
	traffic <= 1;
	repeat (28) @ ( posedge clk );
	traffic <= 0;
	repeat (21) @ ( posedge clk );
	traffic <= 1;
	repeat (26) @ ( posedge clk );
	traffic <= 0;
	repeat (25) @ ( posedge clk );
	traffic <= 1;
	repeat (27) @ ( posedge clk );
	$finish;
	end
endmodule
