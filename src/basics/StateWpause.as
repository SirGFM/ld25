package basics {

	import org.flixel.FlxG;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class StateWpause extends FlxState {
		
		override public function update():void {
			if (FlxG.paused)
				return;
			super.update();
		}
	}
}
