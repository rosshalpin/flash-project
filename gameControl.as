package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;

	public class gameControl extends MovieClip {

		public var backg: backgroundMC;
		public var backg2: backgroundMC;

		public var shark: sharkMC;
		public var swimmer1: swimmer1MC;
		public var swimmer2: swimmer1MC;
		public var swimmer3: swimmer2MC;
		public var dead: deadMC;
		public var win: winMC;

		public var oilA: oildrumMC;
		public var oilB: oildrumMC;
		public var oilC: oildrumMC;
		public var oilD: oildrumMC;
		public var oilE: oildrumMC;
		public var oilF: oildrumMC;
		public var oilG: oildrumMC;

		public var boat1: boatMC;
		public var alert1: alertMC;

		public var count: Number = 0;
		public var point1: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var point2: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var point3: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);

		public var score_txt: TextField = new TextField();
		public var heart_txt: TextField = new TextField();
		public var pointbox_1: TextField = new TextField();
		public var pointbox_2: TextField = new TextField();
		public var pointbox_3: TextField = new TextField();
		public var Format: TextFormat = new TextFormat();
		public var health: Number = 50;
		public var fontA = new Font1();
		public var menu: Number = 10;

		public function game(): void {
			addEventListener(Event.ENTER_FRAME, on_enter_frame2);

			backg = new backgroundMC(0, 0);
			backg2 = new backgroundMC(0, 0);
			shark = new sharkMC(150, 450);
			swimmer1 = new swimmer1MC(0, 0);
			swimmer2 = new swimmer1MC(0, 0);
			swimmer3 = new swimmer2MC(0, 0);
			oilA = new oildrumMC(0, 0);
			oilB = new oildrumMC(0, 0);
			oilC = new oildrumMC(0, 0);
			oilD = new oildrumMC(0, 0);
			oilE = new oildrumMC(0, 0);
			oilF = new oildrumMC(0, 0);
			oilG = new oildrumMC(0, 0);
			boat1 = new boatMC(-1000, 0);
			alert1 = new alertMC(30, -90);
			win = new winMC(150,250);
			dead = new deadMC(150,250);

			addChild(backg);
			addChild(backg2);
			addChild(shark);
			addChild(swimmer1);
			addChild(swimmer2);
			addChild(swimmer3);
			addChild(oilA);
			addChild(oilB);
			addChild(oilC);
			addChild(oilD);
			addChild(oilE);
			addChild(oilF);
			addChild(oilG);
			addChild(boat1);
			addChild(alert1);

			oilA.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilA.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilB.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilB.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilC.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilC.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilD.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilD.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilE.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilE.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilF.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilF.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			oilG.x = (Math.floor(Math.random() * (260 - 40 + 1)) + 40);
			oilG.y = (Math.floor(Math.random() * (420 - 40 + 1)) + 40);
			swimmer1.x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
			swimmer1.y = (Math.floor(Math.random() * (420 - 20 + 1)) + 20);
			swimmer2.x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
			swimmer2.y = (Math.floor(Math.random() * (420 - 20 + 1)) + 20);
			swimmer3.x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
			swimmer3.y = (Math.floor(Math.random() * (420 - 20 + 1)) + 20);
			boat1.y = (Math.random() * (200 - 120) + 120);

			Format.size = 12;
			Format.font = fontA.fontName;

			score_txt.defaultTextFormat = Format;
			score_txt.width = 70;
			score_txt.height = 17.5;
			score_txt.x = 3;
			score_txt.y = 3;
			addChild(score_txt);

			heart_txt.defaultTextFormat = Format;
			heart_txt.textColor = 0xFF0000;
			heart_txt.width = 70;
			heart_txt.height = 17.5;
			heart_txt.x = 245;
			heart_txt.y = 3;
			addChild(heart_txt);

			pointbox_1.defaultTextFormat = Format;
			pointbox_1.text = String("+" + point1);
			pointbox_1.x = swimmer1.x - 11;
			pointbox_1.y = swimmer1.y - 25;
			addChild(pointbox_1);

			pointbox_2.defaultTextFormat = Format;
			pointbox_2.text = String("+" + point2);
			pointbox_2.x = swimmer2.x - 11;
			pointbox_2.y = swimmer2.y - 25;
			addChild(pointbox_2);

			pointbox_3.defaultTextFormat = Format;
			pointbox_3.text = String("+" + point3);
			pointbox_3.x = swimmer3.x - 11;
			pointbox_3.y = swimmer3.y - 25;
			addChild(pointbox_3);

		}
		public function on_enter_frame2(e: Event): void {

			backg.x += 0.2;
			if (backg.x > 297) {
				backg.x = 0;
			}
			backg2.x = backg.x + 297;

			var oils: Array = new Array(oilA, oilB, oilC, oilD, oilE, oilF, oilG);
			for (var g = 0; g < oils.length; g++) {
				if ((shark.x < oils[g].x + 10 && shark.x > oils[g].x - 10) && (shark.y < oils[g].y + 10 && shark.y > oils[g].y - 10)) {
					for (var kz = 0; kz < 1; kz++) {
						health -= 10;
						oils[g].x = -99;
					}

				}
			}

			if (boat1.rot == -90 && boat1.x > -300 && boat1.x < -100) {
				alert1.x = 30;
				alert1.y = boat1.y;
			} else if (boat1.rot == 90 && boat1.x > 400 && boat1.x < 600) {
				alert1.x = 270;
				alert1.y = boat1.y;
			} else {
				alert1.y = -90;
			}

			var swimmers: Array = new Array(swimmer1, swimmer2, swimmer3);
			var pointboxes: Array = new Array(pointbox_1, pointbox_2, pointbox_3);
			var points: Array = new Array(point1, point2, point3);

			for (var h = 0; h < swimmers.length; h++) {
				if ((shark.x < swimmers[h].x + 10 && shark.x > swimmers[h].x - 10) && (shark.y < swimmers[h].y + 10 && shark.y > swimmers[h].y - 10)) {
					swimmers[h].x = -90;
					pointboxes[h].x = swimmers[h].x;
					for (var ik = 0; ik < 1; ik++) {
						count += points[h];
					}
				}
			}
			
			if(count>=point1+point2+point3){
				addChild(win);
				shark.y = 900;
			}

			if ((shark.x < boat1.x + 25 && shark.x > boat1.x - 25) && (shark.y < boat1.y + 25 && shark.y > boat1.y - 25)) {
				for (var ki = 0; ki < 1; ki++) {
					health -= 10;
				}
			}
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
			} else if (health == 0) {
				heart_txt.text = String("");
				addChild(dead);
				shark.y = 900;
			}
			score_txt.text = String("Score: " + count);

		}
	}
}