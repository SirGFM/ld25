package utils {
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author GFM
	 */
	public class Controler {
		
		static public var startKey:String = "P";
		static public var actionKey:String = "X";
		static public var secondKey:String = "C";
		static public var leftKey:String = "LEFT";
		static public var rightKey:String = "RIGHT";
		static public var upKey:String = "UP";
		static public var downKey:String = "DOWN";
		
		static public function get start():Boolean {
			return FlxG.keys.justPressed(startKey);
		}
		
		static public function get action():Boolean {
			return FlxG.keys.justPressed(actionKey);
		}
		
		static public function get second():Boolean {
			return FlxG.keys.justPressed(secondKey);
		}
		
		static public function get left():Boolean {
			return FlxG.keys.pressed(leftKey);
		}
		
		static public function get right():Boolean {
			return FlxG.keys.pressed(rightKey);
		}
		
		static public function get up():Boolean {
			return FlxG.keys.pressed(upKey);
		}
		
		static public function get down():Boolean {
			return FlxG.keys.pressed(downKey);
		}
		
	}
}
