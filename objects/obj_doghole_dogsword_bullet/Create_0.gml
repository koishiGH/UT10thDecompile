image_xscale = 2;
image_yscale = 2;
flashamt = 0;
dashxstart = 0;
dashxend = 0;
therate = 0;
con = 0;

if (obj_doghole_abberant.gamermode != 1)
    obj_doghole_abberant.gamermode = 2;

dmg = 8;
y = obj_heart.y + 40;
side = 0;

if (x > global.idealborder[0])
    side = 1;

colors[0] = choose(0, 1);

for (var i = 3; i < 10; i++)
    colors[i] = choose(0, 1);

if (choose(0, 1) == 0)
{
    colors[1] = 1 - colors[0];
    colors[2] = choose(0, 1);
    colors[4] = 1 - colors[2];
}
else
{
    colors[1] = choose(0, 1);
    colors[2] = 1 - colors[0];
    colors[4] = 1 - colors[1];
}

colorind = -1;
leftx = global.idealborder[0] - 90;
rightx = global.idealborder[1] + 50;

if (side == 0)
{
    idealx = leftx;
}
else
{
    idealx = rightx + sprite_width;
    image_xscale *= -1;
}

postHeartStep = function()
{
    if (con == 0)
    {
        alarm[4] = 25;
        con = 1;
    }
    
    if (con == 1)
    {
        x = lerp(x, idealx, 0.3);
        y = lerp(y, global.idealborder[3] + 70, 0.2);
    }
    
    if (con == 2)
    {
        xstart = x;
        ystart = y;
        var msf = audio_play_sound(snd_saber3, 10, false);
        
        if (obj_doghole_abberant.gamermode == 2)
            audio_sound_pitch(msf, 1 + (therate / 9));
        else if (obj_doghole_abberant.gamermode == 1)
            audio_sound_pitch(msf, 2);
        
        colorind++;
        con = 3;
    }
    
    if (con == 3)
    {
        flashamt += 0.2;
        
        if (flashamt >= 1)
        {
            flashamt = 1;
            con = 4;
        }
        
        x = xstart + random_range(-2, 2);
        y = ystart + random_range(-2, 2);
    }
    
    if (con == 4)
    {
        x = xstart;
        y = ystart;
        alarm[4] = 12 - therate;
        
        if (obj_doghole_abberant.gamermode == 1)
            alarm[4] = 7;
        
        con = 5;
    }
    
    if (con == 6)
    {
        dashxstart = x;
        
        if (side == 0)
            dashxend = x + 20;
        else
            dashxend = x - 20;
        
        snd_play(snd_arrow);
        audio_play_sound(snd_spearrise, 80, false, 0.7);
        con = 7;
        alarm[4] = 5 - therate;
        
        if (therate >= 2 || obj_doghole_abberant.gamermode == 1)
            alarm[4] = 3;
    }
    
    if (con == 7 || con == 8)
    {
        if (side == 0)
            dashxend = lerp(dashxend, rightx, 0.4);
        else
            dashxend = lerp(dashxend, leftx + abs(sprite_width), 0.4);
        
        if (con >= 8)
        {
            dashxstart = lerp(dashxstart, dashxend, 0.4);
            x = dashxend;
            
            if (abs(dashxstart - dashxend) < 0.2)
            {
                x = round(dashxend);
                dashxstart = 0;
                dashxend = 0;
                con = 10;
            }
        }
        
        if (side == 0 && dashxstart >= ((global.idealborder[0] + global.idealborder[1]) * 0.6))
        {
            flashamt -= 0.1;
            
            if (flashamt <= 0)
                flashamt = 0;
        }
        
        if (side == 1 && dashxstart <= ((global.idealborder[0] + global.idealborder[1]) * 0.4))
        {
            flashamt -= 0.1;
            
            if (flashamt <= 0)
                flashamt = 0;
        }
        
        var currcolor = colors[colorind];
        var _yt = y - 220;
        var _yb = y + 10;
        var swordoffx = 0;
        var swordoffy = -220;
        var _w = 60;
        var _off = 20;
        
        if (side == 0)
            swordoffx += (abs(sprite_width) - _off);
        else
            swordoffx -= ((abs(sprite_width) + _w) - _off);
        
        var prev_sprite_index = sprite_index;
        var prev_image_xscale = image_xscale;
        var prev_image_yscale = image_yscale;
        sprite_index = spr_doghole_dogsword;
        image_xscale = 2;
        image_yscale = 2;
        
        if (side == 0)
        {
            for (var _x = dashxstart; _x <= dashxend; _x += 8)
            {
                if (place_meeting(_x + swordoffx, y + swordoffy, obj_heart))
                {
                    if (obj_heart.x != obj_heart.xprevious || obj_heart.y != obj_heart.yprevious)
                    {
                        if (currcolor == 1)
                            scr_damagestandard(0, 3, 0, 0, 0);
                    }
                    else if (currcolor == 0)
                    {
                        scr_damagestandard(0, 3, 0, 0, 0);
                    }
                }
            }
        }
        else
        {
            for (var _x = dashxstart; _x >= dashxend; _x -= 8)
            {
                if (place_meeting(_x + swordoffx, y + swordoffy, obj_heart))
                {
                    if (obj_heart.x != obj_heart.xprevious || obj_heart.y != obj_heart.yprevious)
                    {
                        if (currcolor == 1)
                            scr_damagestandard(0, 3, 0, 0, 0);
                    }
                    else if (currcolor == 0)
                    {
                        scr_damagestandard(0, 3, 0, 0, 0);
                    }
                }
            }
        }
        
        sprite_index = prev_sprite_index;
        image_xscale = prev_image_xscale;
        image_yscale = prev_image_yscale;
    }
    
    if (con == 10)
    {
        flashamt -= 0.1;
        
        if (flashamt <= 0)
        {
            flashamt = 0;
            side = 1 - side;
            x += sprite_width;
            idealx = x;
            image_xscale *= -1;
            therate += 1;
            con = 1;
            alarm[4] = 2;
            
            if (global.turntimer < 40)
            {
                with (obj_doghole_abberant)
                {
                    if (gamermode == 2)
                        gamermode = 1;
                }
                
                alarm[4] = -1;
            }
        }
    }
};
