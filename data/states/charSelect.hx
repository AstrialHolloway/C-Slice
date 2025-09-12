// Script by AstroDev, if modifying please have a basic understanding of haxe!

var index = 5;

var currentPlayer = "bf";

import data.GlobalVars;

trace(freechar);



var transitioning = false;

var static = false;

var unlocked = true;

var devmode = true;

var debugthingy = true;

var uiOffset = 0;

// -------------------------
// Background
// -------------------------

var BG:FunkinSprite = new FunkinSprite(-150, -150 + uiOffset);
BG.loadGraphic(Paths.image("menus/charSelect/charSelectBG"));
BG.scale.set(1, 1);
add(BG);


menuData = CoolUtil.parseJson("images/menus/charSelect/crowd/animation.json");

crowd = new FunkinSprite(-132,230);
crowd.loadSprite(Paths.image("menus/charSelect/crowd"));
crowd.addAnim('idle', '', 24, true);
crowd.antialiasing = true;
crowd.updateHitbox();
crowd.playAnim('idle', true);
crowd.scale.set(1,1);
add(crowd);




var curtains:FunkinSprite = new FunkinSprite(-50,-50 + uiOffset);
curtains.loadGraphic(Paths.image("menus/charSelect/curtains"));
curtains.scale.set(1, 1);
add(curtains);

var ground:FunkinSprite = new FunkinSprite(-40,375 + uiOffset);
ground.frames = Paths.getSparrowAtlas("menus/charSelect/charSelectStage");
ground.animation.addByPrefix("Loop", "stage full instance 1", 15, true);
ground.animation.play("Loop");
add(ground);

var barThing = new FunkinSprite(0, 40);
barThing.loadSprite(Paths.image("menus/charSelect/barThing"));
barThing.addAnim('idle', 'name bar animated', 24, true);
barThing.antialiasing = true;
barThing.updateHitbox();
barThing.playAnim('idle', true);
barThing.scale.set(1,1);
add(barThing);

var nametag:FunkinSprite = new FunkinSprite(755,7 + uiOffset);
nametag.loadGraphic(Paths.image("menus/charSelect/boyfriendNametag"));
nametag.scale.set(0.77, 0.77);
add(nametag);


var menuDataPico;
menuDataPico = CoolUtil.parseJson("images/menus/charSelect/picoChill/animation.json");
picoChar = new FunkinSprite(940 , 230);
picoChar.loadSprite(Paths.image("menus/charSelect/picoChill"));
picoChar.addAnim('intro', 'pico slide in', 24, false);
picoChar.addAnim('idle', 'pico cs idle', 24, true);
picoChar.addAnim('select', 'pico cs confirm', 24, false);
picoChar.addAnim('deselect', 'pico cs deselect', 24, false);
picoChar.addOffset('intro', -320,-165);
picoChar.addOffset('idle', 0,0);
picoChar.addOffset('select', -320,-165);
picoChar.addOffset('deselect', 110,5);
picoChar.antialiasing = true;
picoChar.updateHitbox();
picoChar.playAnim('idle', true);
picoChar.scale.set(-1,1);
picoChar.visible=false;
add(picoChar);

var menuDataBF;
menuDataBF = CoolUtil.parseJson("images/menus/charSelect/bfChill/animation.json");
bfChar = new FunkinSprite(640 , 346);
bfChar.loadSprite(Paths.image("menus/charSelect/bfChill"));
bfChar.addAnim('intro', 'bf slide in', 24, false);
bfChar.addAnim('idle', 'bf cs idle', 24, true);
bfChar.addAnim('select', 'bf cs confirm', 24, false);
bfChar.addAnim('deselect', 'bf cs deselect', 24, false);
bfChar.addOffset('intro', 0,0);
bfChar.addOffset('idle', 0,0);
bfChar.addOffset('select', 0,0);
bfChar.addOffset('deselect', 0,0);
bfChar.antialiasing = true;
bfChar.updateHitbox();
bfChar.playAnim('idle', true);
bfChar.scale.set(1,1);
add(bfChar);

var menuDataLocked;

menuDataLocked = CoolUtil.parseJson("data/config/random/randomChill.json");

