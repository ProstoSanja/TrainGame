package game;

import game.camera.CameraUtils;
import openfl.events.Event;
import openfl.events.MouseEvent;
import game.items.GameItem;
import game.camera.CameraEvent;
import openfl.display.Stage;
import openfl.display.Sprite;

class Placer extends Sprite {

    private var gameData:GameData;
    private var parentStage:Stage;

    private var currentlyPlacing:GameItem = null;
    private var cameraPosX:Float = 0;
    private var cameraPosY:Float = 0;

    public function new(stage:Stage, data:GameData) {
        super();
        this.parentStage = stage;
        this.gameData = data;

        this.graphics.beginFill(0x5555ff);
        this.alpha = 0.2;
		this.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        this.graphics.endFill();

        parentStage.addEventListener(CameraEvent.CAMERA_UPDATE, updateCamera);
        this.addEventListener(MouseEvent.MOUSE_UP, leftClick);

    }

    public function startPlacing(item:GameItem) {
        parentStage.addChild(this);
        this.addEventListener(Event.ENTER_FRAME, onRender);
        currentlyPlacing = item;
    }

    public function leftClick(e) {
        if (currentlyPlacing != null) {
            this.removeEventListener(Event.ENTER_FRAME, onRender);
            this.removeChild(currentlyPlacing.sprite);
            currentlyPlacing.posX = parentStage.mouseX + cameraPosX;
            currentlyPlacing.posY = parentStage.mouseY + cameraPosY;
            gameData.addItem(currentlyPlacing);
            currentlyPlacing = null;
            parentStage.removeChild(this);
        }
    }

    public function onRender(e) {
        if (currentlyPlacing != null) {
            CameraUtils.checkIfSpriteExists(currentlyPlacing.sprite, this);
            currentlyPlacing.sprite.x = parentStage.mouseX;
            currentlyPlacing.sprite.y = parentStage.mouseY;
        }
    }

    public function updateCamera(e:CameraEvent) {
        cameraPosX = e.X;
        cameraPosY = e.Y;
    }
}