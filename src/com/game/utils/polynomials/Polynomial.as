package com.game.utils.polynomials
{
	import com.game.utils.polynomials.Formula;

	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class Polynomial extends Formula
	{
		public function Polynomial ()
		{
			super ();
		}

		public static function calculate ( t : Number , c : Number , d : Number , b : Number , pow : Number = 1 , easing : String = "" ) : Number
		{
			switch( easing.toLowerCase () )
			{
				case "in" :
					return easeIn ( t , c , d , b , pow );
					break;
				case "out" :
					return easeOut ( t , c , d , b , pow );
					break;
				case "inout" :
					return easeInOut ( t , c , d , b , pow );
					break;
				default:
					t /= d;
					return c * t + b;
			}
		}

		protected static function easeIn ( t : Number , c : Number , d : Number , b : Number , pow : Number = 1 ) : Number
		{
			t /= d;
			return c * Math.pow ( t , pow ) + b;
		}

		protected static function easeOut ( t : Number , c : Number , d : Number , b : Number , pow : Number = 1 ) : Number
		{
			t /= d;
			t --;
			return ( pow % 2 > 0 ? 1 : -1 ) * c * ( Math.pow ( t , pow ) + ( pow % 2 > 0 ? 1 : -1 ) ) + b;
		}

		protected static function easeInOut ( t : Number , c : Number , d : Number , b : Number , pow : Number = 1 ) : Number
		{
			t /= d / 2;
			if ( t < 1 )
				return c / 2 * Math.pow ( t , pow ) + b;
			t -= 2;
			return ( pow % 2 > 0 ? 1 : -1 ) * c / 2 * (Math.pow ( t , pow ) + (( pow % 2 > 0 ? 1 : -1 ) * 2) ) + b;
		}
	}
}
