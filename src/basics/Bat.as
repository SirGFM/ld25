package basics {

	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Bat extends Enemy {
		
		[Embed(source = "../../assets/gfx/bat.png")]		private var bat:Class;
		
		private var counter:int;
		
		public function Bat(X:Number=0, Y:Number=0) {
			super(X, Y);
			loadGraphic(bat, true, false, 16, 16);
			addAnimation("def", [0, 1], 4, true);
			play("def");
			
			width = 14;
			height = 5;
			offset.x = 1;
			offset.y = 4;
			
			counter = FlxG.random() * 100 % 4 * FlxG.framerate;
			path = new FlxPath();
		}
		
		override public function update():void {
			if (pathSpeed == 0) {
				if (velocity.x != 0 || velocity.y != 0) {
					counter = FlxG.random() * 100 % 4 * FlxG.framerate;
					velocity.x = velocity.y = 0;
					_curAnim.delay = 0;
				}
				else if(counter > 0) {
					counter--;
				}
			}
			if (counter == 0) {
				counter--;
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
				tmp.x = FlxG.random() * 1000 % FlxG.width;
				tmp.y = FlxG.random() * 1000 % FlxG.height;
				path.addPointAt(tmp, 1, true);
				followPath(path);
				_curAnim.delay = 0.25;
			}
			if (touching & ANY) {
				if (touching & LEFT)
					x += 2;
				if (touching & RIGHT)
					x -= 2;
				if (touching & UP)
					y += 2;
				if (touching & DOWN)
					y -= 2;
				pathSpeed = 0;
			}
		}
		
		override public function hurt(Damage:Number):void {
			if (flickering)
				return;
			flicker(0.5);
			super.hurt(Damage);
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			health = 2;
		}
	}
}
