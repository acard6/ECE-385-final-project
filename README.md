This project was made for UIUC SP'22 

The project was to make tetris on an FPGA board entirely as hardware with some 
software for reading inputs from a USB keyboard.
The game is played like a normal tetris game utilizing 'A' and 'D' to move left and right
respectively 'S' to rotate the piece, and SPACE BAR to set the piece.
Notable features that I had implemented were a start screen, a game screen, and a game over
screen each screen is accessed by hitting ENTER to move on to the game screen. The onboard
button of the FPGA also acts as a Reset so as to reset the game to its initialization point.