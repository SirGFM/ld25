package states {

	import basics.StateWpause;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import Plugins.PluginAttr;
	import utils.Database;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Menustate extends StateWpause {
		
		[Embed(source = "../../assets/gfx/menu.png")]	private var gfx:Class;
		
		override public function create():void {
			if (Database._switch == null)
				Database.init();
			else {
				var i:int = 0;
				var l:int = Database._switch.length;
				while (i < l) {
					Database._switch[i] = false;
					i++;
				}
				i = 0;
				l = Database._vars.length;
				while (i < l) {
					Database._vars[i] = 0;
					i++;
				}
			}
			PluginAttr.init();
			
			add(new FlxSprite(0, 0, gfx));
			add(new FlxButton(160, 144, "Start", onStart));
		}
		
		public function onStart():void {
			FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new Playstate()); } );
		}
	}
}
