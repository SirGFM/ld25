package basics {

	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Interactive extends FlxSprite {
		
		private var wpFunction:Function;
		private var plFunction:Function;
		
		public function Interactive(X:Number=0, Y:Number=0) {
			super(X, Y);
		}
		
		public function activate(obj:FlxObject):void {
			if (obj is Player && plFunction != null)
				plFunction(obj as Player);
			if (obj is Weapon && wpFunction != null)
				wpFunction(obj as Weapon);
		}
		
		public function restart(X:Number, Y:Number, WpFunc:Function = null, PlFunc:Function = null):void {
			super.reset(X, Y);
			wpFunction = WpFunc;
			plFunction = PlFunc;
		}
		
		override public function kill():void {
			super.kill();
			_callback = null;
		}
	}
}
