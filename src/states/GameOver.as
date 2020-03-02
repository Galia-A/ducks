package states {
import core.Assets;
import core.Game;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

import interfaces.IState;

public class GameOver extends Sprite implements IState {
    public function GameOver(game:Game) {
        this.game = game;
    }
    private var game:Game;
    private var tryAgainButton:MovieClip;
    private var btnGlow:GlowFilter;

    public function init():void {
        //glow
        btnGlow = new GlowFilter();

        //background
        game.stage.addChild(Assets.gameOverScreenBitmap);
        Assets.gameOverScreenBitmap.width = game.stage.stageWidth;
        Assets.gameOverScreenBitmap.height = game.stage.stageHeight;

        //play button
        tryAgainButton = new MovieClip();
        tryAgainButton.addChild(Assets.tryAgainButtonBitmap);
        tryAgainButton.buttonMode = true;

        //position
        tryAgainButton.x = game.stage.stageWidth / 2 - 100;
        tryAgainButton.y = game.stage.stageHeight - 150;

        //add listeners
        tryAgainButton.addEventListener(MouseEvent.CLICK, startGame);
        tryAgainButton.addEventListener(MouseEvent.MOUSE_OVER, mouseOverBtn);
        tryAgainButton.addEventListener(MouseEvent.MOUSE_OUT, mouseOutBtn);

        game.stage.addChild(tryAgainButton);

    }

    public function destroy():void {
        //clear filters
        tryAgainButton.filters = [];
        //remove listeners
        tryAgainButton.removeEventListener(MouseEvent.CLICK, startGame);
        tryAgainButton.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverBtn);
        //remove graphics
        game.stage.removeChild(tryAgainButton);
        game.stage.removeChild(Assets.gameOverScreenBitmap);
    }

    protected function mouseOutBtn(event:MouseEvent):void {
        //clear filter
        tryAgainButton.filters = [];
    }

    protected function mouseOverBtn(event:Event):void {
        //add a glow filter to the button
        tryAgainButton.filters = [btnGlow];
    }

    //clear game over state

    protected function startGame(event:Event):void {
        game.changeState(Game.PLAY_STATE);
    }
}
}