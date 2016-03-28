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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keys_down);
			stage.addEventListener(KeyboardEvent.KEY_UP, keys_up);
			//create menu
			mnu = new menu();
			mnu.menustart();
			//display menu
			addChild(mnu);
		}
		//on key down
		public function keys_down(e: KeyboardEvent): void {
			
			//create game
			gc = new gameControl();
			gc.game();
			if (e.keyCode == 13 && ent == false) { //if I press enter and ent is false
				removeChild(mnu); //remove menu
				addChild(gc); //display game
				ent = true; //set ent to true so this only happens first time i hit enter
			}
			

		}
		//on key up
		public function keys_up(e: KeyboardEvent): void {
			if (ent == true && e.keyCode == 13) {
				//if the game is on the screen, ent is true and entered is press
				
				addChild(gc); //reset game

			}
			

		}



	}
}