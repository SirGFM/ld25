package basics {
	import Plugins.PluginAttr;
	import utils.Database;

	/**
	 * ...
	 * @author GFM
	 */
	public class Princess extends Interactive {
		
		[Embed(source = "../../assets/gfx/princess.png")]		private var gfx:Class;
		[Embed(source = "../../assets/text/princessb.txt", mimeType = 'application/octet-stream')]	private var bad:Class;
		[Embed(source = "../../assets/text/princessg.txt", mimeType = 'application/octet-stream')]	private var good:Class;
		
		public function Princess() {
			super();
			loadGraphic(gfx);
		}
		
		override public function restart(X:Number, Y:Number, WpFunc:Function = null, PlFunc:Function = null):void {
			super.restart(X, Y, null, onTouch);
		}
		
		public function onTouch(pl:Player):void {
			if (Database._vars[1] == 0) {
				PluginAttr.msgwnd.wakeup(new good, 14);
				Database._vars[3] = 0;
			}
			else {
				PluginAttr.msgwnd.wakeup(new bad, 14);
				Database._vars[3] = 3;
			}
			Database._switch[11] = true;
		}
	}
}