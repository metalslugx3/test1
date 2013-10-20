package
{	
	import flash.display.Bitmap;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class MenuState extends FlxState
	{
		[Embed(source="../assets/images/back.png")]
		public static const Back:Class;
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			var back:FlxSprite = new FlxSprite(50, 50);
			back.loadGraphic(Back);
			this.add(back);
			
			var logo:FlxText = new FlxText(FlxG.width * 0.5 - 200, 250, 400, "INVADERS");
			logo.setFormat(null, 40, 0xFFFFFF, "center");
			this.add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width * 0.5 - 200, 320, 400, "PRESS [x] TO START");
			instruct.setFormat(null, 20, 0xff0000, "center");
			this.add(instruct);
		}
		
		override public function update():void
		{
			if (FlxG.keys.X)
			{
				FlxG.switchState(new MainState());
			}
			
			super.update();
		}
	}
}






























