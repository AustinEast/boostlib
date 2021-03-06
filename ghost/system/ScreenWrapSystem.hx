package system;

import ghost.Node;
import ghost.System;
import ghost.component.ScreenWrap;

@:dox(hide)
class ScreenWrapSystem extends System {
  @:nodes var nodes:Node<ScreenWrap>;

  override function step(dt:float) {
    super.step(dt);

    for (node in nodes) {
      // if (node.entity.x > ghost.width + node.screenwrap.width) node.entity.x = -node.screenwrap.width;
      // if (node.entity.x < -width) entity.display.x = GM.width + width;
      // if (node.entity.y > GM.height + height) entity.display.y = -height;
      // if (node.entity.y < -height) entity.display.y = GM.height + height;
    }
  }
}
