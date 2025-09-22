if (phase == 0)
{
    if (alpha < 1)
        alpha += 0.1;
    
    if (alpha >= 1)
        phase = 1;
}
else if (phase == 1)
{
    txtalpha += 0.1;
    
    if (txtalpha == 1)
        phase = 2;
}
else if (phase == 2)
{
    if (buffer > 0)
        buffer--;
    
    if (control_check_pressed(3) && battlesel != 3)
    {
        snd_play(snd_squeak);
        buffer = 2;
        battlesel = 3;
    }
    else if (control_check_pressed(4) && battlesel != 2)
    {
        snd_play(snd_squeak);
        buffer = 2;
        battlesel = 2;
    }
    else if (control_check_pressed(5) && battlesel != 0)
    {
        snd_play(snd_squeak);
        buffer = 2;
        battlesel = 0;
    }
    else if (control_check_pressed(6) && battlesel != 1)
    {
        snd_play(snd_squeak);
        buffer = 2;
        battlesel = 1;
    }
    
    if (control_check_pressed(0) && buffer <= 0 && battlesel != -1)
    {
        snd_play(snd_select);
        
        if (battlesel < 2)
        {
            snd_play(snd_b);
            heart.visible = true;
            
            if (battlesel == 0)
                global.battlegroup = 201;
            else
                global.battlegroup = 95;
            
            blcon = scr_marker(heart.x - 10, heart.y - 22, spr_exc);
            blcon.depth = -10;
            blcon.image_xscale = 2;
            blcon.image_yscale = 2;
            phase = 3;
        }
        else if (battlesel == 2)
        {
            creditsSiner = 0;
            creditsSinerSpeed = -0.025;
            phase = 4;
        }
        else if (battlesel == 3)
        {
            phase = 5;
            
            if (global.touch_controls && !global.touch_controls_hidden)
                instance_create(0, 0, obj_touchcontrolsmenu);
            else
                instance_create(0, 0, obj_controlsmenu);
        }
    }
}
else if (phase == 3)
{
    txtalpha -= 0.2;
    image_alpha -= 0.2;
    phasetimer += 1;
    
    if (phasetimer == 20)
    {
        blcon.visible = false;
        snd_play(snd_battlefall);
        
        with (heart)
        {
            var spdr = point_distance(x, y, 40, 446) / 20;
            move_towards_point(40, 446, spdr);
        }
        
        heart.depth = -1000;
        var f = instance_create(0, 0, obj_unfader);
        f.depth = -900;
    }
    
    if (phasetimer == 40)
    {
        global.currentroom = room_gameover;
        global.gameover_mode = 1;
        __room_goto(room_battle);
        exit;
    }
}
else if (phase == 4)
{
    if (creditsSinerSpeed < creditsSinerSpeedMax)
    {
        creditsSinerSpeed += 0.00025;
        
        if (creditsSinerSpeed >= creditsSinerSpeedMax)
            creditsSinerSpeed = creditsSinerSpeedMax;
    }
    
    if (creditsSinerSpeed > 0)
    {
        creditsSiner += creditsSinerSpeed;
        
        if (creditsSiner >= (2 * pi))
            creditsSiner -= (2 * pi);
    }
    
    if (control_check_pressed(0))
    {
        snd_play(snd_select);
        phase = 2;
    }
}
