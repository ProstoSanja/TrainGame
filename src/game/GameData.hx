package game;

import game.items.GameItem;

class GameData {
    
    private var items = new Array<GameItem>();

    public function new() {
        
    }

    public function addItem(item:GameItem) {
        items.push(item);
    }

    public function getItemsToRender(x:Float, y:Float, width:Float, height:Float):Array<GameItem> {
        return items.filter(function (item) {
            var inField = (item.posX >= x && item.posX <= x+width && item.posY >= y && item.posY <= y+height);
            if (inField && !item.rendered) {
                return true;
            } else if (inField && item.rendered) {
                return false;
            } else if (!inField && item.sprite.parent != null) {
                item.sprite.parent.removeChild(item.sprite);
            }
            return false;
        });
    }

    public function reRenderAll() {
        for (item in items) {
            item.rendered = false;
        }
    }
}