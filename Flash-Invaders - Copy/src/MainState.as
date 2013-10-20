package
{
	import flash.utils.getTimer;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	
	public class MainState extends FlxState
	{
		[Embed(source="../assets/images/back.png")]
		public static const Back:Class;
		
		private var _hero:Hero;
		private var _heroBullets:FlxGroup;
		private var _numBullets:int;
		private var _enemies:FlxGroup;
		
		public function MainState()
		{
			super();
		}
		
		override public function create():void
		{
			var back:FlxSprite = new FlxSprite(50, 50);
			back.loadGraphic(Back);
			this.add(back);
			
			_hero = new Hero();
			this.add(_hero);
			
			/**
			 * Create a FlxGroup of bullets using the FlxSprite Class.
			 * After the bullet group is created it will be passed into the hero's bullets array.
			 * */
			_heroBullets = new FlxGroup();
			_numBullets = 16;
			
			var bullet:FlxSprite;
			for (var i:uint = 0; i < _numBullets; i++)
			{
				bullet = new FlxSprite(-20, -20);
				bullet.makeGraphic(2, 8, 0xFFFF0000);
				_heroBullets.add(bullet);
			}
			
			_hero.bullets = _heroBullets.members;
			this.add(_heroBullets);
			
			/**
			 * Create a FlxGroup of enemies containing the Enemy Class.
			 * */
			_enemies = new FlxGroup();
			var enemy:Enemy;
			for (i = 0; i < 25; i++)
			{
				enemy = new Enemy(FlxG.random() * FlxG.width - 60, -64);
				_enemies.add(enemy);
			}
			
			this.add(_enemies);
		}
		
		override public function update():void
		{
			if (_enemies.countLiving() == 0)
			{
				FlxG.switchState(new MenuState);
			}
			
			FlxG.overlap(_heroBullets, _enemies, onOverLap);
			
			super.update();
		}
		
		private function onOverLap(s1:FlxSprite, s2:FlxSprite):void
		{
			if (!(s2 as Enemy).isDead)
			{
				(s2 as Enemy).Explode();
			}
		}
	}
}






























