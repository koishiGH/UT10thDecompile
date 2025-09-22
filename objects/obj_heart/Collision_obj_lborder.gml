if (ignore_border == 0)
{
    if (movement == 13)
    {
        x = global.idealborder[0] + 4;
        
        if (hspeed < 0)
            hspeed = 0;
        
        jumpstage = 1;
    }
    
    if (obj_battlecontroller.runaway != 1)
        x = other.x + other.sprite_width;
}
