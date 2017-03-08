package states {

	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import Plugins.PluginAttr;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Gameover extends FlxState {
		
		override public function create():void {
			PluginAttr.livec.exists = false;
			PluginAttr.equipgui.exists = false;
			FlxG.bgColor = 0xff777777;
			(add(new FlxText(50, 50, 250, "GAME OVER!")) as FlxText).size = 24;
			add(new FlxButton(160, 144, "Continue", onCont));
		}
		
		public function onCont():void {
			FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new Playstate()); } );
		}
	}
}
