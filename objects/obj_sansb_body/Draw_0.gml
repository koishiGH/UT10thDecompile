if (pose == 3)
{
    siner += 1;
    yoff = sin(siner / 2) * 3;
    xoff = cos(siner / 4) * 2;
}
else if (bounce == 3)
{
    siner += 1;
    yoff = sin(siner / 18) * 2;
}
else if (bounce == 2)
{
    siner += 1;
    yoff = sin(siner / 15) * 4;
}
else if (bounce == 1)
{
    siner += 1;
    yoff = sin(siner / 3);
    xoff = cos(siner / 6);
}
else if (bounce == 0)
{
    siner = 0;
    yoff = 0;
    xoff = 0;
}

if (pose == 0)
{
    draw_sprite_ext(spr_sansb_legs, 0, x, y + 90, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_sansb_torso, global.flag[20], x + xoff, y + 42 + (yoff / 1.5), 2, 2, 0, c_white, 1);
    
    if (facetype == 0)
        draw_sprite_ext(spr_sansb_face, global.faceemotion, x + xoff + headx, y + yoff + heady, 2, 2, 0, c_white, 1);
}
else if (pose == 1)
{
    if (global.turntimer <= 60 && global.turntimer > 1 && wink_frame == 0)
    {
        var winkstar = instance_create(x + 38, y + 34, obj_winkstar);
        winkstar.depth = depth - 1;
        audio_play_sound(snd_bell, 1, false);
        wink_frame = 1;
    }
    else if (global.turntimer < 1 && wink_frame == 1)
    {
        wink_frame = 2;
    }
    
    if (wink_frame != 1)
    {
        sprite_index = spr_sans_chill_full;
        image_speed = 0.5;
    }
    else
    {
        sprite_index = spr_sans_chill;
        image_index = 1;
        image_speed = 0;
    }
    
    draw_sprite_ext(sprite_index, image_index, x - 70, y + 20, 2, 2, 0, c_white, 1);
}
else if (pose == 2)
{
    sprite_index = spr_sans_comb;
    image_speed = 0.2;
    draw_sprite_ext(spr_sans_comb, image_index, x - 66, y - 52, 2, 2, 0, c_white, 1);
}
else if (pose == 3)
{
    sprite_index = spr_sans_dance_full;
    image_speed = 2;
    draw_sprite_ext(sprite_index, image_index, x - 66, y - 20, 2, 2, 0, c_white, 1);
}

if (global.damagetimer > 0 && dodge == 0)
    dodge = 1;

if (dodge == 1)
{
    timerbonus = global.damagetimer;
    dg_t = 0;
    dg_x = x;
    hspeed = -12;
    dodge = 2;
}

if (dodge == 2)
{
    if (x < (dg_x - 60) && dg_t < 20)
    {
        if (hspeed < 0)
            hspeed += 2;
        else
            hspeed = 0;
    }
    
    dg_t += 1;
    
    if (dg_t >= (20 + timerbonus))
    {
        if (hspeed < 12)
            hspeed += 2;
        
        if (x >= (dg_x - 13))
        {
            hspeed = 0;
            x = dg_x;
            dodge = 0;
            global.damagetimer = -1;
        }
    }
}
