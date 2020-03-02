package controllers {
import core.Game;

import flash.geom.Point;

import interfaces.ITargetModel;

import models.BoardModel;

/**
 * TargetController
 *
 * Calculates and sets the target's location
 */

public class TargetController {
    //target's model
    public function TargetController(game:Game, targetModel:ITargetModel) {
        this.game = game;

        //target's model
        this.targetModel = targetModel;

        //set first location
        placeTarget();
    }

    //game
    private var targetModel:ITargetModel;
    private var game:Game;

    public function placeTarget():void {
        //set a random location for the target
        var randomX:int = Math.floor((Math.random() * (BoardModel.RIGHT_WALL - 30 - BoardModel.LEFT_WALL) + BoardModel.LEFT_WALL) / BoardModel.GRID_SIZE);
        var randomY:int = Math.floor((Math.random() * (BoardModel.BOTTOM_WALL - 30 - BoardModel.TOP_WALL) + BoardModel.TOP_WALL) / BoardModel.GRID_SIZE);
        var location:Point = new Point(randomX * BoardModel.GRID_SIZE, randomY * BoardModel.GRID_SIZE);

        //update the model
        targetModel.setLocation(location);
    }

    public function destroy():void {

    }
}
}