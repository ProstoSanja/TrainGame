package game.camera;

import openfl.events.EventType;
import openfl.events.Event;

class CameraEvent extends Event {
    public var X:Float;
    public var Y:Float;

    public function new(x:Float, y:Float) {
        super(CAMERA_UPDATE);
        X = x;
        Y = y;
        trace("Setting camera to: " + x + " , " + y);
    }

    public static inline var CAMERA_UPDATE:EventType<CameraEvent> = "customCameraUpdate";
}