package states {
import controllers.BoardController;
import controllers.SnakeController;
import controllers.TargetController;

import core.Game;
import core.InputEvent;
import core.animationlibraries.TweenMaxLibrary;
import core.controlschemes.InputWithArrowKeys;

import flash.display.Sprite;

import interfaces.IAnimationLibrary;
import interfaces.IBoardModel;
import interfaces.IInputMethod;
import interfaces.ISnakeModel;
import interfaces.IState;
import interfaces.ITargetModel;

import models.BoardModel;
import models.SnakeModel;
import models.TargetModel;

import views.BoardView;
import views.SnakeView;
import views.TargetView;

public class Play extends Sprite implements IState {
    //holds input class
    public function Play(game:Game) {
        this.game = game;
    }

    //holds animation class
    private var inputMethod:IInputMethod;

    //holds model classes
    private var animationLib:IAnimationLibrary;
    private var boardModel:IBoardModel;
    private var snakeModel:ISnakeModel;

    //holds view classes
    private var targetModel:ITargetModel;
    private var boardView:BoardView;
    private var snakeView:SnakeView;

    //holds controller classes
    private var targetView:TargetView;
    private var boardController:BoardController;
    private var snakeController:SnakeController;
    private var targetController:TargetController;
    private var game:Game;

    public function init():void {
        //initiate animation library
        animationLib = new TweenMaxLibrary();

        //initiate the models
        boardModel = new BoardModel();
        snakeModel = new SnakeModel();
        targetModel = new TargetModel();

        //initiate the controllers
        snakeController = new SnakeController(game, snakeModel, targetModel);
        targetController = new TargetController(game, targetModel);
        boardController = new BoardController(game, boardModel, snakeController, targetController);

        //initiate the views
        boardView = new BoardView(boardModel, boardController, game.stage);
        targetView = new TargetView(targetModel, targetController, game.stage, animationLib);
        snakeView = new SnakeView(snakeModel, snakeController, game.stage);

        //initiate the input method //
        //currently with arrow keys; Can also use InputWithWASDKeys class
        inputMethod = new InputWithArrowKeys(game.stage);

        //listening to the input method
        inputMethod.addEventListener(InputEvent.RECEIVED_INPUT, snakeView.inputHandler);

        //add views to the game
        game.stage.addChild(boardView);
        game.stage.addChild(targetView);
        game.stage.addChild(snakeView);
    }

    //clear play state
    public function destroy():void {
        //clear views
        boardView.destroy();
        targetView.destroy();
        snakeView.destroy();
        //remove listener
        inputMethod.disableInput();
        inputMethod.removeEventListener(InputEvent.RECEIVED_INPUT, snakeView.inputHandler);
        //remove from stage
        game.stage.removeChild(snakeView);
        game.stage.removeChild(targetView);
        game.stage.removeChild(boardView);
    }
}
}