depth = 8;
hurt = 0;
legs_image_index = 0;
tailsiner = 0;
tailamp = 1;
siner = 0;
legs_image_index = 0;
head_sprite = spr_mrsunshine_head_normal;
face_frame = 0;
pinwheel_con = -1;
pinwheel_speed = 0;
pinwheel_maxspeed = 7;

if (!instance_exists(obj_doghole_abberant))
    pinwheel_maxspeed = 10;

pinwheel_angle = 0;
pinwheel_bullet_counter = 0;
pinwheel_bullet_alternate = false;
pinwheel_bullets_created = 0;

createPinwheelBullets = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var tailangle = image_angle + (sin(tailsiner / 400) * 15 * tailamp);
    var xx = x - (sprite_get_xoffset(sprite_index) * 2);
    var yy = y - (sprite_get_yoffset(sprite_index) * 2);
    var len = 93;
    var dir = -105;
    var headoffx = lengthdir_x(len, dir - tailangle);
    var headoffy = -lengthdir_y(len, dir - tailangle);
    var headx = xx + 196 + headoffx;
    var heady = yy + 116 + headoffy;
    
    if (pinwheel_bullet_alternate)
    {
        arg1 = 0;
        pinwheel_bullet_alternate = false;
    }
    else
    {
        pinwheel_bullet_alternate = true;
    }
    
    var bulletlen = 25;
    
    for (var i = 0; i < 6; i++)
    {
        var angle = (i * 60) + 60 + (arg1 * 15) + pinwheel_angle;
        
        with (instance_create(headx + lengthdir_x(bulletlen, angle), heady + lengthdir_y(bulletlen, angle), obj_doghole_mrsunshine_bullet))
        {
            sprite_index = arg6;
            direction = angle;
            speed = 5.5 * arg0;
            depth = (obj_lborder.depth - 10000) + other.pinwheel_bullets_created++;
            diramt *= arg3;
            growamt *= arg2;
            wobble = arg4;
            gravity = arg5;
            
            if (arg6 == spr_doghole_mrsunshine_bullet_sun)
            {
                image_xscale *= 0.65;
                image_yscale *= 0.65;
                growamt *= 0.8;
            }
        }
    }
};

postBattlecontrollerStep = function()
{
    legs_image_index += 0.05;
    
    if (legs_image_index >= 2)
        legs_image_index -= 2;
    
    image_xscale = 1;
    var y_offset = sin(siner / 150) * 10;
    y = ystart + y_offset;
    image_yscale = 1 + (sin(siner / 300) * 0.03);
    siner += 33.333333333333336;
    
    if (global.mnfight != 1 && head_sprite == spr_mrsunshine_head_look && obj_doghole_mrsunshine.shudder == 0)
    {
        head_sprite = spr_mrsunshine_head_normal;
        face_frame = 0;
    }
    else if (global.mnfight != 0)
    {
        face_frame += 0.33;
    }
    
    var bulletRate = 10;
    var speedFactor = 1;
    var angleFactor = 0;
    var growFactor = 1;
    var dirFactor = 1;
    var wobbleFactor = 0;
    var gravityAmount = 0;
    var sprite = spr_doghole_mrsunshine_bullet;
    
    if (!instance_exists(obj_doghole_abberant))
    {
        bulletRate = 3.5;
        speedFactor = 1.6;
        angleFactor = 1;
        growFactor = 1.6;
        dirFactor = 8;
        
        if (head_sprite == spr_mrsunshine_head_happy)
        {
            speedFactor = 0.8;
            growFactor = 1.04;
            bulletRate = 4.5;
            angleFactor = 4;
        }
        else if (head_sprite == spr_mrsunshine_head_sad)
        {
            speedFactor = 1.4;
            growFactor *= 0.45;
            wobbleFactor = 4;
            gravityAmount = 0.2;
        }
    }
    else if (head_sprite == spr_mrsunshine_head_happy)
    {
        speedFactor *= 0.5;
        growFactor *= 0.65;
    }
    else if (head_sprite == spr_mrsunshine_head_sad)
    {
        growFactor *= 0.45;
        wobbleFactor = 4;
        gravityAmount = 0.1;
    }
    
    if (pinwheel_con == 0)
    {
        pinwheel_speed += 0.2;
        
        if (pinwheel_speed >= pinwheel_maxspeed)
        {
            pinwheel_speed = pinwheel_maxspeed;
            pinwheel_con = 1;
        }
        
        if (pinwheel_speed >= 3)
        {
            pinwheel_bullet_counter += 1;
            
            if (pinwheel_bullet_counter >= bulletRate)
            {
                pinwheel_bullet_counter -= bulletRate;
                createPinwheelBullets(speedFactor, angleFactor, growFactor, dirFactor, wobbleFactor, gravityAmount, sprite);
            }
        }
        else
        {
            pinwheel_bullets_created = 0;
            pinwheel_bullet_counter = bulletRate - 1;
        }
    }
    
    if (pinwheel_con == 1)
    {
        pinwheel_bullet_counter += 1;
        
        if (pinwheel_bullet_counter >= bulletRate)
        {
            pinwheel_bullet_counter -= bulletRate;
            createPinwheelBullets(speedFactor, angleFactor, growFactor, dirFactor, wobbleFactor, gravityAmount, sprite);
        }
        
        if (global.turntimer < 60)
            pinwheel_con = 2;
    }
    
    if (pinwheel_con == 2)
    {
        if (pinwheel_angle > 360)
            pinwheel_angle += min(pinwheel_speed, lerp(pinwheel_angle, 720, 0.1) - pinwheel_angle);
        else
            pinwheel_angle += pinwheel_speed;
        
        if (pinwheel_angle >= 719.5)
        {
            pinwheel_con = -1;
            pinwheel_angle = 0;
            pinwheel_speed = 0;
            pinwheel_bullet_counter = 0;
        }
    }
    else
    {
        pinwheel_angle += pinwheel_speed;
        pinwheel_angle %= 360;
    }
};
