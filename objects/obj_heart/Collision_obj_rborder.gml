if (ignore_border == 0)
{
    if (movement == 11)
    {
        x = global.idealborder[1] - 16;
        
        if (hspeed > 0)
            hspeed = 0;
        
        if (movement == 11)
            jumpstage = 1;
    }
    
    x = other.x - sprite_width;
}
