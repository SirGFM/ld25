package utils {
	
	import basics.Arrow;
	import basics.Bat;
	import basics.Boss01;
	import basics.Chair;
	import basics.EvilKing;
	import basics.Goblin;
	import basics.Inanimate;
	import basics.Interactive;
	import basics.Keeper1;
	import basics.Keeper2;
	import basics.Player;
	import basics.Princess;
	import basics.Sparks;
	import basics.Weapon;
	import flash.display.BitmapData;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import Plugins.PluginAttr;
	import states.Playstate;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class MapController {
		
		static private const WIDTH:uint = 5;
		
		// Texts
		[Embed(source = "../../assets/text/final1.txt", mimeType = 'application/octet-stream')]	static private var _final1:Class;
		[Embed(source = "../../assets/text/final2good.txt", mimeType = 'application/octet-stream')]	static private var _final2g:Class;
		[Embed(source = "../../assets/text/final2bad.txt", mimeType = 'application/octet-stream')]	static private var _final2b:Class;
		[Embed(source = "../../assets/text/final3.txt", mimeType = 'application/octet-stream')]	static private var _final3:Class;
		[Embed(source = "../../assets/text/intro.txt", mimeType = 'application/octet-stream')]	static private var _intro_txt:Class;
		[Embed(source = "../../assets/text/intro2.txt", mimeType = 'application/octet-stream')]	static private var _intro2_txt:Class;
		[Embed(source = "../../assets/text/evilcastleentrance.txt", mimeType = 'application/octet-stream')]	static private var evilcastle1:Class;
		[Embed(source = "../../assets/text/evilcastleintro.txt", mimeType = 'application/octet-stream')]	static private var evilcastle2:Class;
		[Embed(source = "../../assets/text/boss1before.txt", mimeType = 'application/octet-stream')]	static private var _boss1_before:Class;
		
		// Maps
		[Embed(source = "../../assets/map/30.txt", mimeType = 'application/octet-stream')]		static private var _30_txt:Class;
		[Embed(source = "../../assets/map/01.png")]		static private var _01_gfx:Class;
		[Embed(source = "../../assets/map/31.txt", mimeType = 'application/octet-stream')]		static private var _31_txt:Class;
		[Embed(source = "../../assets/map/02.png")]		static private var _02_gfx:Class;
		[Embed(source = "../../assets/map/12.png")]		static private var _12_gfx:Class;
		[Embed(source = "../../assets/map/22.txt", mimeType = 'application/octet-stream')]		static private var _22_txt:Class;
		[Embed(source = "../../assets/map/03.png")]		static private var _03_gfx:Class;
		[Embed(source = "../../assets/map/13.png")]		static private var _13_gfx:Class;
		[Embed(source = "../../assets/map/32.txt", mimeType = 'application/octet-stream')]		static private var _32_txt:Class;
		[Embed(source = "../../assets/map/23.txt", mimeType = 'application/octet-stream')]		static private var _23_txt:Class;
		[Embed(source = "../../assets/map/33.txt", mimeType = 'application/octet-stream')]		static private var _33_txt:Class;
		[Embed(source = "../../assets/map/43.png")]		static private var _43_gfx:Class;
		[Embed(source = "../../assets/map/24.txt", mimeType = 'application/octet-stream')]		static private var _24_txt:Class;
		[Embed(source = "../../assets/map/34.txt", mimeType = 'application/octet-stream')]		static private var _34_txt:Class;
		
		//GFX
		[Embed(source = "../../assets/gfx/target.png")]				static private var target:Class;
		[Embed(source = "../../assets/gfx/switch.png")]				static private var switchgfx:Class;
		[Embed(source = "../../assets/gfx/spikes.png")]				static private var spikes:Class;
		[Embed(source = "../../assets/gfx/weed.png")]				static private var weed:Class;
		[Embed(source = "../../assets/gfx/map/bg_31.png")]				static private var bg_31:Class;
		[Embed(source = "../../assets/gfx/map/wCastleBase.png")]		static private var wCastleBase:Class;
		[Embed(source = "../../assets/gfx/map/bCastleBase.png")]		static private var bCastleBase:Class;
		//Tiles
		[Embed(source = "../../assets/gfx/map/tmp/grass02.png")]		static private var tileGrass:Class;
		[Embed(source = "../../assets/gfx/map/tmp/test2.png")]		static private var test:Class;
		[Embed(source = "../../assets/gfx/map/swamp.png")]				static private var swamp:Class;
		[Embed(source = "../../assets/gfx/map/sand.png")]				static private var sand:Class;
		[Embed(source = "../../assets/gfx/map/dark.png")]				static private var dark:Class;
		
		static private var bg:FlxSprite;
		static public var map:FlxTilemap;
		// anything!! enemies, chest, etc.
		static private var stuff:FlxGroup;
		
		static public function init():void {
			bg = new FlxSprite();
			bg.active = false;
			
			map = new FlxTilemap();
			stuff = new FlxGroup();
			
			FlxG.state.add(bg);
			FlxG.state.add(map);
			(FlxG.state as Playstate).objs.add(stuff);
			
			//getMap(1, 2);
			getMap(3, 4);
		}
		
		static public function getMap(X:uint, Y:uint):void {
			if (Database._switch[10])
				return;
			bg.visible = false;
			stuff.callAll("kill");
			switch(Y * WIDTH + X) {
				case 0 + 1 * WIDTH: _01(); break;
				case 3 + 0 * WIDTH: _30(); break;
				case 3 + 1 * WIDTH: _31(); break;
				case 0 + 2 * WIDTH: _02(); break;
				case 1 + 2 * WIDTH: _12(); break;
				case 2 + 2 * WIDTH: _22(); break;
				case 3 + 2 * WIDTH: _32(); break;
				case 0 + 3 * WIDTH: _03(); break;
				case 1 + 3 * WIDTH: _13(); break;
				case 2 + 3 * WIDTH: _23(); break;
				case 3 + 3 * WIDTH: _33(); break;
				case 4 + 3 * WIDTH: _43(); break;
				case 2 + 4 * WIDTH: _24(); break;
				case 3 + 4 * WIDTH: _34(); break;
			}
		}
		
		static private function _01():void {
			var tmp:Interactive;
			
			changeMapBMP(_01_gfx, dark);
			
			if (!(Database._switch[10])) {
				Database._switch[10] = true;
				PluginAttr.msgwnd.wakeup(new _final1, 15);
				if (Database._vars[1] > 0)
					PluginAttr.msgwnd.wakeup(new _final2b, 12);
				else
					PluginAttr.msgwnd.wakeup(new _final2g, 15);
				PluginAttr.msgwnd.wakeup(new _final3, 7);
			}
			
			FlxG.bgColor = 0xff777777;
			
			tmp = stuff.recycle(Princess) as Interactive;
			tmp.restart(5*16, 9*16);
			tmp = stuff.recycle(EvilKing) as Interactive;
			tmp.restart(13*16,9*16);
			tmp = stuff.recycle(Chair) as Interactive;
			tmp.restart(9*16,12*16);
		}
		
		static private function _43():void {
			var tmp:FlxObject;
			
			changeMapBMP(_43_gfx, sand);
			
			if (!(Database._vars[1] & 2)) {
				tmp = stuff.recycle(Keeper2) as FlxObject;
				tmp.reset(9 * 16, 3 * 16);
			}
			
			FlxG.bgColor = 0xffada171;
		}
		
		static private function _03():void {
			changeMapBMP(_03_gfx, swamp);
			if (!Database._switch[2]) {
				PluginAttr.livec.hurt(PluginAttr.livec.countLiving());
				PluginAttr.livec.lifePlus(7);
				var tmp:FlxObject;
				tmp = stuff.recycle(Boss01) as FlxObject;
				tmp.reset(10 * 16, 11 * 16);
				
				PluginAttr.msgwnd.wakeup(new _boss1_before, 10);
				map.setTile(8, 0, 1, true);
				map.setTile(9, 0, 1, true);
				map.setTile(10, 0, 1, true);
				map.setTile(11, 0, 1, true);
				map.setTile(12, 0, 1, true);
				map.setTile(19, 6, 1, true);
				map.setTile(19, 7, 1, true);
				Database._switch[2] = true;
			}
			else if (!Database._switch[4]) {
				map.setTile(8, 0, 1, true);
				map.setTile(9, 0, 1, true);
				map.setTile(10, 0, 1, true);
				map.setTile(11, 0, 1, true);
				map.setTile(12, 0, 1, true);
			}
			FlxG.bgColor = 0xffada171;
		}
		
		static private function _13():void {
			var tmp:FlxObject;
			changeMapBMP(_13_gfx, swamp);
			
			if (!(Database._vars[1] & 1)) {
				tmp = stuff.recycle(Keeper1) as FlxObject;
				tmp.reset(9 * 16, 3 * 16);
			}
			
			FlxG.bgColor = 0xffada171;
		}
		
		static private var s0:Interactive;
		static private var s1:Interactive;
		static private var s2:Interactive;
		static private var s3:Interactive;
		
		static private function spawnFromTrap():void {
			var i:int = 0;
			s0.play("switchINI");
			s1.play("switchINI");
			s2.play("switchINI");
			s3.play("switchINI");
			Database._vars[0] = 0;
			while (i < 3) {
				var tmp:FlxPoint = new FlxPoint();
				var ene:FlxObject;
				tmp.x = int(Player.position.x/16);
				tmp.y = int(Player.position.y/16);
				while (tmp.x == int(Player.position.x/16) && tmp.y == int(Player.position.y/16)) {
					tmp.x = int(FlxG.random() * 100 % 12 + 4);
					tmp.y = int(FlxG.random() * 100 % 10 + 4);
				}
				ene = stuff.recycle(Goblin) as FlxObject;
				ene.reset(tmp.x*16, tmp.y*16);
				i++;
			}
		}
		
		static private function _02():void {
			changeMapBMP(_02_gfx, swamp);
			FlxG.bgColor = 0xffada171;
			
			if (Player.position.x < 50) {
				map.setTile(8, 14, 1, true);
				map.setTile(9, 14, 1, true);
				map.setTile(10, 14, 1, true);
				map.setTile(11, 14, 1, true);
				map.setTile(12, 14, 1, true);
				Database._vars[0] = 0;
			}
			
			s0 = newSwitch(4, 4, function(w:Weapon):void {
									if (w  is Sparks)
										return;
									w.allowCollisions = FlxObject.NONE;
									if (Database._vars[0] == 0){
										this.play("switchMOVE");
										Database._vars[0] = 1;
									}
									else {
										spawnFromTrap();
									}
									});
			s1 = newSwitch(15, 11, function(w:Weapon):void{
									if (w  is Sparks)
										return;
									w.allowCollisions = FlxObject.NONE;
									if (Database._vars[0] == 1){
										this.play("switchMOVE");
										Database._vars[0] = 2;
									}
									else {
										spawnFromTrap();
									}});
			s2 = newSwitch(15, 4, function(w:Weapon):void{
									if (w  is Sparks)
										return;
									w.allowCollisions = FlxObject.NONE;
									if (Database._vars[0] == 2){
										this.play("switchMOVE");
										Database._vars[0] = 3;
									}
									else {
										spawnFromTrap();
									}});
			s3 = newSwitch(4, 11, function(w:Weapon):void{
									if (w  is Sparks)
										return;
									w.allowCollisions = FlxObject.NONE;
									if (Database._vars[0] == 3){
										this.play("switchMOVE");
										Database._vars[0] = 4;
										map.setTile(8, 14, 0, true);
										map.setTile(9, 14, 0, true);
										map.setTile(10, 14, 0, true);
										map.setTile(11, 14, 0, true);
										map.setTile(12, 14, 0, true);
									}
									else {
										spawnFromTrap();
									}});
		}
		
		static private function _12():void {
			var tmp:FlxObject;
			changeMapBMP(_12_gfx, swamp);
			FlxG.bgColor = 0xffada171;
			
			newSpike(10, 3);
			newSpike(10, 4);
			
			tmp = stuff.recycle(Goblin) as FlxObject;
			tmp.reset(15 * 16, 11 * 16);
			tmp = stuff.recycle(Goblin) as FlxObject;
			tmp.reset(3 * 16, 9 * 16);
		}
		
		static private function _30():void {
			var tmp:Inanimate;
			
			changeMap(new _30_txt, sand);
			FlxG.bgColor = 0xffada171;
			
			if (!Database._switch[1]) {
				Database._switch[1] = true;
				PluginAttr.msgwnd.wakeup(new evilcastle1, 20);
			}
			if (Database._switch[8] && !Database._switch[9]) {
				Database._switch[9] = true;
				PluginAttr.msgwnd.wakeup(new evilcastle2, 7);
				(FlxG.state as Playstate).mapX = 0;
				(FlxG.state as Playstate).mapY = 0;
			}
			
			
			tmp = stuff.recycle(Inanimate) as Inanimate;
			tmp.loadGraphic(bCastleBase);
			tmp.moves = false;
			tmp.immovable = true;
			tmp.reset(120, 122);
		}
		
		static private function _31():void {
			_30();
			/*
			map.loadMultitile(new _31_txt, test, 3, 16, 16, FlxTilemap.AUTO);
			map.setDirty();
			// Big BG is bad for fps!
			bg.loadGraphic(bg_31);
			bg.visible = true;
			*/
		}
		
		static private function _22():void {
			changeMap(new _22_txt, tileGrass);
			
			spawnBats()
			
			newWeed(4, 13);
			newWeed(5, 13);
			newWeed(6, 13);
			newWeed(7, 13);
			newWeed(8, 13);
			newWeed(5, 12);
			newWeed(6, 12);
			newWeed(7, 12);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function _32():void {
			changeMap(new _32_txt, tileGrass);
			
			spawnBats()
			
			newWeed(10, 12);
			newWeed(5, 8);
			newWeed(7, 4);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function _23():void {
			changeMap(new _23_txt, tileGrass);
			
			spawnBats()
			
			newWeed(4, 8);
			newWeed(10, 12);
			newWeed(17, 10);
			newWeed(12, 6);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function _33():void {
			changeMap(new _33_txt, tileGrass);
			
			spawnBats()
			
			newWeed(5, 6);
			newWeed(10, 7);
			newWeed(16, 6);
			newWeed(13, 4);
			
			newTarget(19, 7);
			newTarget(19, 8);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function _24():void {
			var act:Interactive;
			var f:Function = function(w:Weapon):void { if (w is Sparks) return; this.play("weedkill"); this.addAnimationCallback(function(n:String, i:uint, fi:uint):void { if (this.finished) this.kill(); } ); };
			var tmp:FlxObject;
			
			changeMap(new _24_txt, tileGrass);
			
			tmp = stuff.recycle(Bat) as FlxObject;
			tmp.reset(176, 48);
			tmp = stuff.recycle(Bat) as FlxObject;
			tmp.reset(112, 160);
			tmp = stuff.recycle(Bat) as FlxObject;
			tmp.reset(96, 112);
			tmp = stuff.recycle(Bat) as FlxObject;
			tmp.reset(144, 96);
			
			
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(240, 176, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(240, 160, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(256, 144, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(272, 144, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(256, 160, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(272, 160, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(288, 160, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(256, 176, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(272, 176, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(288, 176, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(256, 188, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(272, 188, f);
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.restart(288, 188, f);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function _34():void {
			var tmp:Inanimate;
			var act:Interactive;
			var f:Function = function(w:Weapon):void { this.play("weedkill"); this.addAnimationCallback(function(n:String, i:uint, fi:uint):void { if (this.finished) this.kill(); } );};
			
			if (!Database._switch[0]) {
				Database._switch[0] = true;
				PluginAttr.msgwnd.wakeup(new _intro_txt, 10);
				PluginAttr.msgwnd.wakeup(new _intro2_txt, 10);
			}
			
			changeMap(new _34_txt, tileGrass);
			
			tmp = stuff.recycle(Inanimate) as Inanimate;
			tmp.loadGraphic(wCastleBase);
			tmp.moves = false;
			tmp.immovable = true;
			tmp.reset(120, 122);
			
			newWeed(1, 11);
			newWeed(1, 12);
			newWeed(1, 13);
			newWeed(2, 12);
			newWeed(2, 13);
			newWeed(3, 13);
			
			FlxG.bgColor = 0xff7dad50;
		}
		
		static private function changeMap(tilemap:String, gfx:Class):void {
			map.loadMap(tilemap, gfx, 16, 16, FlxTilemap.AUTO);
			map.setDirty();
		}
		
		static private function changeMapBMP(tilemap:Class, gfx:Class):void {
			var pixels:BitmapData = new FlxSprite(0, 0, tilemap).pixels;
			map.loadMap(FlxTilemap.bitmapToCSV(pixels), gfx, 16, 16, FlxTilemap.AUTO);
			map.setDirty();
		}
		
		static private function newSwitch(X:Number, Y:Number, f:Function):Interactive {
			var act:Interactive;
			
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(switchgfx, true, false, 16, 16);
			act.addAnimation("switchINI", [0], 0, false);
			act.addAnimation("switchMOVE", [1,2], 8, false);
			act.immovable = true;
			act.allowCollisions = FlxObject.ANY;
			act.restart(X * 16, Y * 16, f);
			
			return(act);
		}
		
		static private function newWeed(X:Number, Y:Number):void {
			var act:Interactive;
			var f:Function = function(w:Weapon):void { if (w is Sparks) return; this.play("weedkill"); this.addAnimationCallback(function(n:String, i:uint, fi:uint):void { if (this.finished) this.kill(); } ); };
			
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(weed, true, false, 16, 16);
			act.addAnimation("weedkill", [1, 2], 8, false);
			act.immovable = true;
			act.allowCollisions = FlxObject.ANY;
			act.restart(X*16, Y*16, f);
		}
		
		static private function newTarget(X:Number, Y:Number):void {
			var act:Interactive;
			var f:Function = function(w:Weapon):void { if (w is Arrow) this.kill(); };
			
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(target, false, false, 16, 16);
			act.immovable = true;
			act.allowCollisions = FlxObject.ANY;
			act.restart(X*16, Y*16, f);
		}
		
		static private function newSpike(X:Number, Y:Number):void {
			var act:Interactive;
			var f:Function = function(p:Player):void { this.play("spikekill"); p.hurt(1); };
			
			act = stuff.recycle(Interactive) as Interactive;
			act.loadGraphic(spikes, true, false, 16, 16);
			act.addAnimation("spikekill", [1, 2, 2, 2, 1, 0], 8, false);
			act.immovable = true;
			act.allowCollisions = FlxObject.ANY;
			act.restart(X*16, Y*16, null, f);
		}
		
		static private function spawnBats():void {
			var i:int = FlxG.random() * 100 % 5 + 1;
			while (i > 0) {
				var tmp:FlxPoint = new FlxPoint();
				var ene:FlxObject;
				tmp.x = int(Player.position.x/16);
				tmp.y = int(Player.position.y/16);
				while (tmp.x == int(Player.position.x/16) && tmp.y == int(Player.position.y/16)) {
					tmp.x = int(FlxG.random() * 100 % 12 + 4);
					tmp.y = int(FlxG.random() * 100 % 10 + 4);
				}
				ene = stuff.recycle(Bat) as FlxObject;
				ene.reset(tmp.x*16, tmp.y*16);
				i--;
			}
		}
	}
}
