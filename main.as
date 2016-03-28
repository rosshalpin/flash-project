package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.events.KeyboardEvent;

	public class main extends MovieClip {
		var gc: gameControl;
		var gc2: gameControl;
		var mnu: menu;
		var ent: Boolean = false;
		var ent2: Boolean = false;
		public function main(): void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, enter_game);
			stage.addEventListener(KeyboardEvent.KEY_UP, enter_game2);
			mnu = new menu();
			mnu.menustart();
			addChild(mnu);
		}

		public function enter_game(e: KeyboardEvent): void {
			gc = new gameControl();
			gc.game();
			if (e.keyCode == 13 && ent == false) {
				removeChild(mnu);
				addChild(gc);
				ent = true;
			}

		}

		public function enter_game2(e: KeyboardEvent): void {
			ent2 = true;
			if (contains(gc) != true && ent == true && e.keyCode == 13) {
				addChild(gc);

			}

		}



	}
}