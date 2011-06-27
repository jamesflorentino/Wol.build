package main
{
	import com.game.Game;
	import com.game.Sheets;
	import com.game.renderer.Renderer;
	import com.game.renderer.RenderItem;
	import flash.display.MovieClip;

	public class AbstractLevel extends Renderer
	{
		
		public function AbstractLevel ( __width : Number = 500 , __height : Number = 300 , __fps : Number = 30 )
		{
			super ( __width , __height , __fps );
			var m : MovieClip = ( new lib_sprite_marine ) as MovieClip;
			var inf : MovieClip = ( new lib_sprite_infiltrator ) as MovieClip;
			var ovr	: MovieClip = ( new lib_sprite_overwatch ) as MovieClip;
			
			Sheets.addSheet( AssetNames.MARINE , m );
			Sheets.addSheet( AssetNames.INFILTRATOR , inf );
			Sheets.addSheet( AssetNames.OVERWATCH , ovr );
			
			
			var renderitem	: RenderItem;
			var i 		: uint;

			for( i = 0; i < 30; i++ )
			{
				
				renderitem = new RenderItem ();
				renderitem.totalFrames = ovr.totalFrames;
				renderitem.width	= Sheets.getSheet( AssetNames.OVERWATCH )[0].width;
				renderitem.height 	= Sheets.getSheet( AssetNames.OVERWATCH)[0].height;
				renderitem.currentFrame = Math.random () * renderitem.totalFrames;
				renderitem.x = Math.random() * Game.WIDTH;
				renderitem.y = Math.random() * ( Game.HEIGHT - renderitem.rect.bottom );
				renderitem.sheet = AssetNames.OVERWATCH;
				addEntity( renderitem );
			}


			for( i = 0; i < 30; i++ )
			{
				
				renderitem = new RenderItem ();
				renderitem.totalFrames = m.totalFrames;
				renderitem.width	= Sheets.getSheet( AssetNames.MARINE )[0].width;
				renderitem.height 	= Sheets.getSheet( AssetNames.MARINE )[0].height;
				renderitem.currentFrame = Math.random () * renderitem.totalFrames; 
				renderitem.x = Math.random() * Game.WIDTH;
				renderitem.y = Math.random() * ( Game.HEIGHT - renderitem.rect.bottom );
				renderitem.sheet = AssetNames.MARINE;
				addEntity( renderitem );
			}
			
			
			
			
			
			for( i = 0; i < 40; i++ )
			{
				
				renderitem = new RenderItem ();
				renderitem.totalFrames = inf.totalFrames;
				renderitem.width	= Sheets.getSheet( AssetNames.INFILTRATOR )[0].width;
				renderitem.height 	= Sheets.getSheet( AssetNames.INFILTRATOR )[0].height;
				renderitem.currentFrame = Math.random () * renderitem.totalFrames; 
				renderitem.x = Math.random() * Game.WIDTH;
				renderitem.y = Math.random() * ( Game.HEIGHT - renderitem.rect.bottom );
				renderitem.sheet = AssetNames.INFILTRATOR;
				addEntity( renderitem );
			}
			
			startRender();
		}
	}
}
