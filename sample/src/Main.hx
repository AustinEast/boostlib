package;

import boost.GM;
import boost.Game;
import states.*;
import systems.SampleSwapper;

class Main {
	
	static function main() {
		new Main();
	}

	function new() {
		// Create our Game with an Initial State and Options
		var game = new Game(SampleState3, EMBED, {
			name: "Sample App",
			version: "0.0.1",
			width: 320,
			height: 180
		});

		game.on_init = () -> {
			// Set the window's Background Color to something a little more pleasing ;)
			GM.background_color = 0xff222034;
			// Add a custom System to the Game's top-level ECS Engine
			// Systems added to the Game's ECS Engine will persist between states
			// This is useful for Level managers, Save managers, etc.
			game.add_system(new SampleSwapper());
		}
	}
}

enum Event {
	
}