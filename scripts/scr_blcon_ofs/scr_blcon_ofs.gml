function scr_blcon_ofs(x, y, style, xOffset, yOffset)
{
    writer = instance_create(x + 30, y + 10, OBJ_WRITER);
    writer.writingx += xOffset;
    writer.writingxend += xOffset;
    writer.writingy += yOffset;
    blcon = instance_create(writer.x - 30, writer.y - 10, obj_blconwideslave);
    blcon.parent = writer;
    
    if (style == 1)
        blcon.sprite_index = spr_blconwdshrt_l;
    
    if (style == 2)
    {
        blcon.sprite_index = spr_blconabove;
        writer.writingy -= 20;
        writer.writingx -= 20;
    }
    
    if (style == 3)
    {
        blcon.sprite_index = spr_blconwdshrt;
        writer.writingy -= 20;
    }
    
    if (style == 4)
    {
        blcon.sprite_index = spr_blconbelow;
        writer.writingx -= 10;
    }
}
