package basics {

	/**
	 * ...
	 * @author GFM
	 */
	public class Sparks extends Weapon {
		
		[Embed(source = "../../assets/gfx/sparks.png")]		private var gfx:Class;
		
		public function Sparks() {
			super(0,0,0);
			loadGraphic(gfx, true, false, 16, 16);
			addAnimation("def", [0, 1, 2, 3], 8, false);
		}
	}
}