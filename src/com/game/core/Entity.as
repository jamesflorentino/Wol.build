package com.game.core 
{
	/**
	 * ...
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Entity 
	{
		protected var __name : String;

		public function get name () : String
		{
			return __name;
		}

		public function set name ( _name : String ) : void
		{
			__name = _name;
		}		
		
	}

}