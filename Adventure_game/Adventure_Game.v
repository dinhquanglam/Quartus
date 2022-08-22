//--Main adventure game file 
//--Adventure_Game_Room + Adventure_Game_Sword
module Adventure_Game 
	(
		input clk,
		input reset,
		input start,
		input wire [1:0] direction,
		output wire [2:0] room,
		output sword,
		output wire result
	);
	wire [2:0]room_state;
	wire sword_enable;
//--Module Room location
	Adventure_Game_Room A0 
		( 
			.clk(clk), 
			.reset(reset), 
			.start(start), 
			.direction(direction), 
			.sword_state_r(sword), 
			.room_locate(room), 
			.result(result)
		);
//--Module Sword State
	Adventure_Game_Sword A1 
		( 
			.clk(clk), 
			.reset(reset), 
			.start(start), 
			.room_locate_r(room), 
			.sword_state(sword)
		);
endmodule
