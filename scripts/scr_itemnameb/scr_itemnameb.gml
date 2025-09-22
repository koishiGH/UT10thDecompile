function scr_itemnameb()
{
    for (var i = 0; i < 8; i++)
    {
        var itemid = global.item[i];
        var name;
        
        if (global.seriousbattle == 1)
            name = scr_gettext("item_names_" + string(itemid));
        else
            name = scr_gettext("item_nameb_" + string(itemid));
        
        global.itemnameb[i] = name;
    }
}
