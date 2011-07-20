package com.game.control 
{
	/**
	 * ...
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class KeyBind 
	{
		
		private var _key		: String;
		private var _name		: String;
		private var _callback	: Function;
		
		public function KeyBind( name : String, key : String, callback : Function ) 
		{
			_name		= name;
			_key		= key;
			_callback	= callback;
		}

		public function get key () : String
		{
			return _key;
		}

		public function set key ( key : String ) : void
		{
			_key = key;
		}

		public function get name () : String
		{
			return _name;
		}

		public function set name ( name : String ) : void
		{
			_name = name;
		}

		public function get callback () : Function
		{
			return _callback;
		}

		public function set callback ( callback : Function ) : void
		{
			_callback = callback;
		}
		
	}

}