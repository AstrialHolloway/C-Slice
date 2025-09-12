import Xml;
import Type;
import haxe.ds.StringMap;
import funkin.savedata.FunkinSave;

var holdCoverMap:Map<StrumLine, Array<HoldCoverData>>;
var holdCoverConfigMap:Map<String, Xml> = ["default" => null];

var holdCoverAtlasMap:Map<String, FlxAtlasFrames> = ["default" => null];
var directionShortcuts:Array<String> = ["left", "down", "up", "right"];

public static var allowHoldCovers:Bool = FlxG.save.data.holdCovers;

function postCreate() {
    holdCoverMap = [cpu => [null, null, null, null]];

    var stylesToCache:Array<String> = ["default", "pixel-default"];
    for(style in stylesToCache) {
        getHoldCoverAtlas("game/holdcovers/" + style);
        getHoldCoverConfig(style);
    }
}

function postUpdate(elapsed) {
    for(strumLine => holdCoverList in holdCoverMap) {
        for(i in 0...holdCoverList.length) {
            var holdCoverData:HoldCoverData = holdCoverList[i];
            if(holdCoverData != null && Conductor.songPosition >= holdCoverData.timer) {
                var holdCover:FunkinSprite = holdCoverData.spr;
                if(holdCoverData.strumLine.cpu)
                    holdCover.kill();
                else
                    holdCover.playAnim("end" + directionShortcuts[i]);

                holdCoverData.timer = Math.POSITIVE_INFINITY;
            }
        }
    }
    updateHoldCoverPositions();
}

function onNoteHit(e) {
    var holdCoverList:Array<FunkinSprite> = holdCoverMap.get(e.note.strumLine);
    if(!allowHoldCovers || (e.note.isSustainNote && holdCoverList != null && (holdCoverList[e.note.noteData]?.spr?.exists ?? false)))
        return;

    var sLen:Float = -Conductor.stepCrochet;
    var nextSustain:Note = e.note.nextNote;
    while(nextSustain != null) {
        sLen += nextSustain.sustainLength;
        nextSustain = nextSustain.nextSustain;
    }
    if(sLen <= 100)
        return;

    if(holdCoverMap.get(e.note.strumLine) == null)
        holdCoverMap.set(e.note.strumLine, [null, null, null, null]);

    var holdCoverList:Array<FunkinSprite> = holdCoverMap.get(e.note.strumLine);
    if(holdCoverList[e.note.noteData] == null) {
        var dir:Int = e.note.noteData;
        var spr:FunkinSprite = new FunkinSprite();
        spr.animation.onFinish.add((animName:String) -> {
            if(StringTools.startsWith(animName, "start"))
                spr.playAnim("holding" + directionShortcuts[dir]);
            
            else if(StringTools.startsWith(animName, "end"))
                spr.kill();
        });
        spr.cameras = [camHUD];
        spr.kill();
        add(spr);

        holdCoverList[dir] = {
            spr: spr,
            timer: Math.POSITIVE_INFINITY,
            strumLine: null
        };
    }
    var holdCoverData:HoldCoverData = holdCoverList[e.note.noteData];
    var holdCoverConfig:HoldCoverConfig = getHoldCoverConfig(e.note.splash);

    var holdCover:FunkinSprite = holdCoverData.spr;
    holdCover.frames = getHoldCoverAtlas(holdCoverConfig.sprite);
    holdCover.alpha = holdCoverConfig.alpha;

    for(strumID => anims in holdCoverConfig.strums) {
        if(strumID == e.note.noteData) {
            var directionStr:String = directionShortcuts[strumID];
            for(anim in anims) {
                holdCover.animation.addByPrefix(anim.name, anim.anim, anim.fps, anim.loop);
                holdCover.addOffset(anim.name, anim.x, anim.y);
            }
            break;
        }
    }
    holdCover.antialiasing = holdCoverConfig.antialiasing;
    holdCover.playAnim("start" + directionShortcuts[e.note.noteData]);
    holdCover.revive();

    holdCover.scale.set(holdCoverConfig.scale, holdCoverConfig.scale);
    holdCover.updateHitbox();
    
    holdCoverData.timer = e.note.strumTime + sLen;
    holdCoverData.strumLine = e.note.strumLine;
}

function onInputUpdate(e) {
    for(i in 0...e.justReleased.length) {
        if(e.justReleased[i]) {
            var holdCoverList:Array<FunkinSprite> = holdCoverMap.get(player);
            if(holdCoverList != null && holdCoverList[i] != null) {
                var holdCoverData:HoldCoverData = holdCoverList[i];
                if(holdCoverData != null) {
                    if(!StringTools.startsWith(holdCoverData.spr.animation.name, "end"))
                        holdCoverData.spr.kill();

                    holdCoverData.timer = Math.POSITIVE_INFINITY;
                }
            }
        }
    }
}

function getHoldCoverConfig(type:String) {
    if(holdCoverConfigMap.get(type) == null) {
        var path:String = Paths.xml("holdcovers/" + type);
        if(!Assets.exists(path))
            path = Paths.xml("holdcovers/default");
    
        var xml:Xml = Xml.parse(Assets.getText(path)).firstElement();
        var strums:Map<Int, Array<HoldCoverAnimationData>> = [0 => null];

        var config:HoldCoverData = {
            sprite: xml.get("sprite"),
            scale: Std.parseFloat(xml.get("scale") ?? "1"),
            alpha: Std.parseFloat(xml.get("alpha") ?? "1"),
            antialiasing: (xml.get("antialiasing") ?? "true").toLowerCase() == "true",
            strums: strums
        };
        for(e in xml.elements()) {
            if(e.nodeName != "strum")
                continue;
            
            var animations:Array<HoldCoverAnimationData> = [];
            for(e2 in e.elements()) {
                if(e2.nodeName == "anim") {
                    animations.push({
                        name: e2.get("name"),
                        anim: e2.get("anim"),
                        fps: Std.parseFloat(e2.get("fps") ?? "24"),
                        x: Std.parseFloat(e2.get("x") ?? "0"),
                        y: Std.parseFloat(e2.get("y") ?? "0"),
                        loop: e2.get("loop").toLowerCase() == "true"
                    });
                }
            }
            config.strums.set(Std.parseInt(e.get("id")), animations);
        }
        holdCoverConfigMap.set(type, config);
    }
    return holdCoverConfigMap.get(type);
}

function getHoldCoverAtlas(sprite:String) {
    if(holdCoverAtlasMap.get(sprite) == null) {
        var imgPath:String = Paths.image(sprite);
        if(Assets.exists(imgPath))
            holdCoverAtlasMap.set(sprite, Paths.getSparrowAtlas(sprite));
        else
            holdCoverAtlasMap.set(sprite, Paths.getSparrowAtlas("game/holdcovers/default"));
    }
    return holdCoverAtlasMap.get(sprite);
}

function updateHoldCoverPositions() {
    for(strumLine => holdCoverList in holdCoverMap) {
        for(i in 0...holdCoverList.length) {
            var holdCoverData:HoldCoverData = holdCoverList[i];
            if(holdCoverData != null) {
                var holdCover:FlxSprite = holdCoverData.spr;
                holdCover.visible = strumLine.visible;

                var strum:Strum = strumLine.members[i];
                holdCover.setPosition(
                    strum.x - ((strum.width - holdCover.width) * -0.5),
                    strum.y - ((strum.height - holdCover.height) * -0.5)
                );
                holdCover.angle = strum.angle;
            }
        }
    }
}