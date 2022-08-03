package games;

import flixel.FlxSprite;

class PlayerVehicle extends FlxSprite {
	public var speed = 75;

	public function new() {
		super();

		this.loadGraphic("assets/cars/RedCar.png");
	}
}
