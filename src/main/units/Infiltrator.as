package main.units 
{
	import com.game.AssetLibrary;
	import main.AbstractUnit;
	import main.AssetNames;
	
	/**
	 * ...
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Infiltrator extends AbstractUnit 
	{
		
		public function Infiltrator() 
		{
			this.sheetname		= AssetNames.INFILTRATOR;
			this.offsetX 		= -30;
			this.offsetY		= -80;
			this.width			= AssetLibrary.getSheet( this.sheetname )[0].width;
			this.height			= AssetLibrary.getSheet( this.sheetname )[0].height;
			this.totalFrames	= AssetLibrary.getSheet( this.sheetname ).length;
		}
		
	}

}