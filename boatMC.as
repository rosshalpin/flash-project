package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class boatMC extends MovieClip {
		public var speed: Number = 15;
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
			
			
			//when boat goes off screen, rotate it back around and place in random y position
			if(x > 700){
				rot = 90; //facing right
				rotation = rot; //change rotation
				x += speed_x; //increase x
				for(var d=0;d<1;d++){
					y = (Math.random() * (400 - 80) + 80); //change boat y position
				}
			}
			else if(x < -400){
				rot = -90; //facing left
				rotation = rot; //change rotatiob
				x -= speed_x; //decrease x
				for(var da=0;da<1;da++){
					y = (Math.random() * (400 - 80) + 80); //change boat y position
				}
			}
		}
		
	}
	
}
