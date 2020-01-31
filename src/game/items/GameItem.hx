package game.items;


import openfl.display.Sprite;

interface GameItem {
    public var posX:Float;
    public var posY:Float;

    public var rendered:Bool;
    public var sprite:Sprite;
}