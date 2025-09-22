global.gamepad_controls = [32769, 32770, 32771, 32772, 32773, 32775, 32774, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784];

function scr_controls_default()
{
    global.input_k[0] = 40;
    global.input_k[1] = 39;
    global.input_k[2] = 38;
    global.input_k[3] = 37;
    global.input_k[4] = 90;
    global.input_k[5] = 88;
    global.input_k[6] = 67;
    global.input_k[7] = 13;
    global.input_k[8] = 16;
    global.input_k[9] = 17;
    scr_controls_default_gamepad();
}

function scr_controls_default_gamepad()
{
    global.input_g[0] = 32782;
    global.input_g[1] = 32784;
    global.input_g[2] = 32781;
    global.input_g[3] = 32783;
    global.input_g[4] = 32769;
    global.input_g[5] = 32770;
    global.input_g[6] = 32772;
    global.input_g[7] = -1;
    global.input_g[8] = -1;
    global.input_g[9] = -1;
    global.gamepad_shoulderlb_reassign = false;
    global.gamepad_axis_deadzone = 0.4;
}

function control_init()
{
    scr_controls_default();
    global.control_state = array_create(7, false);
    global.control_pressed = array_create(7, false);
    global.control_new_state = array_create(7, false);
    global.gamepad_id = -1;
    global.gamepad_active = false;
    global.gamepad_type = undefined;
    global.gamepad_hint_playstation = undefined;
    global.gamepad_hint_dualsense = undefined;
    touch_controls_init();
}

function control_update()
{
    touch_controls_update();
    var gp = global.gamepad_active && global.gamepad_id >= 0 && gamepad_is_connected(global.gamepad_id);
    var new_state = keyboard_check(global.input_k[4]) || keyboard_check(global.input_k[7]);
    
    if (gp)
    {
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[4]);
        
        if (!global.gamepad_shoulderlb_reassign)
            new_state |= gamepad_button_check(global.gamepad_id, gp_shoulderlb);
    }
    
    if (keyboard_check_pressed(global.input_k[4]) || keyboard_check_pressed(global.input_k[7]))
    {
        touch_controls_hint_hide();
        global.control_state[0] = false;
        new_state = true;
    }
    else if (gp && (gamepad_button_check_pressed(global.gamepad_id, global.input_g[4]) || (!global.gamepad_shoulderlb_reassign && gamepad_button_check_pressed(global.gamepad_id, gp_shoulderlb))))
    {
        touch_controls_hint_hide();
        global.control_state[0] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(0, new_state);
    global.control_new_state[0] = new_state;
    new_state = keyboard_check(global.input_k[5]) || keyboard_check(global.input_k[8]);
    
    if (gp)
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[5]);
    
    if (keyboard_check_pressed(global.input_k[5]) || keyboard_check_pressed(global.input_k[8]))
    {
        touch_controls_hint_hide();
        global.control_state[1] = false;
        new_state = true;
    }
    else if (gp && gamepad_button_check_pressed(global.gamepad_id, global.input_g[5]))
    {
        touch_controls_hint_hide();
        global.control_state[1] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(1, new_state);
    global.control_new_state[1] = new_state;
    new_state = keyboard_check(global.input_k[2]);
    
    if (gp)
    {
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[2]);
        new_state |= (gamepad_axis_value(global.gamepad_id, gp_axislv) <= -global.gamepad_axis_deadzone);
    }
    
    if (keyboard_check_pressed(global.input_k[2]))
    {
        touch_controls_hint_hide();
        global.control_state[3] = false;
        new_state = true;
    }
    else if (gp && gamepad_button_check_pressed(global.gamepad_id, global.input_g[2]))
    {
        touch_controls_hint_hide();
        global.control_state[3] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(3, new_state);
    global.control_new_state[3] = new_state;
    new_state = keyboard_check(global.input_k[0]);
    
    if (gp)
    {
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[0]);
        new_state |= (gamepad_axis_value(global.gamepad_id, gp_axislv) >= global.gamepad_axis_deadzone);
    }
    
    if (keyboard_check_pressed(global.input_k[0]))
    {
        touch_controls_hint_hide();
        global.control_state[4] = false;
        new_state = true;
    }
    else if (gp && gamepad_button_check_pressed(global.gamepad_id, global.input_g[0]))
    {
        touch_controls_hint_hide();
        global.control_state[4] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(4, new_state);
    global.control_new_state[4] = new_state;
    new_state = keyboard_check(global.input_k[3]);
    
    if (gp)
    {
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[3]);
        new_state |= (gamepad_axis_value(global.gamepad_id, gp_axislh) <= -global.gamepad_axis_deadzone);
    }
    
    if (keyboard_check_pressed(global.input_k[3]))
    {
        touch_controls_hint_hide();
        global.control_state[5] = false;
        new_state = true;
    }
    else if (gp && gamepad_button_check_pressed(global.gamepad_id, global.input_g[3]))
    {
        touch_controls_hint_hide();
        global.control_state[5] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(5, new_state);
    global.control_new_state[5] = new_state;
    new_state = keyboard_check(global.input_k[1]);
    
    if (gp)
    {
        new_state |= gamepad_button_check(global.gamepad_id, global.input_g[1]);
        new_state |= (gamepad_axis_value(global.gamepad_id, gp_axislh) >= global.gamepad_axis_deadzone);
    }
    
    if (keyboard_check_pressed(global.input_k[1]))
    {
        touch_controls_hint_hide();
        global.control_state[6] = false;
        new_state = true;
    }
    else if (gp && gamepad_button_check_pressed(global.gamepad_id, global.input_g[1]))
    {
        touch_controls_hint_hide();
        global.control_state[6] = false;
        new_state = true;
    }
    
    new_state = touch_controls_update_control(6, new_state);
    global.control_new_state[6] = new_state;
    
    for (var i = 0; i < 7; i++)
    {
        global.control_pressed[i] = !global.control_state[i] && global.control_new_state[i];
        global.control_state[i] = global.control_new_state[i];
    }
}

function control_check(arg0)
{
    return global.control_state[arg0];
}

function control_check_pressed(arg0)
{
    return global.control_pressed[arg0];
}

function control_clear(arg0)
{
    global.control_pressed[arg0] = false;
}

function control_gamepad_is_ps()
{
    static dualshock_list = ["playstation", "dualshock", "ps1", "ps2", "ps3", "ps4"];
    
    var lower_gamepad_type = string_lower(global.gamepad_type ?? "");
    var is_ps = global.gamepad_hint_playstation ?? false;
    var i = 0;
    var n = array_length(dualshock_list);
    
    while (i < n)
    {
        if (string_pos(dualshock_list[i], lower_gamepad_type) > 0)
        {
            is_ps = true;
            break;
        }
        
        i++;
    }
    
    return is_ps;
}

function control_gamepad_is_dualsense()
{
    static dualsense_list = ["ps5", "dualsense"];
    
    var lower_gamepad_type = string_lower(global.gamepad_type ?? "");
    var is_dualsense = global.gamepad_hint_dualsense ?? false;
    var i = 0;
    var n = array_length(dualsense_list);
    
    while (i < n)
    {
        if (string_pos(dualsense_list[i], lower_gamepad_type) > 0)
        {
            is_dualsense = true;
            break;
        }
        
        i++;
    }
    
    return is_dualsense;
}
