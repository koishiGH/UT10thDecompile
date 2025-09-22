if (alpha <= 0)
    exit;

var _y = floor(y);
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_set_halign(fa_center);
scr_setfont(fnt_main);

if (mode == 0)
{
    switch (global.overmsg)
    {
        case 0:
            draw_text(320, _y + 230, "Happy 10th Anniversary to UNDERTALE!");
            break;
        
        case 1:
            draw_text(320, _y + 230, "Haven't you learned anything over 10 years?");
            break;
        
        case 2:
            draw_text(320, _y + 230, "Do you want to be Mrs. Sunshine?");
            break;
        
        case 3:
            draw_text(320, _y + 230, "I guess you were the real aberrant.");
            break;
    }
}
else
{
    switch (global.overmsg)
    {
        case 0:
            draw_text(320, _y + 230, "Stay determined!");
            break;
        
        case 1:
            draw_text(320, _y + 230, "well, that works, i guess.");
            break;
        
        case 2:
            draw_text(320, _y + 230, "don't doze off...");
            break;
        
        case 3:
            draw_text(320, _y + 230, "Really?");
            break;
        
        case 4:
            draw_text(320, _y + 210, "well, getting to the last move\nwas good enough, right?");
            break;
        
        case 5:
            draw_text(320, _y + 210, "look. i'm not mad. but why did you\nsuddenly walk out on the last move?");
            break;
    }
}

if (mode == 0)
{
    draw_set_color(c_yellow);
    var str = "Return to menu";
    draw_text(320, _y + 290, str);
    draw_sprite(spr_heart, 0, 320 - (string_width(str) / 2) - 24, _y + 300);
}
else
{
    draw_set_color(c_white);
    var str = "Play again";
    
    if (sel == 0)
    {
        draw_set_color(c_yellow);
        draw_sprite(spr_heart, 0, 320 - (string_width(str) / 2) - 24, _y + 300);
    }
    
    draw_text(320, _y + 290, str);
    draw_set_color(c_white);
    str = "Return to menu";
    
    if (sel == 1)
    {
        draw_set_color(c_yellow);
        draw_sprite(spr_heart, 0, 320 - (string_width(str) / 2) - 24, _y + 300 + 32);
    }
    
    draw_text(320, _y + 290 + 32, str);
}

draw_set_halign(fa_left);
draw_set_alpha(1);