lockedChar = new FunkinSprite(menuDataLocked.char.position[0]-15, menuDataLocked.char.position[1]+10);
lockedChar.loadSprite(Paths.image("menus/charSelect/randomChill"));
lockedChar.animation.addByPrefix('idle', menuDataLocked.char.animations.idle.prefix, menuDataLocked.char.animations.idle.frameRate ?? 24, false);
lockedChar.animation.addByPrefix('in', menuDataLocked.char.animations.in.prefix, menuDataLocked.char.animations.in.frameRate ?? 24, true);
lockedChar.animation.addByPrefix('explode', menuDataLocked.char.animations.explode.prefix, menuDataLocked.char.animations.explode.frameRate ?? 24, false);
lockedChar.animation.addByPrefix('fail', menuDataLocked.char.animations.fail.prefix, menuDataLocked.char.animations.fail.frameRate ?? 24, false);
lockedChar.addOffset('idle', -menuDataLocked.char.animations.idle.offsets[0], -menuDataLocked.char.animations.idle.offsets[1]);
lockedChar.addOffset('explode', -menuDataLocked.char.animations.explode.offsets[0], -menuDataLocked.char.animations.explode.offsets[1]);
lockedChar.addOffset('in', -menuDataLocked.char.animations.in.offsets[0], -menuDataLocked.char.animations.in.offsets[1]);
lockedChar.addOffset('fail', -menuDataLocked.char.animations.fail.offsets[0], -menuDataLocked.char.animations.fail.offsets[1]);
lockedChar.antialiasing = true;
lockedChar.updateHitbox();
lockedChar.playAnim('idle', true);
lockedChar.visible=false;
add(lockedChar);

var menuDataGF;
menuDataGF = CoolUtil.parseJson("images/menus/charSelect/gfChill/animation.json");
gfPart = new FunkinSprite(650,350);
gfPart.loadSprite(Paths.image("menus/charSelect/gfChill"));
gfPart.addAnim('idle', 'Partner GF idle', 24, true);
gfPart.addAnim('select', 'Partner GF confirm', 24, true);
gfPart.addAnim('deselect', 'Partner GF deselect', 24, false);
gfPart.addOffset('idle', 0,0);
gfPart.addOffset('select', 0,0);
gfPart.addOffset('deselect', 0,0);
gfPart.antialiasing = true;
gfPart.updateHitbox();
gfPart.playAnim('idle', true);
gfPart.scale.set(1,1);
add(gfPart);

var menuDataNene;
menuDataNene = CoolUtil.parseJson("images/menus/charSelect/neneChill/animation.json");
nenePart = new FunkinSprite(720,400);
nenePart.loadSprite(Paths.image("menus/charSelect/neneChill"));
nenePart.addAnim('idle', 'nene cs idle', 24, true);
nenePart.addAnim('select', 'Nene cs confirm', 24, true);
nenePart.addAnim('deselect', 'Nene cs deselect', 24, false);
nenePart.addOffset('idle', 0,0);
nenePart.addOffset('select', 0,0);
nenePart.addOffset('deselect', 0,0);
nenePart.antialiasing = true;
nenePart.updateHitbox();
nenePart.playAnim('idle', true);
nenePart.scale.set(1,1);
nenePart.visible=false;
add(nenePart);



speaker1 = new FunkinSprite(-85,435);
speaker1.loadSprite(Paths.image("menus/charSelect/charSelectSpeakers"));
speaker1.addAnim('idle', 'back speaker 1 animated', 24, true);
speaker1.antialiasing = true;
speaker1.updateHitbox();
speaker1.playAnim('idle', true);
speaker1.scale.set(1,1);
add(speaker1);

speaker2 = new FunkinSprite(180,620);
speaker2.loadSprite(Paths.image("menus/charSelect/charSelectSpeakers"));
speaker2.addAnim('idle', 'back speaker 2 animated', 24, true);
speaker2.antialiasing = true;
speaker2.updateHitbox();
speaker2.playAnim('idle', true);
speaker2.scale.set(1,1);
add(speaker2);

speaker3 = new FunkinSprite(1220,430);
speaker3.loadSprite(Paths.image("menus/charSelect/charSelectSpeakers"));
speaker3.addAnim('idle', 'back speaker 1 animated', 24, true);
speaker3.antialiasing = true;
speaker3.updateHitbox();
speaker3.playAnim('idle', true);
speaker3.scale.set(-1,1);
add(speaker3);

speaker4 = new FunkinSprite(950,620);
speaker4.loadSprite(Paths.image("menus/charSelect/charSelectSpeakers"));
speaker4.addAnim('idle', 'back speaker 2 animated', 24, true);
speaker4.antialiasing = true;
speaker4.updateHitbox();
speaker4.playAnim('idle', true);
speaker4.scale.set(-1,1);
add(speaker4);

