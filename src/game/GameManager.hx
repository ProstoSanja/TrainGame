package src.game;

import src.game.GameData;
import openfl.display.Stage;
import src.gui.BottomButton;
import src.gui.BottomBar;
import src.game.camera.CameraBase;

class GameManager {

    private var bottomBar:BottomBar;
    private var stage:Stage;

    private var gameData = new GameData();

    private var cameraBase:CameraBase;

    public function new(stage:Stage, bottomBar:BottomBar) {
        this.stage = stage;
        this.bottomBar = bottomBar;

        this.cameraBase = new CameraBase(stage, gameData);
        stage.addChildAt(cameraBase, 0);

        initializeGUI();
    }

    public function initializeGUI() {
        bottomBar.addButton(new ButtonData("Line", testLine));
        bottomBar.addButton(new ButtonData("Station", stationLine));
        bottomBar.addButton(new ButtonData("Chat", chatLine));
    }

    public function testLine(e) {
        gameData.items.push(new GameItem(GameItemType.Train, 0, 0));
    }

    public function stationLine(e) {
        
    }

    public function chatLine(e) {
        
    }
    
}