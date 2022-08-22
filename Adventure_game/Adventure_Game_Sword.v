//-------------------
//--The adventure game has seven rooms and one object (a sword). 
//--The game begins in the Cave of Cacophony. To win the game, you must first head east through the Twisty Tunnel and south to Rapid River. 
//From there, you'll need to find a Vorpal sword in the Secret Sword Stash to the west. 
//The sword will allow you to safely cross east from Rapid River through the Dragon Den into the Victory Vault (you've won the game at this point).
// If you enter the Dragon Den without the Vorpal sword, you will be devoured by a dangerous dragon and thrown into the Grievous Graveyard
// (where the game ends with you dying). You will still be in the Graveyard or Vault until reset 
//-------------------
module Adventure_Game_Sword
	(
		input clk,
		input reset, // reset game after game over
		input start, // start game 
		input wire [2:0] room_locate_r, // location room
		// Secret Sword Stash = 011
		output reg sword_state // status with or without sword
		// Sword = 1 when S3, else sword = 0
	);
//--------------------------------------
always @ ( posedge clk ) 
	begin
		if ( ~start ) begin 
			sword_state = 0; end
		else if ( room_locate_r == 3'b011 ) begin
			sword_state = 1; end
		else if ( reset ) begin
			sword_state = 0; end
		end
endmodule
