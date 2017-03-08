package basics {
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author GFM
	 */
	public class Arrow extends Weapon {
		
		[Embed(source = "../../assets/gfx/arrow.png")]		private var gfx:Class;
		
		private var counter:int;
		
		public function Arrow() {
			super(0, 0, 1);
			loadGraphic(gfx, true, false, 16, 16);
			addAnimation("def", [0], 0.25, false);
			width = 8;
			height = 8;
			centerOffsets(true);
			counter = 0;
			immovable = true;
		}
		
		override public function update():void {
			super.update();
			
			if (overlaped || !onScreen()) {
				overlaped = false;
				Player.canAttack = true;
				kill();
			}
		}
	}
}
