package src.gui;

import src.gui.BottomButton;
import openfl.display.Stage;
import openfl.display.Sprite;

class BottomBar extends Sprite
{

	private var barHeight:Int = 30;
	private var items:Array<BottomButton> = new Array();

	public function new(stage:Stage) {
		super();
		this.graphics.beginFill(0x000000, 0.2);
		this.graphics.drawRect(0, 0, stage.stageWidth, barHeight);
		this.graphics.endFill();
	}

	public function addButton(panel:ButtonData) {
		var button = new BottomButton(panel);
		stage.addChild(button);
		items.push(button);
	}

	public function updateSize(stage:Stage) {
		this.width = stage.stageWidth;
		this.y = stage.stageHeight - barHeight;
		var halfItem = this.width / 2 / items.length;
		for (i in 0...items.length) {
			items[i].x = ((i + 1) * 2 - 1) * halfItem;
			items[i].y = stage.stageHeight - barHeight;
		}
	}
}