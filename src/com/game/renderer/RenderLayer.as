package com.game.renderer
{
	import flash.geom.Point;
	import flash.filters.BitmapFilter;
	import com.game.AssetLibrary;
	import com.game.core.Entity;
	import flash.display.BitmapData;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class RenderLayer extends Entity
	{
		
		private var __bitmapData			: BitmapData;
		public function get bitmapData () 	: BitmapData { return __bitmapData; }
		
		private var __children				: Vector.<DisplayElement>;
		public function get children ()		: Vector.<DisplayElement> { return __children; }
		
		private var __filters				: Vector.<BitmapFilter>;
		public function get filters () 		: Vector.<BitmapFilter> { return __filters; }
		public function set filters ( val : Vector.<BitmapFilter> ) : void { __filters = val; }
		
		private var __position				: Point;
		public function set x ( val : Number ) : void	{ __position.x = val; 	}
		public function set y ( val : Number ) : void	{ __position.y = val; 	}
		public function get x ()			: Number 	{ return __position.x; 	}
		public function get y ()			: Number 	{ return __position.y; 	}
		
		public function get totalItems ()		: Number { return __children.length; }
		
		// arbitrary values
		private var __returnpoint		: Point;
		
		public function RenderLayer ( __width : uint, __height : uint )
		{
			__returnpoint	= new Point;
			__position		= new Point;
			__filters		= new Vector.<BitmapFilter>;
			__bitmapData 	= new BitmapData ( __width, __height, true, 0x00000000 );
			__children		= new Vector.<DisplayElement>();
		}
		
		public function addEntity ( child : DisplayElement ) : Vector.<DisplayElement>
		{
			__children.push( child );
			return __children;
		}
		
		private var __child 	: DisplayElement;
		private var i 			: uint;
		
		public function render() : void
		{
			
			__bitmapData.lock();
			__bitmapData.fillRect ( __bitmapData.rect, 0x00000000 );
			
			for( i = 0 ; i < __children.length; i++ )
			{
				__child	= __children [ i ];
				__child.update();
				
				__bitmapData.copyPixels 
				( 
					AssetLibrary.getSheetByIndex(__child.sheetname, __child.currentFrame),
					__child.rect,
					getPosition(__child.position),
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
		
		public function getPosition ( childPoint : Point ) : Point
		{
			__returnpoint.x		= __position.x + childPoint.x;
			__returnpoint.y		= __position.y + childPoint.y;
			return __returnpoint;
		}
	}
}
