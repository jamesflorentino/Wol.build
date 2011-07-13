package main.utils
{
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class FrameAnimation
	{
		public var name	: String;
		public var start	: int;
		public var end		: int;
		public var loop		: Boolean;
		
		public function FrameAnimation( __label:String , __start : int , __end : int, __loop : Boolean = false )
		{
			name	= __label; 
			start	= __start;
			end		= __end;
			loop	= __loop;		
		}
		
	}
}
