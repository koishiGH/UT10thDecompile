function scr_replace_buttons_pc(arg0)
{
    arg0 = string_replace_all(arg0, "\\*Z", "[Z]");
    arg0 = string_replace_all(arg0, "\\*X", "[X]");
    arg0 = string_replace_all(arg0, "\\*C", "[C]");
    arg0 = string_replace_all(arg0, "\\*A", scr_gettext("key_left"));
    arg0 = string_replace_all(arg0, "\\*D", scr_gettext("key_right"));
    return arg0;
}
