package basics {

	/**
	 * ...
	 * @author GFM
	 */
	public class Bow extends Weapon {
		
		[Embed(source = "../../assets/gfx/bow.png")]	private var gfx:Class;
		
		public function Bow() {
			super(0, 0, 1);
			loadGraphic(gfx, true, false, 16, 16);
			addAnimation("def", [0, 1, 0, 2], 8, false);
		}
		
		override public function update():void {
			if (finished) {
				kill();
			}
		}
	}
}
