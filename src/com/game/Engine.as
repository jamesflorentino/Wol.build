package com.game
{
	import flash.geom.Point;
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
			
			var __tempspritebg	: Sprite;
			__tempspritebg		= new Sprite();
			__tempspritebg.graphics.drawRect(0, 0, 100, 100);
			__tempspritebg.graphics.beginFill(0x000000);
			
			background.draw(__tempspritebg);
			
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
			canvas.lock ();
			
			renderBackground ();
			renderUnits ();
			
			canvas.unlock ();
		}
		
		private var __pt	: Point = new Point;
		public function renderBackground () : void
		{
			canvas.copyPixels
			(
				background,
				background.rect,
				__pt
			);
		}
		
		public function renderUnits () : void
		{
			var i 		: uint;
			var entity	: Entity;
			
			i	= units.length;
			while ( i-- )
			{
				entity	= units[i];
				entity.update ();
				canvas.copyPixels 
				(
					Sheets.sheets ( entity.sheet )[entity.currentFrame],
					entity.rect,
					entity.position,
					null,
					null,
					true
				);
			}
		}
		
		
		
	}
}
