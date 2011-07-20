package com.game.renderer
{
	import flash.filters.GlowFilter;
	import flash.filters.ColorMatrixFilter;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Filters
	{
		private static function createMatrix () : Array
		{
			var matrix : Array;
			matrix	= [];
			matrix	= matrix.concat([	1,	0,	0,	0,	0	]); // 0, 1, 2, 3, 4
			matrix	= matrix.concat([	0,	1,	0,	0,	0	]); // 5, 6, 7, 8, 9
			matrix	= matrix.concat([	0,	0,	1,	0,	0	]); // 10, 11, 12, 13, 14
			matrix	= matrix.concat([	0,	0,	0,	1,	0	]); // 15, 16, 17, 18, 19
			return matrix;
		}
		
		private static var _transparent : ColorMatrixFilter;
		static public function get transparent () : ColorMatrixFilter
		{
			if(!_transparent)
			{
				var matrix : Array;
				matrix		= createMatrix();
				matrix[18]	= .5;
				_transparent = new ColorMatrixFilter ( matrix );
			}
			return _transparent;
		}
		
		private static var _stealth : ColorMatrixFilter;
		static public function get stealth () : ColorMatrixFilter
		{
			if(!_stealth)
			{
				var matrix : Array;
				matrix = [0,0,0,0,0,0,0.5,0,0,0,0,0,1,0,0,0,0,0,1,0];
				_stealth = new ColorMatrixFilter ( matrix );
			}
			return _stealth;
		}

		private static var _stealth_innerglow : GlowFilter;
		static public function get stealth_innerglow () : GlowFilter
		{
			if(!_stealth_innerglow)
			{
				var color : uint = 0x00FFFF;
				var alpha : Number = 1;
				var blurX : Number = 3;
				var blurY : Number = 3;
				var strength : Number = 3;
				var quality : int = 1;
				var inner : Boolean = true;
				var knockout : Boolean = false;
				_stealth_innerglow = new GlowFilter ( color , alpha , blurX , blurY , strength , quality , inner , knockout );
				trace('glow!!!1');
			}
			return _stealth_innerglow;
		}
	}
}
