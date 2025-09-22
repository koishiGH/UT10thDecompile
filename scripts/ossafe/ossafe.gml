function ossafe_fill_rectangle(arg0, arg1, arg2, arg3)
{
    if (arg0 > arg2)
    {
        var temp = arg0;
        arg0 = arg2;
        arg2 = temp;
    }
    
    if (arg1 > arg3)
    {
        var temp = arg1;
        arg1 = arg3;
        arg3 = temp;
    }
    
    draw_sprite_ext(spr_pixwht, 0, arg0, arg1, ((arg2 - arg0) + 1) * 0.5, ((arg3 - arg1) + 1) * 0.5, 0, draw_get_color(), draw_get_alpha());
}
