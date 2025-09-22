var col;

if (colorind == -1)
    col = 16777215;
else if (colors[colorind] == 0)
    col = 4235519;
else
    col = 16754964;

var _yt = y - 220;
var _yb = y + 10;
var swordoffx = 0;
var swordoffy = -210;
var _w = 64;
var _off = 40;
var swordxscale;

if (side == 0)
{
    swordoffx += ((abs(sprite_width) + _w) - _off);
    swordxscale = -2;
}
else
{
    swordoffx -= ((abs(sprite_width) + _w) - _off);
    swordxscale = 2;
}

if (con >= 8)
    col = merge_color(c_white, col, flashamt);
else if (con < 3)
    col = 16777215;

if (dashxstart != 0)
    draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, 1);

if (flashamt > 0)
{
    gpu_set_fog(true, col, 0, 0);
    
    if (dashxstart != 0)
    {
        var origx = x;
        
        if (side == 0)
        {
            for (var _x = dashxstart; _x <= dashxend; _x += 2)
            {
                x = _x;
                draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, 1);
            }
        }
        else
        {
            for (var _x = dashxstart; _x >= dashxend; _x -= 2)
            {
                x = _x;
                draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, 1);
            }
        }
        
        gpu_set_fog(false, c_black, 0, 0);
        x = dashxend;
        draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, 1);
        gpu_set_fog(true, col, 0, 0);
        draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, flashamt);
        x = origx;
    }
    else
    {
        draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, flashamt);
    }
    
    image_alpha = 1;
    gpu_set_fog(false, c_black, 0, 0);
}

if (dashxstart == 0)
    draw_sprite_ext(spr_doghole_dogsword, 0, x + swordoffx, y + swordoffy, swordxscale, 2, 0, col, 1);

if (dashxstart != 0)
    draw_self();

if (flashamt > 0)
{
    gpu_set_fog(true, c_white, 0, 0);
    
    if (dashxstart != 0)
    {
        var origx = x;
        
        if (side == 0)
        {
            for (var _x = dashxstart; _x <= dashxend; _x += 2)
            {
                x = _x;
                draw_self();
            }
        }
        else
        {
            for (var _x = dashxstart; _x >= dashxend; _x -= 2)
            {
                x = _x;
                draw_self();
            }
        }
        
        gpu_set_fog(false, c_black, 0, 0);
        x = dashxend;
        draw_self();
        gpu_set_fog(true, c_white, 0, 0);
        image_alpha = flashamt;
        draw_self();
        x = origx;
    }
    else
    {
        image_alpha = flashamt;
        draw_self();
    }
    
    image_alpha = 1;
    gpu_set_fog(false, c_black, 0, 0);
}

if (dashxstart == 0)
    draw_self();
