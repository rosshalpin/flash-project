package {
	import flash.display.Sprite;
	import flash.events.Event;

	public class sharkgame extends Sprite {

		public var shark: sharkmc;
		public var swimmer: swimr1;
		public var swimmer2: swimr1;
		public var count: Number = 0;
		public var edeadA: Boolean = false;
		public var edeadB: Boolean = false;
		public var point1: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);
		public var point2: Number = (Math.floor(Math.random() * (15 - 5 + 1)) + 5);

		public function sharkgame(): void {

			addEventListener(Event.ENTER_FRAME, on_enter_frame2);
			shark = new sharkmc(150, 450);
			addChild(shark);
			swimmer = new swimr1(100, 300);
			addChild(swimmer);

			swimmer2 = new swimr1(140, 310);
			addChild(swimmer2);

			swimmer.x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
			swimmer.y = (Math.floor(Math.random() * (480 - 60 + 1)) + 50);
			swimmer2.x = (Math.floor(Math.random() * (280 - 20 + 1)) + 20);
			swimmer2.y = (Math.floor(Math.random() * (480 - 60 + 1)) + 50);

			point_1.text = String("+" + point1);
			point_1.x = swimmer.x - 11;
			point_1.y = swimmer.y - 25;


			point_2.text = String("+" + point2);
			point_2.x = swimmer2.x - 11;
			point_2.y = swimmer2.y - 25;
		}

		public function on_enter_frame2(e: Event): void {
			if ((shark.x < swimmer.x + 10 && shark.x > swimmer.x - 10) && (shark.y < swimmer.y + 10 && shark.y > swimmer.y - 10)) {
				edeadA = true;
				swimmer.x = 9999;
				point_1.x = swimmer.x;
				for (var i = 0; i < 1; i++) {
					count += point1;
				}
			}
			if ((shark.x < swimmer2.x + 10 && shark.x > swimmer2.x - 10) && (shark.y < swimmer2.y + 10 && shark.y > swimmer2.y - 10)) {
				edeadB = true;
				swimmer2.x = 9999;
				point_2.x = swimmer2.x;
				for (var j = 0; j < 1; j++) {
					count += point2;
				}
			}

			score_txt.text = String(count);

		}
	}
}