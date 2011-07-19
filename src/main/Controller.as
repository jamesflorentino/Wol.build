package main
{
	import flash.events.Event;
	import main.hex.Hex;
	import flash.utils.Dictionary;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Controller
	{
		private static var keyBindings		: Array;
		
		public static function addKeyBind ( key : String, eventCallback : Event ) : void
		{
			
		}
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
		
		public static function getHexgrid ( cellX : Number, cellY : Number ) : Hex
		{
			return grid[ String('h_x_y').replace('x', cellX).replace('y', cellY) ] as Hex;
		}
	}
}
