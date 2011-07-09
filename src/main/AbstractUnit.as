package main
{
	import com.game.renderer.DisplayElement;

	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class AbstractUnit extends DisplayElement
	{
		
		override public function get x () : Number
		{
			return super.x + ( __offset.x * ( this.flipped ? -1 : 1 ) );
		}
	}
}