var blur:FunkinSprite = new FunkinSprite(-130,200 + uiOffset);
blur.loadGraphic(Paths.image("menus/charSelect/foregroundBlur"));
blur.scale.set(1,2);
blur.alpha=0.3;
add(blur);



// -------------------------
// Selector
// -------------------------

var selectorBlur:FunkinSprite = new FunkinSprite(427, -100 + uiOffset);
selectorBlur.frames = Paths.getSparrowAtlas("menus/charSelect/dipshitBlur");
selectorBlur.animation.addByPrefix("Loop", "CHOOSE vertical offset instance 1", 24, true);
selectorBlur.animation.play("Loop");
add(selectorBlur);

var selectorBacking:FunkinSprite = new FunkinSprite(425, -30 + uiOffset);
selectorBacking.frames = Paths.getSparrowAtlas("menus/charSelect/dipshitBacking");
selectorBacking.animation.addByPrefix("Loop", "CHOOSE horizontal offset instance 1", 24, true);
selectorBacking.animation.play("Loop");
add(selectorBacking);

var selectorCover:FunkinSprite = new FunkinSprite(427, -27 + uiOffset);
selectorCover.loadGraphic(Paths.image("menus/charSelect/chooseDipshit"));
selectorCover.scale.set(1, 1);
add(selectorCover);

// -------------------------
// cursor
// -------------------------

var cursor:FunkinSprite = new FunkinSprite(563,256 + uiOffset);
cursor.frames = Paths.getSparrowAtlas("menus/charSelect/selectorCursor");
cursor.animation.addByPrefix("idle", "cursor IDLE instance ", 24, true);
cursor.animation.addByPrefix("denied", "cursor DENIED instance ", 24, true);
cursor.animation.addByPrefix("accepted", "cursor ACCEPTED instance ", 24, true);
cursor.animation.play("idle");
cursor.scale.set(1, 1);
cursor.color = 0xffcd00;
add(cursor);

// -------------------------
// Icons
// -------------------------

var lockIcon1:FunkinSprite = new FunkinSprite(441,98 + uiOffset);
lockIcon1.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon1.animation.addByPrefix("idle", "LOCK FULL 1 instance 2", 24, true);
lockIcon1.animation.play("idle");
add(lockIcon1);

var lockIcon2:FunkinSprite = new FunkinSprite(549,98 + uiOffset);
lockIcon2.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon2.animation.addByPrefix("idle", "LOCK FULL 2 instance 10000", 24, true);
lockIcon2.animation.play("idle");
add(lockIcon2);

var lockIcon3:FunkinSprite = new FunkinSprite(655,98 + uiOffset);
lockIcon3.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon3.animation.addByPrefix("idle", "LOCK FULL 3 instance 10000", 24, true);
lockIcon3.animation.play("idle");
add(lockIcon3);

var picoIcon:FunkinSprite = new FunkinSprite(496,282 + uiOffset);
picoIcon.frames = Paths.getSparrowAtlas("menus/freeplay/icons/picopixel");
picoIcon.animation.addByPrefix("idle", "idle", 15, true);
picoIcon.animation.addByPrefix("selected", "confirm", 15, false);
picoIcon.animation.addByPrefix("back", "back", 15, false);
picoIcon.scale.set(2,2);
picoIcon.animation.play("idle");
add(picoIcon);

var bfIcon:FunkinSprite = new FunkinSprite(596,273 + uiOffset);
bfIcon.frames = Paths.getSparrowAtlas("menus/freeplay/icons/bfpixel");
bfIcon.animation.addByPrefix("Idle", "idle", 24, true);
bfIcon.animation.addByPrefix("selected", "confirm", 10, false);
bfIcon.animation.addByPrefix("back", "back", 10, false);
bfIcon.scale.set(2, 2);
bfIcon.animation.play("Idle");
add(bfIcon);

var lockIcon6:FunkinSprite = new FunkinSprite(655,225 + uiOffset);
lockIcon6.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon6.animation.addByPrefix("idle", "LOCK FULL 4 instance 10000", 24, true);
lockIcon6.animation.play("idle");
add(lockIcon6);

