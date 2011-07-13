package main
{
	import main.utils.FrameAnimation;
	import flash.utils.Dictionary;
	import com.game.Game;
	import com.game.utils.polynomials.Polynomial;
	import com.game.renderer.DisplayElement;
	import main.hex.Hex;

	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class AbstractUnit extends DisplayElement
	{
		protected var __startFrame		: Number;
		protected var __isAnimating		: Boolean;
		private var __isWalking			: Boolean;
		private var __currentWalktime	: Number;
				
		private var __walkSpeed			: Number = 1000;
		public function get walkSpeed () : Number { return __walkSpeed / 1000; }
		public function set walkSpeed ( val : Number ) : void { __walkSpeed = 1000 * val; }
		
		
		private var __targetHex			: Hex;
		private var __currentHex		: Hex;
		public function get hex ()		: Hex { return __currentHex; }
		
		protected var __framelabels				: Dictionary;
		protected var __currentFrameAnimation	: FrameAnimation;
		
		public function AbstractUnit ()
		{
			__startFrame	= 0;
			__framelabels	= new Dictionary;
		}
		
		
		
		public function gotoHex ( hex : Hex ) : void
		{
			if (!hex)
				throw new Error('Hex tile not found!');
			if ( !__isWalking )
			{
				__targetHex	= hex;
				if( __currentHex && __currentHex != __targetHex )
				{
					__currentWalktime	= 0;
					__isWalking 	= true;
					onMoveStart();
				}
				else
				{
					__currentHex	= hex;
					this.x 		= __targetHex.centerX;
					this.y 		= __targetHex.centerY;
				}
			}	
		}
		
		protected function onMoveStart () : void
		{
			
		}
		
		
		protected function addFrameAnimation ( animation : FrameAnimation ) : void
		{
			if(animation)
				__framelabels[animation.name] = animation;
		}
		
		protected function getFrameAnimation ( animation_name : String ) : FrameAnimation
		{
			if ( !__framelabels[animation_name] )
				throw new Error(String('`ANIMATION` not found').replace('`ANIMATION`', animation_name));
			return __framelabels[animation_name] as FrameAnimation;
		}
		
		protected function setFrameAnimation ( animation_name : String ) : void
		{
			if(!animation_name)
			{
				__currentFrame	= 0;
				__startFrame	= 0;
				__totalFrames	= 0;
				__isAnimating	= false;
				return;
			}
			
			__currentFrameAnimation	= getFrameAnimation(animation_name);
			__startFrame		= __currentFrameAnimation.start;
			__totalFrames		= __currentFrameAnimation.end;
			__currentFrame		= __startFrame;
			__isAnimating		= true;
		}
		
		public function playAnimation( animation_name : String ) : void
		{
			if(!getFrameAnimation(animation_name))
				throw new Error('Frame label not found!');
			setFrameAnimation(animation_name);
		}
		
		protected function onUpdatePosition () : void
		{
			this.x = Polynomial.calculate(__currentWalktime, __targetHex.centerX - __currentHex.centerX, __walkSpeed, __currentHex.centerX );
			this.y = Polynomial.calculate(__currentWalktime, __targetHex.centerY - __currentHex.centerY, __walkSpeed, __currentHex.centerY );
		}
		
		protected function onMoveEnd () : void
		{
			__isWalking = false;
		}
		
		protected function updatePosition () : void
		{
			onUpdatePosition();
			__currentWalktime += 1000/Game.FPS;
			if(__currentWalktime >= __walkSpeed )
			{
				__currentHex = __targetHex;
				onMoveEnd();
			}
		}


		override public function update () : void
		{
			if( __isWalking )
			{
				updatePosition();
			}
			
			if( __isAnimating )
			{
				__currentFrame++;
				if(__currentFrame  > __totalFrames )
				{
					onAnimationEnd();
					__currentFrame 	= __startFrame;
					__isAnimating	= __currentFrameAnimation.loop;
				}
			}
			
			super.update ();
			
		}
		
		protected function onAnimationEnd () : void
		{
			
		}

	}
}
