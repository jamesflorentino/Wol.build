package com.game.system.stats
{
	import flash.utils.Dictionary;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Stats
	{
		public var __stats		: Dictionary;
		public var __traits		: Dictionary;
		
		public function Stats ()
		{
			__stats		= new Dictionary;
			__traits	= new Dictionary;
		}
		
		public function addStat ( stat : Stat ) : void
		{
			__stats [ stat.name ]	= stat;
		}
		
		public function getStat ( name :String ) : Stat
		{
			return __stats [ name ] ? __stats [ name ] : Stat.NULL ;
		}
	}
}
