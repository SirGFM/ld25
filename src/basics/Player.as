package basics {

	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import Plugins.PluginAttr;
	import states.Gameover;
	import states.Playstate;
	import utils.Controler;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Player extends FlxSprite {
		
		[Embed(source = "../../assets/gfx/player.png")]		private var player_gfx:Class;
		
		static public const sword:int = 0x0000;
		static public const sparks:int = 0x0001;
		static public const bow:int = 0x0002;
		static public const arrow:int = 0x0003;
		private const speed:int = 100;
		
		static public var position:FlxPoint;
		static public var canAttack:Boolean;
		static public var equiped:int;
		static public var equiped2:int;
		
		private var knockval:int = 75;
		
		public function Player(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) {
			super(X, Y, SimpleGraphic);
			canAttack = true;
			
			drag.x = 50;
			drag.y = 50;
			
			loadGraphic(player_gfx, true, false, 16, 16);
			addAnimation("down", [0, 1, 0, 2], 8);
			addAnimation("up", [3, 4, 3, 5], 8);
			addAnimation("left", [6, 7, 6, 8], 8);
			addAnimation("right", [9, 10, 9, 11], 8);
			addAnimation("stopD", [0], 0, false);
			addAnimation("stopU", [3], 0, false);
			addAnimation("stopL", [6], 0, false);
			addAnimation("stopR", [9], 0, false);
			play("stopD");
			position = new FlxPoint();
			
			if(FlxG.debug)
				equiped = bow;
			else
				equiped = sword;
			equiped2 = sparks;
		}
		
		override public function update():void {
			if (canAttack && Controler.action)
				attack();
			if (canAttack && Controler.second)
				second();
			if (Controler.left) {
				play("left");
				facing = LEFT;
				velocity.x = -speed;
			}
			else if (Controler.right) {
				play("right");
				facing = RIGHT;
				velocity.x = speed;
			}
			else {
				if (velocity.y == 0 && !Controler.up && !Controler.down && _curAnim.name.indexOf("stop") < 0)
					if (velocity.x > 0)
						play("stopR");
					else
						play("stopL");
				velocity.x = 0;
			}
			if (Controler.up) {
				play("up");
				facing = UP;
				velocity.y = -speed;
			}
			else if (Controler.down) {
				play("down");
				facing = DOWN;
				velocity.y = speed;
			}
			else {
				if (!Controler.left && !Controler.right && _curAnim.name.indexOf("stop") < 0)
					if (velocity.y > 0)
						play("stopD");
					else
						play("stopU");
				velocity.y = 0;
			}
		}
		
		override public function postUpdate():void {
			super.postUpdate();
			position.x = x;
			position.y = y;
		}
		
		public function attack():void {
			var weapon:FlxObject;
			canAttack = false;
			weapon = (FlxG.state as Playstate).weapons.members[equiped] as FlxObject;
			/*
			switch(equiped) {
				case sword: {
					weapon = (FlxG.state as Playstate).weapons.members[sword] as FlxObject;
				}break;
				case sparks: {
					weapon = (FlxG.state as Playstate).weapons.members[sparks] as FlxObject;
				}break;
				case bow: {
					weapon = (FlxG.state as Playstate).weapons.members[bow] as FlxObject;
				}break;
			}
			*/
			goweapon(weapon as Weapon);
			if (equiped == bow)
				goweapon((FlxG.state as Playstate).weapons.members[arrow] as Weapon);
			/*
			switch(facing) {
				case LEFT: {
					weapon.reset(x - 16, y);
					weapon.angle = 180;
				}break;
				case RIGHT: {
					weapon.reset(x + 16, y);
					weapon.angle = 0;
				}break;
				case UP: {
					weapon.reset(x, y - 16);
					weapon.angle = -90;
				}break;
				case DOWN: {
					weapon.reset(x, y + 16);
					weapon.angle = 90;
				}break;
			}
			*/
		}
		
		public function second():void {
			var weapon:FlxObject;
			canAttack = false;
			weapon = (FlxG.state as Playstate).weapons.members[equiped2] as FlxObject;
			/*
			switch(equiped2) {
				case sword: {
					weapon = (FlxG.state as Playstate).weapons.members[sword] as FlxObject;
				}break;
				case sparks: {
					weapon = (FlxG.state as Playstate).weapons.members[sparks] as FlxObject;
				}break;
			}
			*/
			goweapon(weapon as Weapon);
			if (equiped2 == bow)
				goweapon((FlxG.state as Playstate).weapons.members[arrow] as Weapon);
			/*
			switch(facing) {
				case LEFT: {
					weapon.reset(x - 16, y);
					weapon.angle = 180;
				}break;
				case RIGHT: {
					weapon.reset(x + 16, y);
					weapon.angle = 0;
				}break;
				case UP: {
					weapon.reset(x, y - 16);
					weapon.angle = -90;
				}break;
				case DOWN: {
					weapon.reset(x, y + 16);
					weapon.angle = 90;
				}break;
			}
			*/
		}
		
		public function goweapon(weapon:Weapon):void {
			switch(facing) {
				case LEFT: {
					weapon.reset(x - 16, y);
					weapon.angle = 180;
					if (weapon is Arrow){
						weapon.velocity.x = -100;
						weapon.velocity.y = 0;
					}
				}break;
				case RIGHT: {
					weapon.reset(x + 16, y);
					weapon.angle = 0;
					if (weapon is Arrow){
						weapon.velocity.x = 100;
						weapon.velocity.y = 0;
					}
				}break;
				case UP: {
					weapon.reset(x, y - 16);
					weapon.angle = -90;
					if (weapon is Arrow){
						weapon.velocity.y = -100;
						weapon.velocity.x = 0;
					}
				}break;
				case DOWN: {
					weapon.reset(x, y + 16);
					weapon.angle = 90;
					if (weapon is Arrow){
						weapon.velocity.y = 100;
						weapon.velocity.x = 0;
					}
				}break;
			}
		}
		
		override public function hurt(Damage:Number):void {
			if (!flickering) {
				if (!PluginAttr.livec.hurt(1)) {
					FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new Gameover()); } );//
					return;
				}
				flicker();
				knockback();
			}
		}
		
		public function knockback():void {
			if (touching & RIGHT)
				velocity.x = -knockval;
			else if (touching & LEFT)
				velocity.x = knockval;
			else if (touching & DOWN)
				velocity.y = -knockval;
			else if (touching & UP)
				velocity.y = knockval;
		}
	}
}
