package 
{
	import net.hires.debug.Stats;
	import flash.display.Sprite;
	import flash.events.Event;
	import main.AbstractLevel;
	
	/**
	 * ...
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild( new AbstractLevel ( 1024, 768,  30 ) );
			addChild( new Stats() );
		}
		
	}
	
}
