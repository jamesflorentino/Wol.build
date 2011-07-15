package main.hex
{
	import flash.geom.Point;
	import main.AssetNames;
	import com.game.renderer.DisplayElement;

	public class Hex extends DisplayElement
	{
		
		public static const WIDTH	: Number	= 100;
		public static const HEIGHT	: Number	= 86;
		public static const OFFSETY	: Number	= 26;
		public static const OFFSETX	: Number	= 50;
		
		private var __cell	: Point = new Point;
		public function get cellX () 	: int 	{ return __cell.x; }
		public function set cellX ( val : int ) : void 
		{ 
			__cell.x = val; 
			updatePos (); 
		}
		
		public function get cellY () 	: int 	{ return __cell.y; }
		public function set cellY ( val : int ) : void 
		{ 
			__cell.y = val; 
			updatePos (); 
		}
		
		public function get centerX ()	: int	
		{ 
			return x + (Hex.WIDTH * .5); 
		}
		public function get centerY ()	: int	
		{ 
			return y + (Hex.HEIGHT * .5); 
		}
		
		public function Hex ()
		{
			super();
			this.sheetname	= AssetNames.HEX_BASE;
		}
		
		private function updatePos () : void
		{
			/**/
			this.x		= __cell.x * Hex.WIDTH;
			this.y		= __cell.y * ( Hex.HEIGHT - Hex.OFFSETY );
			
			if( __cell.y % 2 )
			{
				this.x	+= Hex.OFFSETX;
			}
			
			this.name	= String( "h_x_y" ).replace( "x", __cell.x ).replace( "y", __cell.y );
			/**/
		}
		
	}
}
