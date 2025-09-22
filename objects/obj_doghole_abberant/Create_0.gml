depth = 10;
scr_monstersetup();
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
part1 = obj_doghole_abberant_body;
mypart1 = instance_create(x, y, part1);
mypart1.parent = id;
hurtanim = 0;
hurtsound = snd_hurtbuzz;
talked = 0;
whatiheard = -1;
con = 0;
attacked = 0;
killed = 0;
global.heard = 0;
takedamage = 0;
mercymod = 20;
gamermode = 0;
sha = 0;
shb = 0;
ht = sprite_height / 2;
wd = sprite_width / 2;
global.overmsg = 0;
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
        whatiheard = 6;
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
            
            if (mercymod >= 900)
                global.msg[0] = "* Abberant can't believe its&  assumptions aren't true.";
            
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
                    global.msg[0] = "* ABBERANT - ATK 40 DEF 70&* A self-proclaimed member of&  the Knights of the Hound./";
                    global.msg[1] = "* A white knight of a certain&  dog^1, it worships everything&  it doesn't say./^";
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                    
                    whatiheard = 9;
                }
                
                if (whatiheard == 3)
                {
                    global.msc = 0;
                    
                    if (con == 0)
                    {
                        global.msg[0] = "* You explain to ABBERANT this&  new area is probably just for&  show./";
                        global.msg[1] = "* The hair controlling it&  was destroyed!/^";
                    }
                    else
                    {
                        global.msg[0] = "* You explain to ABBERANT this&  new area is probably just for&  show./^";
                    }
                    
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                }
                
                if (whatiheard == 1)
                {
                    global.msc = 0;
                    global.msg[0] = "* [missing text]/^";
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                }
                
                if (whatiheard == 4)
                {
                    global.msc = 0;
                    global.msg[0] = "* [missing text]/^";
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                }
                
                global.heard = 1;
            }
        }
    }
    
    if (whatiheard == 3)
    {
        if (con == 0 && (!instance_exists(OBJ_WRITER) || OBJ_WRITER.stringno == 1))
        {
            snd_play(snd_damage);
            HairCut();
            con = 1;
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
};

function HairCut()
{
    snd_play(snd_saber3);
    
    for (i = 0; i < 10; i += 1)
    {
        for (j = 0; j < 23; j += 1)
        {
            instance_create(((obj_doghole_abberant_body.x - 30) + (i * 2)) - random(15), (obj_doghole_abberant_body.y - 35) + (j * 4), obj_whtpxlgrav);
            instance_create(obj_doghole_abberant_body.x + 35 + (i * 2) + random(15), (obj_doghole_abberant_body.y - 35) + (j * 4), obj_whtpxlgrav);
        }
    }
    
    for (i = 0; i < 17; i += 1)
    {
        for (j = 0; j < 17; j += 1)
            instance_create((obj_doghole_abberant_body.x - 10) + (i * 4), (obj_doghole_abberant_body.y - 38) + (j * 2), obj_whtpxlgrav);
    }
    
    for (i = 0; i < 4; i += 1)
    {
        for (j = 0; j < 4; j += 1)
        {
            instance_create(obj_doghole_abberant_body.x + 15 + (i * 3), obj_doghole_abberant_body.y - 38 - (j * 2), obj_whtpxlgrav);
            instance_create((obj_doghole_abberant_body.x - 5) + (i * 3), obj_doghole_abberant_body.y - 38 - (j * 2), obj_whtpxlgrav);
        }
    }
    
    with (obj_whtpxlgrav)
    {
        image_xscale = 1.5;
        image_yscale = 1.5;
        depth = -50;
    }
    
    mercymod = 900;
}
