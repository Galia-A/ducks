package core.animationlibraries {
import com.greensock.*;

import flash.display.Bitmap;

import interfaces.IAnimationLibrary;

/**
 * TweenMaxLibrary class
 *
 * Uses TweenMax for the animations
 */

public class TweenMaxLibrary implements IAnimationLibrary {
    public function TweenMaxLibrary() {
    }

    //enlarge graphics
    public function scaleAnimation(img:Bitmap):void {

        img.scaleX = 0.01;
        img.scaleY = 0.01;


        TweenLite.to(img, 1, {scaleX: 0.1, scaleY: 0.1});
    }

}
}
