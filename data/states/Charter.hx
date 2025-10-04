import funkin.editors.charter.Charter;
import funkin.editors.ui.UIUtil;
import LilBuddy;

var lilBuddiesEnabled = false;

var lilBuddies = [];

function postCreate()
{
	topMenu[3].childs.insert(topMenu[3].childs.length, null);

	topMenu[3].childs.insert(topMenu[3].childs.length, {
		label: "Show Lil Buddies",
		icon: lilBuddiesEnabled ? 1 : 0,
		onSelect: enable_lil_buddies
	});
	topMenu[3].childs.insert(topMenu[3].childs.length, {
		label: "Refresh Lil Buddies",
		onSelect: reload_lil_buddies
	});

	var i = 0;

	for(strum in strumLines.members)
	{
		var newLilBuddy = new LilBuddy(strum.strumLine.type == 1, strum.draggable ? -51 : -60);
		newLilBuddy.ID = i;
		newLilBuddy.cameras = [charterCamera];
		newLilBuddy.scale.set(0.7,0.7);
		newLilBuddy.visible = lilBuddiesEnabled;
		strum.healthIcons.visible = !lilBuddiesEnabled;
		newLilBuddy.updateHitbox();
		lilBuddies.push(newLilBuddy);
		add(newLilBuddy);
		i++;
	}
}

var notesHited = 0;
function update(_)
{
	var idx = 0;

	for(lilBuddy in lilBuddies)
	{
		if(lilBuddy.ID == null) continue;
		var strum = strumLines.members[idx];
		if(strum == null) continue;
		UIUtil.follow(lilBuddy, strum, lilBuddy.isPlayer ? -65 : 45, lilBuddy.yOffset = FlxMath.lerp(lilBuddy.yOffset, strum.draggable ? -51 : -60, 1/12));

		if(!FlxG.sound.music.playing)
			lilBuddy.animation.play("idle");

		idx++;
	}

	for(i in notesGroup.members)
	{
		if (i.__passed != (i.__passed = i.step < Conductor.curStepFloat)) {
			if (i.__passed && FlxG.sound.music.playing)
			{
				var lilBuddy = lilBuddies[i.strumLineID];
				lilBuddy.animation.play(i.id, true);
				i.__passed = !i.__passed;
			}
		}
	}

	if((FlxG.mouse.justReleased || !strumLines.draggable) && strumLines.isDragging)
	{
		reload_lil_buddies(null);
	}
}

function measureHit(m)
{
	for(lilBuddy in lilBuddies)
	{
		lilBuddy.animation.play("idle");
	}
}

function reload_lil_buddies(_) {
	for(lilBuddy in lilBuddies)
	{
		lilBuddy.destroy();
	}

	lilBuddies = [];

	var i = 0;
	for(strum in strumLines.members)
	{
		var newLilBuddy = new LilBuddy(strum.strumLine.type == 1, strum.draggable ? -51 : -60);
		newLilBuddy.ID = i;
		newLilBuddy.cameras = [charterCamera];
		newLilBuddy.scale.set(0.7,0.7);
		newLilBuddy.visible = lilBuddiesEnabled;
		strum.healthIcons.visible = !lilBuddiesEnabled;
		newLilBuddy.updateHitbox();
		lilBuddies.push(newLilBuddy);
		add(newLilBuddy);
		i++;
	}
}

function enable_lil_buddies(t) {
	t.icon = (lilBuddiesEnabled = !lilBuddiesEnabled) ? 1 : 0;
	for(strum in strumLines.members)
	{
		strum.healthIcons.visible = !lilBuddiesEnabled;
	}
	for(lilBuddy in lilBuddies)
	{
		lilBuddy.visible = lilBuddiesEnabled;
	}
}