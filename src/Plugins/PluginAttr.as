package Plugins {
	
	import org.flixel.FlxG;
	import utils.LivesCounter;

	/**
	 * ...
	 * @author GFM
	 */
	public class PluginAttr {
		
		static public var msgwnd:MessageWindow;
		static public var equipgui:Equipped;
		static public var pausewnd:PauseWindow;
		static public var livec:LivesCounter;
		
		static public function init():void {
			equipgui = new Equipped();
			equipgui.exists = false;
			livec = new LivesCounter();
			livec.exists = false;
			msgwnd = new MessageWindow();
			pausewnd = new PauseWindow();
			
			FlxG.addPlugin(livec);
			FlxG.addPlugin(equipgui);
			FlxG.addPlugin(pausewnd);
			FlxG.addPlugin(msgwnd);
		}
	}
}
