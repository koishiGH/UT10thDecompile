function scr_battlemenu_cursor_y(arg0)
{
    if (global.language == "ja")
        return global.idealborder[2] + 27 + (arg0 * 36);
    
    return global.idealborder[2] + 28 + (arg0 * 32);
}
