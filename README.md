# flash-project
Online Written Report for CS270
### The Task
To complete a flash tutorial and adapt it originally for my own use. 
### The idea
To create a Jaws-inspired arcade game where you play the shark and the goal is to attack beach-goers, swimmers etc. for points. 
The tutorial I plan to use to create this will be a [driving game tutorial](http://www.emanueleferonato.com/2010/06/16/create-a-flash-racing-game-tutorial-as3-version/) which is an AS3 updated version of this previous [AS2 tutorial](http://www.emanueleferonato.com/2007/05/15/create-a-flash-racing-game-tutorial/). The AS2 tutorial covers the logic while the AS3 is updated code. I have chosen this specific tutorial as the restriced movement of a car is very similiar to the restricted movement of a shark. 
### The Tutorial
For my purposes I only needed 1/18 steps of the tutorial, the basic idea of this step is to move and rotate a Movie Clip around a scene in a similiar way to how a vehicle moves when viewed from above. To do this, the tutorial uses trigonometry for all the movements of the vehicle. Trigonometry applies here because Flash uses a Cartesian coordinate system, which means it has an X and a Y axis. 

<img src="http://www.emanueleferonato.com/images/flash_tutorial_1_img_1.gif">

This img from the tutorial shows the math needed to create the movement of the vehicle, along with its utilisation of trigonometry in a cartesian coordinate system. As flash uses horizontal and vertical vectors, this math is needed to calculate their components, in this case the speed.  Another hurdle in flash is that it does not understand degrees and thus we must convert them to radians(although degrees are fine for our rotation of the moveiclip).

At the start of the tutorial I set my fps to 24 frames per second. This dicates how fast or slow the game runs. Thus the tutorial uses a technique commonly referred to as an OnEnterFrame function, which will be called by its event handler 24 times a second,  or whatever fps you have set. Without fps we would not be able to create the movement of the vehicle. 

For controls we use two event listeners for key presses and key releases. In order to be able to press multiple keys at once we use booleans for each key press/release. So if I press Up+Left, the keypress boolean for each key will be true, and the function will call their respective if statements. Using normal techniques for key event listeners does not work so well. 

