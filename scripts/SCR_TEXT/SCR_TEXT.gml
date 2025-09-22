function SCR_TEXT(arg0)
{
    switch (arg0)
    {
        case 0:
            break;
        
        case 1:
            global.msg[0] = "\\XLa, la.^3 &Time to wake&up and\\R smell\\X &the^4 pain./";
            global.msg[1] = "* Though^2.^4.^6.^8.&It's still a&little shaky./";
            global.msg[2] = "fhuehfuehfuehfuheufhe/%";
            global.msg[3] = "%%%";
            break;
        
        case 2:
            global.msg[0] = "* TestMonster and its cohorts&draw near!";
            global.msg[1] = "%%%";
            break;
        
        case 3:
            global.msg[0] = " ";
            
            if (global.monster[0] == 1)
            {
                with (global.monsterinstance[0])
                    scr_mercystandard();
                
                adder = "\\W";
                
                if (global.monsterinstance[0].mercy < 0)
                {
                    if (global.flag[22] == 0)
                        adder = "\\Y";
                    
                    if (global.flag[22] == 2)
                        adder = "\\p";
                }
                
                global.msg[0] = adder;
                global.msg[0] += scr_gettext("battle_name_header") + global.monstername[0];
                
                if (global.monstertype[0] == global.monstertype[1] || global.monstertype[0] == global.monstertype[2])
                    global.msg[0] += scr_gettext("battle_name_a");
            }
            
            global.msg[0] += "\\W &";
            
            if (global.monster[1] == 1)
            {
                with (global.monsterinstance[1])
                    scr_mercystandard();
                
                if (global.monsterinstance[1].mercy < 0 && global.flag[22] == 0)
                    global.msg[0] += "\\Y";
                
                if (global.monsterinstance[1].mercy < 0 && global.flag[22] == 2)
                    global.msg[0] += "\\p";
                
                global.msg[0] += scr_gettext("battle_name_header") + global.monstername[1];
                
                if (global.monstertype[1] == global.monstertype[0])
                    global.msg[0] += scr_gettext("battle_name_b");
            }
            
            global.msg[0] += "\\W &";
            
            if (global.monster[2] == 1)
            {
                with (global.monsterinstance[2])
                    scr_mercystandard();
                
                if (global.monsterinstance[2].mercy < 0 && global.flag[22] == 0)
                    global.msg[0] += "\\Y";
                
                if (global.monsterinstance[2].mercy < 0 && global.flag[22] == 2)
                    global.msg[0] += "\\p";
                
                global.msg[0] += scr_gettext("battle_name_header") + global.monstername[2];
                
                if (global.monstertype[2] == global.monstertype[1])
                    global.msg[0] += scr_gettext("battle_name_c");
            }
            
            global.msg[1] = "%%%";
            break;
        
        case 7:
            global.msg[0] = "";
            
            for (i = 0; i < 3; i += 1)
            {
                if (global.monster[i] == 1)
                {
                    with (global.monsterinstance[i])
                        scr_mercystandard();
                    
                    if (global.monsterinstance[i].mercy < 0 && global.flag[22] == 0)
                        global.msg[0] = "\\Y";
                    
                    if (global.monsterinstance[i].mercy < 0 && global.flag[22] == 2)
                        global.msg[0] = "\\p";
                }
            }
            
            global.msg[0] += scr_gettext("battle_mercy_spare");
            
            if (global.mercy == 0)
                global.msg[0] += " &\\W" + scr_gettext("battle_mercy_flee");
            
            break;
        
        case 9:
            global.msg[0] = scr_gettext("item_menub_header") + global.itemnameb[0];
            
            if (global.item[1] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[1];
            
            global.msg[0] += "&";
            
            if (global.item[2] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[2];
            
            if (global.item[3] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[3];
            
            global.msg[0] += "&" + scr_gettext("item_menub_page1");
            global.msg[1] = "%%%";
            break;
        
        case 10:
            global.msg[0] = scr_gettext("item_menub_header") + global.itemnameb[4];
            
            if (global.item[5] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[5];
            
            global.msg[0] += "&";
            
            if (global.item[6] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[6];
            
            if (global.item[7] != 0)
                global.msg[0] += scr_gettext("item_menub_header") + global.itemnameb[7];
            
            global.msg[0] += "&" + scr_gettext("item_menub_page2");
            global.msg[1] = "%%%";
            break;
        
        case 11:
            global.msg[0] += " &";
            
            if (global.item[8] < 99)
                global.msg[0] += scr_gettext("recover_hp", string(global.item[8]));
            else
                global.msg[0] += scr_gettext("recover_hp_max");
            
            break;
        
        case 14:
            i = round(random(20));
            
            if (i == 0 || i == 1)
                global.msg[0] = scr_gettext("SCR_TEXT_111");
            
            if (i == 2)
                global.msg[0] = scr_gettext("SCR_TEXT_112");
            
            if (i > 3)
                global.msg[0] = scr_gettext("SCR_TEXT_113");
            
            if (i == 3)
                global.msg[0] = scr_gettext("SCR_TEXT_114");
            
            if (global.xpreward[3] > 0 || global.goldreward[3] > 0)
                global.msg[0] = scr_gettext("SCR_TEXT_121", string(global.xpreward[3]), string(global.goldreward[3]));
            
            break;
        
        case 1068:
            global.msg[0] = scr_gettext("SCR_TEXT_6689");
            global.choices[0] = 1;
            global.choices[1] = 0;
            global.choices[2] = 0;
            global.choices[3] = 0;
            global.choices[4] = 0;
            global.choices[5] = 0;
            break;
        
        case 1200:
            global.msg[0] = scr_gettext("SCR_TEXT_10_1");
            global.choices[0] = 1;
            global.choices[1] = 1;
            global.choices[2] = 0;
            global.choices[3] = 1;
            global.choices[4] = 1;
            global.choices[5] = 0;
            break;
        
        case 1201:
            global.msg[0] = scr_gettext("SCR_TEXT_10_2");
            global.choices[0] = 1;
            global.choices[1] = 0;
            global.choices[2] = 0;
            global.choices[3] = 1;
            global.choices[4] = 0;
            global.choices[5] = 0;
            break;
    }
}
