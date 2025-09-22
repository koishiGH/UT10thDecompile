if (keyboard_check_pressed(vk_anykey))
    onOtherInputMethod();

if (global.gamepad_active)
{
    for (var i = 0; i < array_length(global.gamepad_controls); i++)
    {
        if (gamepad_button_check_pressed(global.gamepad_id, global.gamepad_controls[i]))
        {
            onOtherInputMethod();
            break;
        }
    }
}

if (switchToMainControls == 2)
{
    snd_play(snd_levelup);
    
    if (global.__room == room_touch_configure)
    {
        __room_goto(room_menu);
    }
    else
    {
        instance_create(0, 0, obj_controlsmenu);
        instance_destroy();
    }
    
    exit;
}

buttonDone.update();
fadeAlpha += 0.075;

if (fadeAlpha >= 1)
{
    fadeAlpha = 1;
    
    if (doneBuffer > 0)
        doneBuffer--;
    
    if (otherInputMethodBuffer > 0)
        otherInputMethodBuffer--;
    
    if (switchToMainControlsCancelTimer > 0)
        switchToMainControlsCancelTimer--;
    else
        switchToMainControls = 0;
}
