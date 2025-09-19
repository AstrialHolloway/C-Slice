// oh my god I need to clean this up lmao


import funkin.savedata.FunkinSave;

import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.addons.util.FlxSimplex;
import funkin.backend.MusicBeatState;

import data.GlobalVars;

trace(char);

FunkinSave.load();

var saveData:FunkinSave;

var allowDebug = FlxG.save.data.devAccess;

trace(allowDebug);

var curAccuracy = 0;

var curScore = 0;

var remix = false;

var addonthing = "";

var debugthingy = true;

var erectMode = false;

var index = 1;

var indexErect = 1;

var diff = 1;

var songStarted = false;

var basicRand = 1;

var erectRand = 1;

var devmode = false;

var uiOffset = -14;

var iconSprite:FunkinSprite;




// -------------------------
// songs
// -------------------------

var songList:Array<String> =
[
    "random",
    "tutorial", 
    "bopeebo", 
    "fresh", 
    "dadbattle", 
    "spookeez", 
    "south", 
    "monster", 
    "pico",
    "philly nice",
    "blammed",
    "satin panties",
    "high",
    "milf",
    "cocoa",
    "eggnog",
    "winter horrorland",
    "senpai",
    "roses",
    "thorns",
    "ugh",
    "guns",
    "stress",
    "darnell",
    "lit-up"//,
    //add extra songs below (put a comma after each one exept the last)
];

var songErectList:Array<String> =
[
    "random",
    "bopeebo", 
    "fresh", 
    "dadbattle", 
    "spookeez", 
    "south",  
    "pico",
    "philly nice",
    "blammed",
    "satin panties",
    "high",
    "cocoa",
    "eggnog",
    "senpai",
    "roses",
    "thorns",
    "ugh"
];

// -------------------------
// song OSTs
// -------------------------

var songOSTList:Array<String> =
[
    "random",
    "volume1", 
    "volume1", 
    "volume1", 
    "volume1", 
    "volume1", 
    "volume1", 
    "volume1", 
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume1",
    "volume2-alt",
    "volume2-alt",
    "volume2-alt",
    "volume2",
    "volume2",
    "volume2",
    "volume4",
    "expansion2"//,
    //add extra volumes below (put a comma after each one exept the last)
];

var songErectOSTList:Array<String> =
[
    "random",
    "volume3", 
    "volume3", 
    "volume3", 
    "volume3", 
    "volume3",  
    "volume3",
    "volume3",
    "volume3",
    "expansion1",
    "volume3",
    "volume4",
    "expansion1",
    "volume3",
    "volume3",
    "volume3",
    "volume4"
];

// -------------------------
// song diffs
// -------------------------

