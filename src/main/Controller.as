package main
{
	import main.hex.Hex;
	import flash.utils.Dictionary;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Controller
	{
		
		private static var __grid		: Dictionary;
		public static function get grid () : Dictionary 
		{
			if ( !__grid ) __grid = new Dictionary;
			return __grid; 
		}
		
		private static var __units		: Dictionary;
		public static function get units () : Dictionary
		{
			if ( !__units ) __units	= new Dictionary;
			return __grid;
		}
		
		public static function getHexgrid ( hexname : String ) : Hex
		{
			return grid[hexname] as Hex;
		}
	}
}
