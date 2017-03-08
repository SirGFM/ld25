package utils {

	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Typewriter extends FlxText {
		
		private var len:int;
		private var originalText:String;
		private var i:int;
		private var frameWait:int;
		private var frameCount:int;
		
		public function Typewriter(X:Number, Y:Number, Width:uint, Text:String=null, Time:Number=1.0) {
			super(X, Y, Width);
			if (Text == null)
				Text = "";
			originalText = Text;
			len = originalText.length;
			frameWait = Time * FlxG.framerate / len;
			i = 0;
			frameCount = 0;
		}
		
		override public function update():void {
			super.update();
			frameCount++;
			if (i < len && Controler.action) {
				text = originalText;
				i = len;
				frameCount = 0;
			}
			if (frameCount >= frameWait) {
				if (i < len) {
					frameCount = 0;
					text += originalText.charAt(i++);
				}
				else if (i == len) {
					text += "\n\nPress " + Controler.actionKey + " to continue.";
					i++;
				}
			}
		}
		
		public function get complete():Boolean {
			return i > len && Controler.action;
		}
		
		public function restart(Text:String, Time:Number):void {
			text = "";
			originalText = Text;
			len = originalText.length;
			frameWait = Time * FlxG.framerate / len;
			i = 0;
			frameCount = 0;
		}
	}
}
