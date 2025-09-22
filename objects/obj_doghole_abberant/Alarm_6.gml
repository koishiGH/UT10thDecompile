blcon = instance_create(431, 5, obj_blconsm);
blcon.sprite_index = spr_blconabove;
gg = floor(random(3));
mycommand = round(random(100));
turn_counter++;

if (mycommand >= 0)
    global.msg[0] = "Trespass not into&our new kingdom!";

if (mycommand >= 40)
    global.msg[0] = "Eat the hairs&of the world.";

if (mycommand >= 70)
    global.msg[0] = "En Cheveux,&En Pelo!";

if (mercymod >= 900)
{
    global.msg[0] = "No... the dog's&betrayal?";
    
    if (mycommand >= 25)
        global.msg[0] = "What... What am I&fighting for?";
    
    if (mycommand >= 50)
        global.msg[0] = "Next time I'll&get... a cool&fade...";
    
    if (mycommand >= 75)
        global.msg[0] = "It was just...&A regular dog!?";
}

if (whatiheard == 3)
    global.msg[0] = "No...&What did I&believe in?!";

if (whatiheard == 6)
{
    global.msg[0] = "You're playing&this battle&wrong, you know!";
    
    if (mycommand >= 50)
        global.msg[0] = "All puppies are&perfect!";
}

whatiheard = -1;
global.msg[1] = "%%%";
global.typer = 2;
blconwd = instance_create(blcon.x + 15, blcon.y + 10, OBJ_NOMSCWRITER);
global.border = 17;
obj_heart.x = round((global.idealborder[0] + global.idealborder[1]) / 2) - 8;
obj_heart.y = round((global.idealborder[2] + global.idealborder[3]) / 2) - 8;
