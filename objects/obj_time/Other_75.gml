switch (ds_map_find_value(async_load, "event_type"))
{
    case "gamepad discovered":
        var pad = ds_map_find_value(async_load, "pad_index");
        
        if (gamepad_is_connected(pad))
        {
            global.gamepad_id = pad;
            global.gamepad_active = true;
            var gamepad_description = gamepad_get_description(global.gamepad_id);
            
            if (global.gamepad_type != gamepad_description)
            {
                global.gamepad_type = gamepad_description;
                scr_controls_default_gamepad();
                config_load_controls_gamepad();
            }
        }
        
        break;
    
    case "gamepad lost":
        if (ds_map_find_value(async_load, "pad_index") != global.gamepad_id)
            break;
        
        global.gamepad_id = -1;
        global.gamepad_active = false;
        global.gamepad_type = undefined;
        break;
    
    case "post_message_received":
        var origin = ds_map_find_value(async_load, "origin");
        var data = ds_map_find_value(async_load, "data");
        
        if (!is_string(data) || data == "")
            break;
        
        if (data == "disable_manual_orientation_flip")
            array_push(queued_methods, disable_manual_orientation_flip);
        else if (data == "enable_manual_orientation_flip")
            array_push(queued_methods, enable_manual_orientation_flip);
        else if (data == "disable_fill_browser_size")
            array_push(queued_methods, disable_fill_browser_size);
        else if (data == "enable_fill_browser_size")
            array_push(queued_methods, enable_fill_browser_size);
        
        if (!string_starts_with(data, "{"))
            break;
        
        try
        {
            var decodedData = json_parse(data);
            
            if (!is_struct(decodedData))
                break;
            
            var gamepadIsPlaystation = struct_get_from_hash(decodedData, variable_get_hash("gamepadIsPlaystation"));
            var gamepadIsDualsense = struct_get_from_hash(decodedData, variable_get_hash("gamepadIsDualsense"));
            
            if (is_undefined(gamepadIsPlaystation) || is_undefined(gamepadIsDualsense) || !is_bool(gamepadIsPlaystation) || !is_bool(gamepadIsDualsense))
                break;
            
            global.gamepad_hint_playstation = gamepadIsPlaystation;
            global.gamepad_hint_dualsense = gamepadIsDualsense;
        }
        catch (e)
        {
           // show_debug_message(@@string@@("Failed to parse JSON data: {0}", e));
        }
        break;
}
