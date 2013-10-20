package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Hero extends FlxSprite
	{
		[Embed(source="../assets/images/hero.png")]
		public static const HeroPNG:Class;
		
		[Embed(source="../assets/audio/shoot.mp3")]
		public static const ShootMP3:Class;
		
		private var _bullets:Array;
		private var _bulletIndex:int = 0;
		
		public function Hero(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			X = FlxG.width * 0.5;
			Y = FlxG.height - 100;
			SimpleGraphic = HeroPNG;
			
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void
		{
			velocity.x = 0;
			
			if (FlxG.keys.LEFT)
			{
				velocity.x -= 250;
			}
			
			if (FlxG.keys.RIGHT)
			{
				velocity.x += 250;
			}
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.play(ShootMP3);
				
				var bullet:FlxSprite = bullets[_bulletIndex];
				bullet.reset(this.x + this.width * 0.5 - bullet.width, this.y);
				bullet.velocity.y = -400;
				_bulletIndex++;
				if (_bulletIndex >= bullets.length)
				{
					_bulletIndex = 0;
				}
			}
			
			super.update();
		}

		public function get bullets():Array
		{
			return _bullets;
		}

		public function set bullets(value:Array):void
		{
			_bullets = value;
		}

	}
}






























