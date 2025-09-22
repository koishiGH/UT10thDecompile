event_inherited();
riseTimer = 20;
leaveTimer = 60;
riseDestY = y;

postHeartStep = function()
{
    riseTimer--;
    
    if (riseTimer <= 0)
    {
        y = lerp(ystart, riseDestY, animcurve_channel_evaluate(animcurve_get_channel(acv_elastic, 0), abs(riseTimer) / 20));
        
        if (riseTimer <= -20)
        {
            y = riseDestY;
            riseTimer = infinity;
        }
    }
    
    leaveTimer--;
    
    if (leaveTimer <= 0)
    {
        y++;
        
        if (y >= ystart)
            leaveTimer = infinity;
    }
    
    var xx = x + 1;
    var xx2 = (x + width) - 1;
    
    if (obj_heart.x < ((xx + hspeed) - 60))
        exit;
    
    if (obj_heart.x > (xx2 + hspeed + 60))
        exit;
    
    var pushout = 0;
    var yy = y + 8;
    var yy2 = y + 15;
    
    if (type != 1)
    {
        var heartXStart = obj_heart.x;
        var distance;
        
        for (distance = 0; collision_rectangle(xx + hspeed, yy, xx2 + hspeed, yy2, obj_heart, 0, 1); distance++)
        {
            var move_dir = obj_heart.x - x;
            obj_heart.x += sign(move_dir);
            
            if (move_dir == 0)
                obj_heart.x += 1;
            
            if ((obj_heart.x < 10 && hspeed < 0) || (obj_heart.x > 630 && hspeed > 0))
                pushout = 1;
        }
        
        if (distance > (abs(hspeed) * 4))
        {
            obj_heart.x = heartXStart;
            obj_heart.y = y - 14;
        }
    }
    else if (obj_time.right || obj_time.left || obj_heart.vspeed != 0)
    {
        if (collision_rectangle(xx + hspeed, yy, xx2 + hspeed, yy2, obj_heart, 0, 1))
        {
            if (!noloop)
            {
                if (sign(obj_heart.x - obj_heart.xprevious) != sign(hspeed))
                    obj_heart.xprevious = obj_heart.x + (sign(obj_time.right - obj_time.left) * 4);
                
                noloop = 1;
            }
            
            obj_heart.x = obj_heart.xprevious;
            obj_heart.x += hspeed;
            obj_heart.hspeed = 0;
        }
        else
        {
            noloop = 0;
        }
        
        if ((obj_heart.x < 10 && hspeed < 0) || (obj_heart.x > 630 && hspeed > 0))
            pushout = 1;
    }
    
    if (type == 0)
    {
        if (collision_rectangle(x + 2, (bbox_top + 1) - obj_heart.vspeed, (x + width) - 2, bbox_bottom - obj_heart.vspeed, obj_heart, 0, 1))
        {
            if (obj_heart.vspeed >= 0 && obj_heart.y <= (y - 8))
            {
                lock = 1;
                obj_heart.y = y - 14;
                obj_heart.vspeed = 0;
                obj_heart.jumpstage = 1;
            }
        }
        else
        {
            if (lock == 1 && obj_heart.jumpstage == 1)
            {
                obj_heart.jumpstage = 2;
                obj_heart.vspeed = 0;
            }
            
            lock = 0;
        }
        
        if (lock == 1 && lock_move == 0)
        {
            obj_heart.x += hspeed;
            
            if ((obj_heart.x < 10 && hspeed < 0) || (obj_heart.x > 630 && hspeed > 0))
                pushout = 1;
            
            with (obj_sans_bonebul_phy)
                lock_move = 1;
            
            with (obj_sans_bonebul_phy_hang)
                lock_move = 1;
        }
    }
    
    if (pushout == 1 && obj_battlecontroller.runaway == 0)
    {
        obj_battlecontroller.runaway = 1;
        snd_play(snd_escaped);
        global.flag[472] = 5.1;
        
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
        
        with (obj_sans_bonebul_phy)
            instance_destroy();
        
        with (obj_sans_bonebul_phy_hang)
            instance_destroy();
        
        with (obj_sansb)
            array_resize(boneUpdateOrder, 0);
    }
};
