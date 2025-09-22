function scr_draw_name_curs(arg0, arg1)
{
    var use_font;
    
    if (global.language == "ja")
    {
        use_font = fnt_ja_curs;
        arg1 += 3;
    }
    else
    {
        use_font = fnt_curs;
        
        for (var i = 1; i < strlen(global.charname); i++)
        {
            if (ord(string_char_at(global.charname, i)) >= 12288)
            {
                use_font = fnt_ja_curs;
                arg1 += 3;
                break;
            }
        }
    }
    
    draw_set_font(use_font);
    draw_text(arg0, arg1, global.charname);
    return string_width(global.charname);
}