var songDiffEasyList:Array<String> =
[
    //Random
    "0",
    //Tutorial
    "0", 
    //week1
    "1", 
    "1", 
    "1", 
    //week2
    "1", 
    "1", 
    "1", 
    //week3
    "1",
    "1",
    "1",
    //week4
    "1",
    "1",
    "2",
    //week5
    "1",
    "1",
    "1",
    //week6
    "1",
    "2",
    "2",
    //week7
    "2",
    "3",
    "3",
    //weekend1
    "3",
    "4"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffNormList:Array<String> =
[
    //Random
    "0",
    //Tutorial
    "0", 
    //week1
    "1", 
    "1", 
    "2", 
    //week2
    "1", 
    "2", 
    "2", 
    //week3
    "2",
    "2",
    "2",
    //week4
    "2",
    "2",
    "3",
    //week5
    "2",
    "2",
    "2",
    //week6
    "2",
    "3",
    "3",
    //week7
    "3",
    "4",
    "4",
    //weekend1
    "4",
    "5"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffHardList:Array<String> =
[
    //Random
    "0",
    //Tutorial
    "1", 
    //week1
    "2", 
    "2", 
    "3", 
    //week2
    "2", 
    "2", 
    "2", 
    //week3
    "2",
    "3",
    "3",
    //week4
    "2",
    "3",
    "4",
    //week5
    "2",
    "3",
    "2",
    //week6
    "3",
    "4",
    "4",
    //week7
    "4",
    "5",
    "5",
    //weekend1
    "5",
    "6"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffErectList:Array<String> =
[
    "0",
    //week1
    "7", 
    "6", 
    "9", 
    //week2
    "11", 
    "8",  
    //week3
    "9",
    "8",
    "11",
    //week4
    "11",
    "8",
    //week5
    "7",
    "6",
    //week6
    "6",
    "8",
    "9",
    //week7
    "8"
];

var songDiffNightList:Array<String> =
[
    "0",
    //week1
    "8", 
    "7", 
    "10", 
    //week2
    "12", 
    "9",  
    //week3
    "10",
    "9",
    "12",
    //week4
    "12",
    "9",
    //week5
    "8",
    "7",
    //week6
    "7",
    "9",
    "10",
    //week7
    "9"
];

// -------------------------
// display lists
// -------------------------

var displayList:Array<String> =
[
    "Random",
    "Tutorial", 
    "Bopeebo", 
    "Fresh", 
    "DadBattle", 
    "Spookeez", 
    "South",
    "Monster",
    "Pico",
    "Philly Nice",
    "Blammed",
    "Satin Panties",
    "High",
    "M.I.L.F.",
    "  Cocoa",
    "  Eggnog",
    "Winter Horrorland",
    "Senpai",
    "Roses",
    "Thorns",
    "Ugh",
    "Guns",
    "Stress",
    "Darnell (BF MIX)",
    "Lit-Up (BF MIX)"//,
    //add extra song display names below (put a comma after each one exept the last)
];

var displayErectList:Array<String> =
[
    "Random", 
    "Bopeebo Erect", 
    "Fresh Erect", 
    "DadBattle Erect", 
    "Spookeez Erect", 
    "South Erect",
    "Pico Erect",
    "Philly Nice Erect",
    "Blammed Erect",
    "Satin Panties Erect",
    "High Erect",
    "  Cocoa Erect",
    "  Eggnog Erect",
    "Senpai Erect",
    "Roses Erect",
    "Thorns Erect",
    "Ugh Erect"
];

// -------------------------
// week lists
// -------------------------

var weekList:Array<String> = 
[
    "0",
    "0", 
    "1", 
    "1", 
    "1", 
    "2", 
    "2", 
    "2",
    "3",
    "3",
    "3",
    "4",
    "4",
    "4",
    "5",
    "5",
    "5",
    "6",
    "6",
    "6",
    "7",
    "7",
    "7",
    "1",
    "1"//,
    //add extra week numbers below (put a comma after each one exept the last)
];

var weekErectList:Array<String> = 
[
    "0", 
    "1", 
    "1", 
    "1", 
    "2",
    "2",
    "3",
    "3",
    "3",
    "4",
    "4",
    "5",
    "5",
    "6",
    "6",
    "6",
    "7"//,
    //add extra week numbers below (put a comma after each one exept the last)
];

// -------------------------
// bpm lists
// -------------------------

var bpmList:Array<String> = 
[
    "145",
    "100",
    "100",
    "120",
    "180",
    "150",
    "165",
    "95",
    "150",
    "175",
    "165",
    "110",
    "125",
    "180",
    "100",
    "150",
    "159",
    "144",
    "120",
    "190",
    "160",
    "185",
    "178",
    "155",
    "175"//,
    //add extra song bpms below (put a comma after each one exept the last)
];

var bpmErectList:Array<String> = 
[
    "145",
    "123",
    "125",
    "190",
    "166",
    "177",
    "162",
    "170",
    "135",
    "125",
    "175",
    "174",
    "140",
    "158",
    "128",
    "190",
    "170"//,
    //add extra erect song bpms below (put a comma after each one exept the last)
];

// -------------------------
// icons
// -------------------------

var icons:Array<String> = 
[
    "menus/freeplay/icons/randompixel",
    "menus/freeplay/icons/gfpixel", 
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/spookypixel",
    "menus/freeplay/icons/spookypixel",
    "menus/freeplay/icons/monsterpixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/mompixel",
    "menus/freeplay/icons/mompixel",
    "menus/freeplay/icons/mompixel",
    "menus/freeplay/icons/parentspixel",
    "menus/freeplay/icons/parentspixel",
    "menus/freeplay/icons/monsterpixel",
    "menus/freeplay/icons/senpai-pixelpixel",
    "menus/freeplay/icons/senpai-pixelpixel",
    "menus/freeplay/icons/spirit-pixelpixel",
    "menus/freeplay/icons/tankmanpixel",
    "menus/freeplay/icons/tankmanpixel",
    "menus/freeplay/icons/tankmanpixel",
    "menus/freeplay/icons/darnellpixel",
    "menus/freeplay/icons/darnellpixel"//,
    //add extra icons below (put a comma after each one exept the last)
];

var iconsErect:Array<String> = 
[    
    "menus/freeplay/icons/randompixel",
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/dadpixel", 
    "menus/freeplay/icons/spookypixel",
    "menus/freeplay/icons/spookypixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/picopixel",
    "menus/freeplay/icons/mompixel",
    "menus/freeplay/icons/mompixel",
    "menus/freeplay/icons/parentspixel",
    "menus/freeplay/icons/parentspixel",
    "menus/freeplay/icons/senpai-pixelpixel",
    "menus/freeplay/icons/senpai-pixelpixel",
    "menus/freeplay/icons/spirit-pixelpixel",
    "menus/freeplay/icons/tankmanpixel"//,
    //add extra erect icons below (put a comma after each one exept the last)
];

// -------------------------
// temp songs
// -------------------------

var songTemp:Array<String> =
[
    "girlfriendsRingtone.ogg"
];

// -------------------------
// bg colors
// -------------------------

var songColors:Array<String> = 
[
    0xffd763,    
];

// -------------------------
// diff list
// -------------------------

var diffList:Array<String> = 
[
    "easy",
    "normal", 
    "hard", 
    "erect",
    "nightmare"
];

// -------------------------
// categories
// -------------------------

var categories:Array<String> =
[
    "ALL",
    "AB", 
    "CD", 
    "EH", 
    "IL", 
    "MN", 
    "OR", 
    "S", 
    "T",
    "UZ",
    "NUM",
    "FAV"//,
    //add extra categories below (put a comma after each one exept the last)
];




// -------------------------
// assets
// -------------------------

// -------------------------
// Background
// -------------------------



var cardGlowSprite:FunkinSprite = new FunkinSprite(-10, -25 + uiOffset);
cardGlowSprite.loadGraphic(Paths.image("menus/freeplay/pinkBack"));
cardGlowSprite.color = 0xffd763; // red overlay (ARGB)
cardGlowSprite.scale.set(2, 2);
add(cardGlowSprite);

// -------------------------
// Backing text (with direction)
// -------------------------

// Add "direction" property → 1 = left, -1 = right
var textLines:Array<{text:String, font:String, size:Int, color:FlxColor, speed:Float, y:Int, direction:Int}> = [
    { text: "HOT BLOODED IN MORE WAYS THAN ONE ", font: "5by7_b.ttf", size: 40, color: 0xfff383, speed: 450, y: 160 + uiOffset, direction: 1 },
    { text: "BOYFRIEND ",                         font: "5by7.ttf",   size: 60, color: 0xff9963, speed: 250, y: 220 + uiOffset, direction: -1 },
    { text: "PROTECT YO NUTS ",                   font: "5by7_b.ttf", size: 40, color: 0xffffff, speed: 300, y: 290 + uiOffset, direction: 1 },
    { text: "BOYFRIEND ",                         font: "5by7.ttf",   size: 60, color: 0xff9963, speed: 250, y: 340 + uiOffset, direction: -1 },
    { text: "HOT BLOODED IN MORE WAYS THAN ONE ", font: "5by7_b.ttf", size: 40, color: 0xfff383, speed: 450, y: 400 + uiOffset, direction: 1 },
    { text: "BOYFRIEND ",                         font: "5by7.ttf",   size: 60, color: 0xff9963, speed: 250, y: 450 + uiOffset, direction: -1 }
];

// Hold text objects per line
var loopTexts:Array<Array<FlxText>> = [];
// Store scroll speed + direction for each line
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

// -------------------------
// Background
// -------------------------

var dadSprite:FunkinSprite = new FunkinSprite(556, 115 + uiOffset);
dadSprite.loadGraphic(Paths.image("menus/freeplay/freeplayBGdadCropped"));
dadSprite.scale.set(1.4, 1.4);
add(dadSprite);

// -------------------------
// Albums
// -------------------------

var albumCover:FunkinSprite = new FunkinSprite(950, 282 + uiOffset);
albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
albumCover.scale.set(1,1);
albumCover.angle = 10.2;
add(albumCover);

var albumText:FunkinSprite = new FunkinSprite(925, 500 + uiOffset);
albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
albumText.animation.addByPrefix("idle", "idle", 24, true);
albumText.animation.addByPrefix("switch", "switch", 24, false);
albumText.animation.play("idle");
albumText.scale.set(1,1);
add(albumText);

// -------------------------
// Freeplay UI
// -------------------------

// -------------------------
// Freeplay Diffs
// -------------------------

var arrowLeftDiff:FunkinSprite = new FunkinSprite(20,70 + uiOffset);
arrowLeftDiff.frames = Paths.getSparrowAtlas("menus/freeplay/freeplaySelector/freeplaySelector");
arrowLeftDiff.animation.addByPrefix("Loop", "arrow pointer loop", 24, true);
arrowLeftDiff.animation.play("Loop");
add(arrowLeftDiff);

var arrowRightDiff:FunkinSprite = new FunkinSprite(325,70 + uiOffset);
arrowRightDiff.frames = Paths.getSparrowAtlas("menus/freeplay/freeplaySelector/freeplaySelector");
arrowRightDiff.animation.addByPrefix("Loop", "arrow pointer loop", 24, true);
arrowRightDiff.animation.play("Loop");
arrowRightDiff.origin.set(arrowRightDiff.width / 2, arrowRightDiff.height / 2);
arrowRightDiff.scale.x = -1;
add(arrowRightDiff);

var diffSprite:FunkinSprite = new FunkinSprite(90, 80 + uiOffset);
diffSprite.loadGraphic(Paths.image("menus/freeplay/freeplayDifficulties/freeplaynormal"));
add(diffSprite);

var diffNightSprite:FunkinSprite = new FunkinSprite(90, 80 + uiOffset);
diffNightSprite.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayDifficulties/freeplaynightmare");
diffNightSprite.animation.addByPrefix("Loop", "idle", 24, true);
diffNightSprite.animation.play("Loop");
diffNightSprite.visible = false;
add(diffNightSprite);

var easySelector:FunkinSprite = new FunkinSprite(125, 170 + uiOffset);
easySelector.loadGraphic(Paths.image("menus/freeplay/seperator"));
easySelector.color = 0x575757;
add(easySelector);

var normSelector:FunkinSprite = new FunkinSprite(155, 170 + uiOffset);
normSelector.loadGraphic(Paths.image("menus/freeplay/seperator"));
normSelector.color = 0xffffff;
add(normSelector);

var hardSelector:FunkinSprite = new FunkinSprite(185, 170 + uiOffset);
hardSelector.loadGraphic(Paths.image("menus/freeplay/seperator"));
hardSelector.color = 0x575757;
add(hardSelector);

var erectSelector:FunkinSprite = new FunkinSprite(215, 170 + uiOffset);
erectSelector.loadGraphic(Paths.image("menus/freeplay/seperator"));
erectSelector.color = 0x34296a;
erectSelector.alpha = 0.3;
add(erectSelector);

var nightSelector:FunkinSprite = new FunkinSprite(245, 170 + uiOffset);
nightSelector.loadGraphic(Paths.image("menus/freeplay/seperator"));
nightSelector.color = 0x34296a;
nightSelector.alpha = 0.3;
add(nightSelector);

// -------------------------
// Freeplay Char
// -------------------------

// anything between this comment and the next is from V-Slice-in-Codename-Engine on github so credits to them! (https://github.com/NebulaStellaNova/V-Slice-in-Codename-Engine/tree/main)
var menuData;

static var currentCharacter:String = "boyfriend";

menuData = CoolUtil.parseJson("data/config/freeplayCharacters/"+currentCharacter+".json");

dj = new FunkinSprite(menuData.dj.position[0]-15, menuData.dj.position[1]+10);
dj.loadSprite(Paths.image("menus/freeplay/djs/" + menuData.dj.assetPath));
dj.animation.addByPrefix('intro', menuData.dj.animations.intro.prefix, menuData.dj.animations.intro.frameRate ?? 24, false);
dj.animation.addByPrefix('idle', menuData.dj.animations.idle.prefix, menuData.dj.animations.idle.frameRate ?? 24, true);
dj.animation.addByPrefix('exit', menuData.dj.animations.exit.prefix, menuData.dj.animations.exit.frameRate ?? 24, false);
dj.animation.addByPrefix('confirm', menuData.dj.animations.confirm.prefix, menuData.dj.animations.confirm.frameRate ?? 24, false);
dj.addOffset('idle', -menuData.dj.animations.idle.offsets[0], -menuData.dj.animations.idle.offsets[1]);
dj.addOffset('exit', -menuData.dj.animations.exit.offsets[0], -menuData.dj.animations.exit.offsets[1]);
dj.addOffset('intro', -menuData.dj.animations.intro.offsets[0], -menuData.dj.animations.intro.offsets[1]);
dj.addOffset('confirm', -menuData.dj.animations.confirm.offsets[0], -menuData.dj.animations.confirm.offsets[1]);
dj.antialiasing = true;
dj.updateHitbox();
dj.playAnim('intro', true);
add(dj);
// end

// -------------------------
// Freeplay Capsules
// -------------------------

// Capsules

var freeplayCapsulePrior:FunkinSprite = new FunkinSprite(275, 120 + uiOffset);
freeplayCapsulePrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/freeplayCapsule");
freeplayCapsulePrior.animation.addByPrefix("Basic", "basic", 24, true);
freeplayCapsulePrior.animation.addByPrefix("Selected", "sel", 24, true);
freeplayCapsulePrior.animation.play("Basic");
freeplayCapsulePrior.scale.set(0.8, 0.8);
add(freeplayCapsulePrior);

var freeplayCapsuleNext:FunkinSprite = new FunkinSprite(330, 352 + uiOffset);
freeplayCapsuleNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/freeplayCapsule");
freeplayCapsuleNext.animation.addByPrefix("Basic", "basic", 24, true);
freeplayCapsuleNext.animation.addByPrefix("Selected", "sel", 24, true);
freeplayCapsuleNext.animation.play("Basic");
freeplayCapsuleNext.scale.set(0.8, 0.8);
add(freeplayCapsuleNext);

var freeplayCapsuleNext1:FunkinSprite = new FunkinSprite(283.5, 467 + uiOffset);
freeplayCapsuleNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/freeplayCapsule");
freeplayCapsuleNext1.animation.addByPrefix("Basic", "basic", 24, true);
freeplayCapsuleNext1.animation.addByPrefix("Selected", "sel", 24, true);
freeplayCapsuleNext1.animation.play("Basic");
freeplayCapsuleNext1.scale.set(0.8, 0.8);
add(freeplayCapsuleNext1);

var freeplayCapsuleNext2:FunkinSprite = new FunkinSprite(230, 582 + uiOffset);
freeplayCapsuleNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/freeplayCapsule");
freeplayCapsuleNext2.animation.addByPrefix("Basic", "basic", 24, true);
freeplayCapsuleNext2.animation.addByPrefix("Selected", "sel", 24, true);
freeplayCapsuleNext2.animation.play("Basic");
freeplayCapsuleNext2.scale.set(0.8, 0.8);
add(freeplayCapsuleNext2);

var freeplayCapsule:FunkinSprite = new FunkinSprite(320, 236 + uiOffset);
freeplayCapsule.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/capsule/freeplayCapsule");
freeplayCapsule.animation.addByPrefix("Basic", "basic", 24, true);
freeplayCapsule.animation.addByPrefix("Selected", "sel", 24, true);
freeplayCapsule.animation.play("Selected");
freeplayCapsule.scale.set(0.8, 0.8);
add(freeplayCapsule);

// Text

var PriorSongLabel = new FlxText(429, 165 + uiOffset, 1000, displayList[index-1], 10);
PriorSongLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(PriorSongLabel);

var nextSongLabel = new FlxText(483.5, 396.5 + uiOffset, 1000, displayList[index+1], 10);
nextSongLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(nextSongLabel);

var nextSongLabel1 = new FlxText(437.5, 512 + uiOffset, 1000, displayList[index+2], 10);
nextSongLabel1.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(nextSongLabel1);

var nextSongLabel2 = new FlxText(383.6, 627.6 + uiOffset, 1000, displayList[index+3], 10);
nextSongLabel2.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(nextSongLabel2);

var curSongLabel = new FlxText(479.5, 281 + uiOffset , 1000, displayList[index], 10);
curSongLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.WHITE, "left");
add(curSongLabel);

// Icons

var curIcon:FunkinSprite = new FunkinSprite(405, 271 + uiOffset);
curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
curIcon.animation.addByPrefix("Idle", "idle", 24, true);
curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
curIcon.animation.addByPrefix("Hold", "hold", 24, true);
curIcon.animation.play("Idle");
curIcon.scale.set(2, 2);
curIcon.antialiasing = false;
add(curIcon);

var IconPrior:FunkinSprite = new FunkinSprite(354.5, 155 + uiOffset);
IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
IconPrior.animation.addByPrefix("Hold", "hold", 24, true);
IconPrior.animation.play("Idle");
IconPrior.scale.set(2, 2);
IconPrior.antialiasing = false;
add(IconPrior);

var IconNext:FunkinSprite = new FunkinSprite(409.5, 386.5 + uiOffset);
IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
IconNext.animation.addByPrefix("Idle", "idle", 24, true);
IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
IconNext.animation.addByPrefix("Hold", "hold", 24, true);
IconNext.animation.play("Idle");
IconNext.scale.set(2, 2);
IconNext.antialiasing = false;
add(IconNext);

var IconNext1:FunkinSprite = new FunkinSprite(363, 502 + uiOffset);
IconNext1.frames = Paths.getSparrowAtlas(icons[index+2] ?? icons[0]);
IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
IconNext1.animation.addByPrefix("Hold", "hold", 24, true);
IconNext1.animation.play("Idle");
IconNext1.scale.set(2, 2);
IconNext1.antialiasing = false;
add(IconNext1);

var IconNext2:FunkinSprite = new FunkinSprite(310, 617 + uiOffset);
IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
IconNext2.animation.addByPrefix("Hold", "hold", 24, true);
IconNext2.animation.play("Idle");
IconNext2.scale.set(2, 2);
IconNext2.antialiasing = false;
add(IconNext2);

// song diff

var diffPrior:FunkinSprite = new FunkinSprite(685, 208 + uiOffset);
diffPrior.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/difficultytext"));
diffPrior.scale.set(0.9,0.9);
add(diffPrior);

var diffCur:FunkinSprite = new FunkinSprite(735, 325 + uiOffset);
diffCur.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/difficultytext"));
diffCur.scale.set(0.9,0.9);
add(diffCur);

var diffNext:FunkinSprite = new FunkinSprite(740, 440 + uiOffset);
diffNext.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/difficultytext"));
diffNext.scale.set(0.9,0.9);
add(diffNext);

var diffNext1:FunkinSprite = new FunkinSprite(690, 555 + uiOffset);
diffNext1.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/difficultytext"));
diffNext1.scale.set(0.9,0.9);
add(diffNext1);

var diffNext2:FunkinSprite = new FunkinSprite(640, 670 + uiOffset);
diffNext2.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/difficultytext"));
diffNext2.scale.set(0.9,0.9);
add(diffNext2);

// song bpm

var bpmPrior:FunkinSprite = new FunkinSprite(410, 208 + uiOffset);
bpmPrior.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/bpmtext"));
bpmPrior.scale.set(0.9,0.9);
add(bpmPrior);

var bpmCur:FunkinSprite = new FunkinSprite(460, 325 + uiOffset);
bpmCur.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/bpmtext"));
bpmCur.scale.set(0.9,0.9);
add(bpmCur);

var bpmNext:FunkinSprite = new FunkinSprite(465, 440 + uiOffset);
bpmNext.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/bpmtext"));
bpmNext.scale.set(0.9,0.9);
add(bpmNext);

var bpmNext1:FunkinSprite = new FunkinSprite(420, 555 + uiOffset);
bpmNext1.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/bpmtext"));
bpmNext1.scale.set(0.9,0.9);
add(bpmNext1);

var bpmNext2:FunkinSprite = new FunkinSprite(365, 670 + uiOffset);
bpmNext2.loadGraphic(Paths.image("menus/freeplay/freeplayCapsule/bpmtext"));
bpmNext2.scale.set(0.9,0.9);
add(bpmNext2);

// week/weekend

var weekLabelPrior:FunkinSprite = new FunkinSprite(555, 208 + uiOffset);
weekLabelPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/weektypes");
weekLabelPrior.animation.addByPrefix("week", "WEEK text instance 1", 1, true);
weekLabelPrior.animation.addByPrefix("weekend", "WEEKEND text instance 1", 1, false);
weekLabelPrior.animation.play("week");
weekLabelPrior.scale.set(0.9, 0.9);
add(weekLabelPrior);

var weekLabelNext:FunkinSprite = new FunkinSprite(610, 440 + uiOffset);
weekLabelNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/weektypes");
weekLabelNext.animation.addByPrefix("week", "WEEK text instance 1", 1, true);
weekLabelNext.animation.addByPrefix("weekend", "WEEKEND text instance 1", 1, false);
weekLabelNext.animation.play("week");
weekLabelNext.scale.set(0.9, 0.9);
add(weekLabelNext);

var weekLabelNext1:FunkinSprite = new FunkinSprite(560, 555 + uiOffset);
weekLabelNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/weektypes");
weekLabelNext1.animation.addByPrefix("week", "WEEK text instance 1", 1, true);
weekLabelNext1.animation.addByPrefix("weekend", "WEEKEND text instance 1", 1, false);
weekLabelNext1.animation.play("week");
weekLabelNext1.scale.set(0.9, 0.9);
add(weekLabelNext1);

var weekLabelNext2:FunkinSprite = new FunkinSprite(510, 670 + uiOffset);
weekLabelNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/weektypes");
weekLabelNext2.animation.addByPrefix("week", "WEEK text instance 1", 1, true);
weekLabelNext2.animation.addByPrefix("weekend", "WEEKEND text instance 1", 1, false);
weekLabelNext2.animation.play("week");
weekLabelNext2.scale.set(0.9, 0.9);
add(weekLabelNext2);

var weekLabelCur:FunkinSprite = new FunkinSprite(605, 325 + uiOffset);
weekLabelCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/weektypes");
weekLabelCur.animation.addByPrefix("week", "WEEK text instance 1", 1, true);
weekLabelCur.animation.addByPrefix("weekend", "WEEKEND text instance 1", 1, false);
weekLabelCur.animation.play("week");
weekLabelCur.scale.set(0.9, 0.9);
add(weekLabelCur);


// digits tens

var digitsOffsettensX = 49;
var digitsOffsettensY = -60;

var tensPrior:FunkinSprite = new FunkinSprite(685 + digitsOffsettensX, 208 + digitsOffsettensY + uiOffset);
tensPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
tensPrior.animation.addByPrefix("zero", "ZERO", 1, true);
tensPrior.animation.addByPrefix("one", "ONE", 1, true);
tensPrior.animation.addByPrefix("two", "TWO", 1, true);
tensPrior.animation.addByPrefix("three", "THREE", 1, true);
tensPrior.animation.addByPrefix("four", "FOUR", 1, true);
tensPrior.animation.addByPrefix("five", "FIVE", 1, true);
tensPrior.animation.addByPrefix("six", "SIX", 1, true);
tensPrior.animation.addByPrefix("seven", "SEVEN", 1, true);
tensPrior.animation.addByPrefix("eight", "EIGHT", 1, true);
tensPrior.animation.addByPrefix("nine", "NINE", 1, true);
tensPrior.animation.play("zero");
tensPrior.scale.set(0.9, 0.9);
add(tensPrior);

var tensNext:FunkinSprite = new FunkinSprite(742 + digitsOffsettensX, 440 + digitsOffsettensY  + uiOffset);
tensNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
tensNext.animation.addByPrefix("zero", "ZERO", 1, true);
tensNext.animation.addByPrefix("one", "ONE", 1, true);
tensNext.animation.addByPrefix("two", "TWO", 1, true);
tensNext.animation.addByPrefix("three", "THREE", 1, true);
tensNext.animation.addByPrefix("four", "FOUR", 1, true);
tensNext.animation.addByPrefix("five", "FIVE", 1, true);
tensNext.animation.addByPrefix("six", "SIX", 1, true);
tensNext.animation.addByPrefix("seven", "SEVEN", 1, true);
tensNext.animation.addByPrefix("eight", "EIGHT", 1, true);
tensNext.animation.addByPrefix("nine", "NINE", 1, true);
tensNext.animation.play("zero");
tensNext.scale.set(0.9, 0.9);
add(tensNext);

var tensNext1:FunkinSprite = new FunkinSprite(695 + digitsOffsettensX,   555 + digitsOffsettensY + uiOffset);
tensNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
tensNext1.animation.addByPrefix("zero", "ZERO", 1, true);
tensNext1.animation.addByPrefix("one", "ONE", 1, true);
tensNext1.animation.addByPrefix("two", "TWO", 1, true);
tensNext1.animation.addByPrefix("three", "THREE", 1, true);
tensNext1.animation.addByPrefix("four", "FOUR", 1, true);
tensNext1.animation.addByPrefix("five", "FIVE", 1, true);
tensNext1.animation.addByPrefix("six", "SIX", 1, true);
tensNext1.animation.addByPrefix("seven", "SEVEN", 1, true);
tensNext1.animation.addByPrefix("eight", "EIGHT", 1, true);
tensNext1.animation.addByPrefix("nine", "NINE", 1, true);
tensNext1.animation.play("zero");
tensNext1.scale.set(0.9, 0.9);
add(tensNext1);

var tensNext2:FunkinSprite = new FunkinSprite(640 + digitsOffsettensX,  670  + digitsOffsettensY + uiOffset);
tensNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
tensNext2.animation.addByPrefix("zero", "ZERO", 1, true);
tensNext2.animation.addByPrefix("one", "ONE", 1, true);
tensNext2.animation.addByPrefix("two", "TWO", 1, true);
tensNext2.animation.addByPrefix("three", "THREE", 1, true);
tensNext2.animation.addByPrefix("four", "FOUR", 1, true);
tensNext2.animation.addByPrefix("five", "FIVE", 1, true);
tensNext2.animation.addByPrefix("six", "SIX", 1, true);
tensNext2.animation.addByPrefix("seven", "SEVEN", 1, true);
tensNext2.animation.addByPrefix("eight", "EIGHT", 1, true);
tensNext2.animation.addByPrefix("nine", "NINE", 1, true);
tensNext2.animation.play("zero");
tensNext2.scale.set(0.9, 0.9);
add(tensNext2);

var tensCur:FunkinSprite = new FunkinSprite(735 + digitsOffsettensX,  325 + digitsOffsettensY + uiOffset);
tensCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
tensCur.animation.addByPrefix("zero", "ZERO", 1, true);
tensCur.animation.addByPrefix("one", "ONE", 1, true);
tensCur.animation.addByPrefix("two", "TWO", 1, true);
tensCur.animation.addByPrefix("three", "THREE", 1, true);
tensCur.animation.addByPrefix("four", "FOUR", 1, true);
tensCur.animation.addByPrefix("five", "FIVE", 1, true);
tensCur.animation.addByPrefix("six", "SIX", 1, true);
tensCur.animation.addByPrefix("seven", "SEVEN", 1, true);
tensCur.animation.addByPrefix("eight", "EIGHT", 1, true);
tensCur.animation.addByPrefix("nine", "NINE", 1, true);
tensCur.animation.play("zero");
tensCur.scale.set(0.9, 0.9);
add(tensCur);

// digits ones

var digitsOffsetonesX = 80;
var digitsOffsetonesY = -60;

var onesPrior:FunkinSprite = new FunkinSprite(685 + digitsOffsetonesX, 208 + digitsOffsetonesY + uiOffset);
onesPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
onesPrior.animation.addByPrefix("zero", "ZERO", 1, true);
onesPrior.animation.addByPrefix("one", "ONE", 1, true);
onesPrior.animation.addByPrefix("two", "TWO", 1, true);
onesPrior.animation.addByPrefix("three", "THREE", 1, true);
onesPrior.animation.addByPrefix("four", "FOUR", 1, true);
onesPrior.animation.addByPrefix("five", "FIVE", 1, true);
onesPrior.animation.addByPrefix("six", "SIX", 1, true);
onesPrior.animation.addByPrefix("seven", "SEVEN", 1, true);
onesPrior.animation.addByPrefix("eight", "EIGHT", 1, true);
onesPrior.animation.addByPrefix("nine", "NINE", 1, true);
onesPrior.animation.play("zero");
onesPrior.scale.set(0.9, 0.9);
add(onesPrior);

var onesNext:FunkinSprite = new FunkinSprite(742 + digitsOffsetonesX, 440 + digitsOffsetonesY + uiOffset);
onesNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
onesNext.animation.addByPrefix("zero", "ZERO", 1, true);
onesNext.animation.addByPrefix("one", "ONE", 1, true);
onesNext.animation.addByPrefix("two", "TWO", 1, true);
onesNext.animation.addByPrefix("three", "THREE", 1, true);
onesNext.animation.addByPrefix("four", "FOUR", 1, true);
onesNext.animation.addByPrefix("five", "FIVE", 1, true);
onesNext.animation.addByPrefix("six", "SIX", 1, true);
onesNext.animation.addByPrefix("seven", "SEVEN", 1, true);
onesNext.animation.addByPrefix("eight", "EIGHT", 1, true);
onesNext.animation.addByPrefix("nine", "NINE", 1, true);
onesNext.animation.play("zero");
onesNext.scale.set(0.9, 0.9);
add(onesNext);

var onesNext1:FunkinSprite = new FunkinSprite(695 + digitsOffsetonesX, 555 + digitsOffsetonesY + uiOffset);
onesNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
onesNext1.animation.addByPrefix("zero", "ZERO", 1, true);
onesNext1.animation.addByPrefix("one", "ONE", 1, true);
onesNext1.animation.addByPrefix("two", "TWO", 1, true);
onesNext1.animation.addByPrefix("three", "THREE", 1, true);
onesNext1.animation.addByPrefix("four", "FOUR", 1, true);
onesNext1.animation.addByPrefix("five", "FIVE", 1, true);
onesNext1.animation.addByPrefix("six", "SIX", 1, true);
onesNext1.animation.addByPrefix("seven", "SEVEN", 1, true);
onesNext1.animation.addByPrefix("eight", "EIGHT", 1, true);
onesNext1.animation.addByPrefix("nine", "NINE", 1, true);
onesNext1.animation.play("zero");
onesNext1.scale.set(0.9, 0.9);
add(onesNext1);

var onesNext2:FunkinSprite = new FunkinSprite(640 + digitsOffsetonesX, 670 + digitsOffsetonesY + uiOffset);
onesNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
onesNext2.animation.addByPrefix("zero", "ZERO", 1, true);
onesNext2.animation.addByPrefix("one", "ONE", 1, true);
onesNext2.animation.addByPrefix("two", "TWO", 1, true);
onesNext2.animation.addByPrefix("three", "THREE", 1, true);
onesNext2.animation.addByPrefix("four", "FOUR", 1, true);
onesNext2.animation.addByPrefix("five", "FIVE", 1, true);
onesNext2.animation.addByPrefix("six", "SIX", 1, true);
onesNext2.animation.addByPrefix("seven", "SEVEN", 1, true);
onesNext2.animation.addByPrefix("eight", "EIGHT", 1, true);
onesNext2.animation.addByPrefix("nine", "NINE", 1, true);
onesNext2.animation.play("zero");
onesNext2.scale.set(0.9, 0.9);
add(onesNext2);

var onesCur:FunkinSprite = new FunkinSprite(735 + digitsOffsetonesX, 325 + digitsOffsetonesY + uiOffset);
onesCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/bignumbers");
onesCur.animation.addByPrefix("zero", "ZERO", 1, true);
onesCur.animation.addByPrefix("one", "ONE", 1, true);
onesCur.animation.addByPrefix("two", "TWO", 1, true);
onesCur.animation.addByPrefix("three", "THREE", 1, true);
onesCur.animation.addByPrefix("four", "FOUR", 1, true);
onesCur.animation.addByPrefix("five", "FIVE", 1, true);
onesCur.animation.addByPrefix("six", "SIX", 1, true);
onesCur.animation.addByPrefix("seven", "SEVEN", 1, true);
onesCur.animation.addByPrefix("eight", "EIGHT", 1, true);
onesCur.animation.addByPrefix("nine", "NINE", 1, true);
onesCur.animation.play("zero");
onesCur.scale.set(0.9, 0.9);
add(onesCur);

// bpm numbers

// bpm ones
var onesBPMPrior:FunkinSprite = new FunkinSprite(478, 208 + uiOffset);
onesBPMPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
onesBPMPrior.animation.addByPrefix("zero", "ZERO", 1, true);
onesBPMPrior.animation.addByPrefix("one", "ONE", 1, true);
onesBPMPrior.animation.addByPrefix("two", "TWO", 1, true);
onesBPMPrior.animation.addByPrefix("three", "THREE", 1, true);
onesBPMPrior.animation.addByPrefix("four", "FOUR", 1, true);
onesBPMPrior.animation.addByPrefix("five", "FIVE", 1, true);
onesBPMPrior.animation.addByPrefix("six", "SIX", 1, true);
onesBPMPrior.animation.addByPrefix("seven", "SEVEN", 1, true);
onesBPMPrior.animation.addByPrefix("eight", "EIGHT", 1, true);
onesBPMPrior.animation.addByPrefix("nine", "NINE", 1, true);
onesBPMPrior.animation.play("zero");
onesBPMPrior.scale.set(0.9, 0.9);
add(onesBPMPrior);

var onesBPMCur:FunkinSprite = new FunkinSprite(524, 325 + uiOffset);
onesBPMCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
onesBPMCur.animation.addByPrefix("zero", "ZERO", 1, true);
onesBPMCur.animation.addByPrefix("one", "ONE", 1, true);
onesBPMCur.animation.addByPrefix("two", "TWO", 1, true);
onesBPMCur.animation.addByPrefix("three", "THREE", 1, true);
onesBPMCur.animation.addByPrefix("four", "FOUR", 1, true);
onesBPMCur.animation.addByPrefix("five", "FIVE", 1, true);
onesBPMCur.animation.addByPrefix("six", "SIX", 1, true);
onesBPMCur.animation.addByPrefix("seven", "SEVEN", 1, true);
onesBPMCur.animation.addByPrefix("eight", "EIGHT", 1, true);
onesBPMCur.animation.addByPrefix("nine", "NINE", 1, true);
onesBPMCur.animation.play("zero");
onesBPMCur.scale.set(0.9, 0.9);
add(onesBPMCur);

var onesBPMNext:FunkinSprite = new FunkinSprite(528, 440 + uiOffset);
onesBPMNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
onesBPMNext.animation.addByPrefix("zero", "ZERO", 1, true);
onesBPMNext.animation.addByPrefix("one", "ONE", 1, true);
onesBPMNext.animation.addByPrefix("two", "TWO", 1, true);
onesBPMNext.animation.addByPrefix("three", "THREE", 1, true);
onesBPMNext.animation.addByPrefix("four", "FOUR", 1, true);
onesBPMNext.animation.addByPrefix("five", "FIVE", 1, true);
onesBPMNext.animation.addByPrefix("six", "SIX", 1, true);
onesBPMNext.animation.addByPrefix("seven", "SEVEN", 1, true);
onesBPMNext.animation.addByPrefix("eight", "EIGHT", 1, true);
onesBPMNext.animation.addByPrefix("nine", "NINE", 1, true);
onesBPMNext.animation.play("zero");
onesBPMNext.scale.set(0.9, 0.9);
add(onesBPMNext);

var onesBPMNext1:FunkinSprite = new FunkinSprite(485, 555 + uiOffset);
onesBPMNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
onesBPMNext1.animation.addByPrefix("zero", "ZERO", 1, true);
onesBPMNext1.animation.addByPrefix("one", "ONE", 1, true);
onesBPMNext1.animation.addByPrefix("two", "TWO", 1, true);
onesBPMNext1.animation.addByPrefix("three", "THREE", 1, true);
onesBPMNext1.animation.addByPrefix("four", "FOUR", 1, true);
onesBPMNext1.animation.addByPrefix("five", "FIVE", 1, true);
onesBPMNext1.animation.addByPrefix("six", "SIX", 1, true);
onesBPMNext1.animation.addByPrefix("seven", "SEVEN", 1, true);
onesBPMNext1.animation.addByPrefix("eight", "EIGHT", 1, true);
onesBPMNext1.animation.addByPrefix("nine", "NINE", 1, true);
onesBPMNext1.animation.play("zero");
onesBPMNext1.scale.set(0.9, 0.9);
add(onesBPMNext1);

var onesBPMNext2:FunkinSprite = new FunkinSprite(430, 670 + uiOffset);
onesBPMNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
onesBPMNext2.animation.addByPrefix("zero", "ZERO", 1, true);
onesBPMNext2.animation.addByPrefix("one", "ONE", 1, true);
onesBPMNext2.animation.addByPrefix("two", "TWO", 1, true);
onesBPMNext2.animation.addByPrefix("three", "THREE", 1, true);
onesBPMNext2.animation.addByPrefix("four", "FOUR", 1, true);
onesBPMNext2.animation.addByPrefix("five", "FIVE", 1, true);
onesBPMNext2.animation.addByPrefix("six", "SIX", 1, true);
onesBPMNext2.animation.addByPrefix("seven", "SEVEN", 1, true);
onesBPMNext2.animation.addByPrefix("eight", "EIGHT", 1, true);
onesBPMNext2.animation.addByPrefix("nine", "NINE", 1, true);
onesBPMNext2.animation.play("zero");
onesBPMNext2.scale.set(0.9, 0.9);
add(onesBPMNext2);


// bpm tens
var tensBPMPrior:FunkinSprite = new FunkinSprite(465, 208 + uiOffset);
tensBPMPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
tensBPMPrior.animation.addByPrefix("zero", "ZERO", 1, true);
tensBPMPrior.animation.addByPrefix("one", "ONE", 1, true);
tensBPMPrior.animation.addByPrefix("two", "TWO", 1, true);
tensBPMPrior.animation.addByPrefix("three", "THREE", 1, true);
tensBPMPrior.animation.addByPrefix("four", "FOUR", 1, true);
tensBPMPrior.animation.addByPrefix("five", "FIVE", 1, true);
tensBPMPrior.animation.addByPrefix("six", "SIX", 1, true);
tensBPMPrior.animation.addByPrefix("seven", "SEVEN", 1, true);
tensBPMPrior.animation.addByPrefix("eight", "EIGHT", 1, true);
tensBPMPrior.animation.addByPrefix("nine", "NINE", 1, true);
tensBPMPrior.animation.play("zero");
tensBPMPrior.scale.set(0.9, 0.9);
add(tensBPMPrior);

var tensBPMCur:FunkinSprite = new FunkinSprite(513, 325 + uiOffset);
tensBPMCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
tensBPMCur.animation.addByPrefix("zero", "ZERO", 1, true);
tensBPMCur.animation.addByPrefix("one", "ONE", 1, true);
tensBPMCur.animation.addByPrefix("two", "TWO", 1, true);
tensBPMCur.animation.addByPrefix("three", "THREE", 1, true);
tensBPMCur.animation.addByPrefix("four", "FOUR", 1, true);
tensBPMCur.animation.addByPrefix("five", "FIVE", 1, true);
tensBPMCur.animation.addByPrefix("six", "SIX", 1, true);
tensBPMCur.animation.addByPrefix("seven", "SEVEN", 1, true);
tensBPMCur.animation.addByPrefix("eight", "EIGHT", 1, true);
tensBPMCur.animation.addByPrefix("nine", "NINE", 1, true);
tensBPMCur.animation.play("zero");
tensBPMCur.scale.set(0.9, 0.9);
add(tensBPMCur);

var tensBPMNext:FunkinSprite = new FunkinSprite(516, 440 + uiOffset);
tensBPMNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
tensBPMNext.animation.addByPrefix("zero", "ZERO", 1, true);
tensBPMNext.animation.addByPrefix("one", "ONE", 1, true);
tensBPMNext.animation.addByPrefix("two", "TWO", 1, true);
tensBPMNext.animation.addByPrefix("three", "THREE", 1, true);
tensBPMNext.animation.addByPrefix("four", "FOUR", 1, true);
tensBPMNext.animation.addByPrefix("five", "FIVE", 1, true);
tensBPMNext.animation.addByPrefix("six", "SIX", 1, true);
tensBPMNext.animation.addByPrefix("seven", "SEVEN", 1, true);
tensBPMNext.animation.addByPrefix("eight", "EIGHT", 1, true);
tensBPMNext.animation.addByPrefix("nine", "NINE", 1, true);
tensBPMNext.animation.play("zero");
tensBPMNext.scale.set(0.9, 0.9);
add(tensBPMNext);

var tensBPMNext1:FunkinSprite = new FunkinSprite(473, 555 + uiOffset);
tensBPMNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
tensBPMNext1.animation.addByPrefix("zero", "ZERO", 1, true);
tensBPMNext1.animation.addByPrefix("one", "ONE", 1, true);
tensBPMNext1.animation.addByPrefix("two", "TWO", 1, true);
tensBPMNext1.animation.addByPrefix("three", "THREE", 1, true);
tensBPMNext1.animation.addByPrefix("four", "FOUR", 1, true);
tensBPMNext1.animation.addByPrefix("five", "FIVE", 1, true);
tensBPMNext1.animation.addByPrefix("six", "SIX", 1, true);
tensBPMNext1.animation.addByPrefix("seven", "SEVEN", 1, true);
tensBPMNext1.animation.addByPrefix("eight", "EIGHT", 1, true);
tensBPMNext1.animation.addByPrefix("nine", "NINE", 1, true);
tensBPMNext1.animation.play("zero");
tensBPMNext1.scale.set(0.9, 0.9);
add(tensBPMNext1);

var tensBPMNext2:FunkinSprite = new FunkinSprite(418, 670 + uiOffset);
tensBPMNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
tensBPMNext2.animation.addByPrefix("zero", "ZERO", 1, true);
tensBPMNext2.animation.addByPrefix("one", "ONE", 1, true);
tensBPMNext2.animation.addByPrefix("two", "TWO", 1, true);
tensBPMNext2.animation.addByPrefix("three", "THREE", 1, true);
tensBPMNext2.animation.addByPrefix("four", "FOUR", 1, true);
tensBPMNext2.animation.addByPrefix("five", "FIVE", 1, true);
tensBPMNext2.animation.addByPrefix("six", "SIX", 1, true);
tensBPMNext2.animation.addByPrefix("seven", "SEVEN", 1, true);
tensBPMNext2.animation.addByPrefix("eight", "EIGHT", 1, true);
tensBPMNext2.animation.addByPrefix("nine", "NINE", 1, true);
tensBPMNext2.animation.play("zero");
tensBPMNext2.scale.set(0.9, 0.9);
add(tensBPMNext2);

// bpm hunds
var hundsBPMPrior:FunkinSprite = new FunkinSprite(455, 208 + uiOffset);
hundsBPMPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
hundsBPMPrior.animation.addByPrefix("zero", "ZERO", 1, true);
hundsBPMPrior.animation.addByPrefix("one", "ONE", 1, true);
hundsBPMPrior.animation.addByPrefix("two", "TWO", 1, true);
hundsBPMPrior.animation.addByPrefix("three", "THREE", 1, true);
hundsBPMPrior.animation.addByPrefix("four", "FOUR", 1, true);
hundsBPMPrior.animation.addByPrefix("five", "FIVE", 1, true);
hundsBPMPrior.animation.addByPrefix("six", "SIX", 1, true);
hundsBPMPrior.animation.addByPrefix("seven", "SEVEN", 1, true);
hundsBPMPrior.animation.addByPrefix("eight", "EIGHT", 1, true);
hundsBPMPrior.animation.addByPrefix("nine", "NINE", 1, true);
hundsBPMPrior.animation.play("zero");
hundsBPMPrior.scale.set(0.9, 0.9);
add(hundsBPMPrior);

var hundsBPMCur:FunkinSprite = new FunkinSprite(505, 325 + uiOffset);
hundsBPMCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
hundsBPMCur.animation.addByPrefix("zero", "ZERO", 1, true);
hundsBPMCur.animation.addByPrefix("one", "ONE", 1, true);
hundsBPMCur.animation.addByPrefix("two", "TWO", 1, true);
hundsBPMCur.animation.addByPrefix("three", "THREE", 1, true);
hundsBPMCur.animation.addByPrefix("four", "FOUR", 1, true);
hundsBPMCur.animation.addByPrefix("five", "FIVE", 1, true);
hundsBPMCur.animation.addByPrefix("six", "SIX", 1, true);
hundsBPMCur.animation.addByPrefix("seven", "SEVEN", 1, true);
hundsBPMCur.animation.addByPrefix("eight", "EIGHT", 1, true);
hundsBPMCur.animation.addByPrefix("nine", "NINE", 1, true);
hundsBPMCur.animation.play("zero");
hundsBPMCur.scale.set(0.9, 0.9);
add(hundsBPMCur);

var hundsBPMNext:FunkinSprite = new FunkinSprite(508, 440 + uiOffset);
hundsBPMNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
hundsBPMNext.animation.addByPrefix("zero", "ZERO", 1, true);
hundsBPMNext.animation.addByPrefix("one", "ONE", 1, true);
hundsBPMNext.animation.addByPrefix("two", "TWO", 1, true);
hundsBPMNext.animation.addByPrefix("three", "THREE", 1, true);
hundsBPMNext.animation.addByPrefix("four", "FOUR", 1, true);
hundsBPMNext.animation.addByPrefix("five", "FIVE", 1, true);
hundsBPMNext.animation.addByPrefix("six", "SIX", 1, true);
hundsBPMNext.animation.addByPrefix("seven", "SEVEN", 1, true);
hundsBPMNext.animation.addByPrefix("eight", "EIGHT", 1, true);
hundsBPMNext.animation.addByPrefix("nine", "NINE", 1, true);
hundsBPMNext.animation.play("zero");
hundsBPMNext.scale.set(0.9, 0.9);
add(hundsBPMNext);

var hundsBPMNext1:FunkinSprite = new FunkinSprite(465, 555 + uiOffset);
hundsBPMNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
hundsBPMNext1.animation.addByPrefix("zero", "ZERO", 1, true);
hundsBPMNext1.animation.addByPrefix("one", "ONE", 1, true);
hundsBPMNext1.animation.addByPrefix("two", "TWO", 1, true);
hundsBPMNext1.animation.addByPrefix("three", "THREE", 1, true);
hundsBPMNext1.animation.addByPrefix("four", "FOUR", 1, true);
hundsBPMNext1.animation.addByPrefix("five", "FIVE", 1, true);
hundsBPMNext1.animation.addByPrefix("six", "SIX", 1, true);
hundsBPMNext1.animation.addByPrefix("seven", "SEVEN", 1, true);
hundsBPMNext1.animation.addByPrefix("eight", "EIGHT", 1, true);
hundsBPMNext1.animation.addByPrefix("nine", "NINE", 1, true);
hundsBPMNext1.animation.play("zero");
hundsBPMNext1.scale.set(0.9, 0.9);
add(hundsBPMNext1);

var hundsBPMNext2:FunkinSprite = new FunkinSprite(410, 670 + uiOffset);
hundsBPMNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
hundsBPMNext2.animation.addByPrefix("zero", "ZERO", 1, true);
hundsBPMNext2.animation.addByPrefix("one", "ONE", 1, true);
hundsBPMNext2.animation.addByPrefix("two", "TWO", 1, true);
hundsBPMNext2.animation.addByPrefix("three", "THREE", 1, true);
hundsBPMNext2.animation.addByPrefix("four", "FOUR", 1, true);
hundsBPMNext2.animation.addByPrefix("five", "FIVE", 1, true);
hundsBPMNext2.animation.addByPrefix("six", "SIX", 1, true);
hundsBPMNext2.animation.addByPrefix("seven", "SEVEN", 1, true);
hundsBPMNext2.animation.addByPrefix("eight", "EIGHT", 1, true);
hundsBPMNext2.animation.addByPrefix("nine", "NINE", 1, true);
hundsBPMNext2.animation.play("zero");
hundsBPMNext2.scale.set(0.9, 0.9);
add(hundsBPMNext2);


// week number

var weekNumLabelPrior:FunkinSprite = new FunkinSprite(615, 208 + uiOffset);
weekNumLabelPrior.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
weekNumLabelPrior.animation.addByPrefix("zero", "ZERO", 1, true);
weekNumLabelPrior.animation.addByPrefix("one", "ONE", 1, false);
weekNumLabelPrior.animation.addByPrefix("two", "TWO", 1, false);
weekNumLabelPrior.animation.addByPrefix("three", "THREE", 1, false);
weekNumLabelPrior.animation.addByPrefix("four", "FOUR", 1, false);
weekNumLabelPrior.animation.addByPrefix("five", "FIVE", 1, false);
weekNumLabelPrior.animation.addByPrefix("six", "SIX", 1, false);
weekNumLabelPrior.animation.addByPrefix("seven", "SEVEN", 1, false);
weekNumLabelPrior.animation.addByPrefix("eight", "EIGHT", 1, false);
weekNumLabelPrior.animation.addByPrefix("nine", "NINE", 1, false);
weekNumLabelPrior.animation.play("zero");
weekNumLabelPrior.scale.set(0.9, 0.9);
add(weekNumLabelPrior);

var weekNumLabelNext:FunkinSprite = new FunkinSprite(670, 440 + uiOffset);
weekNumLabelNext.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
weekNumLabelNext.animation.addByPrefix("zero", "ZERO", 1, true);
weekNumLabelNext.animation.addByPrefix("one", "ONE", 1, false);
weekNumLabelNext.animation.addByPrefix("two", "TWO", 1, false);
weekNumLabelNext.animation.addByPrefix("three", "THREE", 1, false);
weekNumLabelNext.animation.addByPrefix("four", "FOUR", 1, false);
weekNumLabelNext.animation.addByPrefix("five", "FIVE", 1, false);
weekNumLabelNext.animation.addByPrefix("six", "SIX", 1, false);
weekNumLabelNext.animation.addByPrefix("seven", "SEVEN", 1, false);
weekNumLabelNext.animation.addByPrefix("eight", "EIGHT", 1, false);
weekNumLabelNext.animation.addByPrefix("nine", "NINE", 1, false);
weekNumLabelNext.animation.play("zero");
weekNumLabelNext.scale.set(0.9, 0.9);
add(weekNumLabelNext);

var weekNumLabelNext1:FunkinSprite = new FunkinSprite(620, 555 + uiOffset);
weekNumLabelNext1.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
weekNumLabelNext1.animation.addByPrefix("zero", "ZERO", 1, true);
weekNumLabelNext1.animation.addByPrefix("one", "ONE", 1, false);
weekNumLabelNext1.animation.addByPrefix("two", "TWO", 1, false);
weekNumLabelNext1.animation.addByPrefix("three", "THREE", 1, false);
weekNumLabelNext1.animation.addByPrefix("four", "FOUR", 1, false);
weekNumLabelNext1.animation.addByPrefix("five", "FIVE", 1, false);
weekNumLabelNext1.animation.addByPrefix("six", "SIX", 1, false);
weekNumLabelNext1.animation.addByPrefix("seven", "SEVEN", 1, false);
weekNumLabelNext1.animation.addByPrefix("eight", "EIGHT", 1, false);
weekNumLabelNext1.animation.addByPrefix("nine", "NINE", 1, false);
weekNumLabelNext1.animation.play("zero");
weekNumLabelNext1.scale.set(0.9, 0.9);
add(weekNumLabelNext1);

var weekNumLabelNext2:FunkinSprite = new FunkinSprite(570, 670 + uiOffset);
weekNumLabelNext2.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
weekNumLabelNext2.animation.addByPrefix("zero", "ZERO", 1, true);
weekNumLabelNext2.animation.addByPrefix("one", "ONE", 1, false);
weekNumLabelNext2.animation.addByPrefix("two", "TWO", 1, false);
weekNumLabelNext2.animation.addByPrefix("three", "THREE", 1, false);
weekNumLabelNext2.animation.addByPrefix("four", "FOUR", 1, false);
weekNumLabelNext2.animation.addByPrefix("five", "FIVE", 1, false);
weekNumLabelNext2.animation.addByPrefix("six", "SIX", 1, false);
weekNumLabelNext2.animation.addByPrefix("seven", "SEVEN", 1, false);
weekNumLabelNext2.animation.addByPrefix("eight", "EIGHT", 1, false);
weekNumLabelNext2.animation.addByPrefix("nine", "NINE", 1, false);
weekNumLabelNext2.animation.play("zero");
weekNumLabelNext2.scale.set(0.9, 0.9);
add(weekNumLabelNext2);

var weekNumLabelCur:FunkinSprite = new FunkinSprite(665, 325 + uiOffset);
weekNumLabelCur.frames = Paths.getSparrowAtlas("menus/freeplay/freeplayCapsule/smallnumbers");
weekNumLabelCur.animation.addByPrefix("zero", "ZERO", 1, true);
weekNumLabelCur.animation.addByPrefix("one", "ONE", 1, false);
weekNumLabelCur.animation.addByPrefix("two", "TWO", 1, false);
weekNumLabelCur.animation.addByPrefix("three", "THREE", 1, false);
weekNumLabelCur.animation.addByPrefix("four", "FOUR", 1, false);
weekNumLabelCur.animation.addByPrefix("five", "FIVE", 1, false);
weekNumLabelCur.animation.addByPrefix("six", "SIX", 1, false);
weekNumLabelCur.animation.addByPrefix("seven", "SEVEN", 1, false);
weekNumLabelCur.animation.addByPrefix("eight", "EIGHT", 1, false);
weekNumLabelCur.animation.addByPrefix("nine", "NINE", 1, false);
weekNumLabelCur.animation.play("zero");
weekNumLabelCur.scale.set(0.9, 0.9);
add(weekNumLabelCur);

// -------------------------
// categories
// -------------------------



// -------------------------
// Top
// -------------------------

var blackSprite:FunkinSprite = new FunkinSprite(0, 0);
blackSprite.loadGraphic(Paths.image("menus/freeplay/black"));
blackSprite.scale.set(FlxG.width*2, 100);
add(blackSprite);

var characterSelectLabel = new FlxText(300, 5 , 1000, "Press [ TAB ] to change characters", 10);
characterSelectLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.GRAY, "left");
add(characterSelectLabel);

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
scoreMilSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreHundThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreTenThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreOneThouSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreHundSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreTenSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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
scoreOneSprite.frames = Paths.getSparrowAtlas("menus/freeplay/digital_numbers");
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

// -------------------------
// Debug stuff
// -------------------------

debugoffset = 10 + uiOffset;

var debugDataDebLabel = new FlxText(0, 150+debugoffset, 1000, "Debug Data:", 10);
debugDataDebLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.BLACK, "left");
add(debugDataDebLabel);