var lockIcon7:FunkinSprite = new FunkinSprite(442,353 + uiOffset);
lockIcon7.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon7.animation.addByPrefix("idle", "LOCK FULL 4 instance 20000", 24, true);
lockIcon7.animation.play("idle");
add(lockIcon7);

var lockIcon8:FunkinSprite = new FunkinSprite(549,353 + uiOffset);
lockIcon8.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon8.animation.addByPrefix("idle", "LOCK FULL 5 instance 10000", 24, true);
lockIcon8.animation.play("idle");
add(lockIcon8);

var lockIcon9:FunkinSprite = new FunkinSprite(656,353 + uiOffset);
lockIcon9.frames = Paths.getSparrowAtlas("menus/charSelect/locks");
lockIcon9.animation.addByPrefix("idle", "LOCK FULL 6 instance 10000", 24, true);
lockIcon9.animation.play("idle");
add(lockIcon9);

// -------------------------
// Debug stuff
// -------------------------

debugoffset = -120 + uiOffset;

var debugDataDebLabel = new FlxText(0, 150+debugoffset, 1000, "Debug Data:", 10);
debugDataDebLabel.setFormat("fonts/5by7.ttf", 32, FlxColor.WHITE, "left");
add(debugDataDebLabel);

var curSelPlayerNumDebLabel = new FlxText(0, 180+debugoffset, 1000, "CSPN: " + index, 10);
curSelPlayerNumDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.WHITE, "left");
add(curSelPlayerNumDebLabel);

var curSelPlayerDebLabel = new FlxText(0, 205+debugoffset, 1000, "CSP: " + currentPlayer, 10);
curSelPlayerDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.WHITE, "left");
add(curSelPlayerDebLabel);

var curAnimDebLabel = new FlxText(0, 230+debugoffset, 1000, "CA: ", 10);
curAnimDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.WHITE, "left");
add(curAnimDebLabel);

var curFrameDebLabel = new FlxText(0, 255+debugoffset, 1000, "CF: ", 10);
curFrameDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.WHITE, "left");
add(curFrameDebLabel);

var unlockedDebLabel = new FlxText(0, 280+debugoffset, 1000, "UNL: " + unlocked, 10);
unlockedDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.BWHITE, "left");
add(unlockedDebLabel);

var transitionDebLabel = new FlxText(0, 305+debugoffset, 1000, "TRN: " + transitioning, 10);
transitionDebLabel.setFormat("fonts/5by7.ttf", 25, FlxColor.WHITE, "left");
add(transitionDebLabel);


function create()
{
    CoolUtil.playMusic("music/stayFunky/stayFunky.ogg");
    trace("Character Selector Loaded");  
}

function update()
{   
    
    if (cursor.animation.name == "denied" && cursor.animation.curAnim.curFrame == 13) {
		cursor.playAnim('idle', true);
        cursor.color = 0xffcd00;
	}
    if (lockedChar.animation.name == "in" && lockedChar.animation.curAnim.curFrame == 7) {
		lockedChar.playAnim('idle', true);
	}
    if (lockedChar.animation.name == "idle" && lockedChar.animation.curAnim.curFrame == 25) {
		lockedChar.playAnim('idle', true);
	}
    if (lockedChar.animation.name == "fail" && lockedChar.animation.curAnim.curFrame == 3) {
		lockedChar.playAnim('idle', true);
	}

    if (currentCharacter == "pico")
    {
        nenePart.visible=true;
        picoChar.visible=true;
        
    }
    else
    {
        nenePart.visible=false;
        picoChar.visible=false;
    }

    if (currentCharacter == "bf")
    {
        gfPart.visible=true;
        bfChar.visible=true;
        
    }
    else
    {
        gfPart.visible=false;
        bfChar.visible=false;
    }
    
    
    
    
    
    currentCharacter = currentPlayer;
    
    // Debug stuff

    curAnimDebLabel.text = "CA: ";

    curFrameDebLabel.text = "CF: ";

    transitionDebLabel.text = "TRN: " + transitioning;

    unlockedDebLabel.text = "UNL: " + unlocked;

    curSelPlayerDebLabel.text = "CSP: " + currentPlayer;
    
    curSelPlayerNumDebLabel.text = "CSPN: " + index;


    if (devmode == true)
    {
        curSelPlayerNumDebLabel.visible = true;

        debugDataDebLabel.visible = true;

        curSelPlayerDebLabel.visible = true;

        curAnimDebLabel.visible = true;

        curFrameDebLabel.visible = true;
  
        unlockedDebLabel.visible = true;

        transitionDebLabel.visible = true;
    }
    else
    {
        curSelPlayerNumDebLabel.visible = false;

        debugDataDebLabel.visible = false;

        curSelPlayerDebLabel.visible = false;

        curAnimDebLabel.visible = false;

        curFrameDebLabel.visible = false;
  
        unlockedDebLabel.visible = false;

        transitionDebLabel.visible = false;
    }
    
    handleInputs();
    
}

