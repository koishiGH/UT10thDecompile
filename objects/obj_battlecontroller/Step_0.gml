var roomExit = false;

try
{
    if (control_check_pressed(4))
    {
        if (global.mnfight == 0)
        {
            if (global.bmenuno == 1 || global.bmenuno == 2 || global.bmenuno == 11)
            {
                var oldcoord = global.bmenucoord[1];
                global.bmenucoord[1] += 1;
                
                if (global.bmenucoord[1] > 2)
                    global.bmenucoord[1] = 0;
                
                if (global.monster[0] == 0 && global.monster[2] == 0)
                    global.bmenucoord[1] = 1;
                
                if (global.bmenucoord[1] == 0 && global.monster[0] == 0)
                    global.bmenucoord[1] = 1;
                
                if (global.bmenucoord[1] == 1 && global.monster[1] == 0)
                    global.bmenucoord[1] = 2;
                
                if (global.bmenucoord[1] == 2 && global.monster[2] == 0)
                    global.bmenucoord[1] = 0;
                
                if (global.bmenucoord[1] != oldcoord)
                    snd_play(snd_squeak);
            }
            
            if (global.bmenuno == 10)
            {
                var oldcoord = global.bmenucoord[2];
                
                if (global.bmenucoord[2] != 2 && global.bmenucoord[2] != 5)
                    global.bmenucoord[2] += 1;
                else
                    global.bmenucoord[2] -= 2;
                
                if (global.choices[global.bmenucoord[2]] == 0 && global.bmenucoord[2] > 2)
                    global.bmenucoord[2] = 3;
                
                if (global.choices[global.bmenucoord[2]] == 0 && global.bmenucoord[2] <= 2)
                    global.bmenucoord[2] = 0;
                
                if (global.choices[0] == 1 && global.choices[1] == 0 && global.choices[2] == 0 && global.choices[3] == 0 && global.choices[4] == 0 && global.choices[5] == 0)
                    global.bmenucoord[2] = 0;
                
                if (global.bmenucoord[2] != oldcoord)
                    snd_play(snd_squeak);
            }
            
            if (global.bmenuno >= 3 && global.bmenuno < 4)
            {
                var tempcheck = global.bmenucoord[3] + ((global.bmenuno - 3) * 8);
                
                if (global.language == "ja")
                {
                    if (tempcheck < 7 && global.item[tempcheck + 1] != 0)
                    {
                        if (global.bmenucoord[3] < 2)
                            global.bmenucoord[3] += 1;
                        else
                            global.bmenuno += 0.125;
                        
                        snd_play(snd_squeak);
                    }
                }
                else
                {
                    var mv = 0;
                    
                    if (global.bmenucoord[3] == 2 || global.bmenucoord[3] == 3)
                    {
                        global.bmenucoord[3] -= 2;
                        mv = 1;
                    }
                    
                    if (mv == 0)
                    {
                        if (global.bmenucoord[3] == 0 || global.bmenucoord[3] == 1)
                        {
                            global.bmenucoord[3] += 2;
                            
                            if (global.item[tempcheck + 2] == 0)
                                global.bmenucoord[3] -= 2;
                            
                            mv = 1;
                        }
                    }
                    
                    if (mv != 0)
                        snd_play(snd_squeak);
                }
            }
            
            if (global.bmenuno == 4)
            {
                var oldcoord = global.bmenucoord[4];
                
                if (global.bmenucoord[4] == 0 && global.mercy < 1)
                    global.bmenucoord[4] = 1;
                else
                    global.bmenucoord[4] = 0;
                
                if (global.bmenucoord[4] != oldcoord)
                    snd_play(snd_squeak);
            }
        }
    }
    
    if (control_check_pressed(6))
    {
        if (global.mnfight == 0)
        {
            if (global.bmenuno == 0)
            {
                var oldcoord = global.bmenucoord[0];
                global.bmenucoord[0] += 1;
                
                if (global.bmenucoord[0] > 3)
                    global.bmenucoord[0] = 0;
                
                if (global.mercy == 2 && global.bmenucoord[0] == 3)
                    global.bmenucoord[0] = 0;
                
                if (global.mercy == 3)
                    global.bmenucoord[0] = 1;
                
                if (global.bmenucoord[0] != oldcoord)
                    snd_play(snd_squeak);
            }
            
            if (global.bmenuno == 10)
            {
                var oldcoord = global.bmenucoord[2];
                
                if (global.bmenucoord[2] <= 2)
                    global.bmenucoord[2] += 3;
                else
                    global.bmenucoord[2] -= 3;
                
                if (global.choices[global.bmenucoord[2]] == 0)
                    global.bmenucoord[2] -= 1;
                
                if (global.choices[0] == 1 && global.choices[1] == 0 && global.choices[2] == 0 && global.choices[3] == 0 && global.choices[4] == 0 && global.choices[5] == 0)
                    global.bmenucoord[2] = 0;
                
                if (global.bmenucoord[2] != oldcoord)
                    snd_play(snd_squeak);
            }
            
            if (global.bmenuno == 6)
            {
                if (global.bmenucoord[6] == 0)
                    global.bmenucoord[6] += 1;
                else
                    global.bmenucoord[6] -= 1;
                
                snd_play(snd_squeak);
            }
            
            if (global.myfight != 4)
            {
                if (global.language == "ja")
                {
                }
                else
                {
                    var mv = 0;
                    
                    if (global.bmenuno == 3)
                    {
                        var tempcheck = global.bmenuno;
                        
                        if (global.bmenucoord[3] == 0)
                        {
                            if (global.item[1] != 0)
                                global.bmenucoord[3] = 1;
                            
                            mv = 1;
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 1)
                            {
                                if (global.item[4] != 0)
                                {
                                    global.bmenucoord[3] = 0;
                                    global.bmenuno = 3.5;
                                }
                                else
                                {
                                    global.bmenucoord[3] = 0;
                                }
                                
                                mv = 1;
                            }
                        }
                        
                        if (global.bmenucoord[3] == 2)
                        {
                            if (global.item[3] != 0)
                                global.bmenucoord[3] = 3;
                            
                            mv = 1;
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 3)
                            {
                                if (global.item[6] != 0)
                                {
                                    global.bmenucoord[3] = 2;
                                    global.bmenuno = 3.5;
                                }
                                else
                                {
                                    global.bmenucoord[3] = 2;
                                }
                                
                                mv = 1;
                            }
                        }
                        
                        if (mv == 1)
                            snd_play(snd_squeak);
                        
                        if (global.bmenuno != tempcheck)
                            scr_itemrewrite();
                    }
                    
                    if (mv == 0 && global.bmenuno == 3.5)
                    {
                        var tempcheck = global.bmenuno;
                        
                        if (global.bmenucoord[3] == 1)
                        {
                            global.bmenucoord[3] = 0;
                            global.bmenuno = 3;
                            mv = 1;
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 0)
                            {
                                if (global.item[5] != 0)
                                {
                                    global.bmenucoord[3] = 1;
                                }
                                else
                                {
                                    global.bmenucoord[3] = 0;
                                    global.bmenuno = 3;
                                }
                                
                                mv = 1;
                            }
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 3)
                            {
                                global.bmenucoord[3] = 2;
                                global.bmenuno = 3;
                                mv = 1;
                            }
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 2)
                            {
                                if (global.item[7] != 0)
                                {
                                    global.bmenucoord[3] = 3;
                                }
                                else
                                {
                                    global.bmenucoord[3] = 2;
                                    global.bmenuno = 3;
                                }
                                
                                mv = 1;
                            }
                        }
                        
                        if (mv == 1)
                            snd_play(snd_squeak);
                        
                        if (global.bmenuno != tempcheck)
                            scr_itemrewrite();
                    }
                }
            }
        }
    }
    
    if (control_check_pressed(3))
    {
        if (!control_check_pressed(4))
        {
            if (global.mnfight == 0)
            {
                if (global.bmenuno == 1 || global.bmenuno == 2 || global.bmenuno == 11)
                {
                    var oldcoord = global.bmenucoord[1];
                    global.bmenucoord[1] -= 1;
                    
                    if (global.bmenucoord[1] < 0)
                        global.bmenucoord[1] = 2;
                    
                    if (global.monster[0] == 0 && global.monster[2] == 0)
                        global.bmenucoord[1] = 1;
                    
                    if (global.bmenucoord[1] == 2 && global.monster[2] == 0)
                        global.bmenucoord[1] = 1;
                    
                    if (global.bmenucoord[1] == 1 && global.monster[1] == 0)
                        global.bmenucoord[1] = 0;
                    
                    if (global.bmenucoord[1] == 0 && global.monster[0] == 0)
                        global.bmenucoord[1] = 2;
                    
                    if (global.bmenucoord[1] != oldcoord)
                        snd_play(snd_squeak);
                }
                
                if (global.bmenuno == 10)
                {
                    var oldcoord = global.bmenucoord[2];
                    
                    if (global.bmenucoord[2] != 0 && global.bmenucoord[2] != 3)
                        global.bmenucoord[2] -= 1;
                    else
                        global.bmenucoord[2] += 2;
                    
                    if (global.choices[global.bmenucoord[2]] == 0)
                        global.bmenucoord[2] -= 1;
                    
                    if (global.choices[global.bmenucoord[2]] == 0)
                        global.bmenucoord[2] -= 1;
                    
                    if (global.choices[0] == 1 && global.choices[1] == 0 && global.choices[2] == 0 && global.choices[3] == 0 && global.choices[4] == 0 && global.choices[5] == 0)
                        global.bmenucoord[2] = 0;
                    
                    if (global.bmenucoord[2] != oldcoord)
                        snd_play(snd_squeak);
                }
                
                if (global.bmenuno >= 3 && global.bmenuno < 4)
                {
                    var tempcheck = global.bmenucoord[3] + ((global.bmenuno - 3) * 8);
                    
                    if (global.language == "ja")
                    {
                        if (tempcheck > 0)
                        {
                            if (global.bmenucoord[3] > 0)
                                global.bmenucoord[3] -= 1;
                            else
                                global.bmenuno -= 0.125;
                            
                            snd_play(snd_squeak);
                        }
                    }
                    else
                    {
                        var mv = 0;
                        tempcheck = global.bmenucoord[3];
                        
                        if (global.bmenuno == 3.5)
                            tempcheck += 4;
                        
                        if (global.bmenucoord[3] == 2 || global.bmenucoord[3] == 3)
                        {
                            global.bmenucoord[3] -= 2;
                            mv = 1;
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenucoord[3] == 0 || global.bmenucoord[3] == 1)
                            {
                                global.bmenucoord[3] += 2;
                                
                                if (global.item[tempcheck + 2] == 0)
                                    global.bmenucoord[3] -= 2;
                                
                                mv = 1;
                            }
                        }
                        
                        if (mv != 0)
                            snd_play(snd_squeak);
                    }
                }
                
                if (global.bmenuno == 4)
                {
                    var oldcoord = global.bmenucoord[4];
                    
                    if (global.bmenucoord[4] == 0 && global.mercy < 1)
                        global.bmenucoord[4] = 1;
                    else
                        global.bmenucoord[4] = 0;
                    
                    if (global.bmenucoord[4] != oldcoord)
                        snd_play(snd_squeak);
                }
            }
        }
    }
    
    if (control_check_pressed(5))
    {
        if (!control_check_pressed(6))
        {
            if (global.mnfight == 0)
            {
                if (global.bmenuno == 0)
                {
                    var oldcoord = global.bmenucoord[0];
                    global.bmenucoord[0] -= 1;
                    
                    if (global.bmenucoord[0] < 0)
                        global.bmenucoord[0] = 3;
                    
                    if (global.mercy == 2 && global.bmenucoord[0] == 3)
                        global.bmenucoord[0] = 2;
                    
                    if (global.mercy == 3)
                        global.bmenucoord[0] = 1;
                    
                    if (global.bmenucoord[0] != oldcoord)
                        snd_play(snd_squeak);
                }
                
                if (global.myfight != 4)
                {
                    if (global.language == "ja")
                    {
                    }
                    else
                    {
                        var mv = 0;
                        
                        if (global.bmenuno == 3)
                        {
                            var tempcheck = global.bmenuno;
                            
                            if (global.bmenucoord[3] == 1)
                            {
                                global.bmenucoord[3] = 0;
                                mv = 1;
                            }
                            
                            if (mv == 0)
                            {
                                if (global.bmenucoord[3] == 0)
                                {
                                    if (global.item[5] != 0)
                                    {
                                        global.bmenucoord[3] = 1;
                                        global.bmenuno = 3.5;
                                        mv = 1;
                                    }
                                    else if (global.item[4] != 0)
                                    {
                                        global.bmenucoord[3] = 0;
                                        global.bmenuno = 3.5;
                                        mv = 1;
                                    }
                                    else if (global.item[1] != 0)
                                    {
                                        global.bmenucoord[3] = 1;
                                        mv = 1;
                                    }
                                }
                            }
                            
                            if (mv == 0)
                            {
                                if (global.bmenucoord[3] == 3)
                                {
                                    global.bmenucoord[3] = 2;
                                    mv = 1;
                                }
                            }
                            
                            if (mv == 0)
                            {
                                if (global.bmenucoord[3] == 2)
                                {
                                    if (global.item[7] != 0)
                                    {
                                        global.bmenucoord[3] = 3;
                                        global.bmenuno = 3.5;
                                        mv = 1;
                                    }
                                    else if (global.item[6] != 0)
                                    {
                                        global.bmenucoord[3] = 2;
                                        global.bmenuno = 3.5;
                                        mv = 1;
                                    }
                                    else if (global.item[3] != 0)
                                    {
                                        global.bmenucoord[3] = 3;
                                        mv = 1;
                                    }
                                }
                            }
                            
                            if (mv != 0)
                                snd_play(snd_squeak);
                            
                            if (global.bmenuno != tempcheck)
                                scr_itemrewrite();
                        }
                        
                        if (mv == 0)
                        {
                            if (global.bmenuno == 3.5)
                            {
                                var tempcheck = global.bmenuno;
                                
                                if (global.bmenucoord[3] == 1)
                                {
                                    global.bmenucoord[3] = 0;
                                    mv = 1;
                                }
                                
                                if (mv == 0)
                                {
                                    if (global.bmenucoord[3] == 0)
                                    {
                                        mv = 1;
                                        global.bmenuno = 3;
                                        global.bmenucoord[3] = 1;
                                    }
                                }
                                
                                if (mv == 0)
                                {
                                    if (global.bmenucoord[3] == 3)
                                    {
                                        global.bmenucoord[3] = 2;
                                        mv = 1;
                                    }
                                }
                                
                                if (mv == 0)
                                {
                                    if (global.bmenucoord[3] == 2)
                                    {
                                        mv = 1;
                                        global.bmenuno = 3;
                                        global.bmenucoord[3] = 3;
                                    }
                                }
                                
                                if (mv == 1)
                                    snd_play(snd_squeak);
                                
                                if (global.bmenuno != tempcheck)
                                    scr_itemrewrite();
                            }
                        }
                    }
                }
                
                if (global.bmenuno == 10)
                {
                    var oldcoord = global.bmenucoord[2];
                    
                    if (global.bmenucoord[2] <= 2)
                        global.bmenucoord[2] += 3;
                    else
                        global.bmenucoord[2] -= 3;
                    
                    if (global.choices[global.bmenucoord[2]] == 0)
                        global.bmenucoord[2] -= 1;
                    
                    if (global.choices[0] == 1 && global.choices[1] == 0 && global.choices[2] == 0 && global.choices[3] == 0 && global.choices[4] == 0 && global.choices[5] == 0)
                        global.bmenucoord[2] = 0;
                    
                    if (global.bmenucoord[2] != oldcoord)
                        snd_play(snd_squeak);
                }
                
                if (global.bmenuno == 6)
                {
                    if (global.bmenucoord[6] == 0)
                        global.bmenucoord[6] += 1;
                    else
                        global.bmenucoord[6] -= 1;
                    
                    snd_play(snd_squeak);
                }
            }
        }
    }
    
    SCR_BORDERSETUP();
    currentplace = global.bmenuno;
    
    if (global.monster[0] == 0)
    {
        if (global.monster[1] == 0)
        {
            if (global.monster[2] == 0)
            {
                if (won == 0)
                {
                    won = 1;
                    global.xp += global.xpreward[3];
                    global.gold += global.goldreward[3];
                    tlvl = global.lv;
                    scr_levelup();
                    
                    if (global.flag[15] == 0)
                    {
                        caster_stop(global.batmusic);
                        caster_free(global.batmusic);
                    }
                    
                    global.msg[0] = scr_gettext("obj_battlecontroller_286", string(global.xpreward[3]), string(global.goldreward[3]));
                    
                    if (tlvl != global.lv)
                    {
                        global.msg[0] += scr_gettext("obj_battlecontroller_287");
                        snd_play(snd_levelup);
                    }
                    
                    global.msg[0] += "/%";
                    global.msc = 0;
                    var writer = instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    writer.writingxend += 20;
                    exit;
                }
            }
        }
    }
    
    global.inv = 30;
    
    if (global.armor == 44)
        global.inv += 30;
    
    if (global.armor == 64)
        global.inv += 15;
    
    if (global.weapon == 45)
        global.inv += 15;
    
    if (global.inv < 15)
        global.inv = 15;
    
    if (global.battlegroup != 95)
    {
        if (global.armor == 46 || global.armor == 64)
        {
            if (global.mnfight == 0 && global.myfight == 0)
            {
                if (((global.turn + 1) % 2) == 0)
                {
                    if (healed == 0)
                    {
                        healed = 1;
                        
                        if (global.hp < global.maxhp)
                            global.hp += 1;
                        
                        snd_play(snd_power);
                    }
                }
            }
            else
            {
                healed = 0;
            }
        }
    }
    
    if (global.mnfight == 0 && global.myfight == 0)
    {
        global.typer = 1;
        
        if (active == 1)
        {
            if (!control_check_pressed(1))
            {
                if (control_check_pressed(0))
                {
                    if (global.bmenuno == 0)
                    {
                        global.tmsg = global.msg[0];
                        global.talked = -1;
                        global.bmenucoord[2] = 0;
                        global.bmenuno = global.bmenucoord[0] + 1;
                        
                        if (global.bmenuno == 1 || global.bmenuno == 2 || global.bmenuno == 11)
                        {
                            global.msc = 3;
                            
                            if (global.monster[global.bmenucoord[1]] == 0)
                                global.bmenucoord[1] += 1;
                            
                            if (global.monster[global.bmenucoord[1]] == 0)
                                global.bmenucoord[1] += 1;
                            
                            if (global.monster[0] == 0 && global.monster[2] == 0)
                                global.bmenucoord[1] = 1;
                            
                            if (global.bmenucoord[1] > 2)
                            {
                                global.bmenucoord[1] = 0;
                                
                                if (global.monster[0] == 0)
                                    global.bmenucoord[1] = 1;
                                
                                if (global.monster[1] == 0)
                                    global.bmenucoord[1] = 2;
                                
                                if (global.monster[2] == 0)
                                    global.bmenucoord[1] = 0;
                            }
                        }
                        
                        if (global.bmenuno == 3)
                        {
                            if (global.item[0] != 0)
                            {
                                global.bmenucoord[3] = 0;
                                scr_itemnameb();
                                
                                if (global.language == "ja")
                                {
                                    global.msc = 0;
                                    global.msg[0] = " ";
                                    global.msg[1] = "%%%";
                                }
                                else
                                {
                                    var pad = " ";
                                    
                                    for (var i = 0; i < 8; i++)
                                    {
                                        var len = 9;
                                        
                                        if ((i % 2) == 0)
                                            len = 10;
                                        
                                        while (string_length(global.itemnameb[i]) < len)
                                            global.itemnameb[i] += pad;
                                    }
                                    
                                    global.msc = 9;
                                }
                            }
                            else
                            {
                                global.bmenuno = 0;
                            }
                        }
                        
                        if (global.bmenuno == 4)
                            global.msc = 7;
                        
                        snd_play(snd_select);
                        
                        with (OBJ_WRITER)
                            halt = 3;
                        
                        with (OBJ_INSTAWRITER)
                            halt = 3;
                        
                        instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
                        control_clear(0);
                        exit;
                    }
                    
                    if (global.bmenuno == 1)
                    {
                        global.mytarget = global.bmenucoord[1];
                        OBJ_WRITER.halt = 3;
                        OBJ_INSTAWRITER.halt = 3;
                        global.myfight = 1;
                        obj_heart.x = -200;
                        snd_play(snd_select);
                        scr_attack();
                        control_clear(0);
                    }
                    
                    if (global.bmenuno == 10)
                    {
                        global.talked = global.bmenucoord[2];
                        global.mntrg = global.monsterinstance[global.mytarget];
                        
                        with (global.mntrg)
                            whatiheard = global.talked;
                        
                        OBJ_WRITER.halt = 3;
                        OBJ_INSTAWRITER.halt = 3;
                        snd_play(snd_select);
                        global.myfight = 2;
                        obj_heart.x = -200;
                        control_clear(0);
                    }
                    
                    if (global.bmenuno == 2)
                    {
                        global.mytarget = global.bmenucoord[1];
                        OBJ_WRITER.halt = 3;
                        OBJ_INSTAWRITER.halt = 3;
                        global.bmenuno = 10;
                        global.msc = 1000 + global.monstertype[global.mytarget];
                        instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
                        control_clear(0);
                        SCR_TEXT(global.msc);
                        
                        if (global.choices[global.bmenucoord[2]] == 0)
                            global.bmenucoord[2] = 0;
                    }
                    
                    if (global.bmenuno >= 3 && global.bmenuno < 4)
                    {
                        if (obj_time.right == 0 && obj_time.left == 0)
                        {
                            OBJ_WRITER.halt = 3;
                            itempos = global.bmenucoord[3] + ((global.bmenuno - 3) * 8);
                            thisitemid = global.item[itempos];
                            scr_itemuseb(itempos, thisitemid);
                            global.talked = 91;
                            global.myfight = 4;
                            obj_heart.x = -200;
                            snd_play(snd_select);
                        }
                        
                        control_clear(0);
                    }
                    
                    if (global.bmenuno == 4)
                    {
                        OBJ_WRITER.halt = 3;
                        global.mercyuse = global.bmenucoord[4];
                        
                        if (global.mercyuse == 1)
                        {
                            scr_runaway();
                            global.talked = 90;
                        }
                        
                        if (runaway == 0)
                            snd_play(snd_select);
                        
                        global.myfight = 4;
                        obj_heart.x = -200;
                        control_clear(0);
                    }
                }
            }
        }
        
        if (active == 1)
        {
            if (control_check_pressed(1))
            {
                if (global.bmenuno != 0 && global.bmenuno < 6)
                {
                    OBJ_WRITER.halt = 3;
                    OBJ_INSTAWRITER.halt = 3;
                    global.bmenuno = 0;
                    global.typer = 1;
                    global.msg[0] = global.tmsg;
                    global.msc = 0;
                    instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
                    control_clear(1);
                }
                
                if (global.bmenuno == 10)
                {
                    OBJ_WRITER.halt = 3;
                    OBJ_INSTAWRITER.halt = 3;
                    global.bmenuno = 2;
                    global.typer = 1;
                    global.msc = 3;
                    instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
                    control_clear(1);
                }
                
                if (global.bmenuno == 11)
                {
                    OBJ_WRITER.halt = 3;
                    OBJ_INSTAWRITER.halt = 3;
                    global.bmenuno = 3;
                    global.typer = 1;
                    global.msc = 0;
                    instance_create(global.idealborder[0], global.idealborder[2], OBJ_INSTAWRITER);
                    control_clear(1);
                }
            }
        }
        
        if (global.bmenuno == 1 || global.bmenuno == 2 || global.bmenuno == 11)
        {
            obj_heart.x = global.idealborder[0] + 32;
            obj_heart.y = scr_battlemenu_cursor_y(global.bmenucoord[1]);
        }
        
        if (global.bmenuno == 10)
        {
            if (global.bmenucoord[2] <= 2)
                obj_heart.x = global.idealborder[0] + 32;
            else
                obj_heart.x = global.idealborder[0] + 292;
            
            if (global.bmenucoord[2] <= 2)
                obj_heart.y = scr_battlemenu_cursor_y(global.bmenucoord[2]);
            else
                obj_heart.y = scr_battlemenu_cursor_y(global.bmenucoord[2] - 3);
        }
        
        if (global.bmenuno >= 3 && global.bmenuno < 4)
        {
            if (global.language == "ja")
            {
                obj_heart.y = scr_battlemenu_cursor_y(global.bmenucoord[3]);
                obj_heart.x = global.idealborder[0] + 32;
            }
            else
            {
                if (global.bmenucoord[3] <= 1)
                    obj_heart.y = global.idealborder[2] + 28;
                else
                    obj_heart.y = global.idealborder[2] + 60;
                
                if (global.bmenucoord[3] == 0 || global.bmenucoord[3] == 2)
                    obj_heart.x = global.idealborder[0] + 32;
                else
                    obj_heart.x = global.idealborder[0] + 280;
            }
        }
        
        if (global.bmenuno == 4)
        {
            obj_heart.x = global.idealborder[0] + 32;
            obj_heart.y = scr_battlemenu_cursor_y(global.bmenucoord[4]);
        }
    }
    
    if (active == 1)
    {
        if (control_check_pressed(1))
        {
            if (global.mnfight == 0 && global.flag[21] == 0)
            {
                if (instance_number(OBJ_WRITER) > 0)
                    OBJ_WRITER.stringpos = string_length(OBJ_WRITER.originalstring);
                
                control_clear(1);
            }
        }
    }
    
    if (global.myfight == 1 || global.myfight == 2 || global.mnfight == 3)
        obj_heart.x = -400;
    
    if (global.mnfight == 3)
    {
        global.border = 0;
        SCR_BORDERSETUP();
        
        if (obj_lborder.x == global.idealborder[0])
        {
            global.typer = 1;
            global.msc = 0;
            instance_create(global.idealborder[0], global.idealborder[2], OBJ_WRITER);
            global.bmenuno = 0;
            global.myfight = 0;
            global.mnfight = 0;
            global.turn += 1;
            global.mercyuse = -1;
        }
    }
    
    if (global.myfight == 3)
    {
        if (instance_exists(OBJ_WRITER))
        {
            if (OBJ_WRITER.halt > 0)
            {
                obj_heart.x = global.idealborder[0] + 32 + (global.bmenucoord[6] * 252);
                obj_heart.y = global.idealborder[2] + 92;
                
                if (global.language == "ja")
                    obj_heart.y += 8;
                
                if (control_check_pressed(0))
                {
                    global.heard = 0;
                    global.talked = 6 + global.bmenucoord[6];
                    
                    with (global.monsterinstance[global.mytarget])
                        whatiheard = global.talked;
                    
                    obj_heart.x = -200;
                    OBJ_WRITER.halt = 3;
                    global.myfight = 2;
                }
            }
        }
    }
    
    if (global.myfight == 4)
    {
        if (runaway == 0)
        {
            obj_heart.x = -200;
            
            if (!instance_exists(OBJ_WRITER))
            {
                global.myfight = 0;
                global.mnfight = 1;
                control_clear(0);
            }
        }
    }
    
    if (global.hp <= 0)
    {
        scr_gameoverb();
        roomExit = true;
        exit;
    }
    
    if (currentplace < global.bmenuno)
    {
        if (!snd_isplaying(snd_select))
            snd_play(snd_select);
    }
}
finally
{
    if (!roomExit)
    {
        with (obj_monsterparent)
            postBattlecontrollerStep();
    }
}
