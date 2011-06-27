package com.game
{
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	public class Sheets
	{
		private static var __sheets : Dictionary;
		
		public static function init () : void
		{
			__sheets	= new Dictionary;
			
			// create an empty null bitmapdata object
			var __NULLSHEET		: Vector.<BitmapData> = new Vector.<BitmapData>;
			__NULLSHEET.push( new BitmapData( 1, 1 ) );
			__sheets [ 'NULL' ] =  __NULLSHEET;
		}
		
		public static function getSheet( sheetname:String ) : Vector.<BitmapData>
		{
			var 	v : Vector.<BitmapData>;
			
			v = __sheets [sheetname] as Vector.<BitmapData>;
			
			if( !v )
			{
				v = __sheets [ 'NULL' ] as Vector.<BitmapData>;
			}
			
			return v;
		}
		
		public static function addSheet ( sheetname : String, clip : MovieClip ) : void
		{
			if( !__sheets )
			{
				init ();
			}
			
			__sheets [ sheetname ] 	= createSheet ( clip );
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
