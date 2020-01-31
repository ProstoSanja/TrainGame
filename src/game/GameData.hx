package src.game;

import src.game.sprites.Station;
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
        this.posX = posX;
        this.posY = posY;
        switch type {
            case GameItemType.Station: this.sprite = new Station();
            default: this.sprite = new Sprite();
        }
    }
}

enum GameItemType {
    Station;
    Line;
}