package basics {
	import Plugins.PluginAttr;
	import utils.Database;

	/**
	 * ...
	 * @author GFM
	 */
	public class EvilKing extends Interactive {
		
		[Embed(source = "../../assets/gfx/evilking.png")]		private var gfx:Class;
		[Embed(source = "../../assets/text/kingb.txt", mimeType = 'application/octet-stream')]	private var bad:Class;
		[Embed(source = "../../assets/text/kingg.txt", mimeType = 'application/octet-stream')]	private var good:Class;
		
		public function EvilKing(X:Number=0, Y:Number=0) {
			super(X, Y);
			loadGraphic(gfx);
		}
		
		override public function restart(X:Number, Y:Number, WpFunc:Function = null, PlFunc:Function = null):void {
			super.restart(X, Y, null, onTouch);
		}
		
		public function onTouch(pl:Player):void {
			if (Database._vars[1] == 0) {
				PluginAttr.msgwnd.wakeup(new good, 14);
				Database._vars[3] = 1;
			}
			else {
				PluginAttr.msgwnd.wakeup(new bad, 14);
				Database._vars[3] = 2;
			}
			Database._switch[11] = true;
		}
	}
}