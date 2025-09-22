function scr_monsterdefeat()
{
    if (killed == 1)
    {
        global.xpreward[3] += global.xpreward[myself];
        global.goldreward[3] += global.goldreward[myself];
        global.vaporspeed = 0;
        global.monstersprite = sprite_index;
        ddd = instance_create(x, y, obj_vaporized_new);
        
        if (object_index == obj_doghole_mrsunshine)
        {
            global.overmsg = 3;
            ddd.y -= 20;
        }
        
        if (object_index == obj_doghole_abberant)
            global.overmsg = 2;
        
        ddd.sprite_index = sprite_index;
        ddd.ht = ht;
        ddd.wd = wd;
        ddd.image_speed = 0;
        ddd.image_index = 1;
        global.kills += 1;
        
        if (global.kills >= 2)
            global.overmsg = 1;
        
        global.areapop[global.area] -= 1;
        
        if (global.areapop[global.area] < 0)
            global.areapop[global.area] = 0;
        
        global.flag[12] = 1;
    }
    
    if (killed == 0)
    {
        global.goldreward[3] += floor(global.goldreward[myself] * ((global.monstermaxhp[myself] - global.monsterhp[myself]) / global.monstermaxhp[myself]));
        global.monstersprite = sprite_index;
        ddd = instance_create(x, y, obj_spared);
        ddd.image_speed = 0;
        ddd.image_index = 1;
        
        if (global.overmsg == 1)
        {
            if (object_index == obj_doghole_mrsunshine)
                global.overmsg = 2;
            else
                global.overmsg = 3;
        }
        
        global.flag[10] = 1;
        global.flag[23] += 1;
    }
    
    global.monster[myself] = 0;
}
