package core {
import flash.events.Event;
import flash.geom.Point;

/**
 * Input Event
 *
 * Used to save direction set by the input method
 */


public class InputEvent extends Event {
    //event name
    public static const RECEIVED_INPUT:String = "receivedInput";

    //direction from input

    public function InputEvent(type:String, moveLocation:Point, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);

        //recieve direction set from input
        this.moveLocation = moveLocation;
    }
    public var moveLocation:Point;

    public override function clone():Event {
        return new InputEvent(type, moveLocation, bubbles, cancelable);
    }

}
}