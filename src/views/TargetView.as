package views {
import controllers.TargetController;

import core.Assets;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;

import interfaces.IAnimationLibrary;
import interfaces.ITargetModel;

/**
 * TargetView
 *
 * set the target (food) graphics on screen
 */

public class TargetView extends Sprite {
    //mvc classes
    public function TargetView(targetModel:ITargetModel, targetController:TargetController, stageIn:Stage, animationLib:IAnimationLibrary) {
        //mvc classes
        this.targetModel = targetModel;
        this.targetController = targetController;
        //stage
        this.stageIn = stageIn;
        //animation library
        this.animationLib = animationLib;

        //start init when finished to load
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
    private var targetModel:ITargetModel;
    //stage
    private var targetController:TargetController;
    //animation library
    private var stageIn:Stage;
    private var animationLib:IAnimationLibrary;

    //target's new location - called when eatten

    public function destroy():void {
        //clear controller
        targetController.destroy();
        //remove listener
        targetModel.removeEventListener(Event.CHANGE, update);
        //remove graphics
        stageIn.removeChild(Assets.foodImg);
    }


    //target's first position

    private function update(event:Event):void {
        //play sound
        Assets.pickup.play();
        //ask for new location
        targetController.placeTarget();
        //set new location
        Assets.foodImg.x = targetModel.getLocation().x;
        Assets.foodImg.y = targetModel.getLocation().y;

        //scale up animation
        animationLib.scaleAnimation(Assets.foodImg);
    }


    //clear from screen

    private function init(event:Event):void {
        //call for new location
        targetController.placeTarget();
        //add target to the screen
        stageIn.addChild(Assets.foodImg);
        //size
        Assets.foodImg.width = 30;
        Assets.foodImg.height = 30;
        //position
        Assets.foodImg.x = targetModel.getLocation().x;
        Assets.foodImg.y = targetModel.getLocation().y;

        //scale up animation
        animationLib.scaleAnimation(Assets.foodImg);

        //update the location in model
        targetModel.addEventListener(Event.CHANGE, update);
    }
}
}