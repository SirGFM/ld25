package {
	
	import org.flixel.FlxG;
	import states.Menustate;
	import org.flixel.FlxGame;
	import states.Playstate;
	import utils.Database;
	
	[SWF(width="640",height="480",backgroundColor="0x000000")]
	[Frame(factoryClass="Preloader")]
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Main extends FlxGame {
		
		public function Main():void {
			Database.init();
			super(320, 240, Menustate, 2, 60, 60, true);
			FlxG.debug = false;
		}
	}
}
