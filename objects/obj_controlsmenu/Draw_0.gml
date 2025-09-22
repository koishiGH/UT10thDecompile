draw_set_color(c_white);
draw_set_alpha(1);
scr_setfont(fnt_main);
draw_set_halign(fa_center);
draw_text(320, 24, "CONTROLS");
draw_set_halign(fa_left);
var _x = 80;
draw_text(_x, 80, "Function");

for (var i = 0; i < 6; i++)
{
    if (sel == i)
    {
        draw_sprite(spr_heart, 0, _x - 32, 140 + (i * 36));
        draw_set_color(remapping ? c_red : c_yellow);
    }
    else
    {
        draw_set_color(c_white);
    }
    
    draw_text(_x, 130 + (i * 36), functionNames[i]);
}

if (sel == 6)
{
    draw_set_color(c_yellow);
    draw_sprite(spr_heart, 0, _x - 32, 378);
}
else
{
    draw_set_color(c_white);
}

if (resetFlashTimer > 0)
    draw_set_color(merge_color(c_yellow, c_aqua, (resetFlashTimer / 10) - 0.1));

draw_text(_x, 368, "Reset to default");

if (sel == 7)
{
    draw_set_color(c_yellow);
    draw_sprite(spr_heart, 0, _x - 32, 410);
}
else
{
    draw_set_color(c_white);
}

draw_text(_x, 400, "Finish");
_x = 260;
draw_set_color(c_white);
draw_text(_x, 80, "Key");

for (var i = 0; i < 6; i++)
{
    if (sel == i)
        draw_set_color(remapping ? c_red : c_yellow);
    else
        draw_set_color(c_white);
    
    var input = global.input_k[i];
    var str = "(?)";
    
    if (input >= 0 && input < array_length(global.asc_def))
        str = global.asc_def[input];
    
    draw_text(_x, 130 + (i * 36), str);
}

_x = 440;
draw_set_color(c_white);
draw_text(_x, 80, "Gamepad");

if (!global.gamepad_active || !gamepad_is_connected(global.gamepad_id))
{
    draw_set_color(c_gray);
    draw_text(_x, 130, "(None\nconnected.)");
}
else
{
    for (var i = 0; i < 6; i++)
    {
        var input = global.input_g[i];
        var spr = scr_getbuttonsprite(input);
        
        if (spr == -4 || !is_handle(spr))
            spr = button_questionmark;
        
        var xoff = 0;
        
        if (spr == button_ps4_dpad_up || spr == button_ps4_dpad_down || spr == button_ps4_dpad_left || spr == button_ps4_dpad_right)
            xoff = -2;
        else if (spr == button_ps4_options)
            xoff = -5;
        else if (sprite_get_width(spr) < 12)
            xoff = 2;
        
        draw_sprite_ext(spr, 0, _x + xoff + 8, 134 + (i * 36), 2, 2, 0, c_white, 1);
    }
}
