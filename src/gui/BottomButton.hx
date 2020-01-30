package src.gui;

import openfl.events.MouseEvent;
import openfl.display.Sprite;

class BottomButton extends Sprite
{
	private var data:ButtonData;

	public function new(data:ButtonData) {
		super();
		this.graphics.beginFill(0x505050);
		this.graphics.drawCircle(0, 0, 10);
		this.graphics.endFill();
		this.data = data;
		this.buttonMode = true;
		this.addEventListener(MouseEvent.MOUSE_UP, this.data.callback);
	}
}

class ButtonData {
    public function new(name:String, callback:MouseEvent->Void) {
        this.name = name;
        this.callback = callback;
    }
    public var name:String;
    public var callback:MouseEvent->Void;
}