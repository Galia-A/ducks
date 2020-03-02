package interfaces {
import flash.events.IEventDispatcher;
import flash.geom.Point;

/**
 * IInputMethod interface
 *
 * Declaires functions for input methods
 */


public interface IInputMethod extends IEventDispatcher {
    function dispatchDirection(direction:Point):void;

    function disableInput():void;
}
}