var erectModeActiveDebLabel = new FlxText(0, 180+debugoffset, 1000, "EM: " + erectMode, 10);
erectModeActiveDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(erectModeActiveDebLabel);

var curNumDebLabel = new FlxText(0, 205+debugoffset, 1000, "CN: " + index, 10);
curNumDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curNumDebLabel);

var curSongDebLabel = new FlxText(0, 230+debugoffset, 1000, "CS: " + displayList[index], 10);
curSongDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curSongDebLabel);

var curRandNumDebLabel = new FlxText(0, 255+debugoffset, 1000, "CRN: " + basicRand, 10);
curRandNumDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curRandNumDebLabel);

var curRandSongDebLabel = new FlxText(0, 280+debugoffset, 1000, "CRS: " + displayList[basicRand], 10);
curRandSongDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curRandSongDebLabel);

var curDiffDebLabel = new FlxText(0, 305+debugoffset, 1000, "CD: " + diffList[diff], 10);
curDiffDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curDiffDebLabel);

var curCharDebLabel = new FlxText(0, 330+debugoffset, 1000, "CC: " + currentCharacter, 10);
curCharDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curCharDebLabel);

var curAnimDebLabel = new FlxText(0, 355+debugoffset, 1000, "CA: " + dj.animation.name, 10);
curAnimDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curAnimDebLabel);

