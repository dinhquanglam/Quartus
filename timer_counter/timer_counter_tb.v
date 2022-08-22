module timer_counter_tb;
reg clk;
reg reset;
reg start;
reg direction;
wire [6:0] digit_units;
wire [6:0] digit_tens;
//--clock
always #100 clk = ~clk;
timer_counter TB
	( 
		.clk(clk),
		.reset(reset),
		.start(start),
		.direction(direction),
		.digit_units(digit_units),
		.digit_tens(digit_tens)
	);
initial
	begin
		clk <= 0; reset <= 0; start = 0; direction <= 1;
		repeat (15) @ ( posedge clk );
		start <= 1;
		repeat (60) @ ( posedge clk );
		reset <= 1; 
		repeat (2) @ ( posedge clk );
		reset <= 0;
		repeat (70) @ ( posedge clk );
		direction <= 0;
		repeat (75) @ ( posedge clk );
		$finish;
	end
endmodule
