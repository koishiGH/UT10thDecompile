image_xscale = 2;
image_yscale = 2;
flashamt = 0;
dashxstart = 0;
dashxend = 0;
con = 0;
dmg = 8;
y = obj_heart.y - 80;
side = 0;

if (x > global.idealborder[0])
    side = 1;

leftx = global.idealborder[0] - 60;
rightx = global.idealborder[1] + 20;
hairDistance = 17;
hairAccumulator = 0;
hairGapNormalizedSize = 0.15;
hairGapPos = lerp(global.idealborder[0], global.idealborder[1], random_range(hairGapNormalizedSize, 1 - hairGapNormalizedSize));
hairGapSize = hairGapNormalizedSize * (global.idealborder[1] - global.idealborder[0]);
hairIteration = 0;
hairRandomness = array_shuffle([hairGapNormalizedSize + random(0.1), 1 - hairGapNormalizedSize - random(0.1), 0.5]);
hairActive = false;

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
        alarm[4] = 45;
        
        if (!instance_exists(obj_doghole_mrsunshine))
            alarm[4] = 20;
        
        con = 1;
    }
    
    if (con == 1)
    {
        x = lerp(x, idealx, 0.3);
        y = lerp(y, obj_heart.y - 18, 0.2);
    }
    
    if (con == 2)
    {
        xstart = x;
        ystart = y;
        snd_play(snd_boost);
        con = 3;
    }
    
    if (con == 3)
    {
        flashamt += 0.1;
        
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
        alarm[4] = 10;
        
        if (!instance_exists(obj_doghole_mrsunshine))
            alarm[4] = 4;
        
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
        alarm[4] = 5;
    }
    
    if (con == 7 || con == 8)
    {
        var lastxend = dashxend;
        
        if (side == 0)
            dashxend = lerp(dashxend, rightx, 0.4);
        else
            dashxend = lerp(dashxend, leftx + abs(sprite_width), 0.4);
        
        if (hairActive)
            hairAccumulator += abs(lastxend - dashxend);
        
        var times = hairAccumulator / hairDistance;
        var i = 0;
        
        while (hairAccumulator >= hairDistance)
        {
            var hairX = lerp(lastxend, dashxend, i / times);
            var hairY = y + 30;
            
            with (obj_doghole_dogknight_hairclump)
            {
                if (hairIteration == other.hairIteration)
                    continue;
                
                if (point_distance(hairX, hairY, x, y) <= 15)
                    instance_destroy();
            }
            
            var distanceToGapCenter = abs(hairX - hairGapPos);
            
            if (distanceToGapCenter > hairGapSize && hairX > (global.idealborder[0] + 4) && hairX < (global.idealborder[1] - 4))
            {
                hairX = clamp(hairX, global.idealborder[0] + 16, global.idealborder[1] - 16);
                
                with (instance_create(hairX, hairY, obj_doghole_dogknight_hairclump))
                {
                    hairIteration = other.hairIteration;
                    
                    if (distanceToGapCenter < (other.hairGapSize * 1.8))
                    {
                        var angleToCenter = (other.hairGapPos < x) ? 180 : 0;
                        
                        if (abs(angle_difference(angleToCenter, direction)) < 90)
                            direction += 180;
                    }
                    
                    if (point_distance(x, y, obj_heart.x + 8, obj_heart.y + 8) < 60 && abs(angle_difference(point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8), direction)) < 40)
                        direction += 180;
                }
            }
            
            i++;
            hairAccumulator -= hairDistance;
        }
        
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
        
        if (side == 0)
        {
            for (var _x = dashxstart; _x <= dashxend; _x += 8)
            {
                if (place_meeting(_x, y, obj_heart))
                    scr_damagestandard(0, 3, 0, 0, 0);
            }
        }
        else
        {
            for (var _x = dashxstart; _x >= dashxend; _x -= 8)
            {
                if (place_meeting(_x, y, obj_heart))
                    scr_damagestandard(0, 3, 0, 0, 0);
            }
        }
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
            con = 1;
            var normalizedPos;
            
            if (hairIteration < array_length(hairRandomness))
                normalizedPos = hairRandomness[hairIteration];
            else
                normalizedPos = random_range(hairGapNormalizedSize, 1 - hairGapNormalizedSize);
            
            hairGapPos = lerp(global.idealborder[0], global.idealborder[1], normalizedPos);
            hairAccumulator = 0;
            hairIteration++;
            alarm[4] = 15;
            
            if (!instance_exists(obj_doghole_mrsunshine))
                alarm[4] = 10;
            
            if (global.turntimer < 60)
                alarm[4] = -1;
        }
    }
};