function handleNametags()
{   
    //Top row

    //Left
    if (index == 1)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 453;
        cursor.y = 146;
        
    }

    //Middle
    if (index == 2)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 563;
        cursor.y = 146;
        
    }

    //Right
    if (index == 3)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 673;
        cursor.y = 146;
        
    }

    //Middle row

    //Left
    if (index == 4)
    {
        currentPlayer = "pico";
        nametag.loadGraphic(Paths.image("menus/charSelect/picoNametag"));
        unlocked = true;
        nametag.x=825;
        nametag.y=-3;
        picoChar.visible=true;
        bfChar.visible=false;
        lockedChar.visible=false;
        picoChar.playAnim('idle', true);
        picoChar.scale.set(-1,1);
        nenePart.playAnim('idle', true);
        cursor.x = 453;
        cursor.y = 256;
        
    }

    //Middle
    if (index == 5)
    {
        currentPlayer = "bf";
        nametag.loadGraphic(Paths.image("menus/charSelect/boyfriendNametag"));
        nametag.x=755;
        nametag.y=7;
        unlocked = true;
        picoChar.visible=false;
        bfChar.visible=true;
        lockedChar.visible=false;
        bfChar.playAnim('idle', true);
        gfPart.playAnim('idle', true);
        cursor.x = 563;
        cursor.y = 256;
        
    }

    //Right
    if (index == 6)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        nametag.x=870;
        nametag.y=7;
        unlocked = false;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 673;
        cursor.y = 256;
        
    }
    
    //Bottom row

    //Left
    if (index == 7)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 453;
        cursor.y = 366;
        
    }
    
    //Middle
    if (index == 8)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 563;
        cursor.y = 366;
        
    }

    //Right
    if (index == 9)
    {
        currentPlayer = "locked";
        nametag.loadGraphic(Paths.image("menus/charSelect/lockedNametag"));
        unlocked = false;
        nametag.x=870;
        nametag.y=7;
        picoChar.visible=false;
        bfChar.visible=false;
        lockedChar.visible=true;
        lockedChar.playAnim('in', true);
        cursor.x = 673;
        cursor.y = 366;
    }
}

function handleSelection(direction)
{
    if (direction == "left")
    {
        index--;
        FlxG.sound.play(Paths.sound("CS_select"), 0.5);
        if (index < 1 && debugthingy == true)
        {
            index = 3;
            debugthingy = false;
        }
        if (index == 3 && debugthingy == true)
        {
            index = 6;
            debugthingy = false;
        }
        if (index == 6 && debugthingy == true)
        {
            index = 9;
            debugthingy = false;
        }
        debugthingy = true;   
    }

    if (direction == "right")
    {
        index++;
        FlxG.sound.play(Paths.sound("CS_select"), 0.5);
        if (index == 4 && debugthingy == true)
        {
            index = 1;
            debugthingy = false;
        }
        if (index == 7 && debugthingy == true)
        {
            index = 4;
            debugthingy = false;
        }
        if (index > 9 && debugthingy == true)
        {
            index = 7;
            debugthingy = false;
        }
        debugthingy = true;
    }

    if (direction == "up")
    {
        
        FlxG.sound.play(Paths.sound("CS_select"), 0.5);
        if (index == 1 && debugthingy == true)
        {
            index = 7;
            debugthingy = false;
        }
        if (index == 2 && debugthingy == true)
        {
            index = 8;
            debugthingy = false;
        }
        if (index == 3 && debugthingy == true)
        {
            index = 9;
            debugthingy = false;
        }
        if (index == 4 && debugthingy == true)
        {
            index = 1;
            debugthingy = false;
        }
        if (index == 5 && debugthingy == true)
        {
            index = 2;
            debugthingy = false;
        }
        if (index == 6 && debugthingy == true)
        {
            index = 3;
            debugthingy = false;
        }
        if (index == 7 && debugthingy == true)
        {
            index = 4;
            debugthingy = false;
        }
        if (index == 8 && debugthingy == true)
        {
            index = 5;
            debugthingy = false;
        }
        if (index == 9 && debugthingy == true)
        {
            index = 6;
            debugthingy = false;
        }
        debugthingy = true;
    }
    if (direction == "down")
    {
        
        FlxG.sound.play(Paths.sound("CS_select"), 0.5);
        if (index == 7 && debugthingy == true)
        {
            index = 1;
            debugthingy = false;
        }
        if (index == 8 && debugthingy == true)
        {
            index = 2;
            debugthingy = false;
        }
        if (index == 9 && debugthingy == true)
        {
            index = 3;
            debugthingy = false;
        }
        if (index == 1 && debugthingy == true)
        {
            index = 4;
            debugthingy = false;
        }
        if (index == 2 && debugthingy == true)
        {
            index = 5;
            debugthingy = false;
        }
        if (index == 3 && debugthingy == true)
        {
            index = 6;
            debugthingy = false;
        }
        if (index == 4 && debugthingy == true)
        {
            index = 7;
            debugthingy = false;
        }
        if (index == 5 && debugthingy == true)
        {
            index = 8;
            debugthingy = false;
        }
        if (index == 6 && debugthingy == true)
        {
            index = 9;
            debugthingy = false;
        }
        debugthingy = true;
    }
    
}