var curFrameDebLabel = new FlxText(0, 380+debugoffset, 1000, "CF: " + dj.animation.curAnim.curFrame, 10);
curFrameDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(curFrameDebLabel);

var RemixModeDebLabel = new FlxText(0, 405+debugoffset, 1000, "RM: " + remix, 10);
RemixModeDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(RemixModeDebLabel);

var songExtDebLabel = new FlxText(0, 430+debugoffset, 1000, "SE: " + addonthing, 10);
songExtDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BLACK, "left");
add(songExtDebLabel);

var diffNumPrior:String = songDiffNormList[index-1]; 
var diffNumCur:String = songDiffNormList[index]; 
var diffNumNext:String = songDiffNormList[index+1]; 
var diffNumNext1:String = songDiffNormList[index+2]; 
var diffNumNext2:String = songDiffNormList[index+3]; 

var bpmNumPrior:String = bpmList[index-1]; 
var bpmNumCur:String = bpmList[index]; 
var bpmNumNext:String = bpmList[index+1]; 
var bpmNumNext1:String = bpmList[index+2]; 
var bpmNumNext2:String = bpmList[index+3]; 

saveData = FunkinSave.getSongHighscore(songList[index], diffList[2]);

curAccuracy = FlxMath.roundDecimal(saveData.accuracy * 100, 0);

trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));

// -------------------------
// Other Stuff
// -------------------------


new FlxTimer().start(20, function(tmr:FlxTimer)
{
    highscoreSprite.animation.play("Idle");
}, 0);

function create()
{

    CoolUtil.playMusic("songs/"+songList[index]+"/song/Inst"+addonthing+".ogg");
    trace("Freeplay Loaded");   
}



