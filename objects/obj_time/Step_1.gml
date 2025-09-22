var i = 0;
var n = array_length(queued_methods);

while (i < n)
{
    queued_methods[i]();
    i++;
}

array_resize(queued_methods, 0);
i = 0;
n = gamepad_get_device_count();

while (i < n)
{
    if (!gamepad_is_connected(i))
    {
    }
    else if (i == global.gamepad_id)
    {
    }
    else
    {
        var activityDetected = abs(gamepad_axis_value(i, gp_axislh)) >= 0.4 || abs(gamepad_axis_value(i, gp_axislv)) >= 0.4;
        var j = 0;
        var n2 = array_length(global.gamepad_controls);
        
        while (j < n2)
        {
            activityDetected |= gamepad_button_check(i, global.gamepad_controls[j]);
            j++;
        }
        
        if (activityDetected)
        {
            global.gamepad_id = i;
            global.gamepad_active = true;
            var gamepad_description = gamepad_get_description(global.gamepad_id);
            
            if (global.gamepad_type != gamepad_description)
            {
                global.gamepad_type = gamepad_description;
                scr_controls_default_gamepad();
                config_load_controls_gamepad();
            }
            
            break;
        }
    }
    
    i++;
}

control_update();

if (!paused)
    time += 1;

up = control_check(3);
down = control_check(4);
left = control_check(5);
right = control_check(6);

if (!global.touch_controls && keyboard_check_pressed(vk_f4))
{
    if (window_get_fullscreen())
        window_set_fullscreen(false);
    else
        window_set_fullscreen(true);
}
