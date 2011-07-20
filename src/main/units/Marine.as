package main.units
{
	import main.utils.FrameAnimation;
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
			this.walkSpeed		= .51;
			this.sheetname		= AssetNames.MARINE;
			this.offsetX 		= -30;
			this.offsetY		= -80;
			this.width			= AssetLibrary.getSheet( this.sheetname )[0].width;
			this.height			= AssetLibrary.getSheet( this.sheetname )[0].height;
			this.totalFrames	= AssetLibrary.getSheet( this.sheetname ).length;
			
			addFrameAnimation( new FrameAnimation( 'onMoveStart', 1, 5 ) );
			addFrameAnimation( new FrameAnimation( 'onMove', 6, 18, true ) );
			addFrameAnimation( new FrameAnimation( 'onMoveEnd', 19, 25 ) );
			addFrameAnimation( new FrameAnimation( 'onAttackStart', 26, 54, true ) );
			addFrameAnimation( new FrameAnimation( 'onGrenadeStart', 55, 87 ) );
		}
		
		override protected function onMoveStart () : void
		{
			super.onMoveStart ();
			setFrameAnimation('onMoveStart');
		}
		
		override protected function onMoveEnd () : void
		{
			super.onMoveEnd ();
			setFrameAnimation('onMoveEnd');
		}
		

		override protected function onAnimationEnd () : void
		{
			super.onAnimationEnd ();
			switch( __currentFrameAnimation.name )
			{
				case 'onMoveStart' :
					
					setFrameAnimation('onMove');
					
					break;
					
				case 'onMoveEnd'	:
					
					setFrameAnimation( null );
					
					break;
				
					
				default:
					
				if ( !__currentFrameAnimation.loop )
					setFrameAnimation( null );
			}
		}
	}
}
