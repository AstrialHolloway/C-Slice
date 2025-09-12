// Script by AstroDev, if modifying please have a basic understanding of haxe!

import funkin.savedata.FunkinSave;

import data.GlobalVars;

var currentCharacter = char;

var freeplayData = CoolUtil.parseJson("data/registry/freeplay/"+currentCharacter+".json");

trace("loading "+char+"'s freeplay menu");

static var freeplayIndex = 0;

static var freeplayDiffIndex = 1;

static var erectMode = false;

static var remix = false;

var uiOffset = -14;

var freeplaySongData:FunkinSave;

var curScore;

var curAccuracy;




//Assets

//BG

var cardGlowSprite:FunkinSprite = new FunkinSprite(-10, -25 + uiOffset);
cardGlowSprite.loadGraphic(Paths.image("menus/freeplay/pinkBack"));
cardGlowSprite.color = Std.parseInt(freeplayData.bgCardColor);
cardGlowSprite.scale.set(2, 2);
add(cardGlowSprite);


var textLines:Array<{text:String, font:String, size:Int, color:FlxColor, speed:Float, y:Int, direction:Int}> = [
    { text: freeplayData.backingText.line1.text, font: freeplayData.backingText.line1.font, size: freeplayData.backingText.line1.size, color: Std.parseInt(freeplayData.backingText.line1.color), speed: Std.parseInt(freeplayData.backingText.line1.speed), y: Std.parseInt(freeplayData.backingText.line1.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line1.direction) },
    { text: freeplayData.backingText.line2.text, font: freeplayData.backingText.line2.font, size: freeplayData.backingText.line2.size, color: Std.parseInt(freeplayData.backingText.line2.color), speed: Std.parseInt(freeplayData.backingText.line2.speed), y: Std.parseInt(freeplayData.backingText.line2.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line2.direction) },
    { text: freeplayData.backingText.line3.text, font: freeplayData.backingText.line3.font, size: freeplayData.backingText.line3.size, color: Std.parseInt(freeplayData.backingText.line3.color), speed: Std.parseInt(freeplayData.backingText.line3.speed), y: Std.parseInt(freeplayData.backingText.line3.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line3.direction) },
    { text: freeplayData.backingText.line4.text, font: freeplayData.backingText.line4.font, size: freeplayData.backingText.line4.size, color: Std.parseInt(freeplayData.backingText.line4.color), speed: Std.parseInt(freeplayData.backingText.line4.speed), y: Std.parseInt(freeplayData.backingText.line4.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line4.direction) },
    { text: freeplayData.backingText.line5.text, font: freeplayData.backingText.line5.font, size: freeplayData.backingText.line5.size, color: Std.parseInt(freeplayData.backingText.line5.color), speed: Std.parseInt(freeplayData.backingText.line5.speed), y: Std.parseInt(freeplayData.backingText.line5.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line5.direction) },
    { text: freeplayData.backingText.line6.text, font: freeplayData.backingText.line6.font, size: freeplayData.backingText.line6.size, color: Std.parseInt(freeplayData.backingText.line6.color), speed: Std.parseInt(freeplayData.backingText.line6.speed), y: Std.parseInt(freeplayData.backingText.line6.y) + uiOffset, direction: Std.parseInt(freeplayData.backingText.line6.direction) }
];

var loopTexts:Array<Array<FlxText>> = [];
var lineSpeeds:Array<Float> = [];
var lineDirs:Array<Int> = [];

for (line in 0...textLines.length)
{
    var lineData = textLines[line];

    // Measure width with this font + size
    var measure:FlxText = new FlxText(0, 0, 0, lineData.text, lineData.size);
    measure.setFormat(Paths.font(lineData.font), lineData.size, lineData.color);
    var textWidth:Float = measure.width;
    remove(measure);

    var repeats:Int = Math.ceil(FlxG.width / textWidth) + 2;
    var lineTexts:Array<FlxText> = [];

    for (i in 0...repeats)
    {
        var txt:FlxText = new FlxText(i * textWidth, lineData.y, 0, lineData.text, lineData.size);
        txt.setFormat(Paths.font(lineData.font), lineData.size, lineData.color);
        add(txt);
        lineTexts.push(txt);
    }

    loopTexts.push(lineTexts);
    lineSpeeds.push(lineData.speed);
    lineDirs.push(lineData.direction);
}


