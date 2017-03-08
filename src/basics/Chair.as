package basics {
	import Plugins.PluginAttr;
	import utils.Database;

	/**
	 * ...
	 * @author GFM
	 */
	public class Chair extends Interactive {
		
		[Embed(source = "../../assets/gfx/chair.png")]		private var gfx:Class;
		[Embed(source = "../../assets/text/chairb.txt", mimeType = 'application/octet-stream')]	private var bad:Class;
		[Embed(source = "../../assets/text/chairg.txt", mimeType = 'application/octet-stream')]	private var good:Class;
		[Embed(source = "../../assets/text/charig2.txt", mimeType = 'application/octet-stream')]	private var good2:Class;
		
		public function Chair() {
			super();
			loadGraphic(gfx);
		}
		
		override public function restart(X:Number, Y:Number, WpFunc:Function = null, PlFunc:Function = null):void {
			super.restart(X, Y, null, onTouch);
		}
		
		public function onTouch(pl:Player):void {
			if (Database._vars[1] == 0) {
				PluginAttr.msgwnd.wakeup(new good, 14);
				PluginAttr.msgwnd.wakeup(new good2, 10);
				Database._vars[3] = 5;
			}
			else {
				PluginAttr.msgwnd.wakeup(new bad, 14);
				Database._vars[3] = 4;
			}
			Database._switch[11] = true;
		}
	}
}
