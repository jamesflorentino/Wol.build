package com.game.renderer
{
	import com.game.core.Entity;
	import flash.display.BitmapData;
	/**
	 * @author James Florentino | jamesflorentino.com | j@jamesflorentino.com
	 */
	public class RenderLayer extends Entity
	{
		
		private var __bitmapData			: BitmapData;
		public function get bitmapData () 	: BitmapData { return __bitmapData; }
		
		private var __children				: Vector.<RenderItem>;
		public function get children ()		: Vector.<RenderItem> { return __children; }
		
		public function RenderLayer ( __width:uint, __height:uint )
		{
			__bitmapData 	= new BitmapData ( __width, __height, true, 0x00000000 );
			__children		= new Vector.<RenderItem>();
		}
		
		
		
		public function render() : void
		{	
			
		}
		
		public function addItem () : void
		{
			
		}
	}
}
