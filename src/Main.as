package 
{
	import main.Controller;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.text.TextField;
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
			addChild( new AbstractLevel ( 800, 700,  30 ) );
			addChild( new Stats() );
			
			stage.addEventListener(MouseEvent.CLICK, randomHex);
			
			
			 /**
			  * ----------------------------
			  * 		TEMPORARY
			  * ----------------------------
			  * 
			  */
			var txt:TextField = new TextField();
			var fmt:TextFormat = new TextFormat;
			fmt.font = 'Arial';
			fmt.bold = true;
			fmt.color = 0xc0ffee;
			fmt.size = 12;
			txt.autoSize = 'left';
			txt.selectable = false;
			txt.defaultTextFormat = fmt;
			txt.text = 'Hiraya AS3 Graphics Engine v0.01';
			txt.x = 800;
			txt.y = 700;
			addChild(txt);
			
			fmt.size = 10;
			fmt.bold = false;
			txt = new TextField;
			txt.autoSize = 'left';
			txt.selectable = false;
			txt.defaultTextFormat = fmt;
			txt.text = 'github.com/jamesflorentino';
			txt.x = 800;
			txt.y = 714;
			addChild(txt);
		}

		private function randomHex ( event : MouseEvent ) : void
		{
			var CELLX : Number	= AbstractLevel.TEMPUNIT.hex.cellX;
			var CELLY : Number	= AbstractLevel.TEMPUNIT.hex.cellY + 1;
			
			AbstractLevel.TEMPUNIT.gotoHex ( Controller.getHexgrid ( CELLX , CELLY ) );
		}
		
	}
	
}
