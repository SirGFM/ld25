package basics {

	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Weapon extends FlxSprite {
		
		public var damage:int;
		public var overlaped:Boolean;
		
		public function Weapon(X:Number=0, Y:Number=0, Damage:int = 1) {
			super(X, Y);
			kill();
			damage = Damage;
			overlaped = false;
		}
		
		override public function update():void {
			if (finished) {
				Player.canAttack = true;
				kill();
			}
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			play("def");
			allowCollisions = ANY;
		}
	}
}
