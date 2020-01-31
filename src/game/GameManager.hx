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
        bottomBar.addButton(new ButtonData("Station", placeStation));
        bottomBar.addButton(new ButtonData("Option2", null));
        bottomBar.addButton(new ButtonData("Option3", null));
    }

    public function placeStation(e) {
        gameData.startPlacingItem(new GameItem(GameItemType.Station));
    }
    
}