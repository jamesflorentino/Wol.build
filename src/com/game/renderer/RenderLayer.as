package com.game.renderer
{
	import flash.geom.Point;
	import flash.filters.BitmapFilter;
	import com.game.Sheets;
	import com.game.core.Entity;
	import flash.display.BitmapData;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class RenderLayer extends Entity
	{
		
		private var __bitmapData			: BitmapData;
		public function get bitmapData () 	: BitmapData { return __bitmapData; }
		
		private var __children				: Vector.<Spritesheet>;
		public function get children ()		: Vector.<Spritesheet> { return __children; }
		
		private var __filters				: Vector.<BitmapFilter>;
		public function get filters () 		: Vector.<BitmapFilter> { return __filters; }
		public function set filters ( val : Vector.<BitmapFilter> ) : void { __filters = val; }
		
		public function RenderLayer ( __width : uint, __height : uint )
		{
			__filters		= new Vector.<BitmapFilter>;
			__bitmapData 	= new BitmapData ( __width, __height, true, 0x00000000 );
			__children		= new Vector.<Spritesheet>();
		}
		
		public function addSheet ( child : Spritesheet ) : Vector.<Spritesheet>
		{
			__children.push( child );
			return __children;
		}
		
		private var __currentItem 	: Spritesheet;
		
		public function render() : void
		{
			var i : uint;
			
			__bitmapData.fillRect ( __bitmapData.rect, 0x00000000 );
			__bitmapData.lock();
			
			for( i = 0 ; i < __children.length; i++ )
			{
				__currentItem	= __children [ i ];
				__currentItem.update ();
				__bitmapData.copyPixels 
				( 
					Sheets.getSheet ( __currentItem.sheet )[ __currentItem.currentFrame ],
					__currentItem.rect,
					__currentItem.position,
					null,
					null,
					true
				);
			}
			renderFilters();
			__bitmapData.unlock();
		}
		
		private var __pt 	: Point = new Point;
		public function renderFilters () : void
		{
			var i : uint;
			for( i = 0 ; i < __filters.length; i++ )
			{
				__bitmapData.applyFilter( __bitmapData, __bitmapData.rect, __pt, __filters[i] );
			}
		}
	}
}