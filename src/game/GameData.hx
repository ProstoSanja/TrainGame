package src.game;

import openfl.display.Sprite;

class GameData {
    public var items = new Array<GameItem>();

    public function new() {
        
    }

    public function reRenderAll() {
        for (item in items) {
            item.rendered = false;
        }
    }
}

class GameItem {
    public var type:GameItemType;
    public var posX:Float;
    public var posY:Float;

    public var rendered = false;
    public var sprite:Sprite;

    public function new(type:GameItemType, posX:Float, posY:Float) {
        this.type = type;
    }
}

enum GameItemType {
    Train;
    Line;
}