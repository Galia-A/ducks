package core {
import flash.display.Sprite;
import flash.events.Event;

import interfaces.IState;

import states.GameOver;
import states.Menu;
import states.Play;

/**
 * Game Class
 *
 * Initiats the game
 * Starts the MVC classes
 */


    //Game size
[SWF(height=600, width=600)]


public class Game extends Sprite {
    //game states
    public static const MENU_STATE:int = 0;
    public static const PLAY_STATE:int = 1;
    public static const GAME_OVER_STATE:int = 2;

    public function Game() {
        // init //
        //initiate the graphics
        Assets.init();

        //add listener to init game when stage finished to load
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    private var currentState:IState;

    public function changeState(state:int):void {
        if (currentState != null) {
            currentState.destroy();
            currentState = null;
        }

        switch (state) {
            case MENU_STATE:
                currentState = new Menu(this);
                break;

            case PLAY_STATE:
                currentState = new Play(this);
                break;

            case GAME_OVER_STATE:
                currentState = new GameOver(this);
                break;
        }

        currentState.init();
    }

    //destroy last state and start the relevant one

    private function init(event:Event):void {
        //open menu
        changeState(MENU_STATE);
    }

}
}