package basics {
	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import Plugins.PluginAttr;
	import utils.Database;
	import utils.MapController;

	/**
	 * ...
	 * @author GFM
	 */
	public class Boss01 extends Enemy {
		
		[Embed(source = "../../assets/gfx/boss01.png")]		private var boss01gfx:Class;
		[Embed(source = "../../assets/text/elder01.txt", mimeType = 'application/octet-stream')]		private var msg1:Class;
		[Embed(source = "../../assets/text/elder01_02.txt", mimeType = 'application/octet-stream')]	private var msg2:Class;
		
		private var counter:int;
		
		public function Boss01(X:Number=0, Y:Number=0) {
			super(X, Y);
			loadGraphic(boss01gfx, true, false, 32, 32);
			addAnimation("walk", [0, 1, 0, 2], 8);
			addAnimation("hurt", [3, 4, 3, 4, 3, 4], 6, false);
			addAnimation("attack", [5, 6], 0.5, false);
			
			play("walk");
			
			counter = FlxG.random() * 100 % 8 * FlxG.framerate;
			path = new FlxPath();
		}
		
		override public function update():void {
			if (_curAnim.name != "walk" && finished)
				play("walk");
			if (counter > 0)
				counter--;
			else {
				counter = FlxG.random() * 100 % 8 * FlxG.framerate;
				
				counter--;
				var tmp:FlxPoint;
				tmp = path.head();
				if (tmp == null)
					tmp = new FlxPoint();
				tmp.x = x;
				tmp.y = y;
				path.addPointAt(tmp, 0, true);
				tmp = path.tail();
				if (tmp == null)
					tmp = new FlxPoint();
				if (FlxG.random() > 0.4) {
					tmp.x = FlxG.random() * 1000 % FlxG.width;
					tmp.y = FlxG.random() * 1000 % FlxG.height;
				}
				else {
					tmp.x = Player.position.x;
					tmp.y = Player.position.y;
					play("attack");
				}
				path.addPointAt(tmp, 1, true);
				followPath(path);
			}
		}
		
		override public function hurt(Damage:Number):void {
			if (flickering)
				return;
			knockback();
			super.hurt(Damage);
			play("hurt");
			flicker();
		}
		
		override public function knockback():void {
			if (_curAnim.name == "attack")
				return;
			super.knockback();
		}
		
		override public function kill():void {
			super.kill();
			if (!Database._switch[3]) {
				Database._switch[3] = true;
				MapController.getMap(0, 3);
				PluginAttr.msgwnd.wakeup(new msg1, 15);
				PluginAttr.msgwnd.wakeup(new msg2, 12);
				PluginAttr.livec.hurt(PluginAttr.livec.countLiving());
				PluginAttr.livec.lifePlus(7);
			}
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			health = 20;
		}
	}
}
