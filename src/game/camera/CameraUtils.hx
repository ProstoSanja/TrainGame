package game.camera;

import openfl.display.Sprite;

class CameraUtils {

    public static function checkIfSpriteExists(sprite:Sprite, parent:Sprite) {
        if (sprite.parent == null) {
            parent.addChild(sprite);
        }
    }
}