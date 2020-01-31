package ;

import game.GameManager;
import gui.BottomBar;

import openfl.events.Event;
import openfl.display.Sprite;


class Main extends Sprite {
	
	private var bottomBar:BottomBar;

	private var gamemanager:GameManager;
	
	public function new () {
		super ();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		initDraw();
	}

	function resize(e) {
		bottomBar.updateSize(stage);
	}

	public function initDraw() {
		bottomBar = new BottomBar(stage);
		addChild(bottomBar);

		stage.addEventListener(Event.RESIZE, resize);

		gamemanager = new GameManager(stage, bottomBar);
	}

}