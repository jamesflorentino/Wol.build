package com.game.renderer
{
	import com.game.core.Entity;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class DisplayElement extends Entity
	{
		public function DisplayElement()
		{
			x = 0;
			y = 0;
		}
		/**
		 * sheet name of the entity
		 */
		protected var __sheet	: String;
		public function get sheetname () : String 	{ return __sheet; }
		public function set sheetname ( val:String ) : void		{ __sheet = val; } 
		
		/**
		 * the arbitrary offset value for the entity's center point
		 */
		protected var __offset	: Point = new Point;
		public function set offsetX ( val : Number ) : void
		{
			__offset.x	= val;
			updatePos();
		}
		public function set offsetY ( val : Number ) : void
		{
			__offset.y	= val;
			updatePos();
		}
		
		/**
		 * bounding box of the entity
		 */
		protected var __rect	: Rectangle = new Rectangle ( 0, 0, 1, 1 );
		public function get rect ()	: Rectangle { return __rect; }
		public function get width () : Number { return __rect.right; } 
		public function get height () : Number { return __rect.bottom; } 
		public function set height ( val : Number ) : void { __rect.bottom = val; }
		public function set width ( val : Number ) : void { __rect.right = val; }
		
		/**
		 * 
		 */
		protected var __flipped	: Boolean = false;
		public function get flipped () : Boolean { return __flipped; }
		public function set flipped ( val : Boolean ) : void 
		{ 
			__flipped = val;
		}
		
		protected var __parentPoint		: Point	= new Point;
		
		protected var __point			: Point = new Point; // original referenced position
		protected var __position_normal		: Point = new Point; // calcualted position
		protected var __position_flipped	: Point = new Point; // calcualted position
		
		public function get position () : Point { return flipped ? __position_flipped : __position_normal; }
		public function get x		()	: Number 
		{
			return __point.x + __offset.x + ( __flipped ? - (__offset.x * 2) - width : 0 );
		}
		public function set x	( val : Number ) : void 
		{
			__point.x 		= val;
			updatePos();
		}
		public function get y	() : Number 
		{ 
			return __point.y + __offset.y; 
		}
		public function set y	( val : Number ) : void 
		{ 
			__point.y 		= val;
			updatePos(); 
		}
		
		
		private function updatePos () : void
		{
			__position_normal.x		= __parentPoint.x + __point.x + __offset.x;	
			__position_normal.y		= __parentPoint.y + __point.y + __offset.y;
			__position_flipped.x	= __parentPoint.x + __point.x + __offset.x - width - ( __offset.x * 2 );	
			__position_flipped.y	= __parentPoint.y + __point.y + __offset.y;
			
		}
		
		/**
		 * current bitmapdata to display in the Vector array
		 */
		protected var __currentFrame	: uint = 0;
		public function get currentFrame () : uint { return __currentFrame; }
		public function set currentFrame ( val : uint ) : void { __currentFrame = val ; }
		
		protected var __startFrame		: int = 0;
		
		protected var __totalFrames		: int = 0;
		public function get totalFrames () : int { return __totalFrames; }
		public function set totalFrames ( val : int ) : void { __totalFrames = val; }
		
		/**
		 * total bitmapdata array
		 */
		protected var __endFrame		: int = 0;
		public function get endFrame () : int { return __endFrame; }
		public function set endFrame ( val:int ) : void { __endFrame = val; }
		
		public function updateParentPosition( parentX : Number , parentY : Number ) : void 
		{
			__parentPoint.x		= parentX;
			__parentPoint.y		= parentY;
		}
		
		public function update () : void 
		{
		}
	}
}
