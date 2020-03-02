package controllers {
import core.Game;

import interfaces.IBoardModel;

/**
 * BoardController class
 *
 * Holds: board model, snake controller, target controller
 */


public class BoardController {
    //mvc classes
    public function BoardController(game:Game, boardModel:IBoardModel, snakeController:SnakeController, targetController:TargetController) {
        this.game = game;
        this.boardModel = boardModel;
        this.snakeController = snakeController;
        this.targetController = targetController;
    }
    private var boardModel:IBoardModel;
    private var snakeController:SnakeController;

    //game
    private var targetController:TargetController;
    private var game:Game;

    public function destroy():void {

    }
}
}