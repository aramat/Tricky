module maze(input [9:0]x, input[9:0]y, input clk, input reset, input moveup, input movedown, input moveright, output [9:0] red, output [9:0] green, output [9:0] blue);

// x1, y1 designate the upperleft corner of the square
reg [9:0] squarex1, squarey1, squarex1_next, squarey1_next;
wire [9:0] squarex1_check, squarey1_check, squarey2, squarex2;
localparam SQUARE_SIZE = 15; 
wire square_on;
wire collision_on;

wire refr_tick;
assign refr_tick = (y == 481) && (x == 0);

reg [2:0] idx;
assign red = (idx[0]? 10'h3ff: 10'he1);
assign green = (idx[1]? 10'h3ff: 10'h2c2);
assign blue = (idx[2]? 10'h3ff: 10'h37a);

initial 
begin
	squarex1 <= 9'd55;
	squarey1 <= 9'd55;
end

// moving the square, DON'T USE POSEDGE
//always @(negedge moveup or negedge moveright or negedge movedown)
assign squarex1_check = squarex1;
assign squarey1_check = squarey1;
assign squarex2 = squarex1_check + SQUARE_SIZE; 
assign squarey2 = squarey1_check + SQUARE_SIZE;
assign square_on = (squarex1_check < x) && (squarex2 >= x) && (squarey1_check < y) && (squarey2 >= y);






always @(posedge clk, posedge reset)
if (reset)
begin
squarex1 <= 9'd55;
squarey1 <= 9'd55;
end
else
begin
squarex1 <= squarex1_next;
squarey1 <= squarey1_next;
end

always @(*)
begin
squarex1_next = squarex1;
squarey1_next = squarey1;
if (refr_tick)
	if (~moveup)
		squarey1_next = squarey1 - 1;
	else if (~movedown)
		squarey1_next = squarey1 + 1;
	else if (~moveright)
		squarex1_next = squarex1 + 1;
end	

// rgb multiplexer

always@(*)
begin
	if (square_on)
		begin
		idx = 5;
		end
	else if ((x < 123) && (x >= 46) & (y >= 47) & (y < 328))
		begin
		idx = 3'd7;
		end
	else if ((x >= 123) && (x < 158) & (y >= 250) & (y < 328))
		begin
		idx = 3'd7;
		end
	else if ((x >= 158) && (x < 236) & (y >= 250) & (y < 429))
		begin
		idx = 3'd7;
		end
	else if ((x >= 236) & (x < 281) & (y < 429) & (y >= 351))
		begin
		idx = 3'd7;
		end
	else if ((x >= 281) & (x < 358) & (y < 429) & (y >= 81))
		begin
		idx = 3'd7;
		end
	else if ((x >= 358) & (x < 426) & (y >= 81) & (y < 159))
		begin
		idx = 3'd7;
		end
	else if ((x >= 426) & (x < 503) & (y >= 81) & (y < 299))
		begin
		idx = 3'd7;
		end
	else if ((x >= 503) & (x < 609) & (y < 299) & (y >= 222))
		begin
		idx = 3'd7;
		end
	else 
		begin
		idx = 0;
		end
end

endmodule
