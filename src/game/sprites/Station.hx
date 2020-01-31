package src.game.sprites;

import openfl.display.Sprite;

class Station extends Sprite{
    public function new() {
        super();
        this.graphics.beginFill(0xff5050);
        this.graphics.drawRect(-5, -10, 10, 20);
        this.graphics.endFill();
    }
}