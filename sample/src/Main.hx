package;

import hxd.GM;
import hxd.Game;
import h2d.GameState;
import states.*;

using h2d.ext.ObjectExt;

// // import systems.SampleSwapperSystem;
class Main {
  var sample_states:Array<Class<GameState>> = [SampleState1];

  static function main() {
    new Main();
  }

  function new() {
    // Create our Game with an Initial GameState and Options
    var game = new Game(EMBED, {
      name: "Sample App",
      version: "0.0.1",
      width: 320,
      height: 180
    });

    game.create = () -> {
      // Set the window's Background Color to something a little more pleasing ;)
      GM.background_color = 0xffd95763;
      game.viewport.pixel_perfect();

      new SampleState1();
    }
  }
}
