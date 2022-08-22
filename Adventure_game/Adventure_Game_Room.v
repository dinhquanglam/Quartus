//-------------------
//The adventure game has seven rooms and one object (a sword). 
//The game begins in the Cave of Cacophony. To win the game, you must first head east through the Twisty Tunnel and south to Rapid River.
//From there, you'll need to find a Vorpal sword in the Secret Sword Stash to the west. 
//The sword will allow you to safely cross east from Rapid River through the Dragon Den into the Victory Vault (you've won the game at this point). If you enter the Dragon Den without the Vorpal sword, you will be devoured by a dangerous dragon and thrown into the Grievous Graveyard (where the game ends with you dying). You will still be in the Graveyard or Vault until reset 
//-------------------
module Adventure_Game_Room
	(
		input clk,
		input reset, // reset game after finish the game
		input start, // start game 
		input wire [1:0] direction, // moving direction 
		// 00 = North ( N )
		// 01 = East ( E )
		// 11 = South ( S )
		// 10 = West ( W )
		input  sword_state_r, // status with or without sword_enable
		output reg [2:0] room_locate,  // current room location
		output reg result // result of game 
		// result = 1 when you win, result = 0 when you lose
		// 000 = Cave of Cacophany
		// 001 = Twisty Tunnel
		// 010 = Rapid River
		// 011 = Secret Sword Stash
		// 100 = Dragon's Den
		// 101 = Grevious Graveyard (DEAD = LOSE )
		// 110 = Victory Vault ( WIN )
	);
parameter 
	S0 = 3'b000, //--Cave of Cacophany
	S1 = 3'b001, //--Twisty Tunnel
	S2 = 3'b010, //--Rapid River
	S3 = 3'b011, //--Secret Sword Stash
	S4 = 3'b100, //--Dragon's Den
	LOSE = 3'b101, //--Grevious Graveyard
	WIN = 3'b110; //--Victory Vault
//--------------------------------------
wire clk_enable; // clock enable signal for 1s
reg [2:0] current_state, next_state;
reg [10:0] count_reg = 0, count_state = 0; // couting signal
reg counting = 0, change_state = 0;  // full count signal
//--------------------------------------
//-- Moving state
always @ ( posedge clk ) 
		begin
			if ( ~start ) 
				current_state <= 3'b000;
			else 
				current_state <= next_state;
		end
//--------------------------------------
//--Room state
always @ (*)
	begin 
		case ( current_state )
		//--------------------
			S0 : begin // Cave of Cacophany
					room_locate = 3'b000;
				if ( direction == 2'b01 ) 
					next_state = S1;
				else next_state = current_state;
				end
			//--------------------------------
			S1 : begin // Twisty Tunnel 
					room_locate = 3'b001;
				if ( direction == 2'b10 ) begin
					next_state = S0; end
				else if ( direction == 2'b11 ) begin
					next_state = S2; end
				else next_state = current_state;
				end
			//---------------------------------
			S2 : begin // Rapid River
					room_locate = 3'b010;
				if ( direction == 2'b10 ) begin
					next_state = S3; end
				else if ( direction == 2'b00 ) begin
					next_state = S1; end
				else if ( direction == 2'b01 ) begin
					next_state = S4;
					counting = 1; 
					end
				else next_state = current_state;
				end
			//---------------------------------
			S3 : begin // Secret Sword Stash
					room_locate = 3'b011;
				if ( direction == 2'b01 ) 
					next_state = S2; 
				else next_state = current_state;
				end
			//---------------------------------
			S4 : begin // Dragon's Den
					room_locate = 3'b100;
				if ( sword_state_r && change_state  )
					begin
						next_state = WIN;
					end
				else if ( ~sword_state_r )
					begin
						next_state = LOSE;
					end
				end
			//---------------------------------
			LOSE : begin // Grevious Graveyard
					room_locate = 3'b101;
				if ( reset ) 
					next_state = S0;
				else next_state = current_state;
				end
			WIN: begin // Victory Vault
					room_locate = 3'b110;
				if ( reset ) 
					next_state = S0;
				else next_state = current_state;
				end
			default : next_state = S0;
		endcase
	end
//----------------------------------------------
//--Counting
always @ ( posedge clk )
	begin
		if ( clk_enable == 1 )
			begin
				if ( counting )
					count_state <= count_state + 1;
				if (count_state == 2)
					begin
						change_state = 1;
					end
				else
					begin
						change_state = 0;
					end
				end
			end
//--1s clock enable
always @ ( posedge clk )
	begin	
		count_reg <= count_reg + 1;
		
		if ( count_reg == 2 ) // clock cycle * 3 = 1s
		// example for testbench
		count_reg <= 0;
	end
assign clk_enable = count_reg == 2 ? 1 : 0;	
//-----------------------------------------------
//--Result
	always @ (*)
		begin
			if (room_locate == 3'b110)
				result = 1;
			else result = 0;
		end
endmodule
