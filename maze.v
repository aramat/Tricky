module maze(input [9:0]x, input[9:0]y, input clk, input moveup, input movedown, input moveright, output [9:0] red, output [9:0] green, output [9:0] blue);

// key1 = up, key2 = down, key3 = right
reg [2:0] idx;
reg [19:0] slowclk = 0; 

// initialize 4 numbers designating the dimensions of a square. x1 is where left edge begins, x2 is right edge, y1 is bottom edge, y2 is top edge
reg [9:0] squarex1, squarex2, squarey1, squarey2;

assign red = (idx[0]? 10'h3ff: 10'he1);
assign green = (idx[1]? 10'h3ff: 10'h2c2);
assign blue = (idx[2]? 10'h3ff: 10'h37a);

initial begin
	squarex1 = 9'd55;
	squarex2 = 9'd70;
	squarey1 = 9'd55;
	squarey2 = 9'd70;
end

// moving the square, DON'T USE POSEDGE
//always @(negedge moveup or negedge moveright or negedge movedown)
always @(posedge moveright)
begin
	if (moveup)
	begin
		//squarey1 = 0;//squarey1 - 9'd10;
		//squarey2 = 0;//squarey2 - 9'd10;
		squarey1 = squarey1 - 9'd10;
		squarey2 = squarey2 - 9'd10;
	end
	else if (movedown)
	begin
		squarey1 = squarey1 + 9'd10;
		squarey2 = squarey2 + 9'd10;
	end
	else if (moveright)
	begin
		squarex1 = squarex1 + 9'd10;
		squarex2 = squarex2 + 9'd10;
	end
end	

// drawing background, draw moving square before background maze
//always@(x, y, clk, moveup, moveright, movedown)
always@(*)
begin
	if ((squarex1 < x) && (squarex2 >= x) && (squarey1 < y) && (squarey2 >= y))
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
