function scr_binfowrite()
{
    draw_set_color(c_white);
    var namex = 30;
    var namey = 400;
    var namewidth = scr_draw_name_curs(namex, namey);
    draw_set_font(fnt_curs);
    draw_text(namex + namewidth, 400, "   LV " + string(global.lv));
    draw_set_color(c_red);
    ossafe_fill_rectangle(275, 400, 275 + (global.maxhp * 1.2), 420);
    draw_set_color(c_yellow);
    ossafe_fill_rectangle(275, 400, 275 + (global.hp * 1.2), 420);
    draw_set_color(c_white);
    draw_set_font(fnt_curs);
    hpwrite = string(global.hp);
    
    if (global.hp < 10)
        hpwrite = "0" + string(global.hp);
    
    if (global.hp < 0)
        hpwrite = "0";
    
    draw_text(290 + (global.maxhp * 1.2), 400, hpwrite + " / " + string(global.maxhp));
}
