package com.game
{
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	public class AssetLibrary
	{
		private static var __bitmaps	: Dictionary;
		private static var __clips		: Dictionary;
		private static var __sheets 	: Dictionary;
		private static var __assets		: Dictionary;
		
		public static function init () : void
		{
			__bitmaps		= new Dictionary;
			__clips			= new Dictionary;
			__assets		= new Dictionary;
			__sheets		= new Dictionary;
			
			var __NULLSHEET		: Vector.<BitmapData> = new Vector.<BitmapData>;
			__NULLSHEET.push( new BitmapData( 1, 1 ) );
			
			__sheets [ 'NULL' ] 	=  __NULLSHEET;
			__assets [ 'NULL' ] 	= new BitmapData( 1, 1 );
		}
		
		public static function getBitmapAsset ( name : String ) : Bitmap
		{
			if ( !__bitmaps [ name ] )
			{
				throw new Error( name+ ' does not exist in the `bitmaps` Dictionary inside the Asset Library' );
			}
			
			return __bitmaps [ name ]  as Bitmap;
		}
		
		public static function getClipAsset ( clipname : String ) : MovieClip
		{
			if ( !__clips [ clipname ] )
			{
				throw new Error( clipname + ' does not exist in the `clips` Dictionary inside the Asset Library' );
			}
			
			return __clips [ clipname ] as MovieClip;
		}
		
		public static function getSheet ( sheetname:String ) : Vector.<BitmapData>
		{
			var 	v : Vector.<BitmapData>;
			
			v = __sheets [sheetname] as Vector.<BitmapData>;
			
			if( !v )
			{
				v = __sheets [ 'NULL' ] as Vector.<BitmapData>;
			}
			
			return v;
		}
		
		public static function getAsset ( assetname : String ) : BitmapData
		{
			var bmd		: BitmapData;
			
			bmd	= __assets [assetname];
			
			if( !bmd )
			{
				bmd	= __assets['NULL'];
			}
			
			return bmd;
		}
		
		
		public static function addBitmapAsset ( bmp : Bitmap, name : String ) : void
		{
			if ( !__bitmaps )
			{
				init ();
			}
			
			__bitmaps [ name ] = bmp;
		}
		
		public static function addClipAsset ( clip : MovieClip, name : String ) : void
		{
			if ( !__clips )
			{
				init ();
			}
			
			__clips [ name ]	= clip;
		}
		
		public static function addSheetByClip ( sheetname : String, clip : MovieClip, scale : Number = 1, flip : Boolean = false ) : void
		{
			if( !__sheets )
			{
				init ();
			}
			
			__sheets [ sheetname ] 	= createSheetByCachedClip ( clip, scale, flip );
		}
		
		public static function addStaticSheet ( sheetname : String, __bitmap : Bitmap ) : void
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

		private static function createSheetByCachedClip ( clip : MovieClip, scale : Number, flip : Boolean ) : Vector.<BitmapData>
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
			
			__width		= Math.ceil ( __width * scale );
			__height	= Math.ceil ( __height * scale );
			
			if ( flip ) 
			{
				__matrix.scale(-scale, scale);
				__matrix.translate(__width, 0);
			}
			else
			{
				__matrix.scale(scale, scale);
			}

			for( i = 1 ; i < __frames; i++ )
			{
				clip.gotoAndStop ( i );
				bmd = new BitmapData ( __width , __height , true , 0x00000000 );
				bmd.draw ( clip, __matrix, null, null, null, false );
				__sheet.push( bmd );
			}
			
			bmd	= null;
			
			return __sheet;			

		}
	}
	
}
