package models {
import core.Direction;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Point;

import interfaces.ISnakeModel;

/**
 * SnakeModel class
 *
 * Holds the positions for the snake's parts
 */


public class SnakeModel extends EventDispatcher implements ISnakeModel {
    //size
    public static const SNAKE_PART_SIZE:Point = new Point(30, 30);
    //start position
    public static const SNAKE_START_POS:Point = new Point(150, 150);

    //snake parts locations

    public function SnakeModel() {
        //init vector
        snakeParts = new Vector.<Point>;
        //insert head location into the vector
        snakeParts.push(SNAKE_START_POS);

        //set the snake's direction
        snakeDirection = Direction.RIGHT;
        //init snake's location
        snakePosition = new Point();
    }

    //direction
    private var snakeParts:Vector.<Point>;
    //position
    private var snakeDirection:Point;
    private var snakePosition:Point;

    public function setDirection(direction:Point):void {
        //set the new direction
        this.snakeDirection = direction;
        //update view
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function getDirection():Point {
        return snakeDirection;
    }

    //add a snake part
    public function lengthenSnake(snakePos:Point):void {
        snakeParts.push(snakePos);
        dispatchEvent(new Event(Event.CHANGE));
    }

    //add a snake part to a specific location in the array
    public function setSnakePart(index:int, newPos:Point):void {
        snakeParts[index] = newPos;
        dispatchEvent(new Event(Event.CHANGE));
    }


    //returns the head part location
    public function snakeHead():Point {
        return snakeParts[0];
    }

    //returns the snake length
    public function snakeLength():int {
        return snakeParts.length;
    }

    //returns a specific part's location
    public function getSnakePart(index:int):Point {
        return snakeParts[index];
    }
}
}