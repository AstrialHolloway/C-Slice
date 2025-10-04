

class LilBuddy extends flixel.FlxSprite {
    public var isPlayer:Bool;
    public var yOffset = -51;
    public function new(isPlayer:Bool = false, ?yOffset:Float = -60)
    {
        this.yOffset = yOffset;
        this.isPlayer = isPlayer;
        super(0,0);
        loadGraphic(Paths.image(this.isPlayer ? "lilBf" : "lilOpp"), true, 300, 256);
        animation.add("idle", [0, 1], 12, true);
		animation.add("0", [3, 4, 5], 12, false);
		animation.add("1", [6, 7, 8], 12, false);
		animation.add("2", [9, 10, 11], 12, false);
		animation.add("3", [12, 13, 14], 12, false);
        animation.finishCallback = function(name:String){
			animation.play(name, true, false, animation.getByName(name).numFrames - 2);
		}
		animation.play("idle");
    }
}