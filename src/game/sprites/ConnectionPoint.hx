package src.game.sprites;

import openfl.display.Sprite;

class ConnectionPoint extends Sprite{
    public function new() {
        super();
        this.graphics.beginFill(0x444444);
        this.graphics.drawCircle(0, 0, 5);
        this.graphics.endFill();
    }
}