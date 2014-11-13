module maze(input [9:0]x, input[9:0]y, input clk, input moveup, input movedown, input moveright, output [9:0] red, output [9:0] green, output [9:0] blue);

reg [2:0] idx;
reg [19:0] slowclk = 0; 

// initialize 4 numbers designating the dimensions of a square. x1 is where left edge begins, x2 is right edge, y1 is bottom edge, y2 is top edge
reg [9:0] squarex1, squarex2, squarey1, squarey2;

assign red = (idx[0]? 10'h3ff: 10'he1);
assign green = (idx[1]? 10'h3ff: 10'h2c2);
assign blue = (idx[2]? 10'h3ff: 10'h37a);

initial begin
	squarey2 <= 55;
	squarey1 <= 70; 
	squarex1 <= 55;
	squarex2 <= 70;
end

// moving the square
always @(posedge moveup, posedge moveright, posedge movedown)
begin
	if (moveup)
	begin
		squarey1 = squarey1 - 10;
		squarey2 = squarey1 - 10;
	end
	if (moveright)
	begin
		squarex1 = squarex1 + 10;
		squarex2 = squarex2 + 10;
	end
	if (movedown)
	begin
		squarey1 = squarey1 + 10;
		squarey2 = squarey1 + 10;
	end
end	

// drawing background, draw moving square before background maze
always@(x, y, clk, moveup, moveright, movedown)
begin
	if ((squarex1 < x) & (squarex2 > x) & (y > squarey2) & (y < squarey1))
		begin
		idx = 5;
		end
	else if ((x < 123) & (x > 46) & (y > 47) & (y < 327))
		begin
		idx = 3'd7;
		end
	else if ((x > 123) & (x < 158) & (y > 250) & (y < 328))
		begin
		idx = 3'd7;
		end
	else if ((x > 158) & (x < 236) & (y > 250) & (y < 429))
		begin
		idx = 3'd7;
		end
	else if ((x > 236) & (x < 281) & (y < 429) & (y > 351))
		begin
		idx = 3'd7;
		end
	else if ((x > 281) & (x < 358) & (y < 429) & (y > 81))
		begin
		idx = 3'd7;
		end
	else if ((x > 358) & (x < 426) & (y > 81) & (y < 159))
		begin
		idx = 3'd7;
		end
	else if ((x > 426) & (x < 503) & (y > 81) & (y < 299))
		begin
		idx = 3'd7;
		end
	else if ((x > 503) & (x < 609) & (y < 299) & (y > 222))
		begin
		idx = 3'd7;
		end
	else 
		begin
		idx = 0;
		end
end

endmodule