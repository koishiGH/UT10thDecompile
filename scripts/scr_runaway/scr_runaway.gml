function scr_runaway()
{
    runaway = 1;
    snd_play(snd_escaped);
    obj_heart.hspeed = -3;
    obj_heart.sprite_index = (obj_heart.sprite_index == spr_heartblue) ? spr_heartgtfoblue : spr_heartgtfo;
    obj_heart.image_speed = 0.5;
    OBJ_WRITER.halt = 3;
    global.xp += global.xpreward[3];
    global.gold += global.goldreward[3];
    tlvl = global.lv;
    scr_levelup();
    
    if (levelup == 1)
        snd_play(snd_levelup);
    
    global.msc = 14;
    instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
    global.flag[11] = 1;
    global.flag[24] += 1;
    
    if (instance_exists(obj_sansb))
    {
        if (obj_sansb.part == 4)
            global.overmsg = 5;
        else
            global.overmsg = 1;
    }
    else
    {
        global.overmsg = 3;
    }
}
