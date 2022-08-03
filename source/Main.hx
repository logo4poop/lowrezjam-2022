package;

import openfl.display.Sprite;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.FlxAssets.FlxShader;
import flixel.system.scaleModes.PixelPerfectScaleMode;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(64, 64, PlayState));
		
		FlxG.game.stage.quality = StageQuality.LOW;
		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.camera.pixelPerfectRender = true; 
		FlxG.game.setFilters([new ShaderFilter(new FlxShader())]);

		FlxG.autoPause = false;
		FlxG.mouse.useSystemCursor = true;
	}
}
