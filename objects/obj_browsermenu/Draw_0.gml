if (phase < 4)
{
    if (alpha <= 0)
        exit;
    
    var _y = floor(y);
    draw_sprite_ext(spr_undertaletitle, 0, 0, _y - 120, 2, 2, 0, c_white, alpha);
    draw_set_alpha(alpha);
    draw_set_color(c_yellow);
    scr_setfont(fnt_main);
    draw_text_transformed(110, _y + 160, "10TH ANNIVERSARY", 2, 2, 0);
    
    if (battlesel == -1)
        draw_sprite(spr_heart, 0, 312, 320);
    
    draw_set_alpha(txtalpha);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    var str = "Mr. Sunshine\nand Abberant";
    
    if (battlesel == 0)
    {
        draw_set_color(c_yellow);
        
        if (phase == 2)
        {
            heart.x = 40 - (string_width(str) / 20) - 18;
            heart.y = _y + 335;
            draw_sprite(spr_heart, 0, heart.x, heart.y);
        }
    }
    
    draw_text(40, _y + 325, str);
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    str = "Sans";
    
    if (battlesel == 1)
    {
        draw_set_color(c_yellow);
        
        if (phase == 2)
        {
            heart.x = 600 - (string_width(str) / 2) - 53;
            heart.y = _y + 350;
            draw_sprite(spr_heart, 0, heart.x, heart.y);
        }
    }
    
    draw_text(600, _y + 340, str);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    str = "Credits";
    
    if (battlesel == 2)
    {
        draw_set_color(c_yellow);
        
        if (phase == 2)
        {
            heart.x = 320 - (string_width(str) / 2) - 24;
            heart.y = _y + 420;
            draw_sprite(spr_heart, 0, heart.x, heart.y);
        }
    }
    
    draw_text(320, _y + 410, str);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    str = "Controls";
    
    if (battlesel == 3)
    {
        draw_set_color(c_yellow);
        
        if (phase == 2)
        {
            heart.x = 320 - (string_width(str) / 2) - 24;
            heart.y = _y + 290;
            draw_sprite(spr_heart, 0, heart.x, heart.y);
        }
    }
    
    draw_text(320, _y + 280, str);
    draw_set_color(c_gray);
    draw_set_font(fnt_small);
    draw_set_halign(fa_center);
    draw_text_transformed(320, 464, "(C) Toby Fox 2025", 2, 2, 0);
}
else if (phase == 4)
{
    scr_setfont(fnt_main);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    draw_text(180, 32, "Director");
    draw_text(460, 32, "Producer");
    draw_text(180, 132, "New Programming");
    draw_text(460, 132, "New Battle");
    draw_text(460, 156, "Graphics");
    draw_text(180, 284, "Special Sans Thanks");
    draw_text(416, 350, "Sans Battle Music");
    draw_set_color(c_white);
    draw_text(180, 64, "Toby Fox");
    draw_text(460, 64, "Robert Sephazon");
    var interpolateAmt = max(creditsSinerSpeed, 0) / creditsSinerSpeedMax;
    
    for (var i = 0; i < 3; i++)
    {
        var startX = sillySpinnyNameStarts[i].x;
        var startY = sillySpinnyNameStarts[i].y;
        var offset = (2.0943951023931953 * i) + 3.6651914291880923;
        var siner = creditsSiner + offset;
        var rotateX = 190 + (cos(siner) * 100);
        var rotateY = 200 + (sin(siner) * 30);
        draw_text(floor(lerp(startX, rotateX, interpolateAmt)), floor(lerp(startY, rotateY, interpolateAmt)), sillySpinnyNames[i]);
    }
    
    draw_text(460, 188, "Temmie");
    draw_text_transformed(460, 220, "Toby", 0.5, 0.5, 0);
    draw_text(180, 316, "Fred Wood");
    draw_text(416, 382, "Carlos \"insaneintherain\" Eiene");
    var str = "Back";
    draw_set_color(c_yellow);
    draw_text(80, 430, str);
    draw_sprite(spr_heart, 0, 80 - (string_width(str) / 2) - 24, 440);
}

draw_set_halign(fa_left);
draw_set_alpha(1);
