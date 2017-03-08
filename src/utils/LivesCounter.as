package utils {

	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class LivesCounter extends FlxGroup {
		
		[Embed(source = "../../assets/gfx/heart.png")]	private var gfx:Class;
		
		public function LivesCounter() {
			super();
		}
		
		override public function draw():void {
			var tmp:FlxSprite;
			var i:uint = 0;
			var x:Number = 0;
			var y:Number = 0;
			while (i < length) {
				tmp = members[i] as FlxSprite;
				tmp.x += x;
				tmp.y += y;
				i++;
			}
			super.draw();
			i = 0
			while (i < length) {
				tmp = members[i] as FlxSprite;
				tmp.x -= x;
				tmp.y -= y;
				i++;
			}
		}
		
		public function lifePlus(n:uint):void {
			var tmp:FlxSprite = getLastDead() as FlxSprite;
			while ((tmp != null) && (n > 0)) {
				tmp.alive = true;
				tmp.play("alive");
				tmp = getLastDead() as FlxSprite;
				n--;
			}
			while (n > 0) {
				tmp = (length > 0)?(members[length - 1] as FlxSprite):null;
				if (tmp == null) {
					tmp = new FlxSprite(5, 12);
				}
				else {
					if(tmp.x <= 185){
						tmp = new FlxSprite(tmp.x + 5 + 16, tmp.y);
					}
					else {
						tmp = new FlxSprite(5, tmp.y + 16 + 5);
					}
				}
				tmp.loadGraphic(gfx, true, false, 16, 16);
				tmp.addAnimation("alive", [0], 0, false);
				tmp.addAnimation("dead", [1], 0, false);
				tmp.play("alive");
				add(tmp);
				n--;
			}
		}
		
		public function hurt(n:uint):Boolean {
			var tmp:FlxSprite;
			while (n > 0) {
				tmp = getFirstAlive() as FlxSprite;
				if (tmp == null)
					return false;
				tmp.alive = false;
				tmp.play("dead");
				n--;
			}
			return true;
		}
		
		public function getLastDead():FlxBasic
		{
			var basic:FlxBasic;
			var i:int = length;
			if (i == 0)
				return null;
			i--;
			while(i >= 0)
			{
				basic = members[i--] as FlxBasic;
				if((basic != null) && basic.exists && !basic.alive)
					return basic;
			}
			return null;
		}
	}
}
