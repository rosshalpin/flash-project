package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.events.KeyboardEvent;

	public class main extends MovieClip {
		var gc: gameControl;
		var mnu: menu;
		var ent:Boolean=false;
		public function main(): void {
			mnu = new menu();
			mnu.menustart();
			addChild(mnu);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, enter_game);
		}

		public function enter_game(e: KeyboardEvent): void {
			
			if (e.keyCode == 13 && ent == false) {
				gc = new gameControl();
				gc.game();
				addChild(gc);
				removeChild(mnu);
				ent=true;
			}
		}



	}
}