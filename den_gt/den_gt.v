// --2 routes LA, LB
// --Traffic lights automatically count and switch modes after counting the set time
// --Total time of yellow light + green light on this route will be equal to the time 
// of red light on the other route
// --Route LA : green 1 (g1), Yellow 1 (y1), Red 1 (r1)
// --Route LB : green 2 (g2), Yellow 2 (y2), Red 2 (r2)
//-------------------------------------------
module den_gt 
	(
		input clk,//clock = 50MHz in real life
		input reset, //
		output reg [5:0] light
		// Bit    5 	4 		3 		2 		1 		0
		// Light g1 	y1 	r1 	g2 	y2 	r2
		// output of lights
	);
parameter 
	IDLE = 3'b000, // IDLE : Only yellow
	S0 = 3'b100, //S0 : LA : green, LB : red
	S1 = 3'b101, //S1 : LA : yellow, LB : red
	S2 = 3'b110, //S2 : LA : red, LB : green
	S3 = 3'b111; //S3 : LA : red, LB : yellow
	// green time + yellow time = red time
//---------------------------------------------
wire clk_enable; // clock enable signal for 1s
reg [3:0] current_state, next_state;
reg yellow_count = 0, green_count = 0; // counting signal
reg yellow = 0, green = 0; // full count signal 
reg [27:0] count_delay = 0, count_reg = 0 ;
//------------------------------------------------
// state
always @ ( posedge clk )
	begin
		if ( ~reset )
			current_state <= IDLE;
		else
			current_state <= next_state;
	end
//----------------------------------------------
// fsm
always @ (*)
	begin	
		case ( current_state )
			//------------------------
			IDLE : begin // Only yellow
					light = 6'b010010;
					yellow_count = 0;
					green_count = 0;
					if (reset) next_state <= S0;
					else next_state <= IDLE;
				end
			//--------------------------------
			S0 : begin // LA : green, LB : red
					yellow_count = 0;
					green_count = 1;
					light = 6'b100001;
				if ( green ) next_state = S1;
				else next_state = S0;
				end
				//------------------------------
			S1 : begin // LA : yellow, LB : red
					light = 6'b010001;
					yellow_count = 1;
					green_count = 0;
				if ( yellow ) next_state = S2;
				//yellow time for 3s, then LA = red, LB = green
				else next_state = S1;
				end
				//----------------------------
			S2 : begin // LA: red, LB : green
					light = 6'b001100;
					yellow_count = 0;
					green_count = 1;
				if ( green ) next_state = S3; 
				else next_state = S2;
				end
				//------------------------------
			S3 : begin // LA : red, LB : yellow
					light = 6'b001010;
					yellow_count = 1;
					green_count = 0;
				if ( yellow ) next_state = S0;
				// yellow time for 3s, then LB = red, LB = green
				else next_state = S3;
				end
			default : next_state = IDLE;
		endcase
	end
//---------------------
// counting
always @ ( posedge clk ) 
	begin
		if ( clk_enable == 1 ) 
			begin
				if ( yellow_count || green_count )
				count_delay <= count_delay + 1;
				if (( count_delay == 1 )&& yellow_count ) 
					begin
						yellow = 1;
						green = 0;
						count_delay <= 0;
					end
				else if ((count_delay == 2 )&& green_count )
					begin
						yellow = 0;
						green = 1;
						count_delay <= 0;
					end
				else 
					begin
						yellow = 0;
						green = 0;
					end
				end
			end
//----------------------
// 1s clock enable 
always @ ( posedge clk )
	begin	
		count_reg <= count_reg + 1;
		
		if ( count_reg == 2 ) // clock cycle * 3 = 1s
		// example for testbench
		count_reg <= 0;
	end 
//-----------------------------------------
assign clk_enable = count_reg == 2 ? 1 : 0;
endmodule