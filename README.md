# flash-project
Online Written Report for CS270
### Instructions
To play game, download zip. Extract it. Go into flash-project-master folder and click main.html.
Controls: Up, Left, Right & Enter key for restart. 
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
### The Game
The basic idea is to have a goal and obstacles in a game. So our goal will be to eat swimmers for points, while avoiding eating oil drums and speeding boats. This is the fully realised idea that came about during creation, as you will see below in the mockup I had not planned the enemies and obstacles yet. 
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

I use the same method for addChild(); in this function, using an object array containg all the objects I want to display at this point. I also set the textfields attributes. Using the array and for loop technique i assign random positions to the oil drums and swimmers. 

In the on_enter_frame function I create the infinitely scrolling background by creating two background movieclips. Increasing background1.x, checking if the background1.x has moved past the stage width, if so setting it back to 0. Then I set the background2.x to background1.x + the stage width(in this case 297).

Having already set a health variable, I use the array and for loop technqiue again for the oil drums. I check if the sharks x,y is within 10,10 of an oil drum object's x,y. If so, I use a for loop that executes once and I take away health while also moving that object offscreen by setting its x to a value offscreen. This is so only the set amount of health is taken away once and since the damage corresponds to the shark and oil drums location, i need to move the expended oil so no more health is taken. I use the same technique for the boat. later in the code I use the same technique but to add points for eating a swimmer. Each time I add points to the count. 

Next I set the boat alert signs location. I do this by checking if the boat has gone off the stage and in which direction. So I check if boat.x is less than 0 or create than the stage width. Then whichever it is, I set the alert to have an x value closer to 0 or closer to 297. I then set its y value to same as the boats. If the boat is not within the tresholds I have set, I make the alert sign dissappear(as this means the boat is onscreen).

As I assign random points to each swimmer, I must calculate the total points that constitute a win each time. I just use an array of the points and add each point to a variable as my total. I then check if the total and count are the same. If so I put the shark off screen and add the Win movieclip to the screen. 

For the health bar I check what the health is equal to and assign corresponding hearts to the heart_txt displayed on the top right. If the health is zero, i move the shark offscreen and display the dead MovieClip. I also add the count to the score_txt displayed on the top left. 

Using code from the tutorial we know define the movement of the shark in the sharkMC class. There isnt much to change here, we have removed the code used for collisions and the basic mechanics of racing. I have taken away the code for moving backwards as sharks cannot swim backwards. We have two event listeners for KEY_UP and KEY_DOWN and two corresponding functions that set different boolean variables as I discussed in the tutorial. The on_enter_frame function handles the math for changing the x and y of the shark along withs rotation for turning etc. 

In our boatMC class we assign a speed that we will use to increase and decrease it's x value. But we start off moving from left to right. Then we have the code for setting its rotation depending on its x value. If it has gone off to the right we set its rotation to 90, and we increase its x value to send it back left. We also set a random y variable. We then do the same but vice versa for the other side of x. Setting its rotation to -90 and we decrease its x value. 

A gif of our final result:

<img src="http://i.imgur.com/AciTYxt.gif">

### What was hard/easy
The easiest part was probably the tutorial. Movement sounds difficult until you see its just clever ways of changing x and y values. I also didnt need to focus much on trigonometry as I was not creating a racing game.

I found using external .as files instead of using the timeline to be less confusing and cleaner, as I have experience with the Lightweight Java Game  Library(famously used for minecraft) it felt more natural to not have a visual editor anyway.

Creating the movieclips was very easy and the art assets even easier as I am well versed in the use on Paint Programs, my choice of "Pixelart" style also made things simple. 

I found it difficult working with the on_enter_frame functions that are called at my set framerate. This makes setting random variables difficult along with increasing a variable only once. 

Another thing I found hard was changing from the menu to the game and then reseting. It's not as easy as gotoAndstop(2) in the actions panel. The proper usage of removeChild seems to be a mystery as no matter what I did it would throw back runtime errors in the Output. What I figured out works perfectly for changing from the menu to the game but the reseting isnt fully what I wanted. It seems to result in laggyness which is not hardware related as I tested it on different systems. 

I found making my code more efficient and tidier to be challenging but wasn't someting I got stuck on. 

AS3 is very very similiar to java when programming games and thus made the overall experience challenging but not too difficult.

###Innovation
Most arcade games on the internet are made with flash, and there are a lot of top down games out there. I do believe my shark game is unique in a way but it definitely borrows ideas from games Ive played before, like having barrels of oil that are detremental to your health. Oil drums are almost a trope at this point. Having an enemy that causes almost instant death that appears out of random places on the screen is also another trope that is used a lot in mobile games. There are plenty of 3D shark/jaws games out there but not a lot of 2D arcade style ones that I've seen. It's very difficult noawadays to go against the grain unless you start entering into the realms of procedurally generated stories and universes where no two players experiences are the same. 
Overall it was a pretty standard arcade game, it has a clear goal and clear obstacles. A game with game mechanics like this could have been made in the 80s in another form. 

###What I learned

I learned that making a simple game is at its core just moving points around a cartesian coordinate system. And having certain things happen when points come together. I also learned that programming a game can be difficult in some places, but its only as difficult as you want it to be. With some games the math is the most difficult part, like calculating vectors and angles and having things collide etc. 

I also learned that AS3 is straightforward, its very easy to learn. I was able to create a game with the libraries that come vanilla with flash professional CC and with a bit of trigonometric math, so mild paint skills it doesnt take much to get a game running. 

With about 100 lines of code and two images, the author of the tutorial had a virtual yet more advanced Scalextric. 
