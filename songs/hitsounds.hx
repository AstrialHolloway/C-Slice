//script by wizardmantis441

import funkin.savedata.FunkinSave;

var allowHitsounds = FlxG.save.data.hitsounds;

var hitsoundVolume = FlxG.save.data.hitsoundsVolume;

function onPlayerHit(a)
    if (allowHitsounds == true)
    {
        if (!a.note.isSustainNote)
            FlxG.sound.play(Paths.sound('hitsound'), hitsoundVolume);
    }