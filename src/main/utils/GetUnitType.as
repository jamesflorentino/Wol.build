package main.utils
{
	import main.units.Marine;
	import main.units.Overwatch;
	import main.AssetNames;
	import main.AbstractUnit;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class GetUnitType
	{
		public static function name ( __name : String ) : AbstractUnit
		{
			switch( __name )
			{
				
				case AssetNames.OVERWATCH :
					return new Overwatch;
					break;
				
				case AssetNames.MARINE :
					return new Marine;
					break;
					
				case AssetNames.INFILTRATOR :
					return new Marine;
					break;
					
				default:
					throw new Error( String('no unit type `{name}`found').replace('{name}', __name ) );
			}
		}
	}
}
