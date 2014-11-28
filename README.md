Annoying-Maze
=============

a maze game designed for Altera's DE2 board, makes use of [John Loomis' VGA controller](http://www.johnloomis.org/digitallab/vgalab/vgalab1/vgalab1.html) and takes inspiration from the Pong game example in *FPGA Prototyping by Verilog Examples* by Pong P. Chu. 

Features:
- "random" movement: the square moves on its own and may hit a wall on its own if you idle!
- customizable square (what you control) size, speed, "random movement" speed & direction
- game over if you hit a wall or if the countdown timer on 7-seg display goes to 0 (it starts at 30 sec)
- uses KEY[3:1] to go up,down,right and SW[0] is a reset switch
- if you read the end of the maze, display switches to greyscale bars but this can easily be changed to a custom "You Win" screen

This code compiles and works as it should.
