package states;

import h2d.Tile;
import ghost.GM;
import ghost.h2d.GameObject;
import ghost.util.RandomUtil;
import ghost.GameState;
import systems.ScreenWrapperSystem;

using ghost.h2d.ext.ObjectExt;
/**
 * Sample State 1 - Pixel Art Stress Test.
 */
class SampleState1 extends GameState {
  /**
   * Text to display the FPS.
   */
  var fps:h2d.Text;
  /**
   * The amount of Entities to spawn.
   */
  var entity_count:Int = 2000;
  /**
   * Override `init()` to initialize the State.
   */
  override public function create() {
    // Create a legion of circles!
    for (i in 0...entity_count) {
      // Create a GameObject at a random point on the Screen
      var game_object = new GameObject(Math.random() * GM.width, Math.random() * GM.height);
      // Load the GameObject's graphic
      game_object.sprite.load(hxd.Res.images.cir);
      // Add some motion
      game_object.transform.rotation = Math.random() * 360;
      game_object.motion.rotational_velocity = 0.01;
      game_object.motion.velocity.x = Math.random() * 45 * (RandomUtil.chance() == true ? 1 : -1);
      // Add the GameObject to the State
      add(game_object);
    }

    // Add the custom ScreenWrapper system.
    add_system(new ScreenWrapperSystem());

    // Add some info text to the UI
    add_ui();
  }
  /**
   * Override `update()` to run logic every frame.
   * This framework supports both using ECS Systems or a good old fashioned update loop to handle game logic.
   * Or in this case, both at one time!
   */
  override public function update(dt:Float) {
    super.update(dt);
    // fps.text = 'FPS: ${GM.fps}';
  }

  function add_ui() {
    // var menu = ui.add_flow(0, 0, {
    //   background: Tile.fromColor(0x000000, 5, 5, 0.8),
    //   vertical: true,
    //   align: {
    //     vertical: Middle
    //   },
    //   padding: {
    //     bottom: 2,
    //     left: 2,
    //     right: 2
    //   }
    // });
    // fps = menu.add_text();
    // menu.add_text('Entities: $entity_count');
  }
}
