package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	public class sharkMC extends MovieClip {
		
		public var acceleration: Number = 0.4;
		public var speed_decay: Number = 0.96;
		public var max_speed: Number = 3;
		public var speed: Number = 0.5;
		public var accelerate, turn_left, turn_right: Boolean = false;
		
		
		public function sharkMC(posx: int, posy: int): void {
			
			x = posx;
			y = posy;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e: Event): void {
			
			addEventListener(Event.ENTER_FRAME, on_enter_frame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, on_key_down);
			stage.addEventListener(KeyboardEvent.KEY_UP, on_key_up);
		}
		
		public function on_enter_frame(e: Event): void {
			
			if (accelerate == true && speed < max_speed) {
				speed += acceleration;
			}
			var speed_x: Number = Math.sin(rotation * 0.0174532925) * speed;
			var speed_y: Number = -Math.cos(rotation * 0.0174532925) * speed;
			if (turn_left) {
				rotation -= 5 * (speed / max_speed);
			}
			if (turn_right) {
				rotation += 5 * (speed / max_speed);
			}
			y += speed_y;
			x += speed_x;
			if (Math.abs(speed) > 0.5) {
				if (Math.abs(speed) > 0.1) {
					speed *= speed_decay;
				} else {
					speed = 0.5;
				}
			} else {
				speed = 0.5;
			}
		}
		
		public function on_key_down(e: KeyboardEvent): void {
			
			if (e.keyCode == 38) {
				accelerate = true;
			}
			if (e.keyCode == 37) {
				turn_left = true;
			}
			if (e.keyCode == 39) {
				turn_right = true;
			}
		}
		
		public function on_key_up(e: KeyboardEvent): void {
			
			if (e.keyCode == 38) {
				accelerate = false;
			}
			if (e.keyCode == 37) {
				turn_left = false;
			}
			if (e.keyCode == 39) {
				turn_right = false;
			}
		}
	}
}