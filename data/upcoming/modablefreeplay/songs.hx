package;

var bfHasErect:Bool = true;
var picoHasErect:Bool = true;
// add more chars below if you want to add more characters
// var HasErect:Bool = true;

// Put songs here that you want to use in your freeplay menu 
// (INCLUDE RANDOM AS FIRST IN LIST)

// ---------------------
// SONG LISTS
// ---------------------

// SONG NAMES MUST MATCH THE FOLDER NAMES EXACTLY

var songListBF:Array<String> =
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
    //add extra bf songs below (put a comma after each one exept the last)
];

var songErectListBF:Array<String> =
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
    "ugh"//,
    //add extra erect bf songs below (put a comma after each one exept the last)
];

var songListPico:Array<String> =
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
    "cocoa",
    "eggnog",
    "senpai",
    "roses",
    "ugh",
    "guns",
    "stress",
    "darnell",
    "lit-up",
    "2hot",
    "blazin"//,
    //add extra pico songs below (put a comma after each one exept the last)
];

var songErectListPico:Array<String> =
[
    "random",
    "darnell"//,
    //add extra erect pico songs below (put a comma after each one exept the last)
];

// if you want to add more characters, use the same format as above but change the end to your character name 
// (example: songListSpooky & songErectListSpooky)

// ---------------------
// SONG DISPLAY NAMES
// ---------------------

// Display names are what shows on the freeplay capsule. (
// (example: "M.I.L.F." instead of "milf")

var displayListBF:Array<String> =
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
    //add extra bf song display names below (put a comma after each one exept the last)
];

var displayErectListBF:Array<String> =
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
    "Ugh Erect"//,
    //add extra erect bf song display names below (put a comma after each one exept the last)
];

// ---------------------

var displayListPico:Array<String> =
[
    "Random",
    "Bopeebo (Pico Mix)", 
    "Fresh (Pico Mix)", 
    "DadBattle (Pico Mix)", 
    "Spookeez (Pico Mix)", 
    "South (Pico Mix)",
    "Pico (Pico Mix)",
    "Philly Nice (Pico Mix)",
    "Blammed (Pico Mix)",
    "  Cocoa (Pico Mix)",
    "  Eggnog (Pico Mix)",
    "Senpai (Pico Mix)",
    "Roses (Pico Mix)",
    "Ugh (Pico Mix)",
    "Guns (Pico Mix)",
    "Stress (Pico Mix)",
    "Darnell",
    "Lit-Up",
    "2Hot",
    "Blazin'"//,
    //add extra pico song display names below (put a comma after each one exept the last)
];

var displayErectListPico:Array<String> =
[
    "Random", 
    "Darnell Erect"//,
    //add extra erect pico song display names below (put a comma after each one exept the last)
];

// ---------------------
// SONG ALBUMS/OSTs
// ---------------------

// If you have an album cover for your song in (images/menus/feeeplay/albumRoll/)
// with the name format as  
// (ostname.png (USE A SIZE OF 262W, 262H),ostname-text.png, ostname-text.xml) 
// if you do not have an album cover put "random" if you want to have no album cover.
// Or you can use one of the pre-existing ones.
// If the files are in a subfolder add /subfolder/ before the ost name in the list

var songOSTListBF:Array<String> =
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

var songErectOSTListBF:Array<String> =
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
    "volume4"//,
    //add albums below (put a comma after each one exept the last)
];

// ---------------------

var songOSTListPico:Array<String> =
[
    "random",
    "volume4", 
    "volume4", 
    "volume4", 
    "volume4", 
    "volume4", 
    "volume4",
    "volume4",
    "volume4",
    "expansion2",
    "volume4",
    "expansion2",
    "expansion2",
    "volume4",
    "volume4",
    "expansion2",
    "volume3",
    "volume3",
    "volume3",
    "volume3"//,
    //add albums below (put a comma after each one exept the last)

];

var songErectOSTListPico:Array<String> =
[
    "random",
    "expansion2"//,
    //add albums below (put a comma after each one exept the last)

];

// ---------------------
// SONG BPMs
// ---------------------

// Self explanatory, put the BPM of the songs here.

var bpmListBF:Array<String> = 
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
    //add extra bf song bpms below (put a comma after each one exept the last)
];

var bpmErectListBF:Array<String> = 
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
    //add extra erect bf song bpms below (put a comma after each one exept the last)
];

// ---------------------

var bpmListPico:Array<String> = 
[
    145,
    100,
    120,
    180,
    150,
    165,
    150,
    175,
    165,
    100,
    150,
    144,
    120,
    160,
    185,
    178,
    155,
    175,
    182,
    100//,
    //add extra pico song bpms below (put a comma after each one exept the last)
];

var bpmErectListPico:Array<String> = 
[
    145,
    155//,
    //add extra erect pico song bpms below (put a comma after each one exept the last)
];

