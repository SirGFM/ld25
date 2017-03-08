package states {

	import adobe.utils.CustomActions;
	import basics.Arrow;
	import basics.Bow;
	import basics.Enemy;
	import basics.Interactive;
	import basics.Player;
	import basics.Sparks;
	import basics.StateWpause;
	import basics.Sword;
	import basics.Weapon;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import Plugins.PluginAttr;
	import utils.Database;
	import utils.MapController;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Playstate extends StateWpause {
		
		public var mapX:uint;
		public var mapY:uint;
		private var player:FlxObject;
		public var weapons:FlxGroup;
		public var objs:FlxGroup;
		
		override public function create():void {
			mapX = 3;
			mapY = 4;
			
			PluginAttr.equipgui.exists = true;
			PluginAttr.livec.exists = true;
			PluginAttr.livec.hurt(PluginAttr.livec.countLiving());
			PluginAttr.livec.lifePlus(7);
			
			objs = new FlxGroup();
			MapController.init();
			
			weapons = new FlxGroup();
			weapons.add(new Sword());
			weapons.add(new Sparks());
			weapons.add(new Bow());
			weapons.add(new Arrow());
			// TODO add weapons to group
			
			player = new Player(160, 188);
			objs.add(player);
			objs.add(weapons);
			add(objs);
			FlxG.watch(this, "mapX");
			FlxG.watch(this, "mapY");
		}
		
		override public function update():void {
			if (Database._switch[11])
				FlxG.switchState(new Endstate());
			super.update();
			
			FlxG.collide(this);
			FlxG.overlap(objs, objs, onCollide);
			
			//check if the player moved outside the screen and update the map
			var changeMap:Boolean = false;
			
			if (player.x < 0) {
				player.x = FlxG.width - player.width;
				mapX--;
				changeMap = true;
			}
			else if (player.x > FlxG.width) {
				player.x = 0;
				mapX++;
				changeMap = true;
			}
			else if (player.y < 0) {
				player.y = FlxG.height - player.height;
				mapY--;
				changeMap = true;
			}
			else if (player.y > FlxG.height) {
				player.y = 0;
				mapY++;
				changeMap = true;
			}
			
			if (changeMap)
				MapController.getMap(mapX, mapY);
		}
		
		public function onCollide(obj1:FlxBasic, obj2:FlxBasic):void {
			var w:Weapon;
			var e:Enemy;
			var p:Player;
			var i:Interactive;
			
			if (obj1 is Weapon)
				w = obj1 as Weapon;
			else if (obj1 is Enemy)
				e = obj1 as Enemy;
			else if (obj1 is Player)
				p = obj1 as Player;
			else if (obj1 is Interactive)
				i = obj1 as Interactive;
			
			if (obj2 is Weapon)
				w = obj2 as Weapon;
			else if (obj2 is Enemy)
				e = obj2 as Enemy;
			else if (obj2 is Player)
				p = obj2 as Player;
			else if (obj2 is Interactive)
				i = obj2 as Interactive;
			
			if (w != null && e != null) {
				w.overlaped = true;
				w.allowCollisions = FlxObject.NONE;
				e.hurt(w.damage);
			}
			else if (w != null && i != null){
				w.overlaped = true;
				i.activate(w);
			}
			else if (p != null && i != null)
				i.activate(p);
			else if (p != null && e != null)
				p.hurt(0);
		}
	}
}
