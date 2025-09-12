import funkin.game.PlayState.ComboRating;

public var useCNERating = false;

function create() {
    if (!useCNERating) {
        comboRatings = [
            new ComboRating(0, "L", 0x6b8bfc),
            new ComboRating(0.55, "G", 0xf0a17f),
            new ComboRating(0.65, "G", 0xe7f2ff),
            new ComboRating(0.75, "E", 0xffffb8),
            new ComboRating(0.95, "P", 0xffa7ff),
            new ComboRating(1, "P", 0xfff25c),
// make as many of the above as however many ratings you want
        ];
    }
}

function onRatingUpdate(e) {
    if (!useCNERating && e.rating?.percent == 1 && e.rating.color != (e.rating.color = 0xfff25c) && e.oldRating == e.rating) {
        accuracyTxt.text = "";
        if (updateRatingStuff != null) updateRatingStuff();
        // setting _regen doesnt work?
    }
}