var dadSprite:FunkinSprite = new FunkinSprite(556, 115 + uiOffset);
dadSprite.loadGraphic(Paths.image("menus/freeplay/"+freeplayData.bgSprite));
dadSprite.scale.set(1.4, 1.4);
add(dadSprite);

var arrowLeftDiff:FunkinSprite = new FunkinSprite(20,70 + uiOffset);
arrowLeftDiff.frames = Paths.getSparrowAtlas("menus/freeplay/freeplaySelector/"+freeplayData.arrowSprite);
arrowLeftDiff.animation.addByPrefix("Loop", "arrow pointer loop", 24, true);
arrowLeftDiff.animation.play("Loop");
add(arrowLeftDiff);

var arrowRightDiff:FunkinSprite = new FunkinSprite(325,70 + uiOffset);
arrowRightDiff.frames = Paths.getSparrowAtlas("menus/freeplay/freeplaySelector/"+freeplayData.arrowSprite);
arrowRightDiff.animation.addByPrefix("Loop", "arrow pointer loop", 24, true);
arrowRightDiff.animation.play("Loop");
arrowRightDiff.origin.set(arrowRightDiff.width / 2, arrowRightDiff.height / 2);
arrowRightDiff.scale.x = -1;
add(arrowRightDiff);

dj = new FunkinSprite(freeplayData.dj.position[0]-15, freeplayData.dj.position[1]+10);
dj.loadSprite(Paths.image("menus/freeplay/djs/" + freeplayData.dj.assetPath));
dj.animation.addByPrefix('intro', freeplayData.dj.animations.intro.prefix, freeplayData.dj.animations.intro.frameRate, freeplayData.dj.animations.intro.looping);
dj.animation.addByPrefix('idle', freeplayData.dj.animations.idle.prefix, freeplayData.dj.animations.idle.frameRate,freeplayData.dj.animations.idle.looping);
dj.animation.addByPrefix('exit', freeplayData.dj.animations.exit.prefix, freeplayData.dj.animations.exit.frameRate, freeplayData.dj.animations.exit.looping);
dj.animation.addByPrefix('confirm', freeplayData.dj.animations.confirm.prefix, freeplayData.dj.animations.confirm.frameRate, freeplayData.dj.animations.confirm.looping);
dj.addOffset('idle', -freeplayData.dj.animations.idle.offsets[0], -freeplayData.dj.animations.idle.offsets[1]);
dj.addOffset('exit', -freeplayData.dj.animations.exit.offsets[0], -freeplayData.dj.animations.exit.offsets[1]);
dj.addOffset('intro', -freeplayData.dj.animations.intro.offsets[0], -freeplayData.dj.animations.intro.offsets[1]);
dj.addOffset('confirm', -freeplayData.dj.animations.confirm.offsets[0], -freeplayData.dj.animations.confirm.offsets[1]);
dj.antialiasing = true;
dj.updateHitbox();
dj.playAnim('idle', true);
add(dj);

// -------------------------
// capsules
// -------------------------

var cardList:Array<String> = [
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule",
    "freeplayCapsule", "freeplayCapsule", "freeplayCapsule"
];

var songTags:Array<FunkinSprite> = [];

var startX:Float = 30; // where the column starts
var startY:Float = 100;  // where the center (selected) card should be
var spacing:Float = 120; // vertical spacing between each
var scrollSpeed:Float = 6; // how fast it eases

