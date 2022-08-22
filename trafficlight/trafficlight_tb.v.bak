module trafficlight _tb;
reg clk;
reg reset;
reg traffic;
wire [2:0] light_A;
wire [2:0] light_B;
// clock
always #100 clk = ~clk;
trafficlight tb (
				.clk(clk),
				.reset(reset),
				.traffic_A(traffic_A),
				.traffic_B(traffic_B),
				.light_A(light_A),
				.light_B(light_B)
				);
initial 
	begin
		clk <= 0; reset <= 0; traffic <= 0;
	repeat (5) @ ( posedge clk );
	reset <= 1;
	repeat (15) @ ( posedge clk );
	traffic_A <= 1; traffic_B <= 0;
	repeat (28) @ ( posedge clk );
	traffic_A <= 0; traffic_B <= 1;
	repeat (21) @ ( posedge clk );
	traffic_A <= 1; traffic_B <= 0;
	repeat (26) @ ( posedge clk );
	traffic_A <= 0; traffic_B <= 1;
	repeat (25) @ ( posedge clk );
	traffic_A <= 1; traffic_B <= 0;
	repeat (27) @ ( posedge clk );
	$finish;
	end
endmodule