// Update loop
function update(elapsed:Float)
{
    for (line in 0...loopTexts.length)
    {
        var lineTexts = loopTexts[line];
        var speed = lineSpeeds[line];
        var dir = lineDirs[line]; // 1 = left, -1 = right

        for (txt in lineTexts)
        {
            txt.x -= speed * dir * elapsed;

            if (dir == 1) // moving left
            {
                if (txt.x + txt.width < 0)
                {
                    var rightMost:Float = 0;
                    for (t in lineTexts)
                        if (t.x > rightMost) rightMost = t.x;

                    txt.x = rightMost + txt.width;
                }
            }
            else // moving right
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





    if (char == "pico")
    {
        FlxG.switchState(new ModState('freeplay-pico'));
    }
    if (index == 24 || index == 23 || basicRand == 24 || basicRand == 23)
    {
        remix = "bf";
        addonthing = "-bf";
        
    }
    else
    {
        remix = false;
        addonthing = "";
    }
    
    if (erectMode == true)
    {
        remix = false;
        addonthing = "-erect";
    }
    if (index != 0)
    {
        basicRand = 1;
    }
    
    if (dj.animation.name == "intro" && dj.animation.curAnim.curFrame == 16) {
		dj.playAnim('idle', true);
	}

    if (dj.animation.name == "exit" && dj.animation.curAnim.curFrame == 25) {
        FlxG.switchState(new ModState('charSelect'));
    }

    //Handlers/functions
    debugStatsHandler();
    handleInputs();
    capsuleHandler();
    randomHandler();
    diffSelectorHandler();
    weekNumHandler();
    bpmNumUpdateHandler();
    accuracyHandler();
    scoreHandler();
    
    difficultyDigitsPrior(diffNumPrior);
    difficultyDigitsCur(diffNumCur);
    difficultyDigitsNext(diffNumNext);
    difficultyDigitsNext1(diffNumNext1);
    difficultyDigitsNext2(diffNumNext2);
    
    

    bpmDigitsPrior(bpmNumPrior);
    bpmDigitsCur(bpmNumCur);
    bpmDigitsNext(bpmNumNext);
    bpmDigitsNext1(bpmNumNext1);
    bpmDigitsNext2(bpmNumNext2);
}


function diffSelectorHandler()
{
    if (index == 1 || index == 7 || index == 13 || index == 16 || index == 21  || index == 22 || index == 23 || index == 24)
    {
        erectSelector.alpha = 0.3;
        nightSelector.alpha = 0.3;
    }
    else
    {
        erectSelector.alpha = 1;
        nightSelector.alpha = 1;
    }
    if (erectMode == true)
    {
        erectSelector.alpha = 1;
        nightSelector.alpha = 1; 
    }
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

function accuracyHandler()
{
    if (erectMode == false)
    {
        if (remix == false)
        {
            saveData = FunkinSave.getSongHighscore(songList[index], diffList[diff]);

            curAccuracy = FlxMath.roundDecimal(saveData.accuracy * 100, 0);
        }
        else
        {
            saveData = FunkinSave.getSongHighscore(songList[index], diffList[diff], "bf");

            curAccuracy = FlxMath.roundDecimal(saveData.accuracy * 100, 0);
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
        saveData = FunkinSave.getSongHighscore(songErectList[indexErect], diffList[diff], "erect");

        curAccuracy = FlxMath.roundDecimal(saveData.accuracy * 100, 0);
        
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

function scoreHandler()
{
    if (erectMode == false)
    {
        if (remix == false)
        {
            saveData = FunkinSave.getSongHighscore(songList[index], diffList[diff]);
        }
        else
        {
            saveData = FunkinSave.getSongHighscore(songList[index], diffList[diff], "bf");
        }
        
        curScore = saveData.score;
    }
    if (erectMode == true)
    {
        saveData = FunkinSave.getSongHighscore(songErectList[indexErect], diffList[diff], "erect");
        curScore = saveData.score;
    }
    updateScoreDisplay(curScore);
}

function bpmNumUpdateHandler()
{
    if (erectMode == false)
    {
        bpmNumPrior = bpmList[index-1]; 
        bpmNumCur = bpmList[index]; 
        bpmNumNext = bpmList[index+1]; 
        bpmNumNext1 = bpmList[index+2]; 
        bpmNumNext2 = bpmList[index+3]; 
    }
    if (erectMode == true)
    {
        bpmNumPrior = bpmErectList[indexErect-1]; 
        bpmNumCur = bpmErectList[indexErect]; 
        bpmNumNext = bpmErectList[indexErect+1]; 
        bpmNumNext1 = bpmErectList[indexErect+2]; 
        bpmNumNext2 = bpmErectList[indexErect+3]; 
    }
}

function weekNumHandler()
{
    if (erectMode == false)
    {
        // random
        if (index-1 == 0 || index-1 == 1)
        {
            weekNumLabelPrior.playAnim("zero");
        }
        if (index == 0 || index == 1)
        {
            weekNumLabelCur.playAnim("zero");
        }
        if (index+1 == 0 || index+1 == 1)
        {
            weekNumLabelNext.playAnim("zero");
        }
        if (index+2 == 0 || index+2 == 1)
        {
            weekNumLabelNext1.playAnim("zero");
        }
        if (index+3 == 0 || index+3 == 1)
        {
            weekNumLabelNext2.playAnim("zero");
        }
        // week1
        if (index-1 == 2 || index-1 == 3 || index-1 == 4)
        {
            weekNumLabelPrior.playAnim("one");
        }
        if (index == 2 || index == 3 || index == 4)
        {
            weekNumLabelCur.playAnim("one");
        }
        if (index+1 == 2 || index+1 == 3 || index+1 == 4)
        {
            weekNumLabelNext.playAnim("one");
        }
        if (index+2 == 2 || index+2 == 3 || index+2 == 4)
        {
            weekNumLabelNext1.playAnim("one");
        }
        if (index+3 == 2 || index+3 == 3 || index+3 == 4)
        {
            weekNumLabelNext2.playAnim("one");
        }

        // week2
        if (index-1 == 5 || index-1 == 6 || index-1 == 7)
        {
            weekNumLabelPrior.playAnim("two");
        }
        if (index == 5 || index == 6 || index == 7)
        {
            weekNumLabelCur.playAnim("two");
        }
        if (index+1 == 5 || index+1 == 6 || index+1 == 7)
        {
            weekNumLabelNext.playAnim("two");
        }
        if (index+2 == 5 || index+2 == 6 || index+2 == 7)
        {
            weekNumLabelNext1.playAnim("two");
        }
        if (index+3 == 5 || index+3 == 6 || index+3 == 7)
        {
            weekNumLabelNext2.playAnim("two");
        }

        // week3
        if (index-1 == 8 || index-1 == 9 || index-1 == 10)
        {
            weekNumLabelPrior.playAnim("three");
        }
        if (index == 8 || index == 9 || index == 10)
        {
            weekNumLabelCur.playAnim("three");
        }
        if (index+1 == 8 || index+1 == 9 || index+1 == 10)
        {
            weekNumLabelNext.playAnim("three");
        }
        if (index+2 == 8 || index+2 == 9 || index+2 == 10)
        {
            weekNumLabelNext1.playAnim("three");
        }
        if (index+3 == 8 || index+3 == 9 || index+3 == 10)
        {
            weekNumLabelNext2.playAnim("three");
        }

        // week4
        if (index-1 == 11 || index-1 == 12 || index-1 == 13)
        {
            weekNumLabelPrior.playAnim("four");
        }
        if (index == 11 || index == 12 || index == 13)
        {
            weekNumLabelCur.playAnim("four");
        }
        if (index+1 == 11 || index+1 == 12 || index+1 == 13)
        {
            weekNumLabelNext.playAnim("four");
        }
        if (index+2 == 11 || index+2 == 12 || index+2 == 13)
        {
            weekNumLabelNext1.playAnim("four");
        }
        if (index+3 == 11 || index+3 == 12 || index+3 == 13)
        {
            weekNumLabelNext2.playAnim("four");
        }

        // week5
        if (index-1 == 14 || index-1 == 15 || index-1 == 16)
        {
            weekNumLabelPrior.playAnim("five");
        }
        if (index == 14 || index == 15 || index == 16)
        {
            weekNumLabelCur.playAnim("five");
        }
        if (index+1 == 14 || index+1 == 15 || index+1 == 16)
        {
            weekNumLabelNext.playAnim("five");
        }
        if (index+2 == 14 || index+2 == 15 || index+2 == 16)
        {
            weekNumLabelNext1.playAnim("five");
        }
        if (index+3 == 14 || index+3 == 15 || index+3 == 16)
        {
            weekNumLabelNext2.playAnim("five");
        }

        // week6
        if (index-1 == 17 || index-1 == 18 || index-1 == 19)
        {
            weekNumLabelPrior.playAnim("six");
        }
        if (index == 17 || index == 18 || index == 19)
        {
            weekNumLabelCur.playAnim("six");
        }
        if (index+1 == 17 || index+1 == 18 || index+1 == 19)
        {
            weekNumLabelNext.playAnim("six");
        }
        if (index+2 == 17 || index+2 == 18 || index+2 == 19)
        {
            weekNumLabelNext1.playAnim("six");
        }
        if (index+3 == 17 || index+3 == 18 || index+3 == 19)
        {
            weekNumLabelNext2.playAnim("six");
        }

        // week7
        if (index-1 == 20 || index-1 == 21 || index-1 == 22)
        {
            weekNumLabelPrior.playAnim("seven");
        }
        if (index == 20 || index == 21 || index == 22)
        {
            weekNumLabelCur.playAnim("seven");
        }
        if (index+1 == 20 || index+1 == 21 || index+1 == 22)
        {
            weekNumLabelNext.playAnim("seven");
        }
        if (index+2 == 20 || index+2 == 21 || index+2 == 22)
        {
            weekNumLabelNext1.playAnim("seven");
        }
        if (index+3 == 20 || index+3 == 21 || index+3 == 22)
        {
            weekNumLabelNext2.playAnim("seven");
        }

        // weekend1
        if (index-1 == 23 || index-1 == 24)
        {
            weekNumLabelPrior.playAnim("one");
            weekNumLabelPrior.x = 655;

        }
        
        else
        {
            weekNumLabelPrior.x = 620;
        }

        if (index == 23 || index == 24)
        {
            weekNumLabelCur.playAnim("one");
            weekNumLabelCur.x = 705;
            
        }
        else
        {
            weekNumLabelCur.x = 670;
        }

        if (index+1 == 23 || index+1 == 24)
        {
            weekNumLabelNext.playAnim("one");
            weekNumLabelNext.x = 715;
           
        }
        else
        {
            weekNumLabelNext.x = 675;
        }
        

        if (index+2 == 23 || index+2 == 24)
        {
            weekNumLabelNext1.playAnim("one");
            weekNumLabelNext1.x = 660;
            
        }
        else
        {
            weekNumLabelNext1.x = 625;
        }
        

        if (index+3 == 23 || index+3 == 24)
        {
            weekNumLabelNext2.playAnim("one");
            weekNumLabelNext2.x = 610;
        }
        else
        {
            weekNumLabelNext2.x = 575;
        }
        
        
        
    }

    if (erectMode == true)
    {
        weekNumLabelPrior.x = 620;
        weekNumLabelCur.x = 670;
        weekNumLabelNext.x = 675;
        weekNumLabelNext1.x = 625;
        weekNumLabelNext2.x = 575;
        // random
        if (indexErect-1 == 0)
        {
            weekNumLabelPrior.playAnim("zero");
        }
        if (indexErect == 0)
        {
            weekNumLabelCur.playAnim("zero");
        }
        if (indexErect+1 == 0)
        {
            weekNumLabelNext.playAnim("zero");
        }
        if (indexErect+2 == 0)
        {
            weekNumLabelNext1.playAnim("zero");
        }
        if (indexErect+3 == 0)
        {
            weekNumLabelNext2.playAnim("zero");
        }
        // week1
        if (indexErect-1 == 1 || indexErect-1 == 2 || indexErect-1 == 3)
        {
            weekNumLabelPrior.playAnim("one");
        }
        if (indexErect == 1 || indexErect == 2 || indexErect == 3)
        {
            weekNumLabelCur.playAnim("one");
        }
        if (indexErect+1 == 1 || indexErect+1 == 2 || indexErect+1 == 3)
        {
            weekNumLabelNext.playAnim("one");
        }
        if (indexErect+2 == 1 || indexErect+2 == 2 || indexErect+2 == 3)
        {
            weekNumLabelNext1.playAnim("one");
        }
        if (indexErect+3 == 1 || indexErect+3 == 2 || indexErect+3 == 3)
        {
            weekNumLabelNext2.playAnim("one");
        }

        // week2
        if (indexErect-1 == 4 || indexErect-1 == 5)
        {
            weekNumLabelPrior.playAnim("two");
        }
        if (indexErect == 4 || indexErect == 5)
        {
            weekNumLabelCur.playAnim("two");
        }
        if (indexErect+1 == 4 || indexErect+1 == 5)
        {
            weekNumLabelNext.playAnim("two");
        }
        if (indexErect+2 == 4 || indexErect+2 == 5)
        {
            weekNumLabelNext1.playAnim("two");
        }
        if (indexErect+3 == 4 || indexErect+3 == 5)
        {
            weekNumLabelNext2.playAnim("two");
        }

        // week3
        if (indexErect-1 == 6 || indexErect-1 == 7 || indexErect-1 == 8)
        {
            weekNumLabelPrior.playAnim("three");
        }
        if (indexErect == 6 || indexErect == 7 || indexErect == 8)
        {
            weekNumLabelCur.playAnim("three");
        }
        if (indexErect+1 == 6 || indexErect+1 == 7 || indexErect+1 == 8)
        {
            weekNumLabelNext.playAnim("three");
        }
        if (indexErect+2 == 6 || indexErect+2 == 7 || indexErect+2 == 8)
        {
            weekNumLabelNext1.playAnim("three");
        }
        if (indexErect+3 == 6 || indexErect+3 == 7 || indexErect+3 == 8)
        {
            weekNumLabelNext2.playAnim("three");
        }

        // week4
        if (indexErect-1 == 9 || indexErect-1 == 10)
        {
            weekNumLabelPrior.playAnim("four");
        }
        if (indexErect == 9 || indexErect == 10)
        {
            weekNumLabelCur.playAnim("four");
        }
        if (indexErect+1 == 9 || indexErect+1 == 10)
        {
            weekNumLabelNext.playAnim("four");
        }
        if (indexErect+2 == 9 || indexErect+2 == 10)
        {
            weekNumLabelNext1.playAnim("four");
        }
        if (indexErect+3 == 9 || indexErect+3 == 10)
        {
            weekNumLabelNext2.playAnim("four");
        }

        // week5
        if (indexErect-1 == 11 || indexErect-1 == 12)
        {
            weekNumLabelPrior.playAnim("five");
        }
        if (indexErect == 11 || indexErect == 12)
        {
            weekNumLabelCur.playAnim("five");
        }
        if (indexErect+1 == 11 || indexErect+1 == 12)
        {
            weekNumLabelNext.playAnim("five");
        }
        if (indexErect+2 == 11 || indexErect+2 == 12)
        {
            weekNumLabelNext1.playAnim("five");
        }
        if (indexErect+3 == 11 || indexErect+3 == 12)
        {
            weekNumLabelNext2.playAnim("five");
        }

        // week6
        if (indexErect-1 == 13 || indexErect-1 == 14 || indexErect-1 == 15)
        {
            weekNumLabelPrior.playAnim("six");
        }
        if (indexErect == 13 || indexErect == 14 || indexErect == 15)
        {
            weekNumLabelCur.playAnim("six");
        }
        if (indexErect+1 == 13 || indexErect+1 == 14 || indexErect+1 == 15)
        {
            weekNumLabelNext.playAnim("six");
        }
        if (indexErect+2 == 13 || indexErect+2 == 14 || indexErect+2 == 15)
        {
            weekNumLabelNext1.playAnim("six");
        }
        if (indexErect+3 == 13 || indexErect+3 == 14 || indexErect+3 == 15)
        {
            weekNumLabelNext2.playAnim("six");
        }

        // week7
        if (indexErect-1 == 16)
        {
            weekNumLabelPrior.playAnim("seven");
        }
        if (indexErect == 16)
        {
            weekNumLabelCur.playAnim("seven");
        }
        if (indexErect+1 == 16)
        {
            weekNumLabelNext.playAnim("seven");
        }
        if (indexErect+2 == 16)
        {
            weekNumLabelNext1.playAnim("seven");
        }
        if (indexErect+3 == 16)
        {
            weekNumLabelNext2.playAnim("seven");
        }
    }
}

function capsuleHandler()
{
    if (erectMode == false)
    {
        if (index+3 == 24 || index+3 == 23)
        {
            weekLabelNext2.playAnim("weekend");
        }
        else
        {
            weekLabelNext2.playAnim("week");
        }

        if (index+2 == 23 || index+2 == 24)
        {
            weekLabelNext1.playAnim("weekend");
        }
        else
        {
            weekLabelNext1.playAnim("week");
        }
        if (index+1 == 23 || index+1 == 24)
        {
            weekLabelNext.playAnim("weekend");
        }
        else
        {
            weekLabelNext.playAnim("week");
        }
        if (index == 24 || index == 23)
        {
            weekLabelCur.playAnim("weekend");
        }
        else
        {
            weekLabelCur.playAnim("week");
        }
        if (index-1 == 23)
        {
            weekLabelPrior.playAnim("weekend");
        }
        else
        {
            weekLabelPrior.playAnim("week");
        }

        

        if (index >= songList.length - 3)
        {
            
            freeplayCapsuleNext2.visible = false;
            nextSongLabel2.visible = false;
            IconNext2.visible = false;
            diffNext2.visible = false;
            bpmNext2.visible = false;
            weekLabelNext2.visible = false;
            tensNext2.visible = false;
            onesNext2.visible = false;
            weekNumLabelNext2.visible = false;
            onesBPMNext2.visible = false;
            tensBPMNext2.visible = false;
            hundsBPMNext2.visible = false;
        }
        else
        {
            
            freeplayCapsuleNext2.visible = true;
            nextSongLabel2.visible = true;
            IconNext2.visible = true;
            diffNext2.visible = true;
            bpmNext2.visible = true;
            weekLabelNext2.visible = true;
            tensNext2.visible = true;
            onesNext2.visible = true;
            weekNumLabelNext2.visible = true;
            onesBPMNext2.visible = true;
            tensBPMNext2.visible = true;
            hundsBPMNext2.visible = true;
            
        }

        if (index >= songList.length - 2)
        {
            
            freeplayCapsuleNext1.visible = false;
            nextSongLabel1.visible = false;
            IconNext1.visible = false;
            diffNext1.visible = false;
            bpmNext1.visible = false;
            weekLabelNext1.visible = false;
            tensNext1.visible = false;
            onesNext1.visible = false;
            weekNumLabelNext1.visible = false;
            onesBPMNext1.visible = false;
            tensBPMNext1.visible = false;
            hundsBPMNext1.visible = false;

        }
        else
        {
        
            freeplayCapsuleNext1.visible = true;
            nextSongLabel1.visible = true;
            IconNext1.visible = true;
            diffNext1.visible = true;
            bpmNext1.visible = true;
            weekLabelNext1.visible = true;
            tensNext1.visible = true;
            onesNext1.visible = true;
            weekNumLabelNext1.visible = true;
            onesBPMNext1.visible = true;
            tensBPMNext1.visible = true;
            hundsBPMNext1.visible = true;
            
        }

        if (index >= songList.length - 1)
        {
           
            freeplayCapsuleNext.visible = false;
            nextSongLabel.visible = false;
            IconNext.visible = false;
            diffNext.visible = false;
            bpmNext.visible = false;
            weekLabelNext.visible = false;
            tensNext.visible = false;
            onesNext.visible = false;
            weekNumLabelNext.visible = false;
            onesBPMNext.visible = false;
            tensBPMNext.visible = false;
            hundsBPMNext.visible = false;
            
        }
        else
        {
            
            freeplayCapsuleNext.visible = true;
            nextSongLabel.visible = true;
            IconNext.visible = true;
            diffNext.visible = true;
            bpmNext.visible = true;
            weekLabelNext.visible = true;
            tensNext.visible = true;
            onesNext.visible = true;
            weekNumLabelNext.visible = true;
            onesBPMNext.visible = true;
            tensBPMNext.visible = true;
            hundsBPMNext.visible = true;
        }
        if (index == 0)
        {
            freeplayCapsulePrior.visible = false;
            PriorSongLabel.visible = false;
            IconPrior.visible = false;
            diffPrior.visible = false;
            bpmPrior.visible = false;
            weekLabelPrior.visible = false;
            tensPrior.visible = false;
            onesPrior.visible = false;
            weekNumLabelPrior.visible = false;
            onesBPMPrior.visible = false;
            tensBPMPrior.visible = false;
            hundsBPMPrior.visible = false;
        }
        else
        {
            freeplayCapsulePrior.visible = true;
            PriorSongLabel.visible = true;
            IconPrior.visible = true;
            diffPrior.visible = true;
            bpmPrior.visible = true;
            weekLabelPrior.visible = true;
            tensPrior.visible = true;
            onesPrior.visible = true;
            weekNumLabelPrior.visible = true;
            onesBPMPrior.visible = true;
            tensBPMPrior.visible = true;
            hundsBPMPrior.visible = true;
        }
    }

    if (erectMode == true)
    {
        weekLabelNext2.playAnim("week");
        weekLabelNext1.playAnim("week");
        weekLabelNext.playAnim("week");
        weekLabelCur.playAnim("week");
        weekLabelPrior.playAnim("week");
        
        if (indexErect == 0)
        {
            freeplayCapsulePrior.visible = false;
            PriorSongLabel.visible = false;
            IconPrior.visible = false;
            diffPrior.visible = false;
            bpmPrior.visible = false;
            weekLabelPrior.visible = false;
            tensPrior.visible = false;
            onesPrior.visible = false;
            weekNumLabelPrior.visible = false;
            onesBPMPrior.visible = false;
            tensBPMPrior.visible = false;
            hundsBPMPrior.visible = false;

        }
        else
        {
            freeplayCapsulePrior.visible = true;
            PriorSongLabel.visible = true;
            IconPrior.visible = true;
            diffPrior.visible = true;
            bpmPrior.visible = true;
            weekLabelPrior.visible = true;
            tensPrior.visible = true;
            onesPrior.visible = true;
            weekNumLabelPrior.visible = true;
            onesBPMPrior.visible = true;
            tensBPMPrior.visible = true;
            hundsBPMPrior.visible = true;
        }

        if (indexErect >= songErectList.length - 3)
        {
            freeplayCapsuleNext2.visible = false;
            nextSongLabel2.visible = false;
            IconNext2.visible = false;
            diffNext2.visible = false;
            bpmNext2.visible = false;
            weekLabelNext2.visible = false;
            tensNext2.visible = false;
            onesNext2.visible = false;
            weekNumLabelNext2.visible = false;
            onesBPMNext2.visible = false;
            tensBPMNext2.visible = false;
            hundsBPMNext2.visible = false;
        }
        else
        {
            freeplayCapsuleNext2.visible = true;
            nextSongLabel2.visible = true;
            IconNext2.visible = true;
            diffNext2.visible = true;
            bpmNext2.visible = true;
            weekLabelNext2.visible = true;
            tensNext2.visible = true;
            onesNext2.visible = true;
            weekNumLabelNext2.visible = true;
            onesBPMNext2.visible = true;
            tensBPMNext2.visible = true;
            hundsBPMNext2.visible = true;
        }

        if (indexErect >= songErectList.length - 2)
        {
            freeplayCapsuleNext1.visible = false;
            nextSongLabel1.visible = false;
            IconNext1.visible = false;
            diffNext1.visible = false;
            bpmNext1.visible = false;
            weekLabelNext1.visible = false;
            tensNext1.visible = false;
            onesNext1.visible = false;
            weekNumLabelNext1.visible = false;
            onesBPMNext1.visible = false;
            tensBPMNext1.visible = false;
            hundsBPMNext1.visible = false;
        }
        else
        {
            freeplayCapsuleNext1.visible = true;
            nextSongLabel1.visible = true;
            IconNext1.visible = true;
            diffNext1.visible = true;
            bpmNext1.visible = true;
            weekLabelNext1.visible = true;
            tensNext1.visible = true;
            onesNext1.visible = true;
            weekNumLabelNext1.visible = true;
            onesBPMNext1.visible = true;
            tensBPMNext1.visible = true;
            hundsBPMNext1.visible = true;
        }

        if (indexErect >= songErectList.length - 1)
        {
            freeplayCapsuleNext.visible = false;
            nextSongLabel.visible = false;
            IconNext.visible = false;
            diffNext.visible = false;
            bpmNext.visible = false;
            weekLabelNext.visible = false;
            tensNext.visible = false;
            onesNext.visible = false;
            weekNumLabelNext.visible = false;
            onesBPMNext.visible = false;
            tensBPMNext.visible = false;
            hundsBPMNext.visible = false;
        }
        else
        {
            freeplayCapsuleNext.visible = true;
            nextSongLabel.visible = true;
            IconNext.visible = true;
            diffNext.visible = true;
            bpmNext.visible = true;
            weekLabelNext.visible = true;
            tensNext.visible = true;
            onesNext.visible = true;
            weekNumLabelNext.visible = true;
            onesBPMNext.visible = true;
            tensBPMNext.visible = true;
            hundsBPMNext.visible = true;
        }
    }

    if (diff == 0)
    {
        diffNumPrior = songDiffEasyList[index-1]; 
        diffNumCur = songDiffEasyList[index]; 
        diffNumNext = songDiffEasyList[index+1]; 
        diffNumNext1 = songDiffEasyList[index+2]; 
        diffNumNext2 = songDiffEasyList[index+3]; 
    }

    if (diff == 1)
    {
        diffNumPrior = songDiffNormList[index-1]; 
        diffNumCur = songDiffNormList[index]; 
        diffNumNext = songDiffNormList[index+1]; 
        diffNumNext1 = songDiffNormList[index+2]; 
        diffNumNext2 = songDiffNormList[index+3]; 
    }

    if (diff == 2)
    {
        diffNumPrior = songDiffHardList[index-1]; 
        diffNumCur = songDiffHardList[index]; 
        diffNumNext = songDiffHardList[index+1]; 
        diffNumNext1 = songDiffHardList[index+2]; 
        diffNumNext2 = songDiffHardList[index+3]; 
    }

    if (diff == 3)
    {
        diffNumPrior = songDiffErectList[indexErect-1]; 
        diffNumCur = songDiffErectList[indexErect]; 
        diffNumNext = songDiffErectList[indexErect+1]; 
        diffNumNext1 = songDiffErectList[indexErect+2]; 
        diffNumNext2 = songDiffErectList[indexErect+3]; 
    }

    if (diff == 4)
    {
        diffNumPrior = songDiffNightList[indexErect-1]; 
        diffNumCur = songDiffNightList[indexErect]; 
        diffNumNext = songDiffNightList[indexErect+1]; 
        diffNumNext1 = songDiffNightList[indexErect+2]; 
        diffNumNext2 = songDiffNightList[indexErect+3]; 
    }
    
}

function randomHandler()
{
    if (index == 0)
    {
        if (songStarted == false)
        {
            if (erectMode == false)
            {
                basicRand = FlxG.random.int(1, songList.length - 1);
            }
            if (erectMode == true)
            {
                erectRand = FlxG.random.int(1, songErectList.length - 1);
            }
        }   
        
    }
    if (indexErect == 0)
    {
        if (songStarted == false)
        {
            if (erectMode == true)
            {
                erectRand = FlxG.random.int(1, 16);
            }
        }   
        
    }
}

function debugStatsHandler()
{
    curAnimDebLabel.text = "CA: " + dj.animation.name;

    curFrameDebLabel.text = "CF: " + dj.animation.curAnim.curFrame;

    RemixModeDebLabel.text = "RM: " + remix;

    songExtDebLabel.text = "SE: " + addonthing;
    

    if (erectMode == false)
    {
        erectModeActiveDebLabel.text = "EM: " + erectMode;

        curNumDebLabel.text = "CN: " + index;

        curSongDebLabel.text = "CS: " + displayList[index];

        curRandNumDebLabel.text = "CRN: " + basicRand;

        curRandSongDebLabel.text = "CRS: " + displayList[basicRand];

        curDiffDebLabel.text = "CD: " + diffList[diff];

        
    }

    if (erectMode == true)
    {
        erectModeActiveDebLabel.text = "EM: " + erectMode;

        curNumDebLabel.text = "CNE: " + indexErect;

        curSongDebLabel.text = "CSE: " + displayErectList[indexErect];

        curRandNumDebLabel.text = "CRNE: " + erectRand;

        curRandSongDebLabel.text = "CRSE: " + displayErectList[erectRand];

        curDiffDebLabel.text = "CD: " + diffList[diff];

       
    }

    if (devmode == true)
    {
        debugDataDebLabel.visible = true;

        erectModeActiveDebLabel.visible = true;

        curNumDebLabel.visible = true;

        curSongDebLabel.visible = true;

        curRandNumDebLabel.visible = true;

        curRandSongDebLabel.visible = true;

        curDiffDebLabel.visible = true;

        curCharDebLabel.visible = true;

        curAnimDebLabel.visible = true;

        curFrameDebLabel.visible = true;

        RemixModeDebLabel.visible = true;

        songExtDebLabel.visible = true;
    }
    else
    {
        debugDataDebLabel.visible = false;

        erectModeActiveDebLabel.visible = false;

        curNumDebLabel.visible = false;

        curSongDebLabel.visible = false;

        curRandNumDebLabel.visible = false;

        curRandSongDebLabel.visible = false;

        curDiffDebLabel.visible = false;

        curCharDebLabel.visible = false;

        curAnimDebLabel.visible = false;

        curFrameDebLabel.visible = false;

        RemixModeDebLabel.visible = false;

        songExtDebLabel.visible = false;
    }
}

function bpmDigitsPrior(bpmNumPrior:String)
{
    // Always 3 digits, pad with zeros if needed
    var padded:String = StringTools.lpad(bpmNumPrior, "0", 3);

    // Convert chars to Ints so they match your switch cases
    var onesCharBPMPrior:Int = Std.parseInt(padded.charAt(2));
    var tensCharBPMPrior:Int = Std.parseInt(padded.charAt(1));
    var hundsCharBPMPrior:Int = Std.parseInt(padded.charAt(0));

    

    // Show/hide digits (optional)
    if (hundsCharBPMPrior == 0)
    {
        hundsBPMPrior.visible = false;
    }
    else
    {
        hundsBPMPrior.visible = true;
    }

    if (tensCharBPMPrior == 1)
    {
        onesBPMPrior.x = 474;
    }
    else
    {
        onesBPMPrior.x = 478;
    }
    

    switch (onesCharBPMPrior)
    {
        case 0: onesBPMPrior.animation.play("zero");
        case 1: onesBPMPrior.animation.play("one");
        case 2: onesBPMPrior.animation.play("two");
        case 3: onesBPMPrior.animation.play("three");
        case 4: onesBPMPrior.animation.play("four");
        case 5: onesBPMPrior.animation.play("five");
        case 6: onesBPMPrior.animation.play("six");
        case 7: onesBPMPrior.animation.play("seven");
        case 8: onesBPMPrior.animation.play("eight");
        case 9: onesBPMPrior.animation.play("nine");
    }

    switch (tensCharBPMPrior)
    {
        case 0: tensBPMPrior.animation.play("zero");
        case 1: tensBPMPrior.animation.play("one");
        case 2: tensBPMPrior.animation.play("two");
        case 3: tensBPMPrior.animation.play("three");
        case 4: tensBPMPrior.animation.play("four");
        case 5: tensBPMPrior.animation.play("five");
        case 6: tensBPMPrior.animation.play("six");
        case 7: tensBPMPrior.animation.play("seven");
        case 8: tensBPMPrior.animation.play("eight");
        case 9: tensBPMPrior.animation.play("nine");
    }

    switch (hundsCharBPMPrior)
    {
        case 0: hundsBPMPrior.animation.play("zero");
        case 1: hundsBPMPrior.animation.play("one");
        case 2: hundsBPMPrior.animation.play("two");
        case 3: hundsBPMPrior.animation.play("three");
        case 4: hundsBPMPrior.animation.play("four");
        case 5: hundsBPMPrior.animation.play("five");
        case 6: hundsBPMPrior.animation.play("six");
        case 7: hundsBPMPrior.animation.play("seven");
        case 8: hundsBPMPrior.animation.play("eight");
        case 9: hundsBPMPrior.animation.play("nine");
    }
}

function bpmDigitsCur(bpmNumCur:String)
{
    // Always 3 digits, pad with zeros if needed
    var padded:String = StringTools.lpad(bpmNumCur, "0", 3);

    // Convert chars to Ints so they match your switch cases
    var onesCharBPMCur:Int = Std.parseInt(padded.charAt(2));
    var tensCharBPMCur:Int = Std.parseInt(padded.charAt(1));
    var hundsCharBPMCur:Int = Std.parseInt(padded.charAt(0));

    

    // Show/hide digits (optional)
    if (hundsCharBPMCur == 0)
    {
        hundsBPMCur.visible = false;
    }
    else
    {
        hundsBPMCur.visible = true;
    }

    if (tensCharBPMCur == 1)
    {
        onesBPMCur.x = 521;
    }
    else
    {
        onesBPMCur.x = 525;
    }
    

    switch (onesCharBPMCur)
    {
        case 0: onesBPMCur.animation.play("zero");
        case 1: onesBPMCur.animation.play("one");
        case 2: onesBPMCur.animation.play("two");
        case 3: onesBPMCur.animation.play("three");
        case 4: onesBPMCur.animation.play("four");
        case 5: onesBPMCur.animation.play("five");
        case 6: onesBPMCur.animation.play("six");
        case 7: onesBPMCur.animation.play("seven");
        case 8: onesBPMCur.animation.play("eight");
        case 9: onesBPMCur.animation.play("nine");
    }

    switch (tensCharBPMCur)
    {
        case 0: tensBPMCur.animation.play("zero");
        case 1: tensBPMCur.animation.play("one");
        case 2: tensBPMCur.animation.play("two");
        case 3: tensBPMCur.animation.play("three");
        case 4: tensBPMCur.animation.play("four");
        case 5: tensBPMCur.animation.play("five");
        case 6: tensBPMCur.animation.play("six");
        case 7: tensBPMCur.animation.play("seven");
        case 8: tensBPMCur.animation.play("eight");
        case 9: tensBPMCur.animation.play("nine");
    }

    switch (hundsCharBPMCur)
    {
        case 0: hundsBPMCur.animation.play("zero");
        case 1: hundsBPMCur.animation.play("one");
        case 2: hundsBPMCur.animation.play("two");
        case 3: hundsBPMCur.animation.play("three");
        case 4: hundsBPMCur.animation.play("four");
        case 5: hundsBPMCur.animation.play("five");
        case 6: hundsBPMCur.animation.play("six");
        case 7: hundsBPMCur.animation.play("seven");
        case 8: hundsBPMCur.animation.play("eight");
        case 9: hundsBPMCur.animation.play("nine");
    }
}

function bpmDigitsNext(bpmNumNext:String)
{
    // Always 3 digits, pad with zeros if needed
    var padded:String = StringTools.lpad(bpmNumNext, "0", 3);

    // Convert chars to Ints so they match your switch cases
    var onesCharBPMNext:Int = Std.parseInt(padded.charAt(2));
    var tensCharBPMNext:Int = Std.parseInt(padded.charAt(1));
    var hundsCharBPMNext:Int = Std.parseInt(padded.charAt(0));

    

    // Show/hide digits (optional)
    if (hundsCharBPMNext == 0)
    {
        hundsBPMNext.visible = false;
    }
    else
    {
        hundsBPMNext.visible = true;
    }

    if (tensCharBPMNext == 1)
    {
        onesBPMNext.x = 523;
    }
    else
    {
        onesBPMNext.x = 528;
    }
    

    switch (onesCharBPMNext)
    {
        case 0: onesBPMNext.animation.play("zero");
        case 1: onesBPMNext.animation.play("one");
        case 2: onesBPMNext.animation.play("two");
        case 3: onesBPMNext.animation.play("three");
        case 4: onesBPMNext.animation.play("four");
        case 5: onesBPMNext.animation.play("five");
        case 6: onesBPMNext.animation.play("six");
        case 7: onesBPMNext.animation.play("seven");
        case 8: onesBPMNext.animation.play("eight");
        case 9: onesBPMNext.animation.play("nine");
    }

    switch (tensCharBPMNext)
    {
        case 0: tensBPMNext.animation.play("zero");
        case 1: tensBPMNext.animation.play("one");
        case 2: tensBPMNext.animation.play("two");
        case 3: tensBPMNext.animation.play("three");
        case 4: tensBPMNext.animation.play("four");
        case 5: tensBPMNext.animation.play("five");
        case 6: tensBPMNext.animation.play("six");
        case 7: tensBPMNext.animation.play("seven");
        case 8: tensBPMNext.animation.play("eight");
        case 9: tensBPMNext.animation.play("nine");
    }

    switch (hundsCharBPMNext)
    {
        case 0: hundsBPMNext.animation.play("zero");
        case 1: hundsBPMNext.animation.play("one");
        case 2: hundsBPMNext.animation.play("two");
        case 3: hundsBPMNext.animation.play("three");
        case 4: hundsBPMNext.animation.play("four");
        case 5: hundsBPMNext.animation.play("five");
        case 6: hundsBPMNext.animation.play("six");
        case 7: hundsBPMNext.animation.play("seven");
        case 8: hundsBPMNext.animation.play("eight");
        case 9: hundsBPMNext.animation.play("nine");
    }
}

function bpmDigitsNext1(bpmNumNext1:String)
{
    // Always 3 digits, pad with zeros if needed
    var padded:String = StringTools.lpad(bpmNumNext1, "0", 3);

    // Convert chars to Ints so they match your switch cases
    var onesCharBPMNext1:Int = Std.parseInt(padded.charAt(2));
    var tensCharBPMNext1:Int = Std.parseInt(padded.charAt(1));
    var hundsCharBPMNext1:Int = Std.parseInt(padded.charAt(0));

    

    // Show/hide digits (optional)
    if (hundsCharBPMNext1 == 0)
    {
        hundsBPMNext1.visible = false;
    }
    else
    {
        hundsBPMNext1.visible = true;
    }

    if (tensCharBPMNext1 == 1)
    {
        onesBPMNext1.x = 481;
    }
    else
    {
        onesBPMNext1.x = 485;
    }
    

    switch (onesCharBPMNext1)
    {
        case 0: onesBPMNext1.animation.play("zero");
        case 1: onesBPMNext1.animation.play("one");
        case 2: onesBPMNext1.animation.play("two");
        case 3: onesBPMNext1.animation.play("three");
        case 4: onesBPMNext1.animation.play("four");
        case 5: onesBPMNext1.animation.play("five");
        case 6: onesBPMNext1.animation.play("six");
        case 7: onesBPMNext1.animation.play("seven");
        case 8: onesBPMNext1.animation.play("eight");
        case 9: onesBPMNext1.animation.play("nine");
    }

    switch (tensCharBPMNext1)
    {
        case 0: tensBPMNext1.animation.play("zero");
        case 1: tensBPMNext1.animation.play("one");
        case 2: tensBPMNext1.animation.play("two");
        case 3: tensBPMNext1.animation.play("three");
        case 4: tensBPMNext1.animation.play("four");
        case 5: tensBPMNext1.animation.play("five");
        case 6: tensBPMNext1.animation.play("six");
        case 7: tensBPMNext1.animation.play("seven");
        case 8: tensBPMNext1.animation.play("eight");
        case 9: tensBPMNext1.animation.play("nine");
    }

    switch (hundsCharBPMNext1)
    {
        case 0: hundsBPMNext1.animation.play("zero");
        case 1: hundsBPMNext1.animation.play("one");
        case 2: hundsBPMNext1.animation.play("two");
        case 3: hundsBPMNext1.animation.play("three");
        case 4: hundsBPMNext1.animation.play("four");
        case 5: hundsBPMNext1.animation.play("five");
        case 6: hundsBPMNext1.animation.play("six");
        case 7: hundsBPMNext1.animation.play("seven");
        case 8: hundsBPMNext1.animation.play("eight");
        case 9: hundsBPMNext1.animation.play("nine");
    }
}

function bpmDigitsNext2(bpmNumNext2:String)
{
    // Always 3 digits, pad with zeros if needed
    var padded:String = StringTools.lpad(bpmNumNext2, "0", 3);

    // Convert chars to Ints so they match your switch cases
    var onesCharBPMNext2:Int = Std.parseInt(padded.charAt(2));
    var tensCharBPMNext2:Int = Std.parseInt(padded.charAt(1));
    var hundsCharBPMNext2:Int = Std.parseInt(padded.charAt(0));

    

    // Show/hide digits (optional)
    if (hundsCharBPMNext2 == 0)
    {
        hundsBPMNext2.visible = false;
    }
    else
    {
        hundsBPMNext2.visible = true;
    }

    if (tensCharBPMNext2 == 1)
    {
        onesBPMNext2.x = 426;
    }
    else
    {
        onesBPMNext2.x = 430;
    }
    

    switch (onesCharBPMNext2)
    {
        case 0: onesBPMNext2.animation.play("zero");
        case 1: onesBPMNext2.animation.play("one");
        case 2: onesBPMNext2.animation.play("two");
        case 3: onesBPMNext2.animation.play("three");
        case 4: onesBPMNext2.animation.play("four");
        case 5: onesBPMNext2.animation.play("five");
        case 6: onesBPMNext2.animation.play("six");
        case 7: onesBPMNext2.animation.play("seven");
        case 8: onesBPMNext2.animation.play("eight");
        case 9: onesBPMNext2.animation.play("nine");
    }

    switch (tensCharBPMNext2)
    {
        case 0: tensBPMNext2.animation.play("zero");
        case 1: tensBPMNext2.animation.play("one");
        case 2: tensBPMNext2.animation.play("two");
        case 3: tensBPMNext2.animation.play("three");
        case 4: tensBPMNext2.animation.play("four");
        case 5: tensBPMNext2.animation.play("five");
        case 6: tensBPMNext2.animation.play("six");
        case 7: tensBPMNext2.animation.play("seven");
        case 8: tensBPMNext2.animation.play("eight");
        case 9: tensBPMNext2.animation.play("nine");
    }

    switch (hundsCharBPMNext2)
    {
        case 0: hundsBPMNext2.animation.play("zero");
        case 1: hundsBPMNext2.animation.play("one");
        case 2: hundsBPMNext2.animation.play("two");
        case 3: hundsBPMNext2.animation.play("three");
        case 4: hundsBPMNext2.animation.play("four");
        case 5: hundsBPMNext2.animation.play("five");
        case 6: hundsBPMNext2.animation.play("six");
        case 7: hundsBPMNext2.animation.play("seven");
        case 8: hundsBPMNext2.animation.play("eight");
        case 9: hundsBPMNext2.animation.play("nine");
    }
}

function difficultyDigitsPrior(diffNumPrior:String)
{
    var padded:String = StringTools.lpad(diffNumPrior, "0", 2);
    var onesCharPrior:String = padded.charAt(1);
    var tensCharPrior:String = padded.charAt(0);

    switch (tensCharPrior)
    {
        case "0": tensPrior.animation.play("zero");
        case "1": tensPrior.animation.play("one");
        case "2": tensPrior.animation.play("two");
        case "3": tensPrior.animation.play("three");
        case "4": tensPrior.animation.play("four");
        case "5": tensPrior.animation.play("five");
        case "6": tensPrior.animation.play("six");
        case "7": tensPrior.animation.play("seven");
        case "8": tensPrior.animation.play("eight");
        case "9": tensPrior.animation.play("nine");
    }

    switch (onesCharPrior)
    {
        case "0": onesPrior.animation.play("zero");
        case "1": onesPrior.animation.play("one");
        case "2": onesPrior.animation.play("two");
        case "3": onesPrior.animation.play("three");
        case "4": onesPrior.animation.play("four");
        case "5": onesPrior.animation.play("five");
        case "6": onesPrior.animation.play("six");
        case "7": onesPrior.animation.play("seven");
        case "8": onesPrior.animation.play("eight");
        case "9": onesPrior.animation.play("nine");
    }
}

function difficultyDigitsCur(diffNumCur:String)
{
    var padded:String = StringTools.lpad(diffNumCur, "0", 2);
    var tensCurChar:String = padded.charAt(0);
    var onesCurChar:String = padded.charAt(1);

    switch (tensCurChar)
    {
        case "0": tensCur.animation.play("zero");
        case "1": tensCur.animation.play("one");
        case "2": tensCur.animation.play("two");
        case "3": tensCur.animation.play("three");
        case "4": tensCur.animation.play("four");
        case "5": tensCur.animation.play("five");
        case "6": tensCur.animation.play("six");
        case "7": tensCur.animation.play("seven");
        case "8": tensCur.animation.play("eight");
        case "9": tensCur.animation.play("nine");
    }

    switch (onesCurChar)
    {
        case "0": onesCur.animation.play("zero");
        case "1": onesCur.animation.play("one");
        case "2": onesCur.animation.play("two");
        case "3": onesCur.animation.play("three");
        case "4": onesCur.animation.play("four");
        case "5": onesCur.animation.play("five");
        case "6": onesCur.animation.play("six");
        case "7": onesCur.animation.play("seven");
        case "8": onesCur.animation.play("eight");
        case "9": onesCur.animation.play("nine");
    }
}

function difficultyDigitsNext(diffNumNext:String)
{
    var padded:String = StringTools.lpad(diffNumNext, "0", 2);

    var tensNextChar:String = padded.charAt(0);
    var onesNextChar:String = padded.charAt(1);

    switch (tensNextChar)
    {
        case "0": tensNext.animation.play("zero");
        case "1": tensNext.animation.play("one");
        case "2": tensNext.animation.play("two");
        case "3": tensNext.animation.play("three");
        case "4": tensNext.animation.play("four");
        case "5": tensNext.animation.play("five");
        case "6": tensNext.animation.play("six");
        case "7": tensNext.animation.play("seven");
        case "8": tensNext.animation.play("eight");
        case "9": tensNext.animation.play("nine");
    }

    switch (onesNextChar)
    {
        case "0": onesNext.animation.play("zero");
        case "1": onesNext.animation.play("one");
        case "2": onesNext.animation.play("two");
        case "3": onesNext.animation.play("three");
        case "4": onesNext.animation.play("four");
        case "5": onesNext.animation.play("five");
        case "6": onesNext.animation.play("six");
        case "7": onesNext.animation.play("seven");
        case "8": onesNext.animation.play("eight");
        case "9": onesNext.animation.play("nine");
    }
}

function difficultyDigitsNext1(diffNumNext1:String)
{
    var padded:String = StringTools.lpad(diffNumNext1, "0", 2);

    var tensNext1Char:String = padded.charAt(0);
    var onesNext1Char:String = padded.charAt(1);

    switch (tensNext1Char)
    {
        case "0": tensNext1.animation.play("zero");
        case "1": tensNext1.animation.play("one");
        case "2": tensNext1.animation.play("two");
        case "3": tensNext1.animation.play("three");
        case "4": tensNext1.animation.play("four");
        case "5": tensNext1.animation.play("five");
        case "6": tensNext1.animation.play("six");
        case "7": tensNext1.animation.play("seven");
        case "8": tensNext1.animation.play("eight");
        case "9": tensNext1.animation.play("nine");
    }

    switch (onesNext1Char)
    {
        case "0": onesNext1.animation.play("zero");
        case "1": onesNext1.animation.play("one");
        case "2": onesNext1.animation.play("two");
        case "3": onesNext1.animation.play("three");
        case "4": onesNext1.animation.play("four");
        case "5": onesNext1.animation.play("five");
        case "6": onesNext1.animation.play("six");
        case "7": onesNext1.animation.play("seven");
        case "8": onesNext1.animation.play("eight");
        case "9": onesNext1.animation.play("nine");
    }
}

function difficultyDigitsNext2(diffNumNext2:String)
{
    var padded:String = StringTools.lpad(diffNumNext2, "0", 2);

    var tensNext2Char:String = padded.charAt(0);
    var onesNext2Char:String = padded.charAt(1);

    switch (tensNext2Char)
    {
        case "0": tensNext2.animation.play("zero");
        case "1": tensNext2.animation.play("one");
        case "2": tensNext2.animation.play("two");
        case "3": tensNext2.animation.play("three");
        case "4": tensNext2.animation.play("four");
        case "5": tensNext2.animation.play("five");
        case "6": tensNext2.animation.play("six");
        case "7": tensNext2.animation.play("seven");
        case "8": tensNext2.animation.play("eight");
        case "9": tensNext2.animation.play("nine");
    }

    switch (onesNext2Char)
    {
        case "0": onesNext2.animation.play("zero");
        case "1": onesNext2.animation.play("one");
        case "2": onesNext2.animation.play("two");
        case "3": onesNext2.animation.play("three");
        case "4": onesNext2.animation.play("four");
        case "5": onesNext2.animation.play("five");
        case "6": onesNext2.animation.play("six");
        case "7": onesNext2.animation.play("seven");
        case "8": onesNext2.animation.play("eight");
        case "9": onesNext2.animation.play("nine");
    }
}

function diffChange(direction)
{
    // left
    if (direction == "left")
    {
        if (diff < 0)
        {   
            
            // Random
            if (index==0)
            {
                indexErect=0;
            }
            // Tutorial
            if (index==1)
            {
                indexErect=1;
            }
            // bopeebo
            if (index==2)
            {
                indexErect=1;
            }
            // fresh
            if (index==3)
            {
                indexErect=2;
            }
            // dadbattle
            if (index==4)
            {
                indexErect=3;
            }
            // spookeez
            if (index==5)
            {
                indexErect=4;
            }
            // south
            if (index==6)
            {
                indexErect=5;
            }
            // monster
            if (index==7)
            {
                indexErect=5;
            }
            // pico
            if (index==8)
            {
                indexErect=6;
            }
            // philly nice
            if (index==9)
            {
                indexErect=7;
            }
            // blammed
            if (index==10)
            {
                indexErect=8;
            }
            // satin panties
            if (index==11)
            {
                indexErect=9;
            }
            // high
            if (index==12)
            {
                indexErect=10;
            }
            // milf
            if (index==13)
            {
                indexErect=10;
            }
            // cocoa
            if (index==14)
            {
                indexErect=11;
            }
            // eggnog
            if (index==15)
            {
                indexErect=12;
            }
            // winter horrorland
            if (index==16)
            {
                indexErect=12;
            }
            // senpai
            if (index==17)
            {
                indexErect=13;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;

                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;

                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
            }
            // roses
            if (index==18)
            {
                indexErect=14;

                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;

                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;

                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
                bpmNext2.visible = false;
            }
            // thorns
            if (index==19)
            {
                indexErect=15;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;

                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;
                bpmNext1.visible = false;

                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
                bpmNext2.visible = false;
                
                
            }
            // ugh
            if (index==20)
            {
                indexErect=16;
                freeplayCapsuleNext.visible = false;
                nextSongLabel.visible = false;
                IconNext.visible = false;
                diffNext.visible = false;
                bpmNext.visible = false;
                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;
                bpmNext1.visible = false;
                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
                bpmNext2.visible = false;
            }
            // else
            if (index > 20)
            {
                indexErect=16;
                freeplayCapsuleNext.visible = false;
                nextSongLabel.visible = false;
                IconNext.visible = false;
                diffNext.visible = false;
                bpmNext.visible = false;
                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;
                bpmNext1.visible = false;
                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
                bpmNext2.visible = false;
            }
            if (index==0)
            {
                CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[indexErect]);
            }
            else
            {
                addonthing = "-erect";
                CoolUtil.playMusic("songs/"+songErectList[indexErect]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[indexErect]);
            }
        }
        if (diff == 2)
        {   
            
            // Random
            if (indexErect==0)
            {
                index=0;
            }
            // bopeebo
            if (indexErect==1)
            {
                index=2;
            }
            // fresh
            if (indexErect==2)
            {
                index=3;
            }
            // dadbattle
            if (indexErect==3)
            {
                index=4;
            }
            // spookeez
            if (indexErect==4)
            {
                index=5;
            }
            // south
            if (indexErect==5)
            {
                index=6;
            }
            // pico
            if (indexErect==6)
            {
                index=8;
            }
            // philly nice
            if (indexErect==7)
            {
                index=9;
            }
            // blammed
            if (indexErect==8)
            {
                index=10;
            }
            // satin panties
            if (indexErect==9)
            {
                index=11;
            }
            // high
            if (indexErect==10)
            {
                index=12;
            }
            // cocoa
            if (indexErect==11)
            {
                index=14;
            }
            // eggnog
            if (indexErect==12)
            {
                index=15;
            }
            // senpai
            if (indexErect==13)
            {
                index=17;
            }
            // roses
            if (indexErect==14)
            {
                index=18;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;
            }
            // thorns
            if (indexErect==15)
            {
                index=19;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;
            }
            // ugh
            if (indexErect==16)
            {
                index=20;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;

            }
            if (index==0)
            {
                CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[index]);
            }
            else
            {
                addonthing = "";
                CoolUtil.playMusic("songs/"+songList[index]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[index]);
            }
        }
    }
    // right
    if (direction == "right")
    {
        if (diff == 3)
        {
            
            // Random
            if (index==0)
            {
                indexErect=0;
            }
            // Tutorial
            if (index==1)
            {
                indexErect=1;
            }
            // bopeebo
            if (index==2)
            {
                indexErect=1;
            }
            // fresh
            if (index==3)
            {
                indexErect=2;
            }
            // dadbattle
            if (index==4)
            {
                indexErect=3;
            }
            // spookeez
            if (index==5)
            {
                indexErect=4;
            }
            // south
            if (index==6)
            {
                indexErect=5;
            }
            // monster
            if (index==7)
            {
                indexErect=5;
            }
            // pico
            if (index==8)
            {
                indexErect=6;
            }
            // philly nice
            if (index==9)
            {
                indexErect=7;
            }
            // blammed
            if (index==10)
            {
                indexErect=8;
            }
            // satin panties
            if (index==11)
            {
                indexErect=9;
            }
            // high
            if (index==12)
            {
                indexErect=10;
            }
            // milf
            if (index==13)
            {
                indexErect=10;
            }
            // cocoa
            if (index==14)
            {
                indexErect=11;
            }
            // eggnog
            if (index==15)
            {
                indexErect=12;
            }
            // winter horrorland
            if (index==16)
            {
                indexErect=12;
            }
            // senpai
            if (index==17)
            {
                indexErect=13;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;

                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;

                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
            }
            // roses
            if (index==18)
            {
                indexErect=14;

                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;

                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;

                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
            }
            // thorns
            if (index==19)
            {
                indexErect=15;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;

                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;

                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
                
            }
            // ugh
            if (index==20)
            {
                indexErect=16;
                freeplayCapsuleNext.visible = false;
                nextSongLabel.visible = false;
                IconNext.visible = false;
                diffNext.visible = false;
                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;
                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
            }
            // else
            if (index > 20)
            {
                indexErect=16;
                freeplayCapsuleNext.visible = false;
                nextSongLabel.visible = false;
                IconNext.visible = false;
                diffNext.visible = false;
                freeplayCapsuleNext1.visible = false;
                nextSongLabel1.visible = false;
                IconNext1.visible = false;
                diffNext1.visible = false;
                freeplayCapsuleNext2.visible = false;
                nextSongLabel2.visible = false;
                IconNext2.visible = false;
                diffNext2.visible = false;
            }
            if (index==0)
            {
                CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[indexErect]);
            }
            else
            {
                addonthing = "-erect";
                CoolUtil.playMusic("songs/"+songErectList[indexErect]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[indexErect]);
            }
        }
        if (diff > 4)
        {
            
            // Random
            if (indexErect==0)
            {
                index=0;
            }
            // bopeebo
            if (indexErect==1)
            {
                index=2;
            }
            // fresh
            if (indexErect==2)
            {
                index=3;
            }
            // dadbattle
            if (indexErect==3)
            {
                index=4;
            }
            // spookeez
            if (indexErect==4)
            {
                index=5;
            }
            // south
            if (indexErect==5)
            {
                index=6;
            }
            // pico
            if (indexErect==6)
            {
                index=8;
            }
            // philly nice
            if (indexErect==7)
            {
                index=9;
            }
            // blammed
            if (indexErect==8)
            {
                index=10;
            }
            // satin panties
            if (indexErect==9)
            {
                index=11;
            }
            // high
            if (indexErect==10)
            {
                index=12;
            }
            // cocoa
            if (indexErect==11)
            {
                index=14;
            }
            // eggnog
            if (indexErect==12)
            {
                index=15;
            }
            // senpai
            if (indexErect==13)
            {
                index=17;
            }
            // roses
            if (indexErect==14)
            {
                index=18;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;
            }
            // thorns
            if (indexErect==15)
            {
                index=19;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;
            }
            // ugh
            if (indexErect==16)
            {
                index=20;
                freeplayCapsuleNext.visible = true;
                nextSongLabel.visible = true;
                IconNext.visible = true;
                diffNext.visible = true;
                bpmNext.visible = true;
                freeplayCapsuleNext1.visible = true;
                nextSongLabel1.visible = true;
                IconNext1.visible = true;
                diffNext1.visible = true;
                bpmNext1.visible = true;
                freeplayCapsuleNext2.visible = true;
                nextSongLabel2.visible = true;
                IconNext2.visible = true;
                diffNext2.visible = true;
                bpmNext2.visible = true;

            }
            if (index==0)
            {
                CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[index]);
            }
            else
            {
                addonthing = "";
                CoolUtil.playMusic("songs/"+songList[index]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[index]);
            }
        }
    }
}

function handleDiffs()
{
    if (diff == 0)
    {
        nightSelector.color = 0x34296a;
        erectSelector.color = 0x34296a;
        hardSelector.color = 0x575757;
        normSelector.color = 0x575757;
        easySelector.color = 0xffffff;
        
        diffSprite.loadGraphic(Paths.image("menus/freeplay/freeplayDifficulties/freeplayeasy"));
        diffSprite.visible = true;
        diffNightSprite.visible = false;
        erectMode = false;
        curSongLabel.text = displayList[index];
        PriorSongLabel.text = displayList[index-1];
        nextSongLabel.text = displayList[index+1];
        nextSongLabel1.text = displayList[index+2];
        nextSongLabel2.text = displayList[index+3];
        IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
        IconNext.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext1.frames = Paths.getSparrowAtlas(icons[index+2] ?? icons[0]);
        IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
        IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

        IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
        IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
        IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

        curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
        curIcon.animation.addByPrefix("Idle", "idle", 24, true);
        curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
        curIcon.animation.addByPrefix("Hold", "hold", 24, true);
        albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
                

        albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
        albumText.animation.addByPrefix("idle", "idle", 24, true);
        albumText.animation.addByPrefix("switch", "switch", 24, false);
        albumText.animation.play("idle");
    }
    if (diff == 1)
    {
        nightSelector.color = 0x34296a;
        erectSelector.color = 0x34296a;
        hardSelector.color = 0x575757;
        normSelector.color = 0xffffff;
        easySelector.color = 0x575757;

        diffSprite.loadGraphic(Paths.image("menus/freeplay/freeplayDifficulties/freeplaynormal"));
        diffSprite.visible = true;
        diffNightSprite.visible = false;
        erectMode = false;
        curSongLabel.text = displayList[index];
        PriorSongLabel.text = displayList[index-1];
        nextSongLabel.text = displayList[index+1];
        nextSongLabel1.text = displayList[index+2];
        nextSongLabel2.text = displayList[index+3];
        IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
        IconNext.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext1.frames = Paths.getSparrowAtlas(icons[index+2] ?? icons[0]);
        IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
        IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

        IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
        IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
        IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

        curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
        curIcon.animation.addByPrefix("Idle", "idle", 24, true);
        curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
        curIcon.animation.addByPrefix("Hold", "hold", 24, true);
        albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
                

        albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
        albumText.animation.addByPrefix("idle", "idle", 24, true);
        albumText.animation.addByPrefix("switch", "switch", 24, false);
        albumText.animation.play("idle");
    }
    if (diff == 2)
    {
        nightSelector.color = 0x34296a;
        erectSelector.color = 0x34296a;
        hardSelector.color = 0xffffff;
        normSelector.color = 0x575757;
        easySelector.color = 0x575757;

        diffSprite.loadGraphic(Paths.image("menus/freeplay/freeplayDifficulties/freeplayhard"));
        diffSprite.visible = true;
        diffNightSprite.visible = false;
        erectMode = false;
        curSongLabel.text = displayList[index];
        PriorSongLabel.text = displayList[index-1];
        nextSongLabel.text = displayList[index+1];
        nextSongLabel1.text = displayList[index+2];
        nextSongLabel2.text = displayList[index+3];
        IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
        IconNext.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext1.frames = Paths.getSparrowAtlas(icons[index+2] ?? icons[0]);
        IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
        IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

        IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
        IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
        IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

        curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
        curIcon.animation.addByPrefix("Idle", "idle", 24, true);
        curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
        curIcon.animation.addByPrefix("Hold", "hold", 24, true);
        albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
                

        albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
        albumText.animation.addByPrefix("idle", "idle", 24, true);
        albumText.animation.addByPrefix("switch", "switch", 24, false);
        albumText.animation.play("idle");
    }
    if (diff == 3)
    {
        nightSelector.color = 0x34296a;
        erectSelector.color = 0xc28aff;
        hardSelector.color = 0x575757;
        normSelector.color = 0x575757;
        easySelector.color = 0x575757;
        
        diffSprite.loadGraphic(Paths.image("menus/freeplay/freeplayDifficulties/freeplayerect"));
        diffSprite.visible = true;
        diffNightSprite.visible = false;
        erectMode = true;
        curSongLabel.text = displayErectList[indexErect];
        PriorSongLabel.text = displayErectList[indexErect-1];
        nextSongLabel.text = displayErectList[indexErect+1];
        nextSongLabel1.text = displayErectList[indexErect+2];
        nextSongLabel2.text = displayErectList[indexErect+3];
        IconNext.frames = Paths.getSparrowAtlas(iconsErect[indexErect+1] ?? icons[0]);
        IconNext.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext1.frames = Paths.getSparrowAtlas(iconsErect[indexErect+2] ?? icons[0]);
        IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext2.frames = Paths.getSparrowAtlas(iconsErect[indexErect+3] ?? icons[0]);
        IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

        IconPrior.frames = Paths.getSparrowAtlas(iconsErect[indexErect-1] ?? icons[0]);
        IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
        IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

        curIcon.frames = Paths.getSparrowAtlas(iconsErect[indexErect] ?? icons[0]);
        curIcon.animation.addByPrefix("Idle", "idle", 24, true);
        curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
        curIcon.animation.addByPrefix("Hold", "hold", 24, true);
        albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]));
                

        albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]+"-text");
        albumText.animation.addByPrefix("idle", "idle", 24, true);
        albumText.animation.addByPrefix("switch", "switch", 24, false);
        albumText.animation.play("idle");
    }
    if (diff == 4)
    {
        nightSelector.color = 0xc28aff;
        erectSelector.color = 0x34296a;
        hardSelector.color = 0x575757;
        normSelector.color = 0x575757;
        easySelector.color = 0x575757;


        diffSprite.visible = false;
        diffNightSprite.visible = true;
        erectMode = true;
        curSongLabel.text = displayErectList[indexErect];
        PriorSongLabel.text = displayErectList[indexErect-1];
        nextSongLabel.text = displayErectList[indexErect+1];
        nextSongLabel1.text = displayErectList[indexErect+2];
        nextSongLabel2.text = displayErectList[indexErect+3];
        IconNext.frames = Paths.getSparrowAtlas(iconsErect[indexErect+1] ?? icons[0]);
        IconNext.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext1.frames = Paths.getSparrowAtlas(iconsErect[indexErect+2] ?? icons[0]);
        IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

        IconNext2.frames = Paths.getSparrowAtlas(iconsErect[indexErect+3] ?? icons[0]);
        IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
        IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

        IconPrior.frames = Paths.getSparrowAtlas(iconsErect[indexErect-1] ?? icons[0]);
        IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
        IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
        IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

        curIcon.frames = Paths.getSparrowAtlas(iconsErect[indexErect] ?? icons[0]);
        curIcon.animation.addByPrefix("Idle", "idle", 24, true);
        curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
        curIcon.animation.addByPrefix("Hold", "hold", 24, true);
        albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]));
                

        albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]+"-text");
        albumText.animation.addByPrefix("idle", "idle", 24, true);
        albumText.animation.addByPrefix("switch", "switch", 24, false);
        albumText.animation.play("idle");
    }
}

