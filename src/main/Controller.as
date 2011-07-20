package main
{
	import com.game.Game;
	import flash.events.KeyboardEvent;
	import com.game.control.KeyBind;
	import main.hex.Hex;
	import flash.utils.Dictionary;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Controller
	{
		private static var __keys		: Vector.<KeyBind>;
		private static var __grid		: Dictionary;
		private static var __units		: Dictionary;
		
		public static function addKeyBind ( name : String, key : String, callback : Function ) : void
		{
			if(!__keys)
			{
				__keys	= new Vector.<KeyBind>;
				Game.STAGE.addEventListener( KeyboardEvent.KEY_UP, onKeyPress ); 
			}
			
			__keys.push(new KeyBind(name, key, callback));
		}

		private static function onKeyPress ( event : KeyboardEvent ) : void
		{
		}
		
		
		public static function get grid () : Dictionary 
		{
			if ( !__grid ) __grid = new Dictionary;
			return __grid; 
		}
		
		public static function get units () : Dictionary
		{
			if ( !__units ) __units	= new Dictionary;
			return __units;
		}
		
		public static function getHexgrid ( cellX : Number, cellY : Number ) : Hex
		{
			return grid[ String ( 'h_x_y' ).replace ( 'x' , cellX ).replace ( 'y' , cellY ) ] as Hex;
		}

		static public function get keys () : Vector.<KeyBind>
		{
			return __keys;
		}

		static public function set keys ( _keys : Vector.<KeyBind> ) : void
		{
			__keys = _keys;
		}
	}
}
