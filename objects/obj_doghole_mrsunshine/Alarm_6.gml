turn_counter++;
gg = floor(random(3));
mycommand = round(random(100));

if (mycommand >= 0)
    global.msg[0] = "All is&but a&wall&shadow!";

if (mycommand >= 25)
    global.msg[0] = "I shone&for 10&years!&I, me!";

if (mycommand >= 50)
    global.msg[0] = "QUIET!&I can't&hear&the SUN!";

if (mycommand >= 75)
    global.msg[0] = "Nobody&talks to&the tail.";

if (obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_happy)
{
    if (mycommand < 50)
        global.msg[0] = "Bananas&are a&type of&moon.";
    else
        global.msg[0] = "Shine,&always&talk to&the shine!";
}

if (obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_sad)
{
    if (mycommand < 50)
        global.msg[0] = "Getting&kinda&hazy...";
    else
        global.msg[0] = "Mr. Sun&SHONE,&more&like...";
}

if (whatiheard == 3 && obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_normal)
{
    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_1");
    mercymod = 900;
}

if (whatiheard == 9 && obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_normal)
    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_2");

if (whatiheard == 10 && obj_doghole_mrsunshine_body.head_sprite != spr_mrsunshine_head_happy)
{
    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_11");
    mercymod = 900;
    obj_doghole_mrsunshine_body.head_sprite = spr_mrsunshine_head_happy;
}

if (whatiheard == 11 && obj_doghole_mrsunshine_body.head_sprite != spr_mrsunshine_head_sad)
{
    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_12");
    mercymod = 900;
    obj_doghole_mrsunshine_body.head_sprite = spr_mrsunshine_head_sad;
}

if (whatiheard == -1 && mycommand >= 75 && obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_normal)
    blcon = instance_create(270, 3, obj_blconsm);
else
    blcon = instance_create(280, 108, obj_blconsm);

blcon.sprite_index = spr_blconsm_plus1;
global.msg[1] = "%%%";
global.typer = 2;
blconwd = instance_create(blcon.x + 15, blcon.y + 10, OBJ_NOMSCWRITER);
blcon.depth = obj_doghole_mrsunshine_body.depth - 100;
blconwd.depth = blcon.depth - 1;
global.border = 17;
obj_heart.x = round((global.idealborder[0] + global.idealborder[1]) / 2) - 8;
obj_heart.y = round((global.idealborder[2] + global.idealborder[3]) / 2) - 8;

if (obj_doghole_mrsunshine_body.head_sprite == spr_mrsunshine_head_normal && (whatiheard == 3 || whatiheard == 9))
    obj_doghole_mrsunshine_body.head_sprite = spr_mrsunshine_head_look;
