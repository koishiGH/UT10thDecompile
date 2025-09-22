SCR_GAMESTART();
time = 0;
image_speed = 0;
var jjjjjj = 0;

repeat (20)
{
    global.tempvalue[jjjjjj] = 0;
    jjjjjj += 1;
}

if (os_type != os_gxgames)
{
    var dh = display_get_height();
    var dw = display_get_width();
    var resultScale = 1;
    
    for (var attemptScale = 2; attemptScale < 6; attemptScale += 1)
    {
        if (dw > (640 * attemptScale) && dh > (480 * attemptScale))
            resultScale = attemptScale;
    }
    
    if (resultScale > 1)
    {
        window_set_size(640 * resultScale, 480 * resultScale);
        alarm[0] = 1;
    }
}

__room_goto(room_activate);
