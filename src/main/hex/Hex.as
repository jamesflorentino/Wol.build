package main.hex
{
	import main.AssetNames;
	import com.game.renderer.DisplayElement;

	public class Hex extends DisplayElement
	{
		
		public static const WIDTH	: Number	= 100;
		public static const HEIGHT	: Number	= 86;
		public static const OFFSETY	: Number	= 26;
		public static const OFFSETX	: Number	= 50;
		
		private var __cellx	: int = 0;
		public function get cellX () 	: int 	{ return __cellx; }
		public function set cellX ( val : int ) : void 
		{ 
			__cellx = val; 
			updatePos (); 
		}
		
		private var __celly	: int = 0;
		public function get cellY () 	: int 	{ return __celly; }
		public function set cellY ( val : int ) : void 
		{ 
			__celly = val; 
			updatePos (); 
		}
		
		public function Hex ()
		{
			super();
			this.sheet	= AssetNames.HEX_BASE;
		}
		
		private function updatePos () : void
		{
			/**/
			this.x		= __cellx * Hex.WIDTH;
			this.y		= __celly * ( Hex.HEIGHT - Hex.OFFSETY );
			
			if( __celly % 2 )
			{
				this.x	+= Hex.OFFSETX;
			}
			
			this.name	= String( "h_x_y" ).replace( "x", __cellx ).replace( "y", __celly );
			/**/
		}
		
	}
}
