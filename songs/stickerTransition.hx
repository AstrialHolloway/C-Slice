
// SCRIPT BY techniktil on discord

// this script is to make sure that the sticker transitions even show!

import funkin.backend.MusicBeatTransition;


import funkin.savedata.FunkinSave;

var allowTransitions = FlxG.save.data.stickerTransitions;

function onGamePause(event)
{
	if (allowTransitions == true)
	{
		MusicBeatTransition.script = 'data/stickerTransition.hx';
	}
}

function onSubstateClose(event)
{
	if (allowTransitions == true)
	{
		if(!Std.isOfType(subState, MusicBeatTransition) && paused)
		{
			MusicBeatTransition.script = '';
		}
	}
}

function onGameOver(event)
{
	if (allowTransitions == true)
	{
		MusicBeatTransition.script = 'data/stickerTransition.hx';
	}
}