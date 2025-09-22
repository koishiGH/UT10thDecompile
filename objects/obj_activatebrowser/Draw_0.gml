if (timer >= 20)
    exit;

scr_setfont(fnt_main);
draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(320, 240, global.touch_controls ? "[TAP TO START]" : "[CLICK TO START]");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
