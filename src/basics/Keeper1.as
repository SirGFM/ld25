package basics {
	
	import Plugins.PluginAttr;
	import utils.Database;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Keeper1 extends Enemy {
		
		[Embed(source = "../../assets/gfx/keeper1.png")]	private var gfx:Class;
		[Embed(source = "../../assets/text/elder1killed.txt", mimeType = 'application/octet-stream')]		private var text:Class;
		[Embed(source = "../../assets/text/elder1alive.txt", mimeType = 'application/octet-stream')]		private var text2:Class;
		[Embed(source = "../../assets/text/gotbow.txt", mimeType = 'application/octet-stream')]		private var text3:Class;
		
		public function Keeper1() {
			super();
			loadGraphic(gfx);
			immovable = true;
		}
		
		override public function hurt(Damage:Number):void {
			if (Database._switch[4])
				return;
			if (Damage == 0) {
				Database._switch[4] = true;
				PluginAttr.msgwnd.wakeup(new text2, 10);
				Database._vars[2] += 1;
				PluginAttr.msgwnd.wakeup(new text3, 5);
				Database._switch[5] = true;
				return;
			}
			super.hurt(Damage);
		}
		
		override public function kill():void {
			super.kill();
			if (!Database._switch[4]) {
				Database._switch[4] = true;
				PluginAttr.msgwnd.wakeup(new text, 10);
				Database._vars[1] += 1;
				PluginAttr.msgwnd.wakeup(new text3, 5);
				Database._switch[5] = true;
			}
		}
	}
}
