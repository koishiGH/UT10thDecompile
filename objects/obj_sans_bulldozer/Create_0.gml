hspeed = -1;
image_speed = 0.5;

if (obj_sansb.hit_try == 1)
{
    hspeed = -26;
    image_speed = 1;
}

image_xscale = 2;
image_yscale = 2;

if (obj_sansb.hit_try == 0)
{
    engine_sound = audio_play_sound(mus_engine_loop, 1, true, 0);
    audio_sound_gain(engine_sound, 1, 5000);
}
else
{
    engine_sound = audio_play_sound(mus_engine_loop, 1, true, 1, 0, 2.5);
}

postHeartStep = function()
{
    var pushout = 0;
    
    while (collision_rectangle(bbox_left + hspeed, bbox_top, bbox_right, bbox_bottom, obj_heart, 0, 1))
    {
        var move_dir = obj_heart.x - x;
        obj_heart.x += sign(move_dir);
        
        if (move_dir == 0)
            obj_heart.x += 1;
        
        if ((obj_heart.x < 10 && hspeed < 0) || (obj_heart.x > 630 && hspeed > 0))
            pushout = 1;
    }
    
    if (pushout == 1 && obj_battlecontroller.runaway == 0)
    {
        obj_battlecontroller.runaway = 1;
        snd_play(snd_escaped);
        
        if (obj_heart.x < 320)
        {
            obj_heart.hspeed = -3;
            obj_heart.sprite_index = spr_heartgtfoblue;
            obj_heart.image_speed = 0.5;
        }
        else
        {
            obj_heart.hspeed = 3;
            obj_heart.sprite_index = spr_heartgtfoblue;
            obj_heart.image_xscale = -1;
            obj_heart.image_speed = 0.5;
        }
        
        obj_heart.movement = 0;
        global.mnfight = 4;
        audio_stop_sound(global.batmusic);
        global.msc = 14;
        instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
        global.talked = 90;
        global.myfight = 4;
        control_clear(0);
        global.mercyuse = 1;
        global.turntimer = 9999;
        
        if (obj_sansb.hit_try == 0)
            global.flag[472] = 5;
        
        with (obj_sans_bonebul_phy)
            instance_destroy();
        
        with (obj_sans_bonebul_phy_hang)
            instance_destroy();
        
        with (obj_sansb)
            array_resize(boneUpdateOrder, 0);
    }
};
