package Plugins {

	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import utils.Typewriter;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class MessageWindow extends FlxGroup {
		
		[Embed(source = "../../assets/gfx/sheet.png")]	private var gfx:Class;
		
		private var bg:FlxSprite;
		private var text:Typewriter;
		private var bufferT:Vector.<String>;
		private var bufferN:Vector.<Number>;
		
		public function MessageWindow() {
			bufferT = new Vector.<String>();
			bufferN = new Vector.<Number>();
			
			bg = new FlxSprite(20, 20, null);
			//bg.makeGraphic(280, 200, 0xff5050ff);
			bg.loadGraphic(gfx);
			// TODO create textwindow
			text = new Typewriter(40, 40, 220, "", 0.0);
			
			add(bg);
			add(text);
			
			exists = false;
		}
		
		override public function update():void {
			super.update();
			if (text.complete) {
				if (bufferT.length > 0) {
					text.restart(bufferT.pop(), bufferN.pop());
					return;
				}
				FlxG.paused = false;
				exists = false;
			}
		}
		
		public function wakeup(Text:String, Time:Number):void {
			if (exists) {
				bufferT.unshift(Text);
				bufferN.unshift(Time);
				return;
			}
			text.restart(Text, Time);
			FlxG.paused = true;
			exists = true;
		}
	}
}
