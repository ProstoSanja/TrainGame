package game.camera;

import openfl.events.MouseEvent;
import game.GameData;
import openfl.events.Event;

import openfl.display.Stage;
import openfl.display.Sprite;

class CameraBase extends Sprite {

    private var canvasWidth:Float = 0;
    private var canvasHeight:Float = 0;

    private var cameraPosX:Float = 0;
    private var cameraPosY:Float = 0;
    private var currentlyDraggingCamera = false;
    private var mousePosX:Float = 0;
    private var mousePosY:Float = 0;

    private var gameData:GameData;

    public function new(stage:Stage, data:GameData) {
        super();
        this.gameData = data;

		this.graphics.beginFill(0xf5f5f5);
		this.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        this.graphics.endFill();

        stage.addEventListener(Event.RESIZE, windowResized);
        
		this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, startCameraMove);
        this.addEventListener(MouseEvent.RIGHT_MOUSE_UP, stopCameraMove);
        this.addEventListener(Event.ENTER_FRAME, render);
        
    }

    public function windowResized(e) {
        canvasWidth = stage.stageWidth;
        canvasHeight = stage.stageHeight;

        //TODO: we need to recreate eentire canvas
    }

    public function startCameraMove(e) {
        currentlyDraggingCamera = true;
        mousePosX = stage.mouseX;
        mousePosY = stage.mouseY;
    }

    public function stopCameraMove(e) {
        currentlyDraggingCamera = false;
    }

    public function render(e) {
        if (currentlyDraggingCamera) {
            cameraPosX -= stage.mouseX - mousePosX;
            cameraPosY -= stage.mouseY - mousePosY;
            mousePosX = stage.mouseX;
            mousePosY = stage.mouseY;
            gameData.reRenderAll();
            stage.dispatchEvent(new CameraEvent(cameraPosX, cameraPosY));
        }
        for (item in gameData.getItemsToRender(cameraPosX,cameraPosY,canvasWidth,canvasHeight)) {
            CameraUtils.checkIfSpriteExists(item.sprite, this);
            item.sprite.x = item.posX - cameraPosX;
            item.sprite.y = item.posY - cameraPosY;
            item.rendered = true;
        }
    }

}