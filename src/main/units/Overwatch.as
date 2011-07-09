package main.units
{
	import com.game.AssetLibrary;
	import main.AssetNames;
	import main.AbstractUnit;

	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Overwatch extends AbstractUnit
	{
		public function Overwatch()
		{
			this.sheetname		= AssetNames.OVERWATCH;
			this.offsetX 		= -65;
			this.offsetY		= -78;
			this.width			= AssetLibrary.getSheet( this.sheetname )[0].width;
			this.height			= AssetLibrary.getSheet( this.sheetname )[0].height;
			this.totalFrames	= AssetLibrary.getSheet( this.sheetname ).length;
			this.totalFrames	= 1;
		}
	}
}