for (i in 0...cardList.length) {
    var tag:FunkinSprite = new FunkinSprite(startX, startY + (i * spacing));
    tag.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/" + cardList[i]);
    tag.animation.addByPrefix("sel", "sel", 24, false);
    tag.animation.addByPrefix("basic", "basic", 24, false);
    tag.animation.play("basic");
    tag.antialiasing = true;
    tag.scale.set(0.8, 0.8);
    add(tag);

    songTags.push(tag);
}

// -------------------------
// Top
// -------------------------

var blackSprite:FunkinSprite = new FunkinSprite(0, 0);
blackSprite.loadGraphic(Paths.image("menus/freeplay/black"));
blackSprite.scale.set(FlxG.width*2, 100);
add(blackSprite);

var characterSelectLabel = new FlxText(300, 5, 1000, "Press [ TAB ] to change characters", 10);
characterSelectLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(characterSelectLabel);

// Fade loop
FlxTween.tween(characterSelectLabel, {alpha: 0.3}, 1.6, {
    type: FlxTween.PINGPONG, // goes back and forth (fade in/out)
    ease: FlxEase.sineInOut   // smooth curve
});
var freeplayTextSprite:FunkinSprite = new FunkinSprite(-142, -19);
freeplayTextSprite.loadGraphic(Paths.image("menus/freeplay/freeplayText"));
freeplayTextSprite.scale.set(0.415,0.415);
add(freeplayTextSprite);

var officalostTextSprite:FunkinSprite = new FunkinSprite(703, -19);
officalostTextSprite.loadGraphic(Paths.image("menus/freeplay/officalostText"));
officalostTextSprite.scale.set(0.415,0.415);
add(officalostTextSprite);

// -------------------------
// clearBox
// -------------------------

var clearBoxSprite:FunkinSprite = new FunkinSprite(1165, 65 + uiOffset);
clearBoxSprite.loadGraphic(Paths.image("menus/freeplay/clearBox"));
clearBoxSprite.scale.set(1, 1);
add(clearBoxSprite);

// -------------------------
// highscore
// -------------------------

var highscoreSprite:FunkinSprite = new FunkinSprite(860, 70 + uiOffset);
highscoreSprite.frames = Paths.getSparrowAtlas("menus/freeplay/highscore");
highscoreSprite.animation.addByPrefix("Idle", "highscore small instance 1", 24, false);
highscoreSprite.animation.play("Idle");
highscoreSprite.scale.set(1, 1);
add(highscoreSprite);

// -------------------------
// score display
// -------------------------

// 1000000s

var scoreMilSprite:FunkinSprite = new FunkinSprite(885, 60 + uiOffset);
scoreMilSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreMilSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreMilSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreMilSprite.animation.play("0");
scoreMilSprite.scale.set(0.40, 0.4);
add(scoreMilSprite);

// 1000s

var scoreHundThouSprite:FunkinSprite = new FunkinSprite(930, 60 + uiOffset);
scoreHundThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreHundThouSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreHundThouSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreHundThouSprite.animation.play("0");
scoreHundThouSprite.scale.set(0.40, 0.4);
add(scoreHundThouSprite);

var scoreTenThouSprite:FunkinSprite = new FunkinSprite(975, 60 + uiOffset);
scoreTenThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreTenThouSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreTenThouSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreTenThouSprite.animation.play("0");
scoreTenThouSprite.scale.set(0.40, 0.4);
add(scoreTenThouSprite);

var scoreOneThouSprite:FunkinSprite = new FunkinSprite(1020, 60 + uiOffset);
scoreOneThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreOneThouSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreOneThouSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreOneThouSprite.animation.play("0");
scoreOneThouSprite.scale.set(0.40, 0.4);
add(scoreOneThouSprite);

// 100s

var scoreHundSprite:FunkinSprite = new FunkinSprite(1065, 60 + uiOffset);
scoreHundSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreHundSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreHundSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreHundSprite.animation.play("0");
scoreHundSprite.scale.set(0.40, 0.4);
add(scoreHundSprite);

var scoreTenSprite:FunkinSprite = new FunkinSprite(1110, 60 + uiOffset);
scoreTenSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreTenSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreTenSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreTenSprite.animation.play("0");
scoreTenSprite.scale.set(0.40, 0.4);
add(scoreTenSprite);

