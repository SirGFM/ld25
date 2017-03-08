package Plugins {

	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	import utils.Controler;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class PauseWindow extends FlxGroup {
		
		public function PauseWindow() {
			var text:FlxText;
			super();
			
			text = new FlxText(125, 30, 100, "PAUSED");
			text.color = 0xff000000;
			text.size = 16;
			add(text);
			
			FlxG.paused = false;
		}
		
		override public function update():void {
			if (Controler.start) {
				FlxG.paused = !FlxG.paused;
			}
			if (!FlxG.paused)
				return;
			super.update();
		}
		
		override public function draw():void {
			if(FlxG.paused)
				super.draw();
		}
	}
}