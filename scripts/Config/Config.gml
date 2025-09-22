function config_load_controls()
{
    ini_open("config.ini");
    
    for (var i = 0; i < 10; i++)
    {
        var readval = ini_read_real("Keyboard", string(i), -1);
        
        if (readval != -1)
            global.input_k[i] = readval;
    }
    
    global.touch_side_offset = ini_read_real("Touch", "side_offset", global.touch_side_offset);
    global.touch_scale = ini_read_real("Touch", "scale", global.touch_scale);
    global.touch_configured = ini_read_real("Touch", "configured", global.touch_configured);
    config_load_controls_gamepad(false);
    ini_close();
    update_touch_regions();
}

function config_load_controls_gamepad(arg0 = true)
{
    if (arg0)
        ini_open("config.ini");
    
    for (var i = 0; i < 10; i++)
    {
        var readval = ini_read_real("Gamepad", string(i), -1);
        
        if (readval != -1)
            global.input_g[i] = readval;
    }
    
    global.gamepad_shoulderlb_reassign = ini_read_real("Gamepad", "shoulderlb_reassign", global.gamepad_shoulderlb_reassign);
    
    if (arg0)
        ini_close();
}

function config_save_controls()
{
    ini_open("config.ini");
    
    for (var i = 0; i < 10; i++)
        ini_write_real("Keyboard", string(i), global.input_k[i]);
    
    for (var i = 0; i < 10; i++)
        ini_write_real("Gamepad", string(i), global.input_g[i]);
    
    ini_write_real("Gamepad", "shoulderlb_reassign", global.gamepad_shoulderlb_reassign);
    ini_write_real("Touch", "side_offset", global.touch_side_offset);
    ini_write_real("Touch", "scale", global.touch_scale);
    ini_write_real("Touch", "configured", global.touch_configured);
    ini_close();
}
