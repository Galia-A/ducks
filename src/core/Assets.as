package core {
import flash.display.Bitmap;
import flash.media.Sound;
import flash.media.SoundTransform;

/**
 * Assets Class
 *
 * Embed graphics and sounds for the game
 */

public class Assets {

    // Target graphic //

    //option 1: Apple
    public static var foodImg:Bitmap;

    //option 2: Grapes
    public static var snakeBodyBitmap:Class;
    public static var snakeHeadImg:Bitmap;


    // Snake body graphic //

    //option 1: square
    public static var bgImg:Bitmap;

    //option 2: ducks
    public static var borderTileBitmap:Class;
    public static var startScreenBitmap:Bitmap;

    // Snake head graphic //

    //option 1: square
    public static var playButtonBitmap:Bitmap;

    //option 2: duck with a crown
    public static var gameOverScreenBitmap:Bitmap;
    public static var tryAgainButtonBitmap:Bitmap;

    // Background graphic //

    //sea image
    public static var pickup:Sound;
    public static var gameOver:Sound;

    // Border graphics //

    //option 1: bricks
    [Embed(source="../../assets/apple.png")]
    private static var appleBitmap:Class;

    //option 2: reed
    [Embed(source="../../assets/grapes.png")]
    private static var grapesBitmap:Class;
    [Embed(source="../../assets/snakeBody.jpg")]
    private static var squareBody:Class;

    // Start Screen //
    //background
    [Embed(source="../../assets/duckRight.png")]
    private static var duckBody:Class;
    [Embed(source="../../assets/snakeHead.jpg")]
    private static var squareHeadBitmap:Class;
    //play button
    [Embed(source="../../assets/kingDuckRight.png")]
    private static var duckHeadBitmap:Class;
    [Embed(source="../../assets/gameBackground.jpg")]
    private static var bgBitmap:Class;

    // Game over screen //
    //background
    [Embed(source="../../assets/brick.jpg")]
    private static var brickBitmap:Class;
    [Embed(source="../../assets/reed.png")]
    private static var reedBitmap:Class;
    //play button
    [Embed(source="../../assets/startScreen.png")]
    private static var startScreen:Class;
    [Embed(source="../../assets/playButton.png")]
    private static var playButton:Class;


    // Sound effects //

    //pick the target
    [Embed(source="../../assets/gameOver.png")]
    private static var gameOverScreen:Class;
    [Embed(source="../../assets/tryAgainButton.png")]
    private static var tryAgainButton:Class;
    //game over
    [Embed(source="../../assets/pickup.mp3")]
    private static var pickupSound:Class;
    [Embed(source="../../assets/squeak.mp3")]
    private static var gameOverSound:Class;

    public static function init():void {
        //set body graphics to the duck
        snakeBodyBitmap = duckBody;

        //set target graphics to the grapes
        foodImg = new grapesBitmap() as Bitmap;

        //set head graphics to the duck
        snakeHeadImg = new duckHeadBitmap() as Bitmap;

        //set background graphics
        bgImg = new bgBitmap() as Bitmap;
        //border graphics
        borderTileBitmap = reedBitmap;

        // start screen //
        //background
        startScreenBitmap = new startScreen() as Bitmap;
        //button
        playButtonBitmap = new playButton() as Bitmap;

        //game over screen
        gameOverScreenBitmap = new gameOverScreen() as Bitmap;
        //button
        tryAgainButtonBitmap = new tryAgainButton() as Bitmap;

        // Sound effects //

        //pick the target
        pickup = new pickupSound();
        //game over
        gameOver = new gameOverSound();

        // Load sound in advance so there's no loading time when actually needing it
        pickup.play(0, 0, new SoundTransform(0));
        gameOver.play(0, 0, new SoundTransform(0));

    }

}
}