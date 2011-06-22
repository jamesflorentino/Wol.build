package main
{
	import com.game.display.Entity;
	import com.game.Sheets;
	import com.game.Engine;

	public class AbstractLevel extends Engine
	{
		public function AbstractLevel ( __width : Number = 500 , __height : Number = 300 , __fps : Number = 30 )
		{
			super ( __width , __height , __fps );
			
			Sheets.addSheet( AssetNames.MARINE , new lib_sprite_marine );
			
			startRender();
			
			/** test stuff **/
			var entity 		: Entity;
			entity			= new Entity ();
			entity.position.y = 100;
			addEntity ( entity );
		}
	}
}
