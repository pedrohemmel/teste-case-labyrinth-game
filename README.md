# Problem

The task is to write a simple maze/labyrinth game - you can use any language/framework to create a game in a mobile version. 

* The game should contain a starting window - the main window. After the game result window and resumption. 
* The labyrinth structure should be stored in the form of a table of numbers total. 
* Each of the numbers specifies the entrances / outputs for a given labyrinth chamber: Bit values determine which door can be passed.  
  * (2^0) - left, 
  * (2^1) - right,  
  * (2^2) - up,  
  * (2^3) - down. 
* One -way passage is allowed. 
* Each of the chambers should be implemented as one screen with four buttons on its edges. Press the button causes a transition to the chamber lying on the side of the screen on which there is a button. 
* Determining the possibility of moving to the neighboring chamber should be determined The color of the button (you can use graphic elements). 
* The end of the game consists in reaching the specific alloy chamber value 0. 
* The start chamber has a bit 4 (2^4). 
* Example of a maze:  
{10, 8, 10, 9,  
28, 1, 0, 12,  
12, 10, 9, 13,  
6, 5, 6, 5}  
* And do Labyrinth generator of any size 

## Case analysis

Make a maze game, the maze will be an array of decimal numbers. Each decimal number will be represented as binary and this will define the movement of the numbers.  
  
* (2^0) - esquerda
* (2^1) - direita
* (2^2) - cima
* (2^3) - baixo

So by logic, if we are at number 10 (dec) being represented by 1010 (bin), we can go right or down, because:

2ˆ3 - 2^2 - 2ˆ1 - 2ˆ0  
   | ----- | ----- | ----- |  
  1   —--  0   —--  1  —--  0  
DN -  N/D - RT - N/D  

The game ends when the player reaches the state with value 0.  

What will be done?  

An application using Swift with UIKit to create a matrix-shaped board to implement the movement logic to the reward state (state with value 0). And after that, show a result screen with the option to redo the maze.  

The initial state is the decimal number that, when converted to binary, contains 2ˆ4, therefore, in the case given by the exercise, it would be in the number 28 dec.
