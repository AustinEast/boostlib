package h3d;

import ghost.EntityBase;
import h3d.scene.Object;

class Entity extends EntityBase<Object> {
  public var state:GameState;

  public function new(?base:Object) {
    super(base == null ? new Object() : base);
  }

  override public function dispose() {
    super.dispose();
    state = null;
  }

  @:allow(h3d.GameState)
  function added(state:GameState) {
    this.state = state;
    state.base.addChild(base);
    for (component in component_arr) Std.instance(component, Component).state_added(state);
  }

  @:allow(h3d.GameState)
  function removed(state:GameState) {
    this.state = null;
    base.remove();
    for (component in component_arr) Std.instance(component, Component).state_added(state);
  }
}
