package basics {
	import Plugins.PluginAttr;
	import utils.Database;

	/**
	 * ...
	 * @author GFM
	 */
	public class Keeper2 extends Enemy {
		
		[Embed(source = "../../assets/gfx/keeper2.png")]		private var gfx:Class;
		
		[Embed(source = "../../assets/text/elder02.txt", mimeType = 'application/octet-stream')]		private var text:Class;
		[Embed(source = "../../assets/text/elder02alive.txt", mimeType = 'application/octet-stream')]		private var text1:Class;
		[Embed(source = "../../assets/text/elder02alive2.txt", mimeType = 'application/octet-stream')]		private var text2:Class;
		[Embed(source = "../../assets/text/elder02killed.txt", mimeType = 'application/octet-stream')]		private var text3:Class;
		
		[Embed(source = "../../assets/text/elder02_pre.txt", mimeType = 'application/octet-stream')]		private var text0:Class;
		
		
		public function Keeper2() {
			super();
			loadGraphic(gfx);
			immovable = true;
		}
		
		override public function hurt(Damage:Number):void {
			if (Database._switch[7])
				return;
			if (Damage == 0) {
				Database._switch[7] = true;
				PluginAttr.msgwnd.wakeup(new text1, 10);
				PluginAttr.msgwnd.wakeup(new text2, 10);
				Database._vars[2] += 2;
				Database._switch[8] = true;
				return;
			}
			super.hurt(Damage);
		}
		
		override public function kill():void {
			super.kill();
			if (!Database._switch[7]) {
				Database._switch[7] = true;
				PluginAttr.msgwnd.wakeup(new text3, 10);
				Database._vars[1] += 2;
				Database._switch[8] = true;
			}
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			if (!Database._switch[6]) {
				Database._switch[6] = true;
				PluginAttr.msgwnd.wakeup(new text0, 12);
				PluginAttr.msgwnd.wakeup(new text, 17);
			}
		}
	}
}