package main
{
	import flash.utils.Dictionary;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Control
	{
		
		private static var __grid		: Dictionary;
		public static function get grid () : Dictionary 
		{
			if ( !__grid ) __grid = new Dictionary;
			return __grid; 
		}
	}
}
