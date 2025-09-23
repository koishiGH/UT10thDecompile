depth = 10;
scr_monstersetup();
image_speed = 0;
part1 = obj_sansb_body;
mypart1 = instance_create(x, y, part1);
alarm[9] = 8;
hurtanim = 0;
hurtsound = snd_nosound;
talked = 0;
whatiheard = -1;
attacked = 0;
killed = 0;
global.heard = 0;
takedamage = 0;
mercymod = -99999;
sha = 0;
shb = 0;
ht = 100;
wd = 120;
con = 1;
atcon = 0;
alarm[4] = 30;
with (obj_borderparent)
    visible = false;
global.mnfight = 99;
global.myfight = 99;
global.faceemotion = 0;
normalfight = 0;
obj_heart.visible = false;
hit_try = 0;
hit_reached = 0;
timer_on = 0;
turn = 0;
turns = 0;
part = 0;
skip = 0;
self_timer = 0;
check_count = 0;
global.overmsg = 0;

if (global.flag[472] >= 5.1)
    skip = 1;

boneUpdateOrder = array_create(256);
array_resize(boneUpdateOrder, 0);

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
            alarm[5] = 15;
            alarm[6] = 1;
            talked = 1;
            global.heard = 0;
        }
    }
    
    if (talked == 1 && instance_exists(OBJ_WRITER))
    {
        if (alarm[5] <= 3)
            alarm[5] = 3;
    }
    
    if (global.hurtanim[myself] == 1)
    {
        with (obj_sansb_body)
        {
            if (pose == 1)
                pose = 0;
        }
        
        shudder = 8;
        alarm[3] = global.damagetimer;
        global.hurtanim[myself] = 3;
    }
    
    if (global.hurtanim[myself] == 2)
    {
        with (dmgwriter)
            alarm[2] = 15;
        
        global.hurtanim[myself] = 0;
        mypart1.pause = 0;
        global.myfight = 0;
        global.mnfight = 1;
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
    
    if (global.mnfight == 2 && normalfight == 1)
    {
        if (attacked == 0)
        {
            if (global.sp < 5)
                global.sp = 5;
            
            global.turntimer = 10;
            timer_on = 1;
            global.border = 53;
            obj_heart.movement = 2;
            obj_heart.sprite_index = spr_heartblue;
            
            if (part == 0)
            {
                with (obj_sansb_body)
                {
                    a_type = 0;
                    event_user(0);
                }
            }
            
            if (part == 1)
            {
                if (atcon == 0)
                {
                    global.msc = 0;
                    global.typer = 107;
                    global.faceemotion = 0;
                    global.msg[0] = "dealing damage..^1.&nah^1, that'd be too&harsh^1, right?/";
                    global.msg[1] = "here^1, lemme take it easy on ya./%";
                    atcon = 1;
                    timer_on = 0;
                    obj_heart.force_lock = true;
                    global.flag[20] = 1;
                    scr_blcon_x(x + 120, y);
                    writer.skippable = true;
                }
                
                if (atcon == 1)
                {
                    if (!instance_exists(OBJ_WRITER))
                    {
                        timer_on = 1;
                        atcon = 0;
                        obj_heart.force_lock = false;
                        obj_heart.movement = 2;
                        
                        with (obj_sansb_body)
                        {
                            global.flag[20] = 0;
                            a_type = 1;
                            event_user(0);
                        }
                    }
                    else
                    {
                        exit;
                    }
                }
            }
            
            if (part == 2)
            {
                if (atcon == 0)
                {
                    global.msc = 0;
                    global.typer = 107;
                    global.faceemotion = 0;
                    global.msg[0] = "hey^1, not bad^1.&but do you remember&how blue attacks&work?/";
                    global.msg[1] = "\\E3hope so^1. i wouldn't&really know how&to explain it./%";
                    atcon = 1;
                    timer_on = 0;
                    obj_heart.force_lock = true;
                    scr_blcon_x(x + 120, y);
                    writer.skippable = true;
                    obj_blconwideslave.depth = obj_sansb_body.depth - 1;
                    OBJ_WRITER.depth = obj_sansb_body.depth - 2;
                }
                
                if (atcon == 1)
                {
                    if (!instance_exists(OBJ_WRITER))
                    {
                        timer_on = 1;
                        atcon = 0;
                        obj_heart.force_lock = false;
                        obj_heart.movement = 2;
                        
                        with (obj_sansb_body)
                        {
                            a_type = 2;
                            event_user(0);
                        }
                    }
                    else
                    {
                        if (global.faceemotion == 3)
                            obj_sansb_body.wink_frame = 1;
                        
                        exit;
                    }
                }
            }
            
            if (part == 3)
            {
                if (atcon == 0)
                {
                    global.msc = 0;
                    global.typer = 107;
                    global.faceemotion = 0;
                    global.msg[0] = "cool^1, so you do&remember./";
                    global.msg[1] = "\\E3... that's all you&remember^1, right?/%";
                    atcon = 1;
                    timer_on = 0;
                    obj_heart.force_lock = true;
                    scr_blcon_x(x + 120, y);
                    writer.skippable = true;
                }
                
                if (atcon == 1)
                {
                    if (!instance_exists(OBJ_WRITER))
                    {
                        timer_on = 1;
                        atcon = 0;
                        obj_heart.force_lock = false;
                        obj_heart.movement = 2;
                        
                        with (obj_sansb_body)
                        {
                            a_type = 3;
                            event_user(0);
                        }
                    }
                    else
                    {
                        if (global.faceemotion == 3)
                            obj_sansb_body.pose = 0;
                        
                        exit;
                    }
                }
            }
            
            if (part == 4)
            {
                if (atcon == 0)
                {
                    global.msc = 0;
                    global.typer = 107;
                    global.faceemotion = 0;
                    global.msg[0] = "okay^1. we all had&fun./";
                    global.msg[1] = "now here's one more&for the road./%";
                    global.overmsg = 4;
                    atcon = 1;
                    timer_on = 0;
                    obj_heart.force_lock = true;
                    scr_blcon_x(x + 120, y);
                    writer.skippable = true;
                    obj_sansb_body.pose = 0;
                }
                
                if (atcon == 1)
                {
                    global.turntimer = 9999;
                    
                    if (!instance_exists(OBJ_WRITER))
                    {
                        obj_heart.force_lock = false;
                        obj_heart.movement = 2;
                        obj_sansb_body.x += 20;
                        
                        if (obj_sansb_body.x > 700)
                            atcon += 1;
                        else
                            exit;
                    }
                    else
                    {
                        exit;
                    }
                }
                
                if (atcon == 2)
                {
                    if (!instance_exists(OBJ_WRITER))
                    {
                        timer_on = 1;
                        
                        with (obj_sansb_body)
                        {
                            a_type = 4;
                            event_user(0);
                        }
                        
                        attacked = 1;
                        exit;
                    }
                    else
                    {
                        exit;
                    }
                }
                
                if (atcon == 3)
                {
                    if (global.turntimer <= 10)
                    {
                        global.msc = 0;
                        global.typer = 107;
                        global.faceemotion = 0;
                        global.msg[0] = "and this is&for the road./%";
                        global.overmsg = 0;
                        atcon = 4;
                        self_timer = 120;
                        timer_on = 0;
                        scr_blcon_ofs(x + 110, y - 30, 1, 6, 0);
                        
                        with (obj_sans_bonebul_phy)
                            instance_destroy();
                        
                        with (obj_sans_bonebul_phy_hang)
                            instance_destroy();
                        
                        array_resize(boneUpdateOrder, 0);
                    }
                    
                    exit;
                }
                
                if (atcon == 4)
                {
                    if (!instance_exists(OBJ_WRITER))
                    {
                        if (hit_try == 1)
                            obj_sansb_body.x += 2;
                        
                        audio_sound_gain(global.batmusic, 0, 1000);
                        self_timer--;
                        
                        if (self_timer <= 0)
                            atcon = 5;
                    }
                    
                    exit;
                }
                
                if (atcon == 5)
                {
                    var bulldozer = instance_create(670, 202, obj_sans_bulldozer);
                    bulldozer.depth = -9999;
                    atcon = 6;
                    exit;
                }
                
                if (atcon == 6)
                    exit;
            }
            
            if (global.border == 39)
            {
                obj_heart.y = global.idealborder[3] - 70;
                obj_heart.vspeed = 2;
            }
            
            turns += 1;
            part += 1;
            
            switch (part)
            {
                case 1:
                    if (global.flag[472] == 5)
                        global.msg[0] = "* You felt something on&  your back..^2.&* ... it's a dog hair.";
                    else
                        global.msg[0] = "* It probably shouldn't have&  said \"shouldn't of\".";
                    
                    break;
                
                case 2:
                    global.msg[0] = "* Smells like Sans.";
                    obj_sansb_body.pose = 1;
                    break;
                
                case 3:
                    global.msg[0] = "* The battlefield is heating up^2!&* ... by 0.1 degrees.";
                    obj_sansb_body.pose = 2;
                    break;
                
                case 4:
                    global.msg[0] = "* Sans looks like he's getting&  ready to Sans.";
                    obj_sansb_body.pose = 3;
                    break;
            }
            
            attacked = 1;
        }
        
        whatiheard = -1;
    }
    
    if (part == 4 && atcon == 2)
    {
        if (global.turntimer <= 10)
        {
            attacked = 0;
            atcon = 3;
            exit;
        }
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
                    
                    switch (check_count)
                    {
                        case 0:
                            if (global.flag[472] != 5.1)
                                global.msg[0] = "* SANS 1 ATK 1 DEF&* The easiest enemy^1.&* Won't even deal damage./^";
                            else
                                global.msg[0] = "* SANS 1 ATK 1 DEF&* The easiest enemy^1.&* You still lost though./^";
                            
                            check_count++;
                            break;
                        
                        case 1:
                            global.msg[0] = "* Still Sans^1.&* You checked./^";
                            check_count++;
                            break;
                        
                        case 2:
                            global.msg[0] = "* Still Sans^1.&* You checked^1.&* (More thoroughly this time.)/^";
                            check_count++;
                            break;
                        
                        case 3:
                            global.msg[0] = "* Still Sans^2.&* ... wait^1, that's not true./";
                            global.msg[1] = "* Sans is moving^1, not still./";
                            global.msg[2] = "* You'll need to check more&  thoroughly next time./^";
                            check_count++;
                            break;
                        
                        case 4:
                            global.msg[0] = "* Moving Sans./^";
                            break;
                    }
                    
                    OBJ_WRITER.halt = 3;
                    iii = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    
                    with (iii)
                        halt = 0;
                    
                    whatiheard = 9;
                }
                
                global.heard = 1;
            }
        }
    }
    
    if (global.myfight == 4)
    {
        if (global.mercyuse == 0)
            scr_mercystandard();
    }
    
    if (mercymod == 222 && !instance_exists(OBJ_WRITER))
        scr_mercystandard();
    
    if (con == 1 && skip == 0)
    {
        with (OBJ_WRITER)
            instance_destroy();
        
        global.mnfight = 99;
        global.myfight = 99;
        obj_heart.visible = false;
        global.sp = 5;
    }
    
    if (con == 1 && skip == 1)
    {
        global.mnfight = 99;
        global.myfight = 99;
        global.sp = 5;
        
        with (OBJ_WRITER)
            instance_destroy();
        
        con = 6;
    }
    
    if (con == 2)
    {
        global.msc = 0;
        global.typer = 107;
        global.faceemotion = 0;
        global.msg[0] = "hope you're serious^1,&kid.../";
        global.msg[1] = "because once we&start.../";
        global.msg[2] = "there's no getting&away./%";
        con = 3;
        scr_blcon_x(x + 120, y);
        writer.skippable = true;
    }
    
    if (con == 3 && !instance_exists(OBJ_WRITER))
    {
        con = 5;
        alarm[4] = 10;
    }
    
    if (con == 6)
    {
        global.bmenuno = 999;
        
        with (obj_borderparent)
            instaborder = 1;
        
        global.border = 0;
        SCR_BORDERSETUP();
        con = 7;
        alarm[4] = 8;
    }
    
    if (con == 8)
    {
        global.faceemotion = 5;
        obj_heart.visible = true;
        snd_play(snd_noise);
        normalfight = 0;
        global.myfight = -1;
        global.mnfight = 2;
        con = 10;
        with (obj_borderparent)
            visible = true;
    }
    
    if (con == 10 && !instance_exists(OBJ_WRITER))
    {
        global.faceemotion = 0;
        bounce = 1;
        
        with (obj_borderparent)
            instaborder = 0;
        
        if (global.flag[472] == 5.1)
            global.msg[0] = "* You probably shouldn't&  of lost.";
        else
            global.msg[0] = "* Feels like a not particularly&  bad time.";
        
        global.border = 0;
        global.bmenuno = 0;
        normalfight = 1;
        audio_sound_gain(global.batmusic, 1, 0);
        caster_loop(global.batmusic, 1, 1);
        global.mnfight = 3;
        global.myfight = 0;
        fac = -1;
        con = 100;
    }
    
    if (timer_on == 1)
    {
        if (global.turntimer <= 0)
        {
            global.mnfight = 3;
            global.movement = 0;
            timer_on = 0;
            array_resize(boneUpdateOrder, 0);
            
            with (obj_sans_bonebul_phy)
                instance_destroy();
            
            with (obj_sans_bonebul_phy_hang)
                instance_destroy();
            
            with (obj_heart)
            {
                jumpstage = 0;
                movement = 0;
                hspeed = 0;
                vspeed = 0;
            }
        }
    }
};
