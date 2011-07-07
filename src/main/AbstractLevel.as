package main
{
	import main.hex.Hex;
	import flash.filters.ColorMatrixFilter;
	import flash.display.Bitmap;
	import com.game.renderer.RenderLayer;
	import com.game.Game;
	import com.game.AssetLibrary;
	import com.game.renderer.Renderer;
	import com.game.renderer.DisplayElement;
	import flash.display.MovieClip;

	public class AbstractLevel extends Renderer
	{
		
		// temporary shit
		[Embed(source="../../libs/bg.png")]
		private var lib_bmp_bg : Class;
		
		[Embed(source="../../libs/hex_base.png")]
		private var lib_bmp_hexbase	: Class;
		
		public function AbstractLevel ( __width : Number = 500 , __height : Number = 300 , __fps : Number = 30 )
		{
			super ( __width , __height , __fps );
			
			addLayer('background');
			addLayer('grid');
			addLayer('units');
			
			setAssets();
			
			generateBackground();
			generateGrid(8, 5);
			generateTestUnits(); 
			
			startRender();
		}
		
		public function setAssets () : void
		{			
			
			// clips
			AssetLibrary.addClipAsset ( new lib_sprite_marine as MovieClip, AssetNames.MARINE );
			AssetLibrary.addClipAsset ( new lib_sprite_overwatch as MovieClip, AssetNames.OVERWATCH );
			AssetLibrary.addClipAsset ( new lib_sprite_infiltrator, AssetNames.INFILTRATOR );
			AssetLibrary.addBitmapAsset ( new lib_bmp_bg as Bitmap, AssetNames.BACKGROUND ); 
			AssetLibrary.addBitmapAsset ( new lib_bmp_hexbase as Bitmap, AssetNames.HEX_BASE ); 
			
			// sheets
			AssetLibrary.addSheetByClip ( AssetNames.MARINE , AssetLibrary.getClipAsset( AssetNames.MARINE ), .35 );
			AssetLibrary.addSheetByClip ( AssetNames.INFILTRATOR , AssetLibrary.getClipAsset( AssetNames.INFILTRATOR ), .35 );
			AssetLibrary.addSheetByClip ( AssetNames.OVERWATCH , AssetLibrary.getClipAsset( AssetNames.OVERWATCH ), .35 );
			
			// static
			AssetLibrary.addStaticSheet ( AssetNames.BACKGROUND , AssetLibrary.getBitmapAsset( AssetNames.BACKGROUND ) );
			AssetLibrary.addStaticSheet ( AssetNames.HEX_BASE, AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ) );
			
			//
			
			var matrix : Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0.1, 1, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 1, 0.1, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
            
			getLayer('units').filters.push( new ColorMatrixFilter(matrix));
		}

		public function generateGrid ( columns : int, rows : int ) : void
		{
			var hex		: Hex;
			var y 		: uint;
			var x		: uint; 
			var layer	: RenderLayer;
			
			layer		= getLayer('grid') as RenderLayer;
			
			trace('layer');
			for( y = 0 ; y < rows; y++ )
			{
				for( x = 0 ; x < columns; x++ )
				{
					hex			= new Hex;
					hex.sheet	= AssetNames.HEX_BASE;
					hex.width	= AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ).width;
					hex.height	= AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ).height;
					hex.cellX	= x;
					hex.cellY	= y;
					layer.addEntity ( hex );
					Control.grid[ hex.name ] = hex;
				}
			}
			
		}
		
		private function generateBackground () : void
		{
			addItem ( 'background' , AssetNames.BACKGROUND );
		}
		
		public function generateTestUnits () : void
		{
			var i 		: uint;
			var item	: DisplayElement;
			
			for( i = 0; i < 40; i++ )
			{
				item = addItem ( 'units', AssetNames.OVERWATCH  );
				item.x = Math.random() * Game.WIDTH * .7;
				item.y = 10 + (Math.random() * 500);
				item.currentFrame = Math.round(Math.random() * item.totalFrames);
			}
			
			for( i = 0; i < 30; i++ )
			{
				item = addItem ( 'units', AssetNames.INFILTRATOR );
				item.x = 100 + (Math.random() * Game.WIDTH * .7 );
				item.y = 101 + (Math.random() * 500);
				item.currentFrame = Math.round(Math.random() * item.totalFrames);
			}
			
			for( i = 0; i < 30; i++ )
			{
				item = addItem ( 'units', AssetNames.MARINE );
				item.x = 10 + (Math.random() * Game.WIDTH * .7 );
				item.y = 100 + (Math.random() * 500);
				item.currentFrame = Math.round(Math.random() * item.totalFrames);
			}
		}

		public function addItem ( layername : String, sheetname : String ) : DisplayElement
		{
			
			var item			: DisplayElement;
			item 				= new DisplayElement ();
			item.width			= AssetLibrary.getSheet( sheetname )[0].width;
			item.height 		= AssetLibrary.getSheet( sheetname )[0].height;
			item.totalFrames	= AssetLibrary.getSheet( sheetname ).length;
			item.sheet 			= sheetname;
			
			getLayer( layername ).addEntity( item );
			return item;
		}
	}
}
