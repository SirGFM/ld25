package  {

	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import utils.TilemapMultitiles;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Teststate extends FlxState {
		
		[Embed(source = "../assets/gfx/map/tmp/test.png")]	private var tile:Class;
		//[Embed(source = "../assets/gfx/map/tmp/grass02.png")]	private var tile:Class;
		
		override public function create():void {
			var tmp:TilemapMultitiles = new TilemapMultitiles();
			//var tmp:FlxTilemap = new FlxTilemap();
			
			add(tmp);
			tmp.x = 50;
			tmp.y = 50;
			tmp.loadMultitile(
/**/"0,1,1,0,2,2,2,3\n3,0,1,0,0,2,2,0\n0,1,1,1,0,2,2,0\n"/**/
/*"0,1,1,0,1,1,1,1\n0,0,1,0,0,1,1,0\n0,1,1,1,0,1,1,0\n"/**/
, tile,2, 16, 16, FlxTilemap.AUTO);
			FlxG.log(tmp.getData());
			FlxG.log(tmp.totalTiles);
			FlxG.log(tmp.widthInTiles);
		}
	}
}