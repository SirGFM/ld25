package states {

	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import utils.Database;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Endstate extends FlxState {
		
		override public function create():void {
			var str:String;
			(add(new FlxText(50, 50, 320, "THE END")) as FlxText).size = 24;
			
			switch(Database._vars[3]) {
				case 0: {
					str = "You were the worst villain possible!! I think that was the spirit! (or was it?)";
				}break;
				case 1: {
					str = "You were almost as villainous as possible!";
				}break;
				case 2: {
					str = "Did you try to be villainous and failed or tried no to (but also failed)?";
				}break;
				case 3: {
					str = "Taking the middle road, I see... Is that villainous?";
				}break;
				case 4: {
					str = "You were really good, almost not a villain at all!";
				}break;
				case 5: {
					str = "You weren't a villain at all! Congrats!(?)";
				}break;
			}
			add(new FlxText(80, 144, 160, str));
			add(new FlxButton(160, 200, "Restart", onRest));
		}
		
		public function onRest():void {
			var i:int = 0;
			var l:int = Database._switch.length;
			while (i < l) {
				Database._switch[i] = false;
				i++;
			}
			i = 0;
			l = Database._vars.length;
			while (i < l) {
				Database._vars[i] = 0;
				i++;
			}
			FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new Playstate()); } );
		}
	}
	
}

