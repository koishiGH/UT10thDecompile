depth = 10;
scr_monstersetup();
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
part1 = obj_doghole_mrsunshine_body;
mypart1 = instance_create(x, y, part1);
mypart1.parent = id;
hurtanim = 0;
hurtsound = snd_hurtdragon;
talked = 0;
whatiheard = -1;
attacked = 0;
killed = 0;
global.heard = 0;
takedamage = 0;
mercymod = 20;
shudder = 0;
sha = 0;
shb = 0;
ht = sprite_height;
wd = sprite_width;
remface = spr_mrsunshine_head_normal;
blconwd = -4;
blcon = -4;
battlegroup_number = global.battlegroup;
turn_counter = 0;

postBattlecontrollerStep = function()
{
    if (global.mnfight == 3)
        attacked = 0;
    
    if (alarm[5] > 0)
    {
        if (global.monster[0] == 1)
        {
            if (global.monsterinstance[0].alarm[5] > alarm[5])
                alarm[5] = global.monsterinstance[0].alarm[5];
        }
        
        if (global.monster[1] == 1)
        {
            if (global.monsterinstance[1].alarm[5] > alarm[5])
                alarm[5] = global.monsterinstance[1].alarm[5];
        }
        
        if (global.monster[2] == 1)
        {
            if (global.monsterinstance[2].alarm[5] > alarm[5])
                alarm[5] = global.monsterinstance[2].alarm[5];
        }
    }
    
    if (global.mnfight == 1)
    {
        if (talked == 0)
        {
            alarm[5] = 110;
            alarm[6] = 1;
            talked = 1;
            global.heard = 0;
        }
    }
    
    if (control_check_pressed(0))
    {
        if (alarm[5] > 5 && obj_lborder.x == global.idealborder[0] && alarm[6] < 0)
            alarm[5] = 2;
    }
    
    if (global.hurtanim[myself] == 1)
    {
        shudder = 8;
        alarm[3] = global.damagetimer;
        global.hurtanim[myself] = 3;
    }
    
    if (global.hurtanim[myself] == 2)
    {
        global.monsterhp[myself] -= takedamage;
        
        with (dmgwriter)
            alarm[2] = 15;
        
        if (global.monsterhp[myself] >= 1)
        {
            global.hurtanim[myself] = 0;
            mypart1.hurt = 0;
            global.myfight = 0;
            global.mnfight = 1;
        }
        else
        {
            global.myfight = 0;
            global.mnfight = 1;
            killed = 1;
            instance_destroy();
        }
    }
    
    if (global.hurtanim[myself] == 5)
    {
        global.damage = 0;
        instance_create((x + (sprite_width / 2)) - 48, y - 24, obj_dmgwriter);
        
        with (obj_dmgwriter)
            alarm[2] = 30;
        
        global.myfight = 0;
        global.mnfight = 1;
        global.hurtanim[myself] = 0;
    }
    
    if (global.mnfight == 2)
    {
        if (attacked == 0)
        {
            pop = scr_monstersum();
            num = 0;
            gen = instance_create(0, 0, obj_doghole_bulletgen);
            gen.dmg = global.monsteratk[myself];
            attacked = 1;
        }
        
        whatiheard = -1;
    }
    
    if (global.myfight == 2)
    {
        if (whatiheard != -1)
        {
            if (global.heard == 0)
            {
                if (whatiheard == 0)
                {
                    global.msc = 0;
                    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_3");
                    global.msg[1] = scr_gettext("obj_doghole_mrsunshine_4");
                    global.msg[2] = scr_gettext("obj_doghole_mrsunshine_5");
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                    
                    whatiheard = 9;
                }
                
                if (whatiheard == 3)
                {
                    global.msc = 0;
                    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_6");
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                }
                
                if (whatiheard == 1)
                {
                    global.msc = 0;
                    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_7");
                    global.msg[1] = scr_gettext("obj_doghole_mrsunshine_8");
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                    
                    whatiheard = 10;
                }
                
                if (whatiheard == 4)
                {
                    global.msc = 0;
                    global.msg[0] = scr_gettext("obj_doghole_mrsunshine_9");
                    global.msg[1] = scr_gettext("obj_doghole_mrsunshine_10");
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                    
                    whatiheard = 11;
                }
                
                global.heard = 1;
            }
        }
    }
    
    if (global.myfight == 4)
    {
        if (global.mercyuse == 0)
        {
            scr_mercystandard();
            
            if (mercy < 0)
                instance_destroy();
        }
    }
    
    if (mercymod == 222 && !instance_exists(OBJ_WRITER))
    {
        scr_mercystandard();
        
        if (mercy < 0)
            instance_destroy();
    }
    
    with (mypart1)
        postBattlecontrollerStep();
};
