package interfaces {
import flash.events.IEventDispatcher;
import flash.geom.Point;

/**
 * ITargetModel interface
 *
 * Declaires functions for the target's model
 */

public interface ITargetModel extends IEventDispatcher {
    function getLocation():Point;

    function setLocation(location:Point):void;
}
}