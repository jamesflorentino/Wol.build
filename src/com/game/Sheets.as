package com.game
{
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	public class Sheets
	{
		public static var sheets : Dictionary;
		public static function init () : void
		{
			sheets	= new Dictionary;
		}
		
		public static function addSheet ( sheetname : String, clip : MovieClip ) : void
		{
			if( ! sheets )
			{
				sheets	= new Dictionary;
			}
			
			sheets [ sheetname ] 	= createSheet ( clip );
		}

		private static function createSheet ( clip : MovieClip ) : Vector.<BitmapData>
		{
			var __sheet		: Vector.<BitmapData>;
			var i			: uint;
			var bmd			: BitmapData;
			var __height	: Number;
			var __width		: Number;
			var __frames	: Number;

			__sheet		= new Vector.<BitmapData>;
			__height	= clip.height;
			__width		= clip.width;
			__frames	= clip.totalFrames + 1;

			for( i = 1 ; i < __frames; i++ )
			{
				clip.gotoAndStop ( i );
				bmd	= new BitmapData ( __width, __height, true, 0x00000000 );
				bmd.draw ( clip );
				__sheet.push( bmd );
			}
			
			bmd	= null;
			
			return __sheet;			

		}
	}
	
}
