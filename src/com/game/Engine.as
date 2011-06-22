package com.game
{
	import com.game.display.Entity;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class Engine extends Sprite
	{
		private var canvas		: BitmapData;
		private var canvasBMP	: Bitmap;
		
		private var units		: Vector.<Entity>;
		private var background	: BitmapData;
		
		public function Engine ( __width:Number = 500, __height:Number = 300, __fps:Number = 30)
		{
			Game.WIDTH	= __width;
			Game.HEIGHT	= __height;
			Game.FPS	= __fps;

			units		= new Vector.<Entity>;
			canvas		= new BitmapData ( Game.WIDTH, Game.HEIGHT );
			canvasBMP	= new Bitmap ( canvas );
			
			background	= new BitmapData(Game.WIDTH, Game.HEIGHT, false, 0xff000000);
			
			addChild( canvasBMP );
			
		}
		
		public function startRender () : void 
		{
			addEventListener( Event.ENTER_FRAME, render );
		}
		
		public function stopRender () : void
		{
			removeEventListener( Event.ENTER_FRAME, render );
		}
		
		public function addEntity ( entity:Entity ) : void
		{
			units.push( entity );
		}
		
		public function render ( e:Event ) : void
		{
			renderBackground ();
			renderUnits ();
		}
		
		public function renderBackground () : void
		{
			
		}
		
		public function renderUnits () : void
		{
			var i 		: uint;
			var entity	: Entity;
			
			i	= units.length;
			while ( i-- )
			{
				entity	= units[i];
				
				canvas.copyPixels 
				(
					Sheets.sheets["unit.marine"][0],
					entity.rect,
					entity.position
				);
			}
		}
		
		
		
	}
}
