if (control_check(4) && !force_lock)
{
    if (movement == 1)
    {
        y += global.sp;
        
        if (control_check(1))
            y -= (global.sp / 2);
    }
}

if (control_check(6) && !force_lock)
{
    if (movement == 1 || movement == 2)
    {
        x += global.sp;
        
        if (control_check(1))
            x -= (global.sp / 2);
    }
}

if (control_check(3) && !force_lock)
{
    if (movement == 1)
    {
        y -= global.sp;
        
        if (control_check(1))
            y += (global.sp / 2);
    }
    
    if (movement == 2)
    {
        if (jumpstage == 1 && vspeed == 0)
        {
            jumpstage = 2;
            vspeed = -6;
        }
    }
}

if (control_check(5) && !force_lock)
{
    if (movement == 1 || movement == 2)
    {
        x -= global.sp;
        
        if (control_check(1))
            x += (global.sp / 2);
    }
}

if (global.mnfight != 2 || force_lock)
    movement = 0;
else if (movement == 0)
    movement = 1;

global.invc -= 1;

if (global.invc > 0 || obj_battlecontroller.runaway == 1)
{
    image_speed = 0.5;
}
else
{
    image_index = 0;
    image_speed = 0;
}

if (movement == 11)
{
    vspeed = 0;
    
    if (obj_time.up)
        y -= global.sp;
    
    if (obj_time.down)
        y += global.sp;
    
    if (obj_time.left)
    {
        if (jumpstage == 1 && hspeed == 0)
        {
            jumpstage = 2;
            hspeed = -6;
        }
    }
}

if (movement == 12)
{
    hspeed = 0;
    
    if (obj_time.left)
        x -= global.sp;
    
    if (obj_time.right)
        x += global.sp;
    
    if (obj_time.down)
    {
        if (jumpstage == 1 && vspeed == 0)
        {
            jumpstage = 2;
            vspeed = 6;
        }
    }
}

if (movement == 13)
{
    vspeed = 0;
    
    if (obj_time.up)
        y -= global.sp;
    
    if (obj_time.down)
        y += global.sp;
    
    if (obj_time.right)
    {
        if (jumpstage == 1 && hspeed == 0)
        {
            jumpstage = 2;
            hspeed = 6;
        }
    }
}

if (jumpstage == 2 && movement == 2)
{
    if (!obj_time.up && vspeed <= -1)
        vspeed = -1;
    
    if (vspeed > 0.5 && vspeed < 8)
        vspeed += 0.6;
    
    if (vspeed > -1 && vspeed <= 0.5)
        vspeed += 0.2;
    
    if (vspeed > -4 && vspeed <= -1)
        vspeed += 0.5;
    
    if (vspeed <= -4)
        vspeed += 0.2;
}

if (jumpstage == 2 && movement == 11)
{
    if (!obj_time.left && hspeed <= -1)
        hspeed = -1;
    
    if (hspeed > 0.5 && hspeed < 8)
        hspeed += 0.6;
    
    if (hspeed > -1 && hspeed <= 0.5)
        hspeed += 0.2;
    
    if (hspeed > -4 && hspeed <= -1)
        hspeed += 0.5;
    
    if (hspeed <= -4)
        hspeed += 0.2;
}

if (jumpstage == 2 && movement == 12)
{
    if (!obj_time.down && vspeed >= 1)
        vspeed = 1;
    
    if (vspeed < -0.5 && vspeed > -8)
        vspeed -= 0.6;
    
    if (vspeed < 1 && vspeed >= -0.5)
        vspeed -= 0.2;
    
    if (vspeed < 4 && vspeed >= 1)
        vspeed -= 0.5;
    
    if (vspeed >= 4)
        vspeed -= 0.2;
}

if (jumpstage == 2 && movement == 13)
{
    if (!obj_time.right && hspeed >= 1)
        hspeed = 1;
    
    if (hspeed < -0.5 && hspeed > -8)
        hspeed -= 0.6;
    
    if (hspeed < 1 && hspeed >= -0.5)
        hspeed -= 0.2;
    
    if (hspeed < 4 && hspeed >= 1)
        hspeed -= 0.5;
    
    if (hspeed >= 4)
        hspeed -= 0.2;
}

if (ignore_border == 0 && instance_exists(obj_sansb_body) && global.mnfight == 2)
{
    if (x < (global.idealborder[0] + 4))
    {
        x = global.idealborder[0] + 4;
        
        if (hspeed < 0)
            hspeed = 0;
        
        if (movement == 13)
            jumpstage = 1;
    }
    
    if (y < (global.idealborder[2] + 4))
    {
        y = global.idealborder[2] + 4;
        
        if (vspeed < 0)
            vspeed = 0;
        
        if (movement == 12)
            jumpstage = 1;
    }
    
    if (x > (global.idealborder[1] - 16))
    {
        x = global.idealborder[1] - 16;
        
        if (hspeed > 0)
            hspeed = 0;
        
        if (movement == 11)
            jumpstage = 1;
    }
    
    if (y > (global.idealborder[3] - 16))
    {
        y = global.idealborder[3] - 16;
        
        if (vspeed > 0)
            vspeed = 0;
        
        if (movement == 2)
            jumpstage = 1;
    }
}

if (instance_exists(obj_battlecontroller))
{
    if (obj_battlecontroller.runaway == 1 && (x < -20 || (sprite_index == spr_heartgtfoblue && x > 640)))
    {
        if (!instance_exists(obj_unfader))
            instance_create(0, 0, obj_unfader);
        
        if (x < -60 || (sprite_index == spr_heartgtfoblue && x > 660))
        {
            if (global.flag[15] == 0)
            {
                caster_stop(global.batmusic);
                caster_free(global.batmusic);
            }
            
            global.myxb = undefined;
            global.myyb = undefined;
            
            if (instance_exists(obj_sans_bulldozer))
            {
                audio_sound_gain(global.batmusic, 1, 0);
                audio_stop_sound(mus_engine_loop);
                global.gameover_mode = 0;
                
                if (obj_sansb.hit_try == 1)
                    global.gameover_mode = 1;
                
                __room_goto(global.currentroom);
                exit;
            }
            else
            {
                __room_goto(global.currentroom);
                exit;
            }
        }
    }
}

with (obj_borderparent)
    postHeartStep();

with (blt_parent_heart_poststep)
    postHeartStep();

with (obj_sansb)
{
    for (var i = 0; i < array_length(boneUpdateOrder); i++)
    {
        with (boneUpdateOrder[i])
            postHeartStep();
    }
    
    with (obj_sans_bulldozer)
        postHeartStep();
}
