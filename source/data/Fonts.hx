package data;

import flixel.graphics.frames.FlxBitmapFont;
import openfl.utils.Assets;

class Fonts {
	static var m5x7: FlxBitmapFont; // https://managore.itch.io/m5x7

	public static function getM5X7(): FlxBitmapFont {
		if (m5x7 == null) {
			m5x7 = FlxBitmapFont.fromAngelCode("assets/fonts/m5x7_0.png", "assets/fonts/m5x7.fnt");
		}
		return m5x7;
	}
}
