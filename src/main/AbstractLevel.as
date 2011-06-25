package main
{
	import flash.display.MovieClip;
	import com.game.display.Entity;
	import com.game.Sheets;
	import com.game.Engine;

	public class AbstractLevel extends Engine
	{
		public function AbstractLevel ( __width : Number = 500 , __height : Number = 300 , __fps : Number = 30 )
		{
			super ( __width , __height , __fps );
			var m : MovieClip = (new lib_sprite_marine) as MovieClip;
			Sheets.addSheet( AssetNames.MARINE , m );
			
			startRender();
			
			/** test stuff **/
			var entity		: Entity;
			entity = new Entity ();
		}
	}
}
