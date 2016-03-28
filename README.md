# flash-project
Online Written Report for CS270
### The Task
To complete a flash tutorial and adapt it originally for my own use. 
### The idea
After watching the films Jaws, Jaws 2 & Jaws:The Revenge, I decided to create a Jaws-inspired arcade game where you play the shark and the goal is to attack beach-goers, swimmers etc. for points. I will also be using a pixelart style. 
The tutorial I plan to adapt to create this will be a [driving game tutorial](http://www.emanueleferonato.com/2010/06/16/create-a-flash-racing-game-tutorial-as3-version/) which is an AS3 updated version of this previous [AS2 tutorial](http://www.emanueleferonato.com/2007/05/15/create-a-flash-racing-game-tutorial/). The AS2 tutorial covers the logic while the AS3 is updated code. I have chosen this specific tutorial as the restricted movement of a car is very similiar to the restricted movement of a shark. 
### The Tutorial
For my purposes I only needed 1/18 steps of the tutorial, the basic idea of this step is to move and rotate a Movie Clip around a scene in a similiar way to how a vehicle moves when viewed from above. To do this, the tutorial uses trigonometry for all the movements of the vehicle. Trigonometry applies here because Flash uses a Cartesian coordinate system, which means it has an X and a Y axis. 

<img src="http://www.emanueleferonato.com/images/flash_tutorial_1_img_1.gif">

This img from the tutorial shows the math needed to create the movement of the vehicle, along with its utilisation of trigonometry in a cartesian coordinate system. As flash uses horizontal and vertical vectors, this math is needed to calculate their components, in this case the speed.  Another hurdle in flash is that it does not understand degrees and thus we must convert them to radians(although degrees are fine for our rotation of the moveiclip).

At the start of the tutorial I set my fps to 24 frames per second. This dicates how fast or slow the game runs. Thus the tutorial uses a technique commonly referred to as an OnEnterFrame function, which will be called by its event handler 24 times a second,  or whatever fps you have set. Without fps we would not be able to create the movement of the vehicle. 

For controls we use two event listeners for key presses and key releases. In order to be able to press multiple keys at once we use booleans for each key press/release. So if I press Up+Left, the keypress boolean for each key will be true, and the functions will call their respective if statements. Using normal techniques with key event listeners does not work so well for games as smooth movement is required along with multiple key presses. 

Using the constructor function for car_mc we update its x and y positions along with a event listener to check if its been added to the stage.

In our main class we create a new shark object and set its starting x and y coordinates.
### Adaptation
To start making a game I usually start with a mockup. A mockup being an idea of what the game might look like, with ideas I might be able to implement. I usually set the style at this point also.

<img src="http://i.imgur.com/Gjs5akf.png">

To create my art assests I used the program Paint.NET although I ran into issues when animating the movieclip and resorted to Photoshop to create a .psd of the shark. Below is all the art assets in one image, including a spritesheet version of the sharks movement.  

<img src="http://i.imgur.com/YdFNg5N.png">

As each asset will be moving(along x and y coords) I needed to make each one a MovieClip with a corresponding .as class that would allow me to set their starting x and y values. Simply have their constructor function take in two int variables and assign them to their x and y positions. Most of the assets will be static but I plan to make them random each time you play. So almost all the MovieClips will have almost identical classes that just take in x and y values.

Apart from the MovieClip classes, I will have a menu class, game control class and a main class. I will use the main class for switching between the menu to the game and then for reseting the game. 

In the main class I have a function containing event listeners for KEY_UP and KEY_DOWN Keyboard Events. This is also where I will create the menu object. The KEY_DOWN function will create the game object, and then if the enter key is pressed down, remove the menu and add the game to the display. This is done with addchild() and removeChild(). 

The KEY_UP function will add the game to display again using addChild(). This is something that I could not quite get correct. removing the game object would lead to errors but adding the game object again doesnt lead to any errors or graphical glitches but it does seem to cause the app to slow down after repeatedly mashing the enter key when adding more game objects.

In the gameControl class I declare all the objects, textfields, variables that I require, and then I create the objects in the game function. Within this function I have an event listener that will exectute my on_enter_frame function which I spoke of before in the tutorial. Almost the entirety of the code in this class is my own, the tutorial code will be used in the sharkMC class for controlling the shark. 

Originally I was editing each of the objects x and y values and other attributes individually but I felt this was adding too much clutter, so I replaced them with for loops that go through arrays containing objects and giving them the attributes I want. As this is the game function this is only executed once when this class is called in the main class. If I was to add random attributes in the on_enter_frame function, I would get 24 random variables a second for each attribute and that would be mayhem. So for example in pseudo code, instead of saying swimmer.x = random and swimmer2.x = random, I say swimmer array = (swimmer1, swimmer2). Then i make a for loop which increase a variable i to the legth of swimmer array. And I say swimmer[i] = random. This is much cleaner and requires much less lines of code. 

I use the same method for addChild(); in this function, using an object array containg all the objects I want to display at this point.


