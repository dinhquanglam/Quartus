// 2-digit counter can count forward or backward depending on the control signal 
// you require, the counter uses 2 7-segment LEDs to display 2 tens and units
//------------------------------------------------------------------------------
module timer_counter
	(
		input clk, // system clock
		input start, // counting when start = 1, not count when start = 0
		input reset, // reset counting
		input direction, 
		// count up or count down
		// 1 = count up, 0 = count down
		output reg [6:0] digit_units, // units abcdefg
		output reg [6:0] digit_tens // tens
	);
wire second_ena; // 1 second signal
reg [10:0] count_1s = 0; // 1 second counting signal
// counting signal 
reg [10:0] count_units = 0;
reg [10:0] count_tens = 0; 
// counting signal
always @ ( posedge clk ) 
	begin
		if ( start == 0 || reset == 1 ) begin
				count_units = 0;
				count_tens = 0; end
		//-- count up
		else if ( start == 1 && direction == 1 && reset == 0 ) begin
			if	( second_ena == 1 ) begin //-- (1)
				count_units = count_units + 1;
				if ( count_units == 10 ) begin
					count_units = 0;
					count_tens = count_tens + 1; end
		end
		end //-- (1)
		//-- count down
		else if ( start == 1 && direction == 0 && reset == 0 ) begin
			if	( second_ena == 1 ) begin //-- (1)
				count_units = count_units - 1;
				if ( count_units == 0 ) begin
					count_units = 9;
					count_tens = count_tens - 1; end
		end
	end //-- (1)
		// case units
		case ( count_units ) 
				0: digit_units = 7'b1111110;
            1: digit_units = 7'b0110000;
            2: digit_units = 7'b1101101;
            3: digit_units = 7'b1111001;
            4: digit_units = 7'b0110011;
            5: digit_units = 7'b1011011;
            6: digit_units = 7'b1011111;
            7: digit_units = 7'b1110000;
            8: digit_units = 7'b1111111;
            9: digit_units = 7'b1111011;
				default : digit_units = 7'b1111110;
		endcase
		// case tens
		case ( count_tens )
		      0: digit_tens = 7'b1111110;
            1: digit_tens = 7'b0110000;
            2: digit_tens = 7'b1101101;
            3: digit_tens = 7'b1111001;
            4: digit_tens = 7'b0110011;
            5: digit_tens = 7'b1011011;
            6: digit_tens = 7'b1011111;
            7: digit_tens = 7'b1110000;
            8: digit_tens = 7'b1111111;
            9: digit_tens = 7'b1111011;
				default : digit_tens = 7'b1111110;
		endcase
	end
	///  1 second enable
always @ ( posedge clk ) 
	begin
		count_1s <= count_1s + 1;
		if ( count_1s == 2 ) // clock cycle * 3 = 1s
		// example for testbench
			count_1s <= 0;
		end
assign second_ena = count_1s == 2 ? 1: 0;
//-----------------------------------------
endmodule
	