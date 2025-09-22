if (resetFlashTimer > 0)
    resetFlashTimer--;

if (buffer > 0)
{
    buffer--;
    exit;
}

if (remapping)
{
    if (keyboard_check_pressed(vk_escape))
    {
        remapping = false;
        buffer = 2;
        exit;
    }
    
    if (remappingTimeout > 0)
    {
        remappingTimeout--;
        
        if (remappingTimeout <= 0)
        {
            remapping = false;
            buffer = 15;
            exit;
        }
    }
    
    var gamepad_accept = -1;
    var new_gamepad_key = -1;
    var key_accept = -1;
    var new_key = -1;
    var do_remap = false;
    
    if (keyboard_check_pressed(vk_anykey))
    {
        for (var i = 48; i <= 90; i += 1)
        {
            if (keyboard_check_pressed(i))
            {
                new_key = i;
                do_remap = true;
            }
        }
        
        if (keyboard_check_pressed(59))
        {
            new_key = 59;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_printscreen))
        {
            new_key = 44;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_delete))
        {
            new_key = 46;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(47))
        {
            new_key = 47;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(92))
        {
            new_key = 92;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(93))
        {
            new_key = 93;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(91))
        {
            new_key = 91;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_numpad0))
        {
            new_key = 96;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_insert))
        {
            new_key = 45;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(61))
        {
            new_key = 61;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_left))
        {
            new_key = 37;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_right))
        {
            new_key = 39;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_up))
        {
            new_key = 38;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_down))
        {
            new_key = 40;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_backspace))
        {
            new_key = 8;
            do_remap = true;
        }
        
        if (keyboard_check_pressed(vk_alt))
        {
            new_key = 18;
            do_remap = true;
        }
        
        if (os_type == os_windows)
        {
            if (string(keyboard_key) == "91" || string(keyboard_key) == "92")
            {
                new_key = -1;
                do_remap = false;
            }
        }
        
        if (keyboard_check_pressed(vk_enter))
        {
            new_key = -1;
            do_remap = false;
        }
        
        if (keyboard_check_pressed(vk_shift))
        {
            new_key = -1;
            do_remap = false;
        }
        
        if (keyboard_check_pressed(vk_control))
        {
            new_key = -1;
            do_remap = false;
        }
        
        if (keyboard_check_pressed(vk_escape))
        {
            new_key = -1;
            do_remap = false;
        }
    }
    
    if (global.gamepad_active)
    {
        for (var i = 0; i < array_length(global.gamepad_controls); i++)
        {
            if (gamepad_button_check_pressed(global.gamepad_id, global.gamepad_controls[i]))
            {
                new_gamepad_key = global.gamepad_controls[i];
                do_remap = true;
            }
        }
    }
    
    if (do_remap)
    {
        if (new_key != -1)
        {
            var dupe = -1;
            
            for (var i = 0; i < 6; i++)
            {
                if (global.input_k[i] == new_key)
                    dupe = i;
            }
            
            if (dupe >= 0)
                global.input_k[dupe] = global.input_k[sel];
            
            global.input_k[sel] = new_key;
            var entercancel = -1;
            var shiftcancel = -1;
            var ctrlcancel = -1;
            
            for (var i = 0; i < 6; i++)
            {
                if (global.input_k[i] == 13)
                {
                    global.input_k[7] = -1;
                    entercancel = 1;
                }
                
                if (global.input_k[i] == 16)
                {
                    global.input_k[8] = -1;
                    shiftcancel = 1;
                }
                
                if (global.input_k[i] == 17)
                {
                    global.input_k[9] = -1;
                    ctrlcancel = 1;
                }
            }
            
            if (entercancel == -1)
                global.input_k[7] = 13;
            
            if (shiftcancel == -1)
                global.input_k[8] = 16;
            
            if (ctrlcancel == -1)
                global.input_k[9] = 17;
        }
        else
        {
            var dupe = -1;
            
            if (new_gamepad_key == 32775)
                global.gamepad_shoulderlb_reassign = true;
            
            for (var i = 0; i < 6; i++)
            {
                if (global.input_g[i] == new_gamepad_key)
                    dupe = i;
            }
            
            if (dupe >= 0)
                global.input_g[dupe] = global.input_g[sel];
            
            global.input_g[sel] = new_gamepad_key;
            var any_shoulderlb = false;
            
            for (var i = 0; i < 6; i++)
            {
                if (global.input_g[sel] == 32775)
                {
                    any_shoulderlb = true;
                    break;
                }
            }
            
            if (!any_shoulderlb)
                global.gamepad_shoulderlb_reassign = false;
        }
        
        remapping = false;
        buffer = 2;
    }
    
    exit;
}

if (control_check_pressed(3))
{
    if (sel > 0)
    {
        sel--;
        snd_play(snd_squeak);
    }
}
else if (control_check_pressed(4))
{
    if (sel < 7)
    {
        sel++;
        snd_play(snd_squeak);
    }
}

if (control_check_pressed(0))
{
    buffer = 2;
    
    if (sel < 6)
    {
        remapping = true;
        remappingTimeout = 240;
    }
    else if (sel == 6)
    {
        snd_play(snd_levelup);
        scr_controls_default();
        resetFlashTimer = 10;
        buffer = 10;
    }
    else
    {
        snd_play(snd_select);
        config_save_controls();
        
        with (obj_browsermenu)
            phase = 2;
        
        instance_destroy();
    }
}
