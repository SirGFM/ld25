package basics {

	/**
	 * ...
	 * @author GFM
	 */
	public class Weed extends Interactive {
		
		public function Weed() {
			super();
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("kill", [1, 2], 8, false);
			act.immovable = true;
		}
		
		override public function restart(X:Number, Y:Number, WpFunc:Function = null, PlFunc:Function = null):void {
			super.restart(X, Y, func, null);
		}
		
		void function func(w:Weapon):void {
			play("Kill");
		}
	}
}