function handleInputs()
{
    if (controls.LEFT_P)
    {
        
        songStarted = false;
        {
            diff--;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            diffChange("left");

            if (diff < 0)
            {
                diff = 4;
            }

            
            handleDiffs();
            trace("difficulty changed to:" + diffList[diff]);
            trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
        }
        
        
    }

    if (controls.RIGHT_P)
    {
        songStarted = false;
        {
            diff++;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            diffChange("right");

            if (diff == 5)
            {
                diff = 0;
            }
            

            handleDiffs();
            trace("difficulty changed to:" + diffList[diff]);

            trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
        }
        
    }

    if (controls.UP_P)
    {
        songStarted = false;
        {
            if (erectMode == false)
            {

            
                index--;
                FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
                

                

                if (index < 0)
                {
                    
                    index = songList.length - 1;
                    
                }

                if (index < 23 && index != 0)
                {
                    addonthing = "";
                    remix = false;
                }
                else
                {
                    addonthing = "-bf";
                    remix = "bf";
                }
                

                if (index == 0)
                {
                    CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[index]);                    
                }
                else
                {
                    CoolUtil.playMusic("songs/"+songList[index]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[index]);
                }

                
                PriorSongLabel.text = displayList[index-1];
                nextSongLabel.text = displayList[index+1];
                nextSongLabel1.text = displayList[index+2];
                nextSongLabel2.text = displayList[index+3];
                
                

                
                
                IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
                IconNext.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext1.frames = Paths.getSparrowAtlas(icons[index+2] ?? icons[0]);
                IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
                IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

                IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
                IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
                IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconPrior.animation.addByPrefix("Hold", "hold", 24, true);
                
                curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
                curIcon.animation.addByPrefix("Idle", "idle", 24, true);
                curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
                curIcon.animation.addByPrefix("Hold", "hold", 24, true);

                curSongLabel.text = displayList[index];
                albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
                

                albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
                albumText.animation.addByPrefix("idle", "idle", 24, true);
                albumText.animation.addByPrefix("switch", "switch", 24, false);
                albumText.animation.play("idle");
                trace("song changed to: " + songList[index]);
                trace("BPM changed to: " + bpmList[index]);
                trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
                
            }
            if (erectMode == true)
            {

            
                indexErect--;
                FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

                if (indexErect < 0)
                {
                    indexErect = 16;
                    
                }

                if (indexErect == 0)
                {
                    CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[indexErect]);
                }
                else
                {
                    
                    
                    CoolUtil.playMusic("songs/"+songErectList[indexErect]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmErectList[indexErect]);
                }

                
                PriorSongLabel.text = displayErectList[indexErect-1];
                nextSongLabel.text = displayErectList[indexErect+1];
                nextSongLabel1.text = displayErectList[indexErect+2];
                nextSongLabel2.text = displayErectList[indexErect+3];
                
                

                
                
                IconNext.frames = Paths.getSparrowAtlas(iconsErect[indexErect+1] ?? icons[0]);
                IconNext.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext1.frames = Paths.getSparrowAtlas(iconsErect[indexErect+2] ?? icons[0]);
                IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext2.frames = Paths.getSparrowAtlas(iconsErect[indexErect+3] ?? icons[0]);
                IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

                IconPrior.frames = Paths.getSparrowAtlas(iconsErect[indexErect-1] ?? icons[0]);
                IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
                IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconPrior.animation.addByPrefix("Hold", "hold", 24, true);
                
                curIcon.frames = Paths.getSparrowAtlas(iconsErect[indexErect] ?? icons[0]);
                curIcon.animation.addByPrefix("Idle", "idle", 24, true);
                curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
                curIcon.animation.addByPrefix("Hold", "hold", 24, true);

                curSongLabel.text = displayErectList[indexErect];
                albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]));
                

                albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]+"-text");
                albumText.animation.addByPrefix("idle", "idle", 24, true);
                albumText.animation.addByPrefix("switch", "switch", 24, false);
                albumText.animation.play("idle");
                trace("song changed to: " + songList[indexErect]);
                trace("BPM changed to: " + bpmList[indexErect]);
                trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
            }
        }
    }

    if (controls.DOWN_P)
    {
        songStarted = false;
        {
            if (erectMode == false)
            {
                index++;
                FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

                if (index > songList.length - 1)
                {
                    index = 0;
                    
                    
                }

                if (index < 23 && index != 0)
                {
                    addonthing = "";
                    remix = false;
                }
                else
                {
                    addonthing = "-bf";
                    remix = "bf";
                }

                if (index == 0)
                {
                    CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[index]);
                    
                }
                else
                {
                    
                    CoolUtil.playMusic("songs/"+songList[index]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmList[index]);
                    
                }

                

                
                PriorSongLabel.text = displayList[index-1];
                nextSongLabel.text = displayList[index+1];
                nextSongLabel1.text = displayList[index+2];
                nextSongLabel2.text = displayList[index+3];
                

                

                IconNext.frames = Paths.getSparrowAtlas(icons[index+1] ?? icons[0]);
                IconNext.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext1.frames = Paths.getSparrowAtlas(icons[index+2]) ?? icons[0];
                IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext2.frames = Paths.getSparrowAtlas(icons[index+3] ?? icons[0]);
                IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

                IconPrior.frames = Paths.getSparrowAtlas(icons[index-1] ?? icons[0]);
                IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
                IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

                curIcon.frames = Paths.getSparrowAtlas(icons[index] ?? icons[0]);
                curIcon.animation.addByPrefix("Idle", "idle", 24, true);
                curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
                curIcon.animation.addByPrefix("Hold", "hold", 24, true);
                curSongLabel.text = displayList[index];
                albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songOSTList[index]));
                

                albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songOSTList[index]+"-text");
                albumText.animation.addByPrefix("idle", "idle", 24, true);
                albumText.animation.addByPrefix("switch", "switch", 24, false);
                albumText.animation.play("idle");
                trace("song changed to: " + songList[index]);
                trace("BPM changed to: " + bpmList[index]);
                trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
            }
            if (erectMode == true)
            {
                indexErect++;
                FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

                if (indexErect > 16)
                {
                    indexErect = 0;
                }
                if (indexErect == 0)
                {
                    CoolUtil.playMusic("music/freeplayRandom/freeplayRandom.ogg",false,1,true,bpmList[indexErect]);
                }
                else
                {
                    CoolUtil.playMusic("songs/"+songErectList[indexErect]+"/song/Inst"+addonthing+".ogg",false,1,true,bpmErectList[indexErect]);        
                }

                
                PriorSongLabel.text = displayErectList[indexErect-1];
                nextSongLabel.text = displayErectList[indexErect+1];
                nextSongLabel1.text = displayErectList[indexErect+2];
                nextSongLabel2.text = displayErectList[indexErect+3];
                

                

                IconNext.frames = Paths.getSparrowAtlas(iconsErect[indexErect+1] ?? icons[0]);
                IconNext.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext1.frames = Paths.getSparrowAtlas(iconsErect[indexErect+2] ?? icons[0]);
                IconNext1.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext1.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext1.animation.addByPrefix("Hold", "hold", 24, true);

                IconNext2.frames = Paths.getSparrowAtlas(iconsErect[indexErect+3] ?? icons[0]);
                IconNext2.animation.addByPrefix("Idle", "idle", 24, true);
                IconNext2.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconNext2.animation.addByPrefix("Hold", "hold", 24, true);

                IconPrior.frames = Paths.getSparrowAtlas(iconsErect[indexErect-1] ?? icons[0]);
                IconPrior.animation.addByPrefix("Idle", "idle", 24, true);
                IconPrior.animation.addByPrefix("Confirm", "confirm", 10, false);
                IconPrior.animation.addByPrefix("Hold", "hold", 24, true);

                curIcon.frames = Paths.getSparrowAtlas(iconsErect[indexErect] ?? icons[0]);
                curIcon.animation.addByPrefix("Idle", "idle", 24, true);
                curIcon.animation.addByPrefix("Confirm", "confirm", 10, false);
                curIcon.animation.addByPrefix("Hold", "hold", 24, true);
                curSongLabel.text = displayErectList[indexErect];
                albumCover.loadGraphic(Paths.image("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]));
                

                albumText.frames = Paths.getSparrowAtlas("menus/freeplay/albumRoll/"+songErectOSTList[indexErect]+"-text");
                albumText.animation.addByPrefix("idle", "idle", 24, true);
                albumText.animation.addByPrefix("switch", "switch", 24, false);
                albumText.animation.play("idle");
                trace("song changed to: " + songErectList[indexErect]);
                trace("BPM changed to: " + bpmErectList[indexErect]);
                trace(FlxMath.roundDecimal(saveData.accuracy * 100, 0));
            }
        }
    }

    if (controls.ACCEPT)
    {
        if (songStarted == false)
        {
            dj.playAnim('confirm', true);
            songStarted = true;
            curIcon.animation.play("Confirm");
            curIcon.animation.finishCallback = function(name:String)
            {
                if (name == "Confirm")
                {
                    curIcon.animation.play("Hold", true);
                }
            };
            FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
            new FlxTimer().start(1 , function(tmr:FlxTimer)
            {
                if (diff == 0)
                {
                    if (erectMode == false)
                    {
                        if (index == 0)
                        {
                            PlayState.loadSong(songList[basicRand], "easy", remix);
                            FlxG.switchState(new PlayState());
                        }
                        else
                        {
                            PlayState.loadSong(songList[index], "easy", remix);
                            FlxG.switchState(new PlayState());
                        }
                    }
                }
                if (diff == 1)
                {
                    if (erectMode == false)
                    {
                        if (index == 0)
                        {
                            PlayState.loadSong(songList[basicRand], "normal", remix);
                            FlxG.switchState(new PlayState());
                        }
                        else
                        {
                            PlayState.loadSong(songList[index], "normal", remix);
                            FlxG.switchState(new PlayState());
                        }
                    }
                }
                if (diff == 2)
                {
                    if (erectMode == false)
                    {
                        if (index == 0)
                        {
                            PlayState.loadSong(songList[basicRand], "hard", remix);
                            FlxG.switchState(new PlayState());
                        }
                        else
                        {
                            PlayState.loadSong(songList[index], "hard", remix);
                            FlxG.switchState(new PlayState());
                            
                        }
                    }
                }
                if (diff == 3)
                {
                    if (erectMode == true)
                    {
                        if (index == 0)
                        {
                            PlayState.loadSong(songErectList[erectRand], "erect", "erect");
                            FlxG.switchState(new PlayState());
                            //trace("ERROR: NOT IMPLEMENTED YET");
                            //FlxG.sound.play(Paths.sound("CS_locked"), 0.7);
                            //songStarted = false;
                            //curIcon.animation.play("Idle", true);
                            //dj.playAnim('idle', true);
                        }
                        else
                        {
                            PlayState.loadSong(songErectList[indexErect], "erect", "erect");
                            FlxG.switchState(new PlayState());
                            //trace("ERROR: NOT IMPLEMENTED YET");
                            //FlxG.sound.play(Paths.sound("CS_locked"), 0.7);
                            //songStarted = false;
                            //curIcon.animation.play("Idle", true);
                            //dj.playAnim('idle', true);
                        }
                    }
                }
                if (diff == 4)
                {
                    if (erectMode == true)
                    {
                        if (indexErect == 0)
                        {
                            PlayState.loadSong(songErectList[erectRand], "nightmare", "erect");
                            FlxG.switchState(new PlayState());
                            //trace("ERROR: NOT IMPLEMENTED YET");
                            //FlxG.sound.play(Paths.sound("CS_locked"), 0.7);
                            //songStarted = false;
                            //curIcon.animation.play("Idle", true);
                            //dj.playAnim('idle', true);
                            
                            
                        }
                        else
                        {
                            PlayState.loadSong(songErectList[indexErect], "nightmare", "erect");
                            FlxG.switchState(new PlayState());
                            //trace("ERROR: NOT IMPLEMENTED YET");
                            //FlxG.sound.play(Paths.sound("CS_locked"), 0.7);
                            //songStarted = false;
                            //curIcon.animation.play("Idle", true);
                            //dj.playAnim('idle', true);
                        }
                    }
                }
            });
        }
    }

    if (controls.getJustPressed("charSelect"))
    {
        if (songStarted == false)
        {
            dj.playAnim("exit", true);
            FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
            songStarted = true;
        }
        
    }

    if (controls.getJustPressed("debugStats"))
    {
        if (allowDebug == true)
        {
            if (songStarted == false && devmode == false && debugthingy == true)
            {
                FlxG.sound.play(Paths.sound("secret"), 0.7);
                devmode = true;
                debugthingy = false;
            }

            if (songStarted == false && devmode == true && debugthingy == true)
            {
                devmode = false;
                debugthingy = false;
            }
            debugthingy = true;    
        }
    }

    if (controls.BACK)
    {
        if (songStarted == false)
        {
            FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
            
        }
        new FlxTimer().start(0.3, function(tmr:FlxTimer)
        {
            
            if (songStarted == false)
            {
                FlxG.switchState(new MainMenuState());
                
            }
                
        });
    }
}
