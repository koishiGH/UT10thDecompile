type = 0;
bottom_y = 0;
bottom_y_init = 0;
siner = 0;
lock = 0;
lock_move = 0;
hspeed = 0;
swing = 0;
y_offset = 0;
rc_cut = 0;
noloop = false;

with (obj_sansb)
    array_push(boneUpdateOrder, other.id);

postHeartStep = function()
{
    var xx = x + 1;
    var xx2 = (x + 9) - rc_cut;
    var pushout = 0;
    
    if (swing == 1)
    {
        y_offset = sin(siner / 10) * 20;
        siner += 1;
    }
    
    if (obj_heart.x < ((xx + hspeed) - 60))
        exit;
    
    if (obj_heart.x > (xx2 + hspeed + 60))
        exit;
    
    var yy, yy2;
    
    if (type == 0 || type == 1)
    {
        yy = y + 5;
        yy2 = global.idealborder[3] - 6 - bottom_y;
    }
    else
    {
        yy = global.idealborder[2] + 11;
        yy2 = y;
    }
    
    if (type != 1)
    {
        while (collision_rectangle(xx + hspeed, yy, xx2 + hspeed, yy2, obj_heart, 0, 1))
        {
            var move_dir = obj_heart.x - x;
            obj_heart.x += sign(move_dir);
            
            if (move_dir == 0)
                obj_heart.x += 1;
            
            if ((obj_heart.x < 10 && hspeed < 0) || (obj_heart.x > 630 && hspeed > 0))
                pushout = 1;
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
        if (collision_rectangle(bbox_left + 2, yy, bbox_right - 2, yy2 + 8, obj_heart, 0, 1))
        {
            if (obj_heart.vspeed < 0)
            {
                while (obj_heart.bbox_top > (yy2 + 6))
                    obj_heart.y -= 1;
                
                obj_heart.vspeed = 0;
            }
        }
        
        if (collision_rectangle(bbox_left + 2, bbox_top - 1 - obj_heart.vspeed, bbox_right - 2, bbox_bottom - obj_heart.vspeed, obj_heart, 0, 1))
        {
            if (obj_heart.vspeed >= 0 && obj_heart.y <= (y - 8))
            {
                lock = 1;
                obj_heart.y = y - 16;
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
    else if (type == 2 && place_meeting(x, bbox_bottom + 1, obj_heart))
    {
        if (obj_heart.vspeed < 0)
            obj_heart.vspeed = 0;
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
