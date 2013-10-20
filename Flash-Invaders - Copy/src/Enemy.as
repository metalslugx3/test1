package
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	
	public class Enemy extends FlxSprite
	{
		[Embed(source="../assets/images/enemy.png")]
		public static const EnemyPNG:Class;
		
		[Embed(source="../assets/audio/blow.mp3")]
		public static const BlowMP3:Class;
		
		public var isDead:Boolean;
		
		public function Enemy(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			trace("Enemy constructor.");
			X = X;
			Y = Y;
			
			super(X, Y, null);
			
			this.loadGraphic(EnemyPNG, true, false, 57, 64);
			
			this.addAnimation("explode", [1, 2, 3, 4, 5], 15, false);
			this.addAnimationCallback(onAnimate);
			
			velocity.y = FlxG.random() * 100 + 40;
			
			isDead = false;
		}
		
		public function Explode():void
		{
			isDead = true;
			FlxG.play(BlowMP3);
			this.play("explode");
		}
		
		public override function update():void
		{
			if (this.y > FlxG.height)
			{
				this.y = 0 - this.height;
				this.x = FlxG.random() * FlxG.width - this.width;
			}
			
			super.update();
		}
		
		private function onAnimate(name:String, frame:uint, index:uint):void
		{
			//trace("frame: " + frame);
			//trace("index: " + index);
			if (index == 5)
			{
				this.kill(); 	
			}
		}
	}
}































