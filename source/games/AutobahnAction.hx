package games;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class AutobahnAction extends FlxState {
	var playerVehicle: PlayerVehicle;
	var bg: FlxSprite;

	override public function create() {
		super.create();
	
		this.bgColor = 0xFF90b35b;

		trace(this.bgColor);

		bg = new Roads();
		bg.x -= bg.width/4;
		bg.y -= bg.height-185;
		bg.maxVelocity.x = bg.maxVelocity.y = 30;

		playerVehicle = new PlayerVehicle();
		
		playerVehicle.x = Std.int((64 - 11)/2);
		playerVehicle.y = Std.int((64 - 11)/2) + 5;
	
		add(bg);
		add(playerVehicle);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		bg.acceleration.x -= Math.sin(playerVehicle.angle * Math.PI / 180) * playerVehicle.speed * elapsed;
		bg.acceleration.y += Math.cos(playerVehicle.angle * Math.PI / 180) * playerVehicle.speed * elapsed;

		if (FlxG.keys.pressed.A) {
			bg.acceleration.x = 0;
			bg.acceleration.y = 0;
			playerVehicle.angle -= playerVehicle.speed * elapsed;
		} else if (FlxG.keys.pressed.D) {
			bg.acceleration.x = 0;
			bg.acceleration.y = 0;	
			playerVehicle.angle += playerVehicle.speed * elapsed;	
		}
		// Collisions
		FlxG.overlap(playerVehicle, bg, function(vehicle:FlxObject, bg:FlxObject) {
			trace("boop");
		});
	}
}
