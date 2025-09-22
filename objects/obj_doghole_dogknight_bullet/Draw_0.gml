if (instance_exists(obj_doghole_dogknight_hairclump))
{
    var prevScissor = gpu_get_scissor();
    gpu_set_scissor(obj_lborder.x, obj_uborder.y, obj_rborder.x - obj_lborder.x, obj_dborder.y - obj_uborder.y);
    
    with (obj_doghole_dogknight_hairclump)
        draw_self();
    
    gpu_set_scissor(prevScissor);
}

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
