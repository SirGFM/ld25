package Plugins {

	import basics.Player;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import utils.Controler;
	import utils.Database;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Equipped extends FlxGroup {
		
		[Embed(source = "../../assets/gfx/iconbow.png")]		private var bow:Class;
		[Embed(source = "../../assets/gfx/iconsparks.png")]	private var sparks:Class;
		[Embed(source = "../../assets/gfx/iconsword.png")]		private var sword:Class;
		
		private var e1tex:FlxText;
		private var e1:FlxSprite;
		
		private var e2tex:FlxText;
		private var e2:FlxSprite;
		
		public function Equipped() {
			super();
			e1tex = new FlxText(290, 5, 25, Controler.actionKey);
			e1 = new FlxSprite(300, 5, sword);
			e2tex = new FlxText(290, 25, 25, Controler.secondKey);
			e2 = new FlxSprite(300, 25, sparks);
			
			add(e1tex);
			add(e1);
			add(e2tex);
			add(e2);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.mouse.justPressed() && e1.overlapsPoint(FlxG.mouse)) {
				changeE1(Player.equiped + 1);
			}
			if (FlxG.mouse.justPressed() && e2.overlapsPoint(FlxG.mouse)) {
				changeE2(Player.equiped2 + 1);
			}
		}
		
		public function changeE1(newEquip:int):void {
			switch(newEquip) {
				case Player.sword: {
					e1.loadGraphic(sword);
					Player.equiped = newEquip;
				}break;
				case Player.sparks: {
					e1.loadGraphic(sparks);
					Player.equiped = newEquip;
				}break;
				case Player.bow: {
					if (!Database._switch[5]) {
						changeE1(newEquip + 1);
						return;
					}
					e1.loadGraphic(bow);
					Player.equiped = newEquip;
				}break;
				default:{
					e1.loadGraphic(sword);
					Player.equiped = Player.sword;
				}
			}
		}
		
		public function changeE2(newEquip:int):void {
			switch(newEquip) {
				case Player.sword: {
					e2.loadGraphic(sword);
					Player.equiped2 = newEquip;
				}break;
				case Player.sparks: {
					e2.loadGraphic(sparks);
					Player.equiped2 = newEquip;
				}break;
				case Player.bow: {
					if (!Database._switch[5]) {
						changeE2(newEquip + 1);
						return;
					}
					e2.loadGraphic(bow);
					Player.equiped2 = newEquip;
				}break;
			}
		}
	}
}
