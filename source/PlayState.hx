package;

import games.AutobahnAction;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {
	override public function create() {
		super.create();
		FlxG.switchState(new AutobahnAction());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
