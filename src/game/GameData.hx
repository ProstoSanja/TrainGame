package src.game;

import src.game.sprites.*;
import openfl.display.Sprite;

class GameData {
    private var items = new Array<GameItem>();

    public var currentlyPlacing:GameItem;

    public function new() {
        
    }

    public function startPlacingItem(item:GameItem) {
        currentlyPlacing = item;
    }

    public function stopPlacingItem(posX:Float, posY:Float) {
        if (currentlyPlacing == null) {
            return;
        }
        currentlyPlacing.posX = posX;
        currentlyPlacing.posY = posY;
        addItem(currentlyPlacing);
        currentlyPlacing = null;
    }

    public function addItem(item:GameItem) {
        items.push(item);
    }

    public function getItemsToRender(x:Float, y:Float, width:Float, height:Float):Array<GameItem> {
        //TODO: implement search based on coords; DONE
        //TODO: despawn items if out of bounds;
        //return items.filter(function (item) {
            //return !item.rendered && item.posX >= x && item.posX <= x+width && item.posY >= y && item.posY <= y+height;
        //});
        return items.filter(function (item) return !item.rendered);
    }

    public function reRenderAll() {
        for (item in items) {
            item.rendered = false;
        }
    }
}

class GameItem {
    public var type:GameItemType;
    public var posX:Float = 0;
    public var posY:Float = 0;

    public var rendered = false;
    public var sprite:Sprite;

    public function new(type:GameItemType) {
        this.type = type;
        switch type {
            case GameItemType.Station: this.sprite = new Station();
            case GameItemType.ConnectionPoint: this.sprite = new ConnectionPoint();
            default: this.sprite = new Sprite();
        }
    }
}

enum GameItemType {
    Station;
    ConnectionPoint;
}