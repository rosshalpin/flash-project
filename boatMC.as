package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class boatMC extends MovieClip {
		public var speed: Number = 10;
		public var rot: Number = 0;
		public function boatMC(posx: int, posy: int): void {
			//rotation = -90;
			x = posx;
			y = posy;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e: Event): void {
			addEventListener(Event.ENTER_FRAME, on_enter_frame);
		}
		
		public function on_enter_frame(e: Event): void {
			var speed_x: Number = Math.sin(rotation * 0.0174532925) * speed;
			x -= speed_x;
			
			if(x > 700){
				rot = 90;
				rotation = rot;
				x += speed_x;
				for(var d=0;d<1;d++){
					y = (Math.random() * (400 - 80) + 80);;
				}
			}
			else if(x < -300){
				rot = -90;
				rotation = rot;
				x -= speed_x;
				for(var da=0;da<1;da++){
					y = (Math.random() * (400 - 80) + 80);
				}
			}
		}
		
	}
	
}
