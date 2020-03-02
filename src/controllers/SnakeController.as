package controllers {
import core.Assets;
import core.Game;
import core.InputEvent;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.utils.Timer;

import interfaces.ISnakeModel;
import interfaces.ITargetModel;

import models.BoardModel;
import models.SnakeModel;

/**
 * SnakeController
 *
 * Calculates the snake's movement
 */


public class SnakeController {
    //timer's ticking
    public static const START_SPEED:int = 100;

    //mvc classes

    public function SnakeController(game:Game, snakeModel:ISnakeModel, targetModel:ITargetModel) {
        //mvc classes
        this.game = game;
        this.snakeModel = snakeModel;
        this.targetModel = targetModel;
    }
    private var snakeModel:ISnakeModel;

    //timer
    private var targetModel:ITargetModel;
    private var movingTimer:Timer;
    private var game:Game;
    private var currentDirection:Point;

    //set a new location for the head

    public function destroy():void {
        movingTimer.stop();
        movingTimer.removeEventListener(TimerEvent.TIMER, moveSnake);
    }

    //set a new location for the tail parts

    public function beginSnakeMovement():void {
        movingTimer = new Timer(SnakeController.START_SPEED);
        movingTimer.addEventListener(TimerEvent.TIMER, moveSnake);
        movingTimer.start();
    }

    private function moveHead(newSnakePos:Point):void {
        snakeModel.setSnakePart(0, newSnakePos);
    }
    //check for collision with food

    private function placeTail():void {
        var snakeLength:int = snakeModel.snakeLength();

        for (var i:int = snakeLength - 1; i > 0; i--) {
            snakeModel.setSnakePart(i, snakeModel.getSnakePart(i - 1));
        }
    }

    //check for collition with tail

    private function checkCollisionWithTarget(snakePos:Point):void {
        if (snakePos.equals(targetModel.getLocation())) {
            targetModel.dispatchEvent(new Event(Event.CHANGE));
            snakeModel.lengthenSnake(snakePos);
        }
    }

    //stop movement in case of game over

    private function hitTail():Boolean {
        var head:Point = snakeModel.snakeHead();
        var len:int = snakeModel.snakeLength();

        for (var i:int = 1; i < len; i++) {
            if (head.equals(snakeModel.getSnakePart(i))) {
                return true;
            }
        }

        return false;

    }

    //update snake direction from input method

    public function moveSnake(event:TimerEvent):void {
        currentDirection = snakeModel.getDirection();
        //the next position the snake should go to
        var newSnakePos:Point = new Point(
                        snakeModel.snakeHead().x + snakeModel.getDirection().x * BoardModel.GRID_SIZE,
                        snakeModel.snakeHead().y + snakeModel.getDirection().y * BoardModel.GRID_SIZE);

        //checking if the next step will reach the wall
        var collisionRight:Boolean = newSnakePos.x > BoardModel.RIGHT_WALL - SnakeModel.SNAKE_PART_SIZE.x;
        var collisionLeft:Boolean = newSnakePos.x < BoardModel.LEFT_WALL;
        var collisionTop:Boolean = newSnakePos.y > BoardModel.BOTTOM_WALL - SnakeModel.SNAKE_PART_SIZE.y;
        var collisionBottom:Boolean = newSnakePos.y < BoardModel.TOP_WALL;

        //check for collition with the walls or with the tail
        if (collisionBottom || collisionLeft || collisionRight || collisionTop || hitTail()) {
            Assets.gameOver.play();
            game.changeState(Game.GAME_OVER_STATE);
        }
        else {
            //check for collition with food
            checkCollisionWithTarget(newSnakePos);
            //move the tail
            placeTail();
            //move the head
            moveHead(newSnakePos);
        }
    }

    //begin timer

    public function inputHandler(event:InputEvent):void {
        var newDirection:Point = event.moveLocation;
        //checking if the move is legal - the snake can't move in reverse
        if (currentDirection.x + newDirection.x != 0 && currentDirection.y + newDirection.y != 0) {
            //set the new direction
            snakeModel.setDirection(newDirection);
        }
    }
}
}