package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;

	public class gameControl extends MovieClip {
		//objects
		public var backg: backgroundMC;
		public var backg2: backgroundMC;
		public var shark: sharkMC;
		public var swimmer1: swimmer1MC;
		public var swimmer2: swimmer1MC;
		public var swimmer3: swimmer2MC;
		public var swimmer4: swimmer2MC;
		public var dead: deadMC;
		public var win: winMC;
		public var oilA: oildrumMC;
		public var oilB: oildrumMC;
		public var oilC: oildrumMC;
		public var oilD: oildrumMC;
		public var oilE: oildrumMC;
		public var oilF: oildrumMC;
		public var oilG: oildrumMC;
		public var oilH: oildrumMC;
		public var oilI: oildrumMC;
		public var oilJ: oildrumMC;
		public var oilK: oildrumMC;
		public var boat1: boatMC;
		public var alert1: alertMC;
		//variables/textfields
		public var count: Number = 0;
		public var point1: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5); //random points for swimmers
		public var point2: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var point3: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var point4: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var fontA = new Font1();
		public var score_txt: TextField = new TextField();
		public var heart_txt: TextField = new TextField();
		public var pointbox_1: TextField = new TextField();
		public var pointbox_2: TextField = new TextField();
		public var pointbox_3: TextField = new TextField();
		public var pointbox_4: TextField = new TextField();
		public var Format: TextFormat = new TextFormat();
		public var health: Number = 50;

		public function game(): void {
			//on function call, call on enter frame function
			addEventListener(Event.ENTER_FRAME, on_enter_frame);
			//objects
			backg = new backgroundMC(0, 0);
			backg2 = new backgroundMC(0, 0);
			shark = new sharkMC(150, 450);
			swimmer1 = new swimmer1MC(0, 0);
			swimmer2 = new swimmer1MC(0, 0);
			swimmer3 = new swimmer2MC(0, 0);
			swimmer4 = new swimmer2MC(0, 0);
			oilA = new oildrumMC(0, 0);
			oilB = new oildrumMC(0, 0);
			oilC = new oildrumMC(0, 0);
			oilD = new oildrumMC(0, 0);
			oilE = new oildrumMC(0, 0);
			oilF = new oildrumMC(0, 0);
			oilG = new oildrumMC(0, 0);
			oilH = new oildrumMC(0, 0);
			oilI = new oildrumMC(0, 0);
			oilJ = new oildrumMC(0, 0);
			oilK = new oildrumMC(0, 0);
			boat1 = new boatMC(-1000, 0);
			alert1 = new alertMC(30, -90);
			win = new winMC(150, 250);
			dead = new deadMC(150, 250);

			//place oildrums in random x,y locations
			var oils: Array = new Array(oilA, oilB, oilC, oilD, oilE, oilF, oilG, oilH, oilI, oilJ, oilK);
			for (var gh = 0; gh < oils.length; gh++) {
				oils[gh].x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
				oils[gh].y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			}

			//place swimmers in random x,y locations
			var swims: Array = new Array(swimmer1, swimmer2, swimmer3, swimmer4);
			for (var sa = 0; sa < swims.length; sa++) {
				swims[sa].x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
				swims[sa].y = (Math.floor(Math.random() * (420 - 20 + 1)) + 20);
			}

			//place boat in random y starting position
			boat1.y = (Math.random() * (200 - 120) + 120);

			//textfield attributes
			Format.size = 12;
			Format.font = fontA.fontName;

			score_txt.defaultTextFormat = Format;
			score_txt.width = 70;
			score_txt.height = 17.5;
			score_txt.x = 3;
			score_txt.y = 3;

			heart_txt.defaultTextFormat = Format;
			heart_txt.textColor = 0xFF0000;
			heart_txt.width = 70;
			heart_txt.height = 17.5;
			heart_txt.x = 245;
			heart_txt.y = 3;

			//addchild(ren) with object array and for loop
			var objects: Array = new Array(backg, backg2, shark, swimmer1, swimmer2, swimmer3, swimmer4, oilA,
				oilB, oilC, oilD, oilE, oilF, oilG, oilH, oilI, oilJ, oilK, boat1,
				alert1, score_txt, heart_txt, pointbox_1, pointbox_2, pointbox_3, pointbox_4);

			for (var kc = 0; kc < objects.length; kc++) {
				addChild(objects[kc]);
			}

		}
		public function on_enter_frame(e: Event): void {

			//scrolling background
			backg.x += 0.2; //speed
			if (backg.x > 297) { //if background.x is greater than the width of the stage
				backg.x = 0; //set background.x back to zero
			}
			backg2.x = backg.x + 297; //add second background to backg.x to create seamless effect

			//oildrum array
			var oils: Array = new Array(oilA, oilB, oilC, oilD, oilE, oilF, oilG, oilH, oilI, oilJ, oilK);
			//oil drum damage
			for (var g = 0; g < oils.length; g++) {
				if ((shark.x < oils[g].x + 10 && shark.x > oils[g].x - 10) && (shark.y < oils[g].y + 10 && shark.y > oils[g].y - 10)) {
					//if shark is within 10,10 of any oildrum x,y
					for (var kz = 0; kz < 1; kz++) {
						health -= 10; //take away 10 health
						oils[g].x = -99; //move oildrum away
					}

				}
			}
			
			
			//if shark x,y is within 25,25 of boat x,y
			if ((shark.x < boat1.x + 25 && shark.x > boat1.x - 25) && (shark.y < boat1.y + 25 && shark.y > boat1.y - 25)) {
				for (var ki = 0; ki < 1; ki++) {
					health -= 10; //take away health
				}
			}
			
			//set alert to be on the side of the incoming boat
			if (boat1.rot == -90 && boat1.x > -300 && boat1.x < -100) { //left side
				alert1.x = 30;
				alert1.y = boat1.y;
			} else if (boat1.rot == 90 && boat1.x > 400 && boat1.x < 600) { //right side
				alert1.x = 270;
				alert1.y = boat1.y;
			} else {
				alert1.y = -90; //if the booat x,y is not within the tolerances, set it outside of viewable area
			}

			var swimmers: Array = new Array(swimmer1, swimmer2, swimmer3, swimmer4);
			var pointboxes: Array = new Array(pointbox_1, pointbox_2, pointbox_3, pointbox_4);
			var points: Array = new Array(point1, point2, point3, point4);
			
			//set each swimmer a point box and there points.
			for (var hk = 0; hk < points.length; hk++) {
				pointboxes[hk].defaultTextFormat = Format; //setting textfields format
				pointboxes[hk].text = String("+" + points[hk]); //settin pointbox text to points
				pointboxes[hk].x = swimmers[hk].x - 11; //placing pointbox relevant to swimmer
				pointboxes[hk].y = swimmers[hk].y - 25;
			}
			
			//get points for each swimmer if you are within 10,10 of swimmer x,y
			for (var h = 0; h < swimmers.length; h++) {
				if ((shark.x < swimmers[h].x + 10 && shark.x > swimmers[h].x - 10) && (shark.y < swimmers[h].y + 10 && shark.y > swimmers[h].y - 10)) {
					swimmers[h].x = -90; //change swimmers x to put it out of viewable area
					pointboxes[h].x = swimmers[h].x; //bring its pointbox with it
					for (var ik = 0; ik < 1; ik++) { 
						/*I use a for loop here as this function
						  is excuted 24 times a second but i want to get my points just once. 
						*/
						count += points[h]; //add points to our count
					}
				}
			}

			var total: Number = 0;
			//as points are random we must add up the points each time to see when we have won
			for (var ft = 0; ft < points.length; ft++) {
				total += points[ft];
			}

			if (count == total) {
				//if our count is the same as the total points
				addChild(win); //show winscreen
				shark.y = 900; //move shark off screen
			}
			
			//health bar logic
			if (health == 50) {
				heart_txt.text = String("♥♥♥♥♥");
			} else if (health == 40) {
				heart_txt.text = String("♥♥♥♥");
			} else if (health == 30) {
				heart_txt.text = String("♥♥♥");
			} else if (health == 20) {
				heart_txt.text = String("♥♥");
			} else if (health == 10) {
				heart_txt.text = String("♥");
			} else if (health == 0) { //if we have no health left
				heart_txt.text = String(""); //show no hearts
				addChild(dead); //show dead screen
				shark.y = 900; //move shark off screeb
			}
			score_txt.text = String("Score: " + count); //show our count in score_txt

		}
	}
}