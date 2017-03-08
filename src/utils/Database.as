package utils {

	/**
	 * ...
	 * @author GFM
	 */
	public class Database {
		
		// 0 = intro.txt
		// 1 = evilcastleentrance.txt
		// 2 = boss1 defeated
		// 3 = after boss 1 txt
		// 4 = elder 1
		// 5 = has bow
		// 6 = elder 2 before
		// 7 = elder 2 after
		// 8 = can enter castle
		// 9 = evilcastleintro.txt
		// 10 = ending
		static public var _switch:Vector.<Boolean>;
		
		// 0 = puzzle (0,1)
		// 1 = keepers killed
		// 2 = keepers saved
		static public var _vars:Vector.<int>;
		
		static public function init():void {
			var i:int;
			
			_switch = new Vector.<Boolean>();
			_vars = new Vector.<int>();
			
			i = 0;
			while (i < 20) {
				_switch.push(false);
				_vars.push(0);
				i++;
			}
		}
	}
}
