if (switchToMainControls == 1)
{
    draw_set_color(c_yellow);
    scr_setfont(fnt_main);
    draw_set_halign(fa_center);
    draw_text(320, 64, "Press another button to switch to\nkeyboard/controller controls.");
    draw_set_halign(fa_left);
    exit;
}

if (switchToMainControls == 2)
    exit;

sliderSideOffset.draw();
sliderScale.draw();
buttonDone.draw();
draw_set_color(c_white);
scr_setfont(fnt_main);
draw_set_halign(fa_center);
draw_text(320, 16, "Drag sliders to adjust touch controls:");
draw_set_color(c_gray);
draw_text(sliderSideOffset.x + (sliderSideOffset.width * 0.5), sliderSideOffset.y - 36, "SIDE DISTANCE");
draw_text(sliderScale.x + (sliderScale.width * 0.5), sliderScale.y - 36, "SCALE");
scr_setfont(fnt_maintext);
draw_text(320, 224, "(Or, press any button on a keyboard or controller.)");
draw_set_halign(fa_left);

if (fadeAlpha < 1)
{
    draw_set_color(c_black);
    draw_set_alpha(1 - fadeAlpha);
    ossafe_fill_rectangle(-4, -4, 644, 484);
    draw_set_alpha(1);
}
