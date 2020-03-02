package views {
import controllers.SnakeController;

import core.Assets;
import core.InputEvent;

import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;

import interfaces.ISnakeModel;

import models.SnakeModel;

/**
 * SnakeView
 *
 * Controlles the snake graphics - init and movement
 */

public class SnakeView extends Sprite {
    //mvc classes
    public function SnakeView(snakeModel:ISnakeModel, snakeController:SnakeController, stageIn:Stage) {
        //mvc classes
        this.snakeModel = snakeModel;
        this.snakeController = snakeController;

        //stage
        this.stageIn = stageIn;

        //start when finished loading
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    private var snakeController:SnakeController;

    //graphics array
    private var snakeModel:ISnakeModel;

    //stage
    private var snakePartsMc:Vector.<MovieClip>;
    private var stageIn:Stage;

    //update snake direction from input method

    public function destroy():void {
        //clear controller
        snakeController.destroy();
        //clear graphics
        snakePartsMc.forEach(function (mc:MovieClip, index:int, vector:Vector.<MovieClip>):void {
            removeChild(mc);
        });
        snakePartsMc = null;
        //remove listener
        snakeModel.removeEventListener(Event.CHANGE, update);
    }

    public function inputHandler(event:InputEvent):void {
        snakeController.inputHandler(event);
    }

    //move snake when the timer ticks

    private function init(event:Event):void {
        //graphics array
        snakePartsMc = new Vector.<MovieClip>;

        //add graphics to stage
        var snakeHeadMc:MovieClip = new MovieClip();
        snakeHeadMc.addChild(Assets.snakeHeadImg);
        addChild(snakeHeadMc);

        //set pos
        snakeHeadMc.x = snakeModel.snakeHead().x;
        snakeHeadMc.y = snakeModel.snakeHead().y;

        //set size
        snakeHeadMc.width = SnakeModel.SNAKE_PART_SIZE.x;
        snakeHeadMc.height = SnakeModel.SNAKE_PART_SIZE.y;

        //add head part to array
        snakePartsMc.push(snakeHeadMc);
        snakeModel.addEventListener(Event.CHANGE, update);

        //begin movement timer
        snakeController.beginSnakeMovement();
    }

    //clear screen

    private function update(event:Event):void {
        //length
        var len:int = snakeModel.snakeLength();

        //if there is a new part to add
        if (len != snakePartsMc.length) {
            //graphic
            var newPart:Bitmap = new Assets.snakeBodyBitmap() as Bitmap;
            //add graphic to movieClip
            var newPartMc:MovieClip = new MovieClip();
            newPartMc.addChild(newPart);

            //movieClip size
            newPartMc.width = SnakeModel.SNAKE_PART_SIZE.x;
            newPartMc.height = SnakeModel.SNAKE_PART_SIZE.y;

            addChild(newPartMc);

            //add graphics to array
            snakePartsMc.push(newPartMc);
        }

        //move snake parts
        for (var i:int = 0; i < len; i++) {
            snakePartsMc[i].x = snakeModel.getSnakePart(i).x;
            snakePartsMc[i].y = snakeModel.getSnakePart(i).y;
        }

    }
}
}
