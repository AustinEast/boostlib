package ghost.component;

import ghost.system.AnimationSystem;
import ghost.Component;

using ghost.ext.IntExt;

class Animations extends Component {
  /**
   * The current Animation.
   */
  public var current:Animation;
  /**
   * The current frame the Animation is displaying.
   */
  public var index:Int;
  /**
   * Flag to check if the current Animation is paused.
   * If it is, the current Animation will not advance to the next frame.
   */
  public var paused:Bool;
  /**
   * Flag to check if the current Animation is finished.
   */
  public var finished:Bool;
  /**
   * A function that is called when the current Animation is finished.
   * If the animation is looped, this will get called after every loop is finished.
   */
  public var callback:Void->Void;

  public var members:Map<String, Animation>;

  @:allow(ghost.system.AnimationSystem)
  var delay:Float;
  @:allow(ghost.system.AnimationSystem)
  var timer:Float;
  @:allow(ghost.system.AnimationSystem)
  var reversed:Bool;

  public function new(?animations:Array<Animation>) {
    members = [];
    if (animations != null) for (animation in animations) add(animation);
  }
  /**
   * Play an Animation. The Animation must already be added to this Controller.
   * @param name The name of the Animation.
   * @param force If true, the Animation will start over if it is already playing.
   * @param callback A function that is called when the Animation is finished.
   * @param frame The frame index to start the Animation from.
   */
  public function play(name:String, force:Bool = false, callback:Void->Void = null, frame:Int = 0) {
    if (current != null && current.name == name && !force && !finished) return;
    if (members.exists(name)) {
      current = members.get(name);
      index = current.direction == REVERSE ? current.frames.length - frame - 1 : frame;
      index = index.clamp(0, current.frames.length - 1);
      this.callback = callback;
      finished = false;
      paused = false;
      reversed = current.direction == REVERSE;
      delay = current.speed > 0 ? 1.0 / current.speed : 0;
      timer = 0;
    }
    // else GM.log.warn('Animation `${name}` does not exist on this Entity');
  }
  /**
   * Adds an Animation to the Controller.
   * @param name The name of the Animation.
   * @param frames The indexes of the frames that will be played.
   * @param speed The speed of the Animation playback in frames per second.
   * @param looped Flag to set if the Animation loops.
   * @param loop_delay Delay between each loop of the Animation in seconds.
   * @param direction Direction the Animation will traverse it's frames.
   * @return Animation
   */
  public function add(animation:Animation):Animation {
    members.exists(animation.name) ? /*GM.log.warn*/ trace('Animation `${animation.name}` already exists on this Entity') : members.set(animation.name, {
      name: animation.name,
      frames: animation.frames,
      speed: animation.speed == null ? 15 : animation.speed,
      looped: animation.looped == null ? false : animation.looped,
      loop_delay: animation.loop_delay == null ? 0 : animation.loop_delay,
      direction: animation.direction == null ? FORWARD : animation.direction
    });
    return members.get(animation.name);
  }
}

typedef Animation = {
  /**
   * The name of the Animation.
   */
  name:String,
  /**
   * The indexes of the frames that will be played.
   */
  frames:Array<Int>,

  /**
   * The speed of the Animation playback in frames per second.
   */
  ?speed:Int,
  /**
   * Flag to set if the Animation loops.
   */
  ?looped:Bool,
  /**
   * Delay between each loop of the Animation in seconds.
   */
  ?loop_delay:Float,
  /**
   * Direction the Animation will traverse it's frames.
   */
  ?direction:AnimationDirection,
  ?ease:Ease
}

@:enum
abstract AnimationDirection(String) {
  var FORWARD = 'Forward';
  var REVERSE = 'Reverse';
  var PINGPONG = 'PingPong';
}

// TODO: Add in optional Easing functions on enter/exit

@:enum
abstract Ease(Int) {
  var TODO = 0;
}
