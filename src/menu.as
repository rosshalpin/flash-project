package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;

	public class menu extends MovieClip{
		
		var menu_backg: backgroundMC;
		var menu_backg2: backgroundMC;
		var swimmer: swimmer2MC;
		var logo:logoMC;
		var enter: TextField = new TextField();
		var created: TextField = new TextField();
		
		public function menustart() {
			addEventListener(Event.ENTER_FRAME, bgControl);
			menu_backg = new backgroundMC(0, 0);
			menu_backg2 = new backgroundMC(0, 0);
			swimmer = new swimmer2MC(150, 250);
			logo = new logoMC(150, 250);
			
			enter.x = 115;
			enter.y = 350;
			created.x = 90;
			created.y = 480;
			created.width = 150;
			enter.text = String("-press enter-");
			created.text = String("created by ross halpin");
			
			addChild(menu_backg);
			addChild(menu_backg2);
			addChild(enter);
			addChild(created);
			addChild(swimmer);
			addChild(logo);
		}

		public function bgControl(e: Event): void {

			menu_backg.x += 0.2;
			if (menu_backg.x > 297) {
				menu_backg.x = 0;
			}
			menu_backg2.x = menu_backg.x + 297;

		}

	}
}