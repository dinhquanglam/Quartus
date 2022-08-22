module thunderbird
	(
		input clk,
		input reset,
		input left, // turn left
		input right,// turn right
		output reg [5:0] light_out
	);
	// Light 		LED_L3	LED_L2	LED_L1		LED_R1	LED_R2	LED_R3
	// State IDLE 		0			0			0				0			0			0
	// State L1 		0			0			1				0			0			0
	// State L2 		0			1			1				0			0			0
	// State L3 		1			1			1				0			0			0
	// State R1 		0			0			0				1			0			0
	// State R2 		0			0			1				1			1			0
	// State R3 		0			0			1				1			1			1
	// State LR 		1			1			1				1			1			1
parameter 
	IDLE = 3'b000,
	L1 = 3'b001,
	L2 = 3'b010,
	L3 = 3'b011,
	R1 = 3'b100,
	R2 = 3'b101,
	R3 = 3'b110,
	LR = 3'b111;
	//---------------------------------
	reg [2:0] current_state, next_state;
	reg light_timer = 0, next_light = 0;
	reg [10:0] count_reg = 0;
	//----------------------------------
	// state
	always @ ( posedge clk )
		begin	
			if ( ~reset ) begin
				current_state <= 3'b000; end
			else if ( left && right ) begin
				current_state <= 3'b111; end
			else begin
				current_state <= next_state; end
			end
	//----------------------------------
	// fsm
	always @ (*) // ko co tin hieu uu tien
	begin
		case ( current_state ) 
		//-------------------
		IDLE : begin
			light_out = 6'b000000;
			light_timer = 0;
					if ( left ) begin next_state = L1;
					end
					else if	( right ) begin next_state = R1;
					end
					else begin next_state = IDLE; end
				end
		//---------------------------------
		L1 : begin
				light_out = 6'b001000;
				light_timer = 1;
				if ( next_light ) next_state = L2;
				else next_state = L1;
			end
		//---------------------------------
		L2 : begin
				light_out = 6'b011000;
				light_timer = 1;
				if ( next_light ) next_state = L3;
				else next_state = L2;
			end
		//---------------------------------
		L3 : begin
				light_out = 6'b111000;
				light_timer = 1;
				if ( next_light ) next_state = IDLE;
				else next_state = L3;
			end
		//---------------------------------
		R1 : begin
				light_out = 6'b000100;
				light_timer = 1;
				if ( next_light ) next_state = R2;
				else next_state = R1;
			end
		//---------------------------------
		R2 : begin
				light_out = 6'b000110;
				light_timer = 1;
				if ( next_light ) next_state = R3;
				else next_state = R2;
			end
		//---------------------------------
		R3 : begin
				light_out = 6'b000111;
				light_timer = 1;
				if ( next_light ) next_state = IDLE;
				else next_state = R3;
			end
		//---------------------------------
		LR : begin
				light_out = 6'b111111;
				light_timer = 0;
				if ( ~(left&&right) ) next_state = IDLE;
				else next_state = LR;
			end
		//---------------------------------
		default : next_state = IDLE;
		endcase
	end
//-------------------------------
// counting
always @ ( posedge clk )
	begin
		if ( light_timer ) 
		count_reg <= count_reg + 1;
		if (count_reg == 2) begin
			next_light = 1;
			count_reg <= 0;
		end
		else begin
			next_light = 0;
		end
	end
//----------------------------
endmodule
