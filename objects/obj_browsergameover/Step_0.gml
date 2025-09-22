if (phase == 2)
    exit;

if (phase == 0)
{
    if (alpha < 1)
        alpha += 0.1;
    
    if (alpha >= 1)
        phase = 1;
}
else if (phase == 1)
{
    if (mode == 1)
    {
        if (control_check_pressed(3) || control_check_pressed(4) || control_check_pressed(5) || control_check_pressed(6))
        {
            snd_play(snd_squeak);
            sel = 1 - sel;
        }
    }
    
    if (control_check_pressed(0))
    {
        snd_play(snd_select);
        global.border = 0;
        global.invc = 0;
        global.lv = 1;
        global.xp = 0;
        global.maxhp = 20;
        global.at = 60;
        global.df = 9 + ceil(global.lv / 4);
        global.hp = global.maxhp;
        global.myxb = undefined;
        global.myyb = undefined;
        
        if (mode == 0 || sel == 1)
        {
            global.flag[472] = 5;
            var menu = instance_create(0, 0, obj_browsermenu);
            menu.image_alpha = 0;
            instance_destroy();
        }
        else
        {
            global.gameover_mode = 1;
            __room_goto(room_battle);
            exit;
        }
    }
}