// ---------------------
// WEEK NUMS
// ---------------------

// Add the week number of the songs here (HAS TO BE NUMBERS LIKE THIS "1")
// If you dont have a week number use "0"
// (Currently only allows up to week/weekend 9. nothing above 9)

var weekListBF:Array<String> = 
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

var weekErectListBF:Array<String> = 
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

// ---------------------

var weekListPico:Array<String> = 
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
    "5",
    "5",
    "6",
    "6",
    "7",
    "7",
    "7",
    "1",
    "1",
    "1",
    "1"
];

var weekErectListPico:Array<String> = 
[
    "0",
    "1"
];

// ---------------------
// SONG DIFFICULTYS
// ---------------------

// Must be a number from "00" to "99" and must have a Easy, Normal, Hard, Erect, and Nightmare difficulty
// If you dont have nightmare or erect songs set "(charactername)HasErect"
// to false and it will disable erect mode

var songDiffEasyListBF:Array<String> =
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

var songDiffNormListBF:Array<String> =
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

var songDiffHardListBF:Array<String> =
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

var songDiffErectListBF:Array<String> =
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

var songDiffNightListBF:Array<String> =
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

// ---------------------

var songDiffEasyListPico:Array<String> =
[
    //Random
    "0",
    //week1
    "1", 
    "2", 
    "3", 
    //week2
    "1", 
    "2",
    //week3
    "2",
    "2",
    "3",
    //week5
    "2",
    "3",
    //week6
    "1",
    "2",
    //week7
    "2",
    "3",
    "4",
    //weekend1
    "2",
    "2",
    "3",
    "3"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffNormListPico:Array<String> =
[
    //Random
    "0",
    //week1
    "2", 
    "3", 
    "4", 
    //week2
    "2", 
    "3",
    //week3
    "3",
    "3",
    "4",
    //week5
    "3",
    "4",
    //week6
    "2",
    "3",
    //week7
    "3",
    "4",
    "5",
    //weekend1
    "3",
    "3",
    "4",
    "4"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffHardListPico:Array<String> =
[
    //Random
    "0",
    //week1
    "3", 
    "4", 
    "5", 
    //week2
    "3", 
    "4",
    //week3
    "4",
    "4",
    "5",
    //week5
    "4",
    "5",
    //week6
    "3",
    "4",
    //week7
    "4",
    "5",
    "6",
    //weekend1
    "4",
    "4",
    "5",
    "5"//,
    //add extra norm diff numbers below (put a comma after each one exept the last)
];

var songDiffErectListPico:Array<String> =
[
    "0",
    //weekend1
    "8"
];

var songDiffNightListPico:Array<String> =
[
    "0",
    //weekend1
    "9"
];

// ---------------------
// SONG ICONS
// ---------------------

// have your icons in (images/menus/freeplay/icons/) with the name format as
// "(charactername)pixel.png"
// DO NOT PUT PIXEL IN THE LIST IT WILL AUTOMATICALLY ADD IT LATER FOR YOU 
// (example: in the list just put "dad" it will add pixel to make "dadpixel" for you later)

var iconsBF:Array<String> = 
[
    "random",
    "gf", 
    "dad", 
    "dad", 
    "dad", 
    "spooky",
    "spooky",
    "monster",
    "pico",
    "pico",
    "pico",
    "mom",
    "mom",
    "mom",
    "parents",
    "parents",
    "monster",
    "senpai-pixel",
    "senpai-pixel",
    "spirit-pixel",
    "tankman",
    "tankman",
    "tankman",
    "darnell",
    "darnell"//,
    //add extra icons below (put a comma after each one exept the last)
];

var iconsErectBF:Array<String> = 
[    
    "random",
    "dad", 
    "dad", 
    "dad", 
    "spooky",
    "spooky",
    "pico",
    "pico",
    "pico",
    "mom",
    "mom",
    "parents",
    "parents",
    "senpai-pixel",
    "senpai-pixel",
    "spirit-pixel",
    "tankman"//,
    //add extra erect icons below (put a comma after each one exept the last)
];

// ---------------------

var iconsPico:Array<String> = 
[
    "random",
    "dad", 
    "dad", 
    "dad", 
    "spooky",
    "spooky",
    "pico",
    "pico",
    "pico",
    "parents",
    "parents",
    "senpai-pixel",
    "senpai-pixel",
    "tankman",
    "tankman",
    "tankman",
    "darnell",
    "darnell",
    "darnell",
    "darnell"
];

var iconsErectPico:Array<String> = 
[
    "random",
    "darnell"
];

// ---------------------
// BG COLORS (may or may not implement later idk)
// ---------------------

// put the hex color code of the background color behind the freeplay character here

var songColorsBF:Array<String> = 
[
    0xffd763, //(static yellow color)    
];

var songColorsPico:Array<String> = 
[
    0x8a91f2, //(static blue color)  
];

