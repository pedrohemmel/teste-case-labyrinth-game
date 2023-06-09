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
