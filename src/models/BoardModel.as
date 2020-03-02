package models {
import flash.events.EventDispatcher;

import interfaces.IBoardModel;

/**
 * BoardModel
 *
 * Holds data for the game board
 */

public class BoardModel extends EventDispatcher implements IBoardModel {
    //board greed
    public static const GRID_SIZE:int = 30;

    //borders location
    public static const LEFT_WALL:int = 30;
    public static const RIGHT_WALL:int = 570;
    public static const TOP_WALL:int = 30;
    public static const BOTTOM_WALL:int = 570;

    public function BoardModel() {

    }
}
}