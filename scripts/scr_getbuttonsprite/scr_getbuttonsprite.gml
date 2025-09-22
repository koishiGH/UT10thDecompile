function scr_getbuttonsprite(arg0, arg1 = false)
{
    if (arg1)
        return noone;
    
    var is_dualshock = control_gamepad_is_ps();
    var is_dualsense = control_gamepad_is_dualsense();
    var button_sprite = button_questionmark;
    var button = arg0;
    
    if (arg0 == 32783)
    {
        button_sprite = button_xbox_left;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_left;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_left;
        
        return button_sprite;
    }
    
    if (arg0 == 32784)
    {
        button_sprite = button_xbox_right;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_right;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_right;
        
        return button_sprite;
    }
    
    if (arg0 == 32781)
    {
        button_sprite = button_xbox_up;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_up;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_up;
        
        return button_sprite;
    }
    
    if (arg0 == 32782)
    {
        button_sprite = button_xbox_down;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_down;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_down;
        
        return button_sprite;
    }
    
    if (button == gp_face1)
    {
        button_sprite = button_xbox_a;
        
        if (is_dualshock)
            button_sprite = button_ps4_cross_0;
        else if (is_dualsense)
            button_sprite = button_ps5_cross_0;
        
        return button_sprite;
    }
    
    if (button == gp_face2)
    {
        button_sprite = button_xbox_b;
        
        if (is_dualshock)
            button_sprite = button_ps4_circle_0;
        else if (is_dualsense)
            button_sprite = button_ps5_circle_0;
        
        return button_sprite;
    }
    
    if (button == gp_face3)
    {
        button_sprite = button_xbox_x;
        
        if (is_dualshock)
            button_sprite = button_ps4_square_0;
        else if (is_dualsense)
            button_sprite = button_ps5_square_0;
        
        return button_sprite;
    }
    
    if (button == gp_face4)
    {
        button_sprite = button_xbox_y;
        
        if (is_dualshock)
            button_sprite = button_ps4_triangle_0;
        else if (is_dualsense)
            button_sprite = button_ps5_triangle_0;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderl)
    {
        button_sprite = button_xbox_left_bumper;
        
        if (is_dualshock)
            button_sprite = button_ps4_l1;
        else if (is_dualsense)
            button_sprite = button_ps5_l1;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderlb)
    {
        button_sprite = button_xbox_left_trigger;
        
        if (is_dualshock)
            button_sprite = button_ps4_l2;
        else if (is_dualsense)
            button_sprite = button_ps5_l2;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderr)
    {
        button_sprite = button_xbox_right_bumper;
        
        if (is_dualshock)
            button_sprite = button_ps4_r1;
        else if (is_dualsense)
            button_sprite = button_ps5_r1;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderrb)
    {
        button_sprite = button_xbox_right_trigger;
        
        if (is_dualshock)
            button_sprite = button_ps4_r2;
        else if (is_dualsense)
            button_sprite = button_ps5_r2;
        
        return button_sprite;
    }
    
    if (button == gp_stickl)
    {
        button_sprite = button_xbox_left_stick;
        
        if (is_dualshock)
            button_sprite = button_ps4_l3_0;
        else if (is_dualsense)
            button_sprite = button_ps5_l3;
        
        return button_sprite;
    }
    
    if (button == gp_stickr)
    {
        button_sprite = button_xbox_right_stick;
        
        if (is_dualshock)
            button_sprite = button_ps4_r3_0;
        else if (is_dualsense)
            button_sprite = button_ps5_r3;
        
        return button_sprite;
    }
    
    if (button == gp_select)
    {
        button_sprite = button_xbox_share;
        
        if (is_dualshock)
            button_sprite = button_ps4_touchpad;
        else if (is_dualsense)
            button_sprite = button_ps5_touchpad;
        
        return button_sprite;
    }
    
    if (button == gp_start)
    {
        button_sprite = button_xbox_menu;
        
        if (is_dualshock)
            return button_ps4_options;
        else if (is_dualsense)
            button_sprite = button_ps5_start;
        
        return button_sprite;
    }
    
    if (button == gp_padl)
    {
        button_sprite = button_xbox_left;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_left;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_left;
        
        return button_sprite;
    }
    
    if (button == gp_padr)
    {
        button_sprite = button_xbox_right;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_right;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_right;
        
        return button_sprite;
    }
    
    if (button == gp_padu)
    {
        button_sprite = button_xbox_up;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_up;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_up;
        
        return button_sprite;
    }
    
    if (button == gp_padd)
    {
        button_sprite = button_xbox_down;
        
        if (is_dualshock)
            button_sprite = button_ps4_dpad_down;
        else if (is_dualsense)
            button_sprite = button_ps5_dpad_down;
        
        return button_sprite;
    }
    
    return button_sprite;
}