var scoreOneSprite:FunkinSprite = new FunkinSprite(1155, 60 + uiOffset);
scoreOneSprite.frames = Paths.getSparrowAtlas("menus/freeplay/"+freeplayData.digitalSprite);
scoreOneSprite.animation.addByPrefix("0", "ZERO DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("1", "ONE DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("2", "TWO DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("3", "THREE DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("4", "FOUR DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("5", "FIVE DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("6", "SIX DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("7", "SEVEN DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("8", "EIGHT DIGITAL0004", 0, false);
scoreOneSprite.animation.addByPrefix("9", "NINE DIGITAL0004", 0, false);
scoreOneSprite.animation.play("0");
scoreOneSprite.scale.set(0.40, 0.4);
add(scoreOneSprite);

// -------------------------
// Accuracy
// -------------------------

var accuracyOnesSprite:FunkinSprite = new FunkinSprite(1209, 86 + uiOffset);
accuracyOnesSprite.frames = Paths.getSparrowAtlas("menus/freeplay/freeplay-clear");
accuracyOnesSprite.animation.addByPrefix("zero", "0", 24, false);
accuracyOnesSprite.animation.addByPrefix("one", "1", 24, false);
accuracyOnesSprite.animation.addByPrefix("two", "2", 24, false);
accuracyOnesSprite.animation.addByPrefix("three", "3", 24, false);
accuracyOnesSprite.animation.addByPrefix("four", "4", 24, false);
accuracyOnesSprite.animation.addByPrefix("five", "5", 24, false);
accuracyOnesSprite.animation.addByPrefix("six", "6", 24, false);
accuracyOnesSprite.animation.addByPrefix("sexen", "7", 24, false);
accuracyOnesSprite.animation.addByPrefix("eight", "8", 24, false);
accuracyOnesSprite.animation.addByPrefix("nine", "9", 24, false);
accuracyOnesSprite.animation.play("zero");
accuracyOnesSprite.scale.set(1,1);
add(accuracyOnesSprite);

var accuracyTensSprite:FunkinSprite = new FunkinSprite(1183, 86 + uiOffset);
accuracyTensSprite.frames = Paths.getSparrowAtlas("menus/freeplay/freeplay-clear");
accuracyTensSprite.animation.addByPrefix("zero", "0", 24, false);
accuracyTensSprite.animation.addByPrefix("one", "1", 24, false);
accuracyTensSprite.animation.addByPrefix("two", "2", 24, false);
accuracyTensSprite.animation.addByPrefix("three", "3", 24, false);
accuracyTensSprite.animation.addByPrefix("four", "4", 24, false);
accuracyTensSprite.animation.addByPrefix("five", "5", 24, false);
accuracyTensSprite.animation.addByPrefix("six", "6", 24, false);
accuracyTensSprite.animation.addByPrefix("sexen", "7", 24, false);
accuracyTensSprite.animation.addByPrefix("eight", "8", 24, false);
accuracyTensSprite.animation.addByPrefix("nine", "9", 24, false);
accuracyTensSprite.animation.play("zero");
accuracyTensSprite.scale.set(1,1);
add(accuracyTensSprite);

var accuracyHundsSprite:FunkinSprite = new FunkinSprite(1172, 86 + uiOffset);
accuracyHundsSprite.frames = Paths.getSparrowAtlas("menus/freeplay/freeplay-clear");
accuracyHundsSprite.animation.addByPrefix("one", "1", 24, false);
accuracyHundsSprite.animation.play("one");
accuracyHundsSprite.scale.set(1,1);
add(accuracyHundsSprite);

new FlxTimer().start(20, function(tmr:FlxTimer)
{
    highscoreSprite.animation.play("Idle");
}, 0);

var elapsedShitIdfk;

function update(elapsed:Float)
{
    handleBackingText();
    scoreHandler();
    accuracyHandler();
    handleInputs();
    elapsedShitIdfk = elapsed;
}

function handleBackingText()
{
    for (line in 0...loopTexts.length)
    {
        var lineTexts = loopTexts[line];
        var speed = lineSpeeds[line];
        var dir = lineDirs[line];

        for (txt in lineTexts)
        {
            txt.x -= speed * dir * elapsedShitIdfk;

            if (dir == 1)
            {
                if (txt.x + txt.width < 0)
                {
                    var rightMost:Float = 0;
                    for (t in lineTexts)
                        if (t.x > rightMost) rightMost = t.x;

                    txt.x = rightMost + txt.width;
                }
            }
            else
            {
                if (txt.x > FlxG.width)
                {
                    var leftMost:Float = FlxG.width;
                    for (t in lineTexts)
                        if (t.x < leftMost) leftMost = t.x;

                    txt.x = leftMost - txt.width;
                }
            }
        }
    }
}

function updateScoreDisplay(score:Int)
{
    // Pad the score to always be 7 digits long ("0000123")
    var padded:String = StringTools.lpad(Std.string(score), "0", 7);

    // Each digit
    var mil = Std.parseInt(padded.charAt(0)); // 1,000,000s
    var hundThou = Std.parseInt(padded.charAt(1)); // 100,000s
    var tenThou = Std.parseInt(padded.charAt(2)); // 10,000s
    var oneThou = Std.parseInt(padded.charAt(3)); // 1,000s
    var hund = Std.parseInt(padded.charAt(4)); // 100s
    var ten = Std.parseInt(padded.charAt(5)); // 10s
    var one = Std.parseInt(padded.charAt(6)); // 1s

    // Update sprites
    scoreMilSprite.animation.play(Std.string(mil));
    scoreHundThouSprite.animation.play(Std.string(hundThou));
    scoreTenThouSprite.animation.play(Std.string(tenThou));
    scoreOneThouSprite.animation.play(Std.string(oneThou));
    scoreHundSprite.animation.play(Std.string(hund));
    scoreTenSprite.animation.play(Std.string(ten));
    scoreOneSprite.animation.play(Std.string(one));
}

function scoreHandler()
{  
    freeplaySongData = FunkinSave.getSongHighscore("bopeebo", "hard");

    curScore = freeplaySongData.score;

    updateScoreDisplay(curScore);
}

function updateAccuracyDisplay(curAccuracy:Int)
{
    // Clamp between 0 and 100 just in case
    curAccuracy = Std.int(Math.min(100, Math.max(0, curAccuracy)));

    // Get digits
    var ones:Int = curAccuracy % 10;
    var tens:Int = Std.int((curAccuracy / 10) % 10);
    var hunds:Int = Std.int(curAccuracy / 100);

    // --- Ones place ---
    switch (ones)
    {
        case 0: accuracyOnesSprite.animation.play("zero");
        case 1: accuracyOnesSprite.animation.play("one");
        case 2: accuracyOnesSprite.animation.play("two");
        case 3: accuracyOnesSprite.animation.play("three");
        case 4: accuracyOnesSprite.animation.play("four");
        case 5: accuracyOnesSprite.animation.play("five");
        case 6: accuracyOnesSprite.animation.play("six");
        case 7: accuracyOnesSprite.animation.play("sexen"); // typo in your atlas
        case 8: accuracyOnesSprite.animation.play("eight");
        case 9: accuracyOnesSprite.animation.play("nine");
    }

    // --- Tens place ---
    if (curAccuracy < 10)
    {
        accuracyTensSprite.visible = false;
    }
    else
    {
        accuracyTensSprite.visible = true;
        switch (tens)
        {
            case 0: accuracyTensSprite.animation.play("zero");
            case 1: accuracyTensSprite.animation.play("one");
            case 2: accuracyTensSprite.animation.play("two");
            case 3: accuracyTensSprite.animation.play("three");
            case 4: accuracyTensSprite.animation.play("four");
            case 5: accuracyTensSprite.animation.play("five");
            case 6: accuracyTensSprite.animation.play("six");
            case 7: accuracyTensSprite.animation.play("sexen");
            case 8: accuracyTensSprite.animation.play("eight");
            case 9: accuracyTensSprite.animation.play("nine");
        }
    }

    // --- Hundreds place ---
    if (curAccuracy < 100)
    {
        accuracyHundsSprite.visible = false;
    }
    else
    {
        accuracyHundsSprite.visible = true;
        accuracyHundsSprite.animation.play("one"); // only 100 possible
    }
}

function accuracyHandler()
{
    if (erectMode == false)
    {
        if (remix == false)
        {
            freeplaySongData = FunkinSave.getSongHighscore("bopeebo", "hard");

            curAccuracy = FlxMath.roundDecimal(freeplaySongData.accuracy * 100, 0);
        }
        else
        {
            freeplaySongData = FunkinSave.getSongHighscore("darnell", "hard", "bf");

            curAccuracy = FlxMath.roundDecimal(freeplaySongData.accuracy * 100, 0);
        }
        
        if (curAccuracy > 9)
        {
            accuracyTensSprite.visible = true;
        }
        else
        {
            accuracyTensSprite.visible = false;
        }
        if (curAccuracy == 100)
        {
            accuracyHundsSprite.visible = true;
        }
        else
        {
            accuracyHundsSprite.visible = false;
        }
        updateAccuracyDisplay(curAccuracy);
        
    }

    if (erectMode == true)
    {
        freeplaySongData = FunkinSave.getSongHighscore("bopeebo", "nightmare", "erect");

        curAccuracy = FlxMath.roundDecimal(freeplaySongData.accuracy * 100, 0);
        
        if (curAccuracy > 9)
        {
            accuracyTensSprite.visible = true;
        }
        else
        {
            accuracyTensSprite.visible = false;
        }
        if (curAccuracy == 100)
        {
            accuracyHundsSprite.visible = true;
        }
        else
        {
            accuracyHundsSprite.visible = false;
        }
        updateAccuracyDisplay(curAccuracy);
        
    }


}

function handleInputs()
{
    // --- Handle controls
    if (controls.UP_P) {
        freeplayIndex--;
        if (freeplayIndex < 0)
        {
            freeplayIndex = cardList.length-1;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
    }
    if (controls.DOWN_P) {
        freeplayIndex++;
        if (freeplayIndex > cardList.length-1)
        {
            freeplayIndex = 0;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
    }

    // --- Smooth scroll positions
    for (i in 0...songTags.length) {
        var targetY:Float = startY + ((i - freeplayIndex) * spacing);
        songTags[i].y = FlxMath.lerp(songTags[i].y, targetY, scrollSpeed * elapsedShitIdfk);

        // scale values
        var smallScale:Float = 0.7;   // not selected
        var baseScale:Float = 0.8;   // default
        var selectedScale:Float = 0.9; // selected

        // anchor scaling to left edge
        songTags[i].origin.set(0, songTags[i].origin.y);

        if (i == freeplayIndex) {
            // selected card: grow bigger
            songTags[i].scale.set(
                FlxMath.lerp(songTags[i].scale.x, selectedScale, 10 * elapsedShitIdfk),
                FlxMath.lerp(songTags[i].scale.y, selectedScale, 10 * elapsedShitIdfk)
            );
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 1.0, 10 * elapsedShitIdfk);
        } else {
            // non-selected: shrink a little
            songTags[i].scale.set(
                FlxMath.lerp(songTags[i].scale.x, smallScale, 10 * elapsedShitIdfk),
                FlxMath.lerp(songTags[i].scale.y, smallScale, 10 * elapsedShitIdfk)
            );
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 0.4, 10 * elapsedShitIdfk);
        }

        // keep left aligned
        songTags[i].x = startX;
    } 
    if (controls.BACK)
    {
        FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
        new FlxTimer().start(0.8, function(tmr:FlxTimer)
        {
            FlxG.switchState(new MainMenuState());
        });
    }
}