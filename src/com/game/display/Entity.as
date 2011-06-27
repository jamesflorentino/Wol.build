package com.game.display
{
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class Entity
	{
		
		protected var __name 	: String;
		public function get name () : String { return __name; }
		
		
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
		protected var __rect	: Rectangle = new Rectangle ( 0, 0, 250, 250 );
		public function get rect ()	: Rectangle { return __rect; }
		
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
		protected var __currentFrame	: int = 0;
		public function get currentFrame () : int { return __currentFrame; }
		
		/**
		 * total bitmapdata array
		 */
		protected var __totalFrames		: int;
		public function get totalFrames () : int { return __totalFrames; }
		public function set totalFrames ( val:int ) : void { __totalFrames = val; }
		
		public function update() : void { __currentFrame++; if ( __currentFrame == __totalFrames ) __currentFrame = 0; }
		
	}
}
