// 2 routes LA, LB
// Route LA : green 1 (g1), Yellow 1 (y1), Red 1 (r1)
// Route LB : green 2 (g2), Yellow 2 (y2), Red 2 (r2)
/////////////////////////////////////////////////////
module fsm_dgt 
	(
		input clk,//clock = 50MHz in real life
		input reset, // active low
		input traffic, // = 1 when LB > LA
		output reg [5:0] light
		// Bit    5 	4 		3 		2 		1 		0
		// Light g1 	y1 	r1 	g2 	y2 	r2
		// output of lights
	);
parameter 
	S0 = 2'b00, //S0 : LA : green, LB : red
	S1 = 2'b01, //S1 : LA : yellow, LB : red
	S2 = 2'b10, //S2 : LA : red, LB : green
	S3 = 2'b11; //S3 : LA : red, LB : yellow
/////////////////////////////////////////////////
wire clk_enable; // clock enable signal for 1s
reg [1:0] current_state, next_state;
reg yellow_count_A = 0, yellow_count_B = 0; // counting signal
reg yellow_A = 0, yellow_B = 0; // full count signal 
reg [27:0] count_delay = 0, count_reg = 0 ;
// state
always @ ( posedge clk )
	begin
		if ( ~reset )
			current_state <= 2'b00;
		else
			current_state <= next_state;
	end
/////////////////////////////////////////////////
// fsm
always @ (*)
	begin	
		case ( current_state )
			/////////////////////
			S0 : begin // LA : green, LB : red
					yellow_count_A = 0;
					yellow_count_B = 0;
					light = 6'b100001;
				if ( traffic ) next_state = S1;
				else next_state = S0;
				end
				/////////////////////
			S1 : begin // LA : yellow, LB : red
					light = 6'b010001;
					yellow_count_A = 1;
					yellow_count_B = 0;
				if ( yellow_A ) next_state = S2;
				//yellow time for 3s, then LA = red, LB = green
				else next_state = S1;
				end
				////////////////////
			S2 : begin // LA: red, LB : green
					light = 6'b001100;
					yellow_count_A = 0;
					yellow_count_B = 0;
				if ( ~traffic ) next_state = S3; 
				else next_state = S2;
				end
				///////////////////
			S3 : begin // LA : red, LB : yellow
					light = 6'b001010;
					yellow_count_A = 0;
					yellow_count_B = 1;
				if ( yellow_B ) next_state = S0;
				// yellow time for 3s, then LB = red, LB = green
				else next_state = S3;
				end
			default : next_state = S0;
		endcase
	end
//////////////////////////
// counting
always @ ( posedge clk ) 
	begin
		if ( clk_enable == 1 ) 
			begin
				if ( yellow_count_A || yellow_count_B )
				count_delay <= count_delay + 1;
				if (( count_delay == 2 )&& yellow_count_A ) 
					begin
						yellow_A = 1;
						yellow_B = 0;
						count_delay <= 0;
					end
				else if ((count_delay == 2 )&& yellow_count_B )
					begin
						yellow_A = 0;
						yellow_B = 1;
						count_delay <= 0;
					end
				else 
					begin
						yellow_A = 0;
						yellow_B = 0;
					end
				end
			end
/////////////////////////
// 1s clock enable 
always @ ( posedge clk )
	begin	
		count_reg <= count_reg + 1;
		
		if ( count_reg == 2 ) // clock cycle * 3 = 1s
		// example for testbench
		count_reg <= 0;
	end 
////////////////////////////
assign clk_enable = count_reg == 2 ? 1 : 0;
endmodule
