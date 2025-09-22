if (audio_system_is_available() || mouse_check_button_pressed(mb_any))
{
    if (global.touch_controls && !global.touch_configured)
        __room_goto(room_touch_configure);
    else
        __room_goto(room_menu);
    
    exit;
}
else
{
    timer++;
    
    if (timer >= 30)
        timer = 0;
}
