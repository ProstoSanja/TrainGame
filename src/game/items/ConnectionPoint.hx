package game.items;

import openfl.display.Sprite;

class ConnectionPoint implements GameItem extends Sprite {
    public var posX:Float = 0;
    public var posY:Float = 0;

    public var rendered:Bool = false;
    public var sprite:Sprite;

    public function new() {
        super();
        sprite = this;
        this.graphics.beginFill(0x444444);
        this.graphics.drawCircle(0, 0, 5);
        this.graphics.endFill();     
    }
}