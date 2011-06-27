package com.game
{
	import flash.geom.Matrix;
	import flash.display.Bitmap;
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
		
		public static function addSheetByCachedClip ( sheetname : String, clip : MovieClip, scale : Number = 1 ) : void
		{
			if( !__sheets )
			{
				init ();
			}
			
			__sheets [ sheetname ] 	= createSheetByCachedClip ( clip, scale );
		}
		
		public static function addSheetByBitmap ( sheetname : String, __bitmap : Bitmap ) : void
		{
			if( !__sheets )
			{
				init ();
			}
			
			__sheets [ sheetname ] 	= createSheetByBitmap ( __bitmap );
		}
		
		private static function createSheetByBitmap ( __bitmap : Bitmap ) : Vector.<BitmapData>
		{
			var __sheet		: Vector.<BitmapData>;
			var __bmd		: BitmapData;
		
			__sheet			= new Vector.<BitmapData>;
			__bmd			= new BitmapData( __bitmap.width, __bitmap.height, true, 0x00000000 );
			__bmd.draw ( __bitmap );
			__sheet.push ( __bmd );
			
			return __sheet;
			
		}

		private static function createSheetByCachedClip ( clip : MovieClip, scale : Number ) : Vector.<BitmapData>
		{
			var __sheet		: Vector.<BitmapData>;
			var i			: uint;
			var bmd			: BitmapData;
			var __height	: Number;
			var __width		: Number;
			var __frames	: Number;
			var __matrix 	: Matrix;
			
			__sheet		= new Vector.<BitmapData>;
			__height	= clip.height;
			__width		= clip.width;
			__frames	= clip.totalFrames + 1;
			__matrix	= new Matrix;
			
			__matrix.scale(scale, scale);
			
			__width		= Math.ceil ( __width * scale );
			__height	= Math.ceil ( __height * scale );

			for( i = 1 ; i < __frames; i++ )
			{
				clip.gotoAndStop ( i );
				bmd = new BitmapData ( __width , __height , true , 0x00000000 );
				bmd.draw ( clip, __matrix, null, null, null, true );
				__sheet.push( bmd );
			}
			
			bmd	= null;
			
			return __sheet;			

		}
	}
	
}
