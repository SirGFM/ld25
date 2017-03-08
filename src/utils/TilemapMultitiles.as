package utils {

	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class TilemapMultitiles extends FlxTilemap {
		
		private var autotilecount:int;
		private var multitile:Boolean;
		
		public function loadMultitile(MapData:String, TileGraphic:Class, AutoTileCount:int, TileWidth:uint = 0, TileHeight:uint = 0, AutoTile:uint = OFF, StartingIndex:uint = 0, DrawIndex:uint = 1, CollideIndex:uint = 1):FlxTilemap {
			autotilecount = AutoTileCount;
			multitile = true;
			super.loadMap(MapData, TileGraphic, TileWidth, TileHeight, AutoTile, StartingIndex, DrawIndex, CollideIndex);
			CollideIndex
			multitile = false;
			return this;
		}
		
		/**
		 * An internal function used by the binary auto-tilers.
		 * 
		 * @param	Index		The index of the tile you want to analyze.
		 */
		override protected function autoTile(Index:uint):void
		{
			if(_data[Index] == 0)
				return;
			else if (multitile && _data[Index] > autotilecount) {
				_data[Index] = 16 * autotilecount + _data[Index] - autotilecount + 1;
				return;
			}
			
			if (multitile) {
				var original:uint = _data[Index];
				var offset:uint = (_data[Index] == 1)?1:(16 * (_data[Index] - 1) + 1);
				var ini:int = 16 * (_data[Index] - 1) + 1;
				var end:int = 16 * _data[Index];
				_data[Index] = 0;
				if((Index-widthInTiles < 0) || (_data[Index-widthInTiles] >= ini && _data[Index-widthInTiles] <= end)) 		//UP
					_data[Index] += 1;
				if((Index%widthInTiles >= widthInTiles-1) || (_data[Index+1] == original) || (_data[Index+1] >= ini && _data[Index+1] <= end)) 		//RIGHT
					_data[Index] += 2;
				if((Index+widthInTiles >= totalTiles) || (_data[Index+widthInTiles] == original) || (_data[Index+widthInTiles] >= ini && _data[Index+widthInTiles] <= end)) //DOWN
					_data[Index] += 4;
				if((Index%widthInTiles <= 0) || (_data[Index-1] >= ini && _data[Index-1] <= end)) 					//LEFT
					_data[Index] += 8;
				
				_data[Index] += offset;
			}
			else {
				_data[Index] = 0;
				if((Index-widthInTiles < 0) || (_data[Index-widthInTiles] > 0)) 		//UP
					_data[Index] += 1;
				if((Index%widthInTiles >= widthInTiles-1) || (_data[Index+1] > 0)) 		//RIGHT
					_data[Index] += 2;
				if((Index+widthInTiles >= totalTiles) || (_data[Index+widthInTiles] > 0)) //DOWN
					_data[Index] += 4;
				if((Index%widthInTiles <= 0) || (_data[Index-1] > 0)) 					//LEFT
					_data[Index] += 8;
				
				_data[Index] += 1;
			}
		}
	}
}
