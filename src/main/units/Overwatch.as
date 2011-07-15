package main.units
{
	import main.utils.FrameAnimation;
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
			this.offsetY		= -95;
			this.width			= AssetLibrary.getSheet( this.sheetname )[0].width;
			this.height			= AssetLibrary.getSheet( this.sheetname )[0].height;
			this.totalFrames	= AssetLibrary.getSheet( this.sheetname ).length;
			this.endFrame		= 0;
			
			addFrameAnimation( new FrameAnimation( 'onMoveStart', 0, 100, true ) );
			setFrameAnimation('onMoveStart');
		}
		
		
	}
}
