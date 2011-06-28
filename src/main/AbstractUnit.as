package main
{
	import com.game.system.stats.StatNames;
	import com.game.system.stats.Stat;
	import com.game.system.stats.Stats;
	import com.game.renderer.Spritesheet;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class AbstractUnit extends Spritesheet
	{
		
		private var stats		: Stats;
		
		public function AbstractUnit ()
		{
			stats = new Stats();
			stats.addStat( new Stat( StatNames.HEALTH, 0, 100) );
		}
	}
}
