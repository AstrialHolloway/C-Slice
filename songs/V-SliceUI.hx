import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.util.FlxStringUtil;
import funkin.savedata.FunkinSave;






function create()
{
    
    
    doIconBop = false;
    
}

function postCreate()
{
    healthBar.updateFilledBar();    
    healthBar.createFilledBar(0xFFff0000, 0xFF66ff33);
    for (cneText in [scoreTxt, missesTxt, accuracyTxt]) remove(cneText);

    iconP1.origin.set(0, iconP1.height / 3);
    
    iconP2.origin.set(iconP2.width, iconP2.height / 3);

    scoreTxt = new FunkinText(150, 680, FlxG.width, "Score: 0");
    scoreTxt.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    scoreTxt.borderSize = 1.25;
    if (downscroll) scoreTxt.y = 610;
    add(scoreTxt);
    scoreTxt.cameras = [camHUD];
}



function update(elapsed:Float)
{
    
    var mult:Float = FlxMath.lerp(1, iconP1.scale.x, FlxMath.bound(1 - (elapsed * 9), 0, 1));
    iconP1.scale.set(mult, mult);
    iconP1.updateHitbox();

    var mult:Float = FlxMath.lerp(1, iconP2.scale.x, FlxMath.bound(1 - (elapsed * 9), 0, 1));
    iconP2.scale.set(mult, mult);
    iconP2.updateHitbox();
    if (songScore > 0 ) scoreTxt.text = "Score: " + songScore ;
    

}

function beatHit()
{
    
    iconP1.scale.set(1.2, 1.2);
    iconP2.scale.set(1.2, 1.2);

    iconP1.updateHitbox();
    iconP2.updateHitbox();
    
}






