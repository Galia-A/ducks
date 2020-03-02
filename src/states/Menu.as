package states {
import core.Assets;
import core.Game;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

import interfaces.IState;

public class Menu extends Sprite implements IState {
    //game
    public function Menu(game:Game) {
        this.game = game;
    }

    //play button
    private var game:Game;

    //glow effect for the button
    private var playButton:MovieClip;
    private var btnGlow:GlowFilter;

    public function init():void {
        //glow
        btnGlow = new GlowFilter();

        //background
        game.stage.addChild(Assets.startScreenBitmap);
        Assets.startScreenBitmap.width = game.stage.stageWidth;
        Assets.startScreenBitmap.height = game.stage.stageHeight;

        //play button
        playButton = new MovieClip();
        playButton.addChild(Assets.playButtonBitmap);
        //position
        playButton.x = game.stage.stageWidth / 2;
        playButton.y = game.stage.stageHeight / 2;
        playButton.buttonMode = true;
        //listeners
        playButton.addEventListener(MouseEvent.CLICK, startGame);
        playButton.addEventListener(MouseEvent.MOUSE_OVER, mouseOverBtn);
        playButton.addEventListener(MouseEvent.MOUSE_OUT, mouseOutBtn);

        game.stage.addChild(playButton);

    }

    public function destroy():void {
        //clear filters
        playButton.filters = [];
        //remove listeners
        playButton.removeEventListener(MouseEvent.CLICK, startGame);
        playButton.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverBtn);
        //remove graphics
        game.stage.removeChild(playButton);
        game.stage.removeChild(Assets.startScreenBitmap);
    }

    protected function mouseOutBtn(event:MouseEvent):void {
        //clear filter
        playButton.filters = [];
    }

    protected function mouseOverBtn(event:Event):void {
        //add a glow filter to the button
        playButton.filters = [btnGlow];
    }

    //clear menu state

    protected function startGame(event:Event):void {
        game.changeState(Game.PLAY_STATE);
    }
}
}