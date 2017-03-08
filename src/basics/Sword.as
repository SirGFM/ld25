package basics {
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Sword extends Weapon {
		
		[Embed(source = "../../assets/gfx/sword.png")]		private var sword_gfx:Class;
		
		public function Sword(X:Number=0, Y:Number=0) {
			super(X, Y, 1);
			loadGraphic(sword_gfx, true, false, 16, 16);
			addAnimation("def", [0, 1, 2], 16, false);
		}
	}
}
