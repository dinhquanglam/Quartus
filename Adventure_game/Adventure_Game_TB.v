module Adventure_Game_TB;
reg clk;
reg start;
reg reset;
reg [1:0] direction;
wire [2:0] room;
wire sword;
wire result;
//-- clock
always #100 clk = ~clk;
Adventure_Game TB
	(
		.clk(clk),
		.start(start),
		.reset(reset),
		.direction(direction),
		.room(room),
		.sword(sword),
		.result(result)
	);
initial 
	begin
		clk <= 0; reset <= 0; start <= 0;
	//
	// Go to Secret Sword Stash(011=), find Vorpal Sword, kill dragon in Dragon Den  and Victory Vault (Win)
	//
	repeat (12) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	start <= 1;
	repeat (10) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b11;
	repeat (7) @ ( posedge clk );
	direction <= 2'b10;
	repeat (7) @ ( posedge clk );
	direction <= 2'b00;
	repeat (7) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b11;
	repeat (7) @ ( posedge clk );
	reset <= 1; 
	repeat (3) @ ( posedge clk );
	//
	//Didn't go to Secret Sword Stash, killed by dragon in Dragon Den  and Grievous Graveyard (Lose)
	//
	reset <= 0;
	repeat (3) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	start <= 1;
	repeat (10) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b11;
	repeat (7) @ ( posedge clk );
	direction <= 2'b01;
	repeat (7) @ ( posedge clk );
	direction <= 2'b11;
	repeat (7) @ ( posedge clk );
	reset <= 1; 
	repeat (7) @ ( posedge clk );	
	$finish;
	end
endmodule
