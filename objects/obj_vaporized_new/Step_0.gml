if (start)
{
    var surf = surface_create(512, 512);
    
    if (!surface_exists(surf))
    {
        failsafe = true;
        start = false;
        buffer = global.reusable_surface_buffer;
    }
    else
    {
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
        draw_sprite_ext(sprite_index, image_index, spriteScale * sprite_get_xoffset(sprite_index), spriteScale * sprite_get_yoffset(sprite_index), spriteScale, spriteScale, 0, c_white, 1);
        surface_reset_target();
        var colorBuffer = global.reusable_surface_buffer;
        buffer_get_surface(colorBuffer, surf, 0);
        surface_free(surf);
        start = false;
        buffer = colorBuffer;
    }
    
    spriteWidth = floor(sprite_get_width(sprite_index) * spriteScale);
    spriteHeight = floor(sprite_get_height(sprite_index) * spriteScale);
}

if (buffer == undefined)
    exit;

if (finishedReading)
    exit;

repeat (4)
{
    if (!failsafe)
    {
        var colorBuffer = buffer;
        var _x = 0;
        var lastX = 0;
        var ww = 0;
        var w = spriteWidth;
        var wide = wd > 120 && !spec;
        buffer_seek(colorBuffer, buffer_seek_start, 2048 * line);
        
        do
        {
            var c = buffer_read(colorBuffer, buffer_u32);
            
            if (c >> 24 && c & 255)
            {
                ww += ((_x - lastX) * 2);
                lastX = _x;
                _x++;
                
                while (_x < w)
                {
                    c = buffer_read(colorBuffer, buffer_u32);
                    
                    if (c >> 24 && c & 255)
                    {
                        _x++;
                        continue;
                    }
                    
                    _x++;
                    break;
                }
                
                var fillAmount = _x - lastX - 1;
                
                if (wide)
                {
                    var blk = instance_create(x + ww, y + (line * 2), obj_whtpxlgrav);
                    blk.image_xscale = fillAmount;
                    ww += (fillAmount * 2);
                }
                else
                {
                    for (var i = 0; i < fillAmount; i++)
                    {
                        instance_create(x + ww, y + (line * 2) + 2, obj_whtpxlgrav);
                        ww += 2;
                    }
                }
                
                lastX = _x - 1;
            }
            else
            {
                _x++;
            }
        }
        until (_x >= w);
    }
    
    line++;
    
    if (line >= spriteHeight)
    {
        finishedReading = true;
        exit;
    }
}
