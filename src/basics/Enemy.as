package basics {

	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Enemy extends FlxSprite {
		
		public var knockval:int = 100;
		
		public function Enemy(X:Number=0, Y:Number=0) {
			super(X, Y);
		}
		
		public function knockback():void {
			if (FlxU.abs(Player.position.x - x) > 10 && Player.position.x > x)
				velocity.x = -knockval;
			else if (FlxU.abs(Player.position.x - x) > 10 && Player.position.x < x)
				velocity.x = knockval;
			else if (FlxU.abs(Player.position.y - y) > 10 && Player.position.y > y)
				velocity.y = -knockval;
			else if (FlxU.abs(Player.position.y - y) > 10 && Player.position.y < y)
				velocity.y = knockval;
		}
	}
}
