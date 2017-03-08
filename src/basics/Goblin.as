package basics {
	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;

	/**
	 * ...
	 * @author GFM
	 */
	public class Goblin extends Enemy {
		
		[Embed(source = "../../assets/gfx/goblin.png")]		private var gfx:Class;
		
		private var counter:int;
		
		public function Goblin() {
			super();
			knockval = 50;
			loadGraphic(gfx, true, true, 16, 16);
			addAnimation("walk", [0, 1, 0, 2], 8, true);
			play("walk");
			facing = RIGHT;
			counter = FlxG.random() * 100 % 6 * FlxG.framerate;
			path = new FlxPath();
		}
		
		override public function update():void {
			counter--;
			facing = (velocity.x > 0)?RIGHT:LEFT;
			if (pathSpeed != 0)
				pathSpeed = 0;
			if (counter == 0) {
				var tmp:FlxPoint;
				tmp = path.head();
				if (tmp == null)
					tmp = new FlxPoint();
				tmp.x = x;
				tmp.y = y;
				path.addPointAt(tmp, 0, true);
				tmp = path.tail();
				if (tmp == null)
					tmp = new FlxPoint();
				tmp.x = Player.position.x;
				tmp.y = Player.position.y;
				path.addPointAt(tmp, 1, true);
				followPath(path);
				counter = FlxG.random() * 65 % 6 * FlxG.framerate;
			}
			if (touching & ANY) {
				if (touching & LEFT) {
					velocity.x *= -1;
					x += 2;
				}
				if (touching & RIGHT) {
					velocity.x *= -1;
					x -= 2;
				}
				if (touching & UP) {
					velocity.y *= -1;
					y += 2;
				}
				if (touching & DOWN) {
					velocity.y *= -1;
					y -= 2;
				}
				pathSpeed = 0;
			}
		}
		
		override public function hurt(Damage:Number):void {
			if (flickering)
				return;
			flicker(0.5);
			super.hurt(Damage);
			knockback();
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			health = 5;
		}
	}
}