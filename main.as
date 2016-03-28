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
		public function main(): void {
			mnu = new menu();
			mnu.menustart();
			addChild(mnu);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, enter_game);
			stage.addEventListener(KeyboardEvent.KEY_UP, enter_game2);
		}

		public function enter_game(e: KeyboardEvent): void {
			gc = new gameControl();
			gc.game();
			if (e.keyCode == 13 && ent == false) {
				addChild(gc);
				removeChild(mnu);
				ent = true;
			}
			if (ent == true && e.keyCode == 13) {
				if(contains(gc)){
				removeChild(gc);
				}
			}

		}
		
		public function enter_game2(e: KeyboardEvent): void {
			
			if (contains(gc) != true && ent == true && e.keyCode == 13) {
				addChild(gc);
			}

		}



	}
}