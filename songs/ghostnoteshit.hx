import funkin.savedata.FunkinSave;

var allowGhostNotes = FlxG.save.data.ghostNotes;

function onNoteCreation(e)
{
    if (allowGhostNotes == true)
    {
        e.note.earlyPressWindow = 0.65; // to make it easier to get a ghost note above the strums
    }
}
function onPlayerHit(e)
{
    if (allowGhostNotes == true)
    {
        // ghost note shit
        if ((e.rating == 'bad' || e.rating == 'shit') && !e.note.isSustainNote)
        {
            trace('got a bad/shit rating, resetting combo womp womp');

            e.preventDeletion();
            
            if (e.note.shader != null) e.note.shader = null;
            e.note.blend = 0;
            e.note.alpha = 0.6;

            combo = 0;
        }
    }
}