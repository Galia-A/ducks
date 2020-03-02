package models {
import flash.events.EventDispatcher;
import flash.geom.Point;

import interfaces.ITargetModel;

/**
 * TargetModel
 *
 * Controlles the target's location
 */

public class TargetModel extends EventDispatcher implements ITargetModel {
    //location
    public function TargetModel() {
        //init location
        location = new Point();
    }
    private var location:Point;

    public function getLocation():Point {
        return location;
    }

    public function setLocation(location:Point):void {
        this.location = location;
    }
}
}