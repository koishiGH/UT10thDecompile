sm = 0;
gg = floor(random(3));
mycommand = round(random(100));
global.msg[0] = "del";
global.msg[1] = "%%%";
yoff = 0;

if (hit_try > hit_reached)
{
    if (hit_try == 1)
    {
        with (obj_sansb_body)
            pose = 0;
        
        global.overmsg = 2;
        part = 4;
        atcon = 4;
        self_timer = 340;
        timer_on = 0;
        array_resize(boneUpdateOrder, 0);
        global.faceemotion = 1;
        global.msg[0] = "what^1, you think&you can hit me&without me dozin'?/";
        global.msg[1] = "\\E4... all right^1,&i get it^2.&i'll be fair^2.&i'll doze for ya./";
        global.msg[2] = "\\E3stay still for a sec./%%";
    }
    
    hit_reached = hit_try;
}

global.typer = 109;
global.border = 52;
obj_heart.x = round((global.idealborder[0] + global.idealborder[1]) / 2);
obj_heart.y = round((global.idealborder[2] + global.idealborder[3]) / 2) - 8;

with (obj_heart)
{
    sprite_index = spr_heartblue;
    movement = 0;
    jumpstage = 1;
    y = global.idealborder[3] - 15;
    speed = 0;
}

if (global.border == 39)
    obj_heart.y = global.idealborder[3] - 70;

if (global.border == 39)
    obj_heart.y = 290;

if (part == 3)
{
    with (obj_sansb_body)
    {
        obj_heart.x = 312;
        obj_heart.y = 290;
        obj_heart.jumpstage = 2;
        
        for (var b = 0; b < 6; b++)
        {
            scr_sbophyhang(60, 40, 0, -120, 0);
            bone.x = 287 + (b * 11);
        }
    }
}

SCR_BORDERSETUP();
yoff = 250 - global.idealborder[2];

if (yoff < 0)
    yoff = 0;

if (sm == 1)
    blcon = instance_create(x + 120, y - yoff, obj_blconsm);
else
    blcon = instance_create(x + 120, y - yoff, obj_blconwdflowey);

blconwd = instance_create(blcon.x + 30, blcon.y + 10, OBJ_NOMSCWRITER);
blconwd.skippable = true;

if (global.msg[0] == "del")
{
    with (blconwd)
        instance_destroy();
    
    with (blcon)
        instance_destroy();
}
