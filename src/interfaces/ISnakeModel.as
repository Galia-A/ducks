package interfaces {
import flash.events.IEventDispatcher;
import flash.geom.Point;

/**
 * ISnakeModel interface
 *
 * Declaires functions for input methods
 */

public interface ISnakeModel extends IEventDispatcher {
    function setDirection(direction:Point):void;

    function getDirection():Point;

    function lengthenSnake(snakePos:Point):void;

    function snakeHead():Point;

    function getSnakePart(index:int):Point;

    function setSnakePart(index:int, newPos:Point):void;

    function snakeLength():int;
}
}