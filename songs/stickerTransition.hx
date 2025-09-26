import funkin.backend.MusicBeatTransition;
import funkin.savedata.FunkinSave;

var allowStickers = FlxG.save.data.hitsounds;

function onGamePause(event)
{
	if (allowStickers == true)
	{
		MusicBeatTransition.script = 'data/stickerTransition.hx';
	}
}

function onSubstateClose(event)
{
	if (allowStickers == true)
	{
		if(!Std.isOfType(subState, MusicBeatTransition) && paused)
		{
			MusicBeatTransition.script = '';
		}
	}
}

function onGameOver(event)
{
	if (allowStickers == true)
	{
		MusicBeatTransition.script = 'data/stickerTransition.hx';
	}
}