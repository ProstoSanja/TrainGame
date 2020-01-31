package game.items;

import openfl.display.Sprite;

class Station implements GameItem extends Sprite {
    public var posX:Float = 0;
    public var posY:Float = 0;

    public var rendered:Bool = false;
    public var sprite:Sprite;

    public function new() {
        super();
        sprite = this;
        this.graphics.beginFill(0xff5050);
        this.graphics.drawRect(-5, -10, 10, 20);
        this.graphics.endFill();        
    }
}