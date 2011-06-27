package main
{
	import flash.filters.ColorMatrixFilter;
	import flash.display.Bitmap;
	import com.game.renderer.RenderLayer;
	import flash.utils.Dictionary;
	import com.game.Game;
	import com.game.Sheets;
	import com.game.renderer.Renderer;
	import com.game.renderer.Spritesheet;
	import flash.display.MovieClip;

	public class AbstractLevel extends Renderer
	{
		// temporary shit
		[Embed(source="../../libs/bg.png")]
		private var background : Class;
		
		private var layers	: Dictionary	= new Dictionary;
		public function AbstractLevel ( __width : Number = 500 , __height : Number = 300 , __fps : Number = 30 )
		{
			super ( __width , __height , __fps );
			
			addNewLayer('background');
			addNewLayer('units');
			
			var mar : MovieClip = ( new lib_sprite_marine ) as MovieClip;
			var inf : MovieClip = ( new lib_sprite_infiltrator ) as MovieClip;
			var ovr	: MovieClip = ( new lib_sprite_overwatch ) as MovieClip;
			
			Sheets.addSheetByCachedClip ( AssetNames.MARINE , mar, .6 );
			Sheets.addSheetByCachedClip ( AssetNames.INFILTRATOR , inf, .6 );
			Sheets.addSheetByCachedClip ( AssetNames.OVERWATCH , ovr, .6 );
			Sheets.addSheetByBitmap ( AssetNames.HEX , new background as Bitmap );
			
			/**/
			addItemByBitmap ( 'background' , AssetNames.HEX );
			//getLayer ( 'units' ).filters.push ( new BlurFilter );
			var matrix : Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0.1, 1, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 1, 0.1, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			getLayer('units').filters.push( new ColorMatrixFilter(matrix));
			/**/
			var i 		: uint;
			var item	: Spritesheet;
			
			for( i = 0; i < 40; i++ )
			{
				item = addUnitBySheet ( 'units',  ovr, AssetNames.OVERWATCH  );
				item.x = Math.random() * Game.WIDTH * .7;
				item.y = 10 + (Math.random() * 500);
			}
			
			for( i = 0; i < 30; i++ )
			{
				item = addUnitBySheet ( 'units',  inf, AssetNames.INFILTRATOR );
				item.x = 100 + (Math.random() * Game.WIDTH * .7 );
				item.y = 101 + (Math.random() * 500);
			}
			
			for( i = 0; i < 30; i++ )
			{
				item = addUnitBySheet ( 'units',  mar, AssetNames.MARINE );
				item.x = 10 + (Math.random() * Game.WIDTH * .7 );
				item.y = 100 + (Math.random() * 500);
			}
			

			startRender();
		}
		
		public function getLayer ( layername : String ) : RenderLayer
		{
			if( !layers[layername] )
				throw new Error('Layer `' + layername + '` not found.');
			
			return layers[layername] as RenderLayer;
		}
		
		public function addNewLayer ( layername :String ) : void
		{
			layers[ layername ] = addLayer( layername );
		}
		
		/**
		 * if the source animation is a movieclip
		 */		
		public function addUnitBySheet ( layername : String, clipsrc : MovieClip, sheetname : String ) : Spritesheet
		{
			
			if( !layers[layername] )
				throw  new Error( 'Layer `' + layername  +  '` not found' );
			
			var item			: Spritesheet;
			item 				= new Spritesheet ();
			item.totalFrames 	= clipsrc.totalFrames;
			item.width			= Sheets.getSheet( sheetname )[0].width;
			item.height 		= Sheets.getSheet( sheetname )[0].height;
			item.currentFrame	= Math.random () * item.totalFrames;
			item.x 				= Math.random() * (Game.WIDTH - item.width);
			item.y 				= Math.random() * ( Game.HEIGHT - item.height );
			item.sheet 			= sheetname;
			( layers[layername] as RenderLayer ).addSheet( item );
			return item;
		}
		
		
		/**
		 * if the source is a static bitmap
		 */
		public function addItemByBitmap ( layername : String, sheetname : String ) : void
		{
			
			if( !layers[layername] )
				throw  new Error( 'Layer `' + layername  +  '` not found' );
			
			var item			: Spritesheet;
			item 				= new Spritesheet ();
			item.totalFrames 	= 0;
			item.width			= Sheets.getSheet( sheetname )[0].width;
			item.height 		= Sheets.getSheet( sheetname )[0].height;
			item.currentFrame	= 0;
			item.x 				= Math.random() * (Game.WIDTH - item.width);
			item.y 				= Math.random() * ( Game.HEIGHT - item.height );
			item.sheet 			= sheetname;
			( layers[layername] as RenderLayer ).addSheet( item );
		}
	}
}
