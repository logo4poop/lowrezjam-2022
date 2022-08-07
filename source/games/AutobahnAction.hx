package games;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class AutobahnAction extends FlxState {
	var background: FlxSpriteGroup;
	var playerVehicle: PlayerVehicle;
	var roads: FlxSprite;
	var testObstacle: FlxSprite;

	override public function create() {
		super.create();
	
		this.bgColor = 0xFF90b35b;

		start();

		background.add(roads);
		background.add(testObstacle);
		add(background);
		add(playerVehicle);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		background.acceleration.x -= Math.sin(playerVehicle.angle * Math.PI / 180) * playerVehicle.speed * elapsed;
		background.acceleration.y += Math.cos(playerVehicle.angle * Math.PI / 180) * playerVehicle.speed * elapsed;

		if (FlxG.keys.pressed.A) {
			background.acceleration.x = 0;
			background.acceleration.y = 0;
			playerVehicle.angle -= playerVehicle.speed * elapsed;
		} else if (FlxG.keys.pressed.D) {
			background.acceleration.x = 0;
			background.acceleration.y = 0;	
			playerVehicle.angle += playerVehicle.speed * elapsed;	
		}
		// Collisions
		var dead: Bool = false;
		FlxG.overlap(playerVehicle, testObstacle, function(vehicle:FlxObject, roads:FlxObject) {
			playerVehicle.acceleration.y = 20;
			dead = true;
		});

		if (dead && Std.int(playerVehicle.y) == 70) {
			start();
			trace("rip");
		}
	}

	public function start() {
		background = new FlxSpriteGroup();
		
		roads = new Roads();
		roads.x -= roads.width/4;
		roads.y -= roads.height-185;
		
		background.maxVelocity.x = background.maxVelocity.y = 30;

		playerVehicle = new PlayerVehicle();
		
		playerVehicle.x = Std.int((64 - 11)/2);
		playerVehicle.y = Std.int((64 - 11)/2) + 5;

		testObstacle = new FlxSprite();
		testObstacle.makeGraphic(10, 10, FlxColor.TRANSPARENT, true);
		testObstacle.drawRect(0, 0, 10, 10, 0xFFFFFFFF);
		testObstacle.x = 10;
		testObstacle.y = 10;
	}
}
