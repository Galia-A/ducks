package views {
import controllers.BoardController;

import core.Assets;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;

import interfaces.IBoardModel;

import models.BoardModel;

/**
 * BoardView
 *
 * Adds graphics to the board - background and border tiles
 */

public class BoardView extends Sprite {
    //stage
    public function BoardView(boardModel:IBoardModel, boardController:BoardController, stageIn:Stage) {
        //stage
        this.stageIn = stageIn;
        //mvc classes
        this.boardModel = boardModel;
        this.boardController = boardController;

        //start init when finished to load
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    //mvc classes
    private var stageIn:Stage;
    private var boardController:BoardController;
    private var boardModel:IBoardModel;

    public function destroy():void {
        //clear controller
        boardController.destroy();
        //remove graphics
        removeChild(Assets.bgImg);
        while (numChildren > 0) {
            removeChildAt(0);
        }
    }

    private function initGraphics():void {
        //background
        addChild(Assets.bgImg);

        //border
        var borderTile:Bitmap;

        for (var i:int = 0; i < stageIn.width; i += BoardModel.GRID_SIZE) {
            //top
            borderTile = new Assets.borderTileBitmap();
            borderTile.width = BoardModel.GRID_SIZE;
            borderTile.height = BoardModel.GRID_SIZE;
            borderTile.x = i;
            borderTile.y = 0;
            addChild(borderTile);

            //bottom
            borderTile = new Assets.borderTileBitmap();
            borderTile.width = 30;
            borderTile.height = 30;
            borderTile.x = i;
            borderTile.y = BoardModel.BOTTOM_WALL;
            addChild(borderTile);

            //right
            borderTile = new Assets.borderTileBitmap();
            borderTile.width = 30;
            borderTile.height = 30;
            borderTile.y = i;
            borderTile.x = BoardModel.RIGHT_WALL;
            addChild(borderTile);

            //left
            borderTile = new Assets.borderTileBitmap();
            borderTile.width = 30;
            borderTile.height = 30;
            borderTile.y = i;
            borderTile.x = 0;
            addChild(borderTile);
        }

    }

    //clear from screen

    private function init(event:Event):void {
        initGraphics();
    }
}
}