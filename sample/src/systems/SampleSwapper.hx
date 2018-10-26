package systems;

import boost.GameState;
import hxd.Key;
import boost.GM;
import boost.ecs.component.sys.States;
import ecs.node.Node;
import ecs.Engine;
import ecs.system.System;
import tink.CoreApi.CallbackLink;

import states.*;

/**
 * System for swapping out the different Sample GameStates.
 */
class SampleSwapper extends System {
    @:nodes var nodes:Node<States>;

    var samples:Array<Class<GameState>> = [ SampleState2, SampleState1 ];
    var current:Int = 0;

    override function update(dt:Float) {
		for(node in nodes) {
            if (Key.isPressed(Key.ENTER)) {
                current = 0;
                node.states.reset = true;
            }

            if (Key.isPressed(Key.SPACE)) {
                current += 1;
                if (current >= samples.length) current = 0;
                GM.load_state(cast Type.createInstance(samples[current], []));
            }
		}
	}
}