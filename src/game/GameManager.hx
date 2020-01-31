package game;

import game.items.*;
import game.GameData;
import openfl.display.Stage;
import gui.BottomButton;
import gui.BottomBar;
import game.camera.CameraBase;

class GameManager {

    private var bottomBar:BottomBar;
    private var stage:Stage;

    private var gameData = new GameData();

    private var cameraBase:CameraBase;
    private var placer:Placer;

    public function new(stage:Stage, bottomBar:BottomBar) {
        this.stage = stage;
        this.bottomBar = bottomBar;

        this.cameraBase = new CameraBase(stage, gameData);
        stage.addChildAt(cameraBase, 0);

        this.placer = new Placer(stage, gameData);

        initializeGUI();
    }

    public function initializeGUI() {
        bottomBar.addButton(new ButtonData("Station", placeStation));
        bottomBar.addButton(new ButtonData("ConnectionPoint", placeConnectionPoint));
        bottomBar.addButton(new ButtonData("Connection", placeConnection));
    }

    public function placeStation(e) {
        placer.startPlacing(new Station());
    }

    public function placeConnectionPoint(e) {
        placer.startPlacing(new ConnectionPoint());
    }

    public function placeConnection(e) {
        //placer.startPlacing();
    }
    
}