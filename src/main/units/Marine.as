package main.units
{
	import com.game.AssetLibrary;
	import main.AssetNames;
	import main.AbstractUnit;

	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Marine extends AbstractUnit
	{
		public function Marine ()
		{
			this.sheetname		= AssetNames.MARINE;
			this.offsetX 		= -30;
			this.offsetY		= -80;
			this.width			= AssetLibrary.getSheet( this.sheetname )[0].width;
			this.height			= AssetLibrary.getSheet( this.sheetname )[0].height;
			this.totalFrames	= AssetLibrary.getSheet( this.sheetname ).length;
		}
	}
}