function handleInputs()
{
    if (controls.LEFT_P)
    {
        if (transitioning == false)
        {
            handleSelection("left");
            handleNametags();
        }
    }

    if (controls.RIGHT_P)
    {
        if (transitioning == false)
        {
            handleSelection("right");
            handleNametags();
        }
    }

    if (controls.UP_P)
    {
        if (transitioning == false)
        {
            handleSelection("up");
            handleNametags();
        }
    }

    if (controls.DOWN_P)
    {
        if (transitioning == false)
        {
            handleSelection("down");
            handleNametags();
        }
    }

    if (controls.ACCEPT)
    {
        if (transitioning == false && currentPlayer != "locked")
        {
            if (currentPlayer == "bf")
            {
                bfIcon.animation.play("selected");
                bfChar.playAnim('select', true);
                gfPart.playAnim('select', true);
                char = "boyfriend";
                cursor.playAnim("accepted",true);
                cursor.color = 0xffffff;
            }
            if (currentPlayer == "pico")
            {
                
                picoIcon.animation.play("selected");
                picoChar.playAnim('select', true);
                nenePart.playAnim('select', true);
                char = "pico";
                cursor.playAnim("accepted",true);
                cursor.color = 0xffffff;
            }
            transitioning = true;
            FlxG.sound.play(Paths.sound("CS_confirm"), 0.5);
            new FlxTimer().start(1.5, function(tmr:FlxTimer)
            {
                if (transitioning == true)
                {   
                    transitioning = false;
                    if (currentPlayer == "bf")
                    {
                        FlxG.switchState(new ModState('freeplay-bf'));
                        freechar = "freeplay-bf";
                        trace(freechar);
                    }
                    if (currentPlayer == "pico")
                    {
                        FlxG.switchState(new ModState('freeplay-pico'));
                        freechar = "freeplay-pico";
                        trace(freechar);
                        
                    }
                }
                    
            });
        }
        if (currentPlayer == "locked")
        {
            FlxG.sound.play(Paths.sound("CS_locked"), 0.5);
            lockedChar.playAnim("fail",true);
            cursor.playAnim("denied",true);
            cursor.color = 0xffffff;
        }
    }

    if (controls.DEV_ACCESS)
    {
         if (transitioning == false && devmode == false && debugthingy == true)
        {
            FlxG.sound.play(Paths.sound("secret"), 0.7);
            devmode = true;
            debugthingy = false;
        }

        if (transitioning == false && devmode == true && debugthingy == true)
        {
            devmode = false;
            debugthingy = false;
        }
        debugthingy = true;
    }

    if (controls.BACK)
    {
        if (currentPlayer == "bf")
        {
            bfIcon.animation.play("back");
            bfChar.playAnim('deselect', true);
            gfPart.playAnim('deselect', true);
        }
        if (currentPlayer == "pico")
        {
            
            picoIcon.animation.play("back");
            picoChar.scale.set(1,1);
            picoChar.playAnim('deselect', true);
            nenePart.playAnim('deselect', true);
        }
    }
}
