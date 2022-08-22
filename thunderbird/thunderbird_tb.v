module thunderbird_tb;
reg clk;
reg reset;
reg left;
reg right;
wire [5:0] light_out;
// clock
always #100 clk = ~clk;
thunderbird tb (
				.clk(clk),
				.reset(reset),
				.left(left),
				.right(right),
				.light_out(light_out)
				);
initial 
	begin
		clk <= 0; reset <= 0; left <= 0; right <= 0;
	repeat (3) @ ( posedge clk );
	reset <= 0; left <= 1; right <= 0;
	repeat (6) @ ( posedge clk );
	reset <= 0; left <= 1; right <= 0;
	repeat (3) @ ( posedge clk );
	reset <= 0; left <= 0; right <= 1;
	repeat (6) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 0;
	repeat (10) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 0;
	repeat (27) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 0;
	repeat (6) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 1;
	repeat (12) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 0;
	repeat (6) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 0;
	repeat (12) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 1;
	repeat (12) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 1;
	repeat (12) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 0;
	repeat (6) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 1;
	repeat (10) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 0;
	repeat (5) @ ( posedge clk );
	reset <= 1; left <= 0; right <= 1;
	repeat (11) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 1;
	repeat (8) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 0;
	repeat (13) @ ( posedge clk );
	reset <= 1; left <= 1; right <= 0;
	$finish;
	end
endmodule