package com.game.renderer
{
	import com.game.core.Entity;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class Spritesheet extends Entity
	{
		/**
		 * sheet name of the entity
		 */
		protected var __sheet	: String;
		public function get sheet () : String 	{ return __sheet; }
		public function set sheet ( val:String ) : void		{ __sheet = val; } 
		
		/**
		 * the arbitrary offset value for the entity's center point
		 */
		protected var __offset	: Point = new Point;
		public function get offset () : Point { return __offset; }
		
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
		 * x,y pos
		 */
		protected var __position		: Point = new Point;
		public function get position () : Point { return __position; }
		public function get x	()	: Number { return __position.x; }
		public function set x	( val : Number ) : void { __position.x = val; }
		public function get y	()	: Number { return __position.y; }
		public function set y	( val : Number ) : void { __position.y = val; }
		
		/**
		 * current bitmapdata to display in the Vector array
		 */
		protected var __currentFrame	: uint = 0;
		public function get currentFrame () : uint { return __currentFrame; }
		public function set currentFrame ( val : uint ) : void { __currentFrame = val ; }
		
		/**
		 * total bitmapdata array
		 */
		protected var __totalFrames		: int;
		public function get totalFrames () : int { return __totalFrames; }
		public function set totalFrames ( val:int ) : void { __totalFrames = val; }
		
		public function update() : void { __currentFrame++; if ( __currentFrame >= __totalFrames ) __currentFrame = 0; }
		
	}
}
