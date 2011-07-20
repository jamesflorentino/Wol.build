package com.game.renderer
{
	import flash.filters.ColorMatrixFilter;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Filters
	{
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
		static public function set transparent ( transparent : ColorMatrixFilter ) : void
		{
			_transparent = transparent;
		}
		
		private static function createMatrix () : Array
		{
			var matrix : Array;
			matrix	= [];
			matrix	= matrix.concat([	1,	0,	0,	0,	0	]);
			matrix	= matrix.concat([	0,	1,	0,	0,	0	]);
			matrix	= matrix.concat([	0,	0,	1,	0,	0	]);
			matrix	= matrix.concat([	0,	0,	0,	1,	0	]);
			return matrix;
		}
	}
}
