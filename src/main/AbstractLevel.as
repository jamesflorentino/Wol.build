package main
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import main.utils.GetUnitType;
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
			addEventListener(Event.ADDED_TO_STAGE, addedToStage );
		}

		private function addedToStage ( event : Event ) : void
		{
			Game.STAGE	= stage;
			Game.STAGE.addEventListener(MouseEvent.CLICK, test );
			
			addLayer ( 'background' );
			addLayer ( 'grid' );
			addLayer ( 'units' );
			
			setAssets ();
			
			generateBackground ();
			generateGrid ( 8, 11 );
			//generateTestUnits (); 
			generateTestUnit();
			
			startRender ();
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage );
		}

		private function test ( event : MouseEvent ) : void
		{
			TEMPUNIT.moveToHex(Controller.getHexgrid(TEMPUNIT.hex.cellX, TEMPUNIT.hex.cellY + 1));
		}
		
		public function setAssets () : void
		{			
			
			// clips
			AssetLibrary.addClipAsset ( new lib_sprite_marine as MovieClip, AssetNames.MARINE );
			AssetLibrary.addSheetByClip ( AssetNames.MARINE , AssetLibrary.getClipAsset( AssetNames.MARINE ), .5, true );
			
			
			AssetLibrary.addBitmapAsset ( new lib_bmp_bg as Bitmap, AssetNames.BACKGROUND );
			AssetLibrary.addStaticSheet ( AssetNames.BACKGROUND , AssetLibrary.getBitmapAsset( AssetNames.BACKGROUND ) );
			
			 
			AssetLibrary.addBitmapAsset ( new lib_bmp_hexbase as Bitmap, AssetNames.HEX_BASE ); 
			AssetLibrary.addStaticSheet ( AssetNames.HEX_BASE, AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ) );
			// static
			
			
			
			//
			
			var matrix : Array = [];
			matrix = matrix.concat ( [ 1, 		0, 		0, 		0, 		0 ] ); // red
            matrix = matrix.concat ( [ 0.1, 	1, 		0, 		0, 		0 ] ); // green
            matrix = matrix.concat ( [ 0, 		0, 		1, 		0.1, 	0 ] ); // blue
            matrix = matrix.concat ( [ 0, 		0, 		0, 		1, 		0 ] ); // alpha
            
			getLayer ( 'units' ).filters.push ( new ColorMatrixFilter( matrix ) );
		}

		public function generateGrid ( columns : int, rows : int ) : void
		{
			var hex		: Hex;
			var y 		: uint;
			var x		: uint; 
			var layer	: RenderLayer;
			
			layer		= getLayer('grid') as RenderLayer;
			
			for( y = 0 ; y < rows; y++ )
			{
				for( x = 0 ; x < columns; x++ )
				{
					hex			= new Hex;
					hex.sheetname	= AssetNames.HEX_BASE;
					hex.width	= AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ).width;
					hex.height	= AssetLibrary.getBitmapAsset( AssetNames.HEX_BASE ).height;
					hex.cellX	= x;
					hex.cellY	= y;
					layer.addEntity ( hex );
					Controller.grid[ hex.name ] = hex;
				}
			}
			
		}
		
		private function generateBackground () : void
		{
			var item		: DisplayElement;
			item			= addItem ( 'background' , AssetNames.BACKGROUND );
		}
		
		public static var TEMPUNIT : AbstractUnit;
		
		private function generateTestUnit () : void
		{
			
			var unit		: AbstractUnit;
			/**
			unit			= GetUnitType.name ( AssetNames.OVERWATCH );
			//unit.x			= Controller.getHexgrid( 3,1 ).centerX;
			//unit.y			= Controller.getHexgrid( 3,1 ).centerY;
			unit.gotoHex(Controller.getHexgrid( 3,1 ));
			getLayer( 'units' ).addEntity( unit );
			/**/
			
			/**/
			unit			= GetUnitType.name ( AssetNames.MARINE );
			unit.moveToHex(Controller.getHexgrid( 2, 2 ));
			unit.flipped = true;
			getLayer( 'units' ).addEntity( unit );
			AbstractLevel.TEMPUNIT = unit;
			/**
			
			unit			= GetUnitType.name ( AssetNames.MARINE );
			unit.gotoHex(Controller.getHexgrid( 2, 0 ));
			unit.flipped = true;
			getLayer( 'units' ).addEntity( unit );
			AbstractLevel.TEMPUNIT = unit;
			/**/
			
		}
		
		public function generateTestUnits () : void
		{
			var i 		: uint;
			var unit	: AbstractUnit;
			
			for( i = 0; i < 40; i++ )
			{
				unit = GetUnitType.name ( AssetNames.OVERWATCH );
				unit.x = Math.random() * Game.WIDTH * .7;
				unit.y = 10 + (Math.random() * 500);
				unit.flipped = true;
				unit.currentFrame = Math.round(Math.random() * unit.totalFrames);
				getLayer( 'units' ).addEntity( unit );
			}
			
			for( i = 0; i < 30; i++ )
			{
				unit = GetUnitType.name( AssetNames.INFILTRATOR );
				unit.x = 100 + (Math.random() * Game.WIDTH * .7 );
				unit.y = 101 + (Math.random() * 500);
				unit.flipped = true;
				unit.currentFrame = Math.round(Math.random() * unit.totalFrames);
				getLayer( 'units' ).addEntity( unit );
			}
		}

		public function addItem ( layername : String, sheetname : String ) : DisplayElement
		{
			
			var item			: DisplayElement;
			item 				= new DisplayElement ();
			item.width			= AssetLibrary.getSheet( sheetname )[0].width;
			item.height 		= AssetLibrary.getSheet( sheetname )[0].height;
			item.totalFrames	= AssetLibrary.getSheet( sheetname ).length;
			item.sheetname 			= sheetname;
			
			getLayer( layername ).addEntity( item );
			return item;
		}
	}
}
