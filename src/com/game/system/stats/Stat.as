package com.game.system.stats
{
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Stat
	{
		private var __basevalue : Number;
		private var __max 		: Number;
		private var __min 		: Number;
		private var __name 		: String;
		
		public static function get NULL () : Stat
		{
			return new Stat ( 'NULL', 0, 0 );
		}
		
		public function get name () : String
		{
			return __name;
		}
		
		public function get value () : Number
		{
			return __basevalue;
		}
		
		public function set value ( val : Number ) : void
		{
			if( val < __min ) __basevalue	= __min;
			if( val > __max ) __basevalue	= __max;
		}

		public function Stat ( name : String , min : Number , max : Number )
		{
			__name = name;
			__basevalue = max;
			__max = max;
			__min = min;
		}
		
	}
}
