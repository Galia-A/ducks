package interfaces {
/**
 * IState interface
 *
 * Declaires functions for controlling the game states
 */
public interface IState {
    function init():void;

    function destroy():void;
}
}