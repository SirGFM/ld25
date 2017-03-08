package basics {
	import org.flixel.FlxPath;

	/**
	 * ...
	 * @author GFM
	 */
	public class Frog extends Enemy {
		
		[Embed(source = "../../assets/gfx/frog.png")]	private var frog:Class;
		
		public function Frog(X:Number=0, Y:Number=0) {
			super(X, Y);
			loadGraphic(frog, true, true, 16, 16);
			addAnimation("def", [1, 0], 1, true);
			play("def");
			
			width = 14;
			height = 10;
			centerOffsets();
			
			counter = FlxG.random() * 100 % 4 * FlxG.framerate;
			path = new FlxPath();
		}
		
	}
}
