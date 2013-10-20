package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.flixel.FlxGame;
	
	[SWF(width="600", height="600", frameRate="60", backgroundColor="#505050")]
	public class Invaders extends FlxGame
	{
		// TODO: find out why pressing P doesnt pause
		public function Invaders()
		{
			super(600, 600, MenuState, 1);
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(event:Event):void
		{
			this.onEnterFrame(event);
		}
	}
}





























