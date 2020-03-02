package core.controlschemes {
import core.Direction;
import core.InputEvent;

import flash.display.Stage;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.ui.Keyboard;

import interfaces.IInputMethod;

/**
 * InputWithArrowKeys
 *
 * This class recieves the user's input through the keyboard
 * Uses the arrow keys
 *
 */

public class InputWithArrowKeys extends EventDispatcher implements IInputMethod {
    public function InputWithArrowKeys(stageIn:Stage) {
        //add listener for kebord
        this.stageIn = stageIn;
        this.stageIn.addEventListener(KeyboardEvent.KEY_DOWN, keyboardEventHandler);
    }
    private var stageIn:Stage;

    //dispatch the new movement direction

    public function dispatchDirection(direction:Point):void {
        dispatchEvent(new InputEvent(InputEvent.RECEIVED_INPUT, direction));
    }

        public function disableInput():void {
        stageIn.removeEventListener(KeyboardEvent.KEY_DOWN, keyboardEventHandler);
        stageIn.removeEventListener(InputEvent.RECEIVED_INPUT, keyboardEventHandler);
    }//end function


    //remove keyboard listener

private function keyboardEventHandler(event:KeyboardEvent):void {
        //holds the new direction from the keyboard
        var nextDirection:Point;

        switch (event.keyCode) {
            case Keyboard.UP:
            {
                nextDirection = Direction.UP;
                break;
            }
            case Keyboard.DOWN:
            {
                nextDirection = Direction.DOWN;
                break;
            }
            case Keyboard.LEFT:
            {
                nextDirection = Direction.LEFT;
                break;
            }
            case Keyboard.RIGHT:
            {
                nextDirection = Direction.RIGHT;
                break;
            }

        }//end switch

        dispatchDirection(nextDirection);

    }
}
}