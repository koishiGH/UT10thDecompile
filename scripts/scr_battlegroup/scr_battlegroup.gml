function scr_battlegroup()
{
    global.monster[0] = 0;
    global.monster[1] = 0;
    global.monster[2] = 0;
    global.monster[3] = 0;
    global.turn = 0;
    
    switch (global.battlegroup)
    {
        case 95:
            with (obj_battlebg)
                instance_destroy();
            
            global.monstertype[0] = 68;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.batmusic = mus_fastvania;
            global.msc = 0;
            global.battlelv = 0;
            global.actfirst = 0;
            global.extraintro = 0;
            global.msg[0] = "";
            global.monsterinstance[0] = instance_create(270, 110, obj_sansb);
            break;
        
        case 201:
            global.flag[500] = 0;
            global.monstertype[0] = 200;
            global.monstertype[1] = 201;
            global.monstertype[2] = 0;
            global.batmusic = mus_strongerer_monsters;
            caster_loop(global.batmusic, 0.8, 1);
            global.msc = 0;
            global.battlelv = 0;
            global.actfirst = 0;
            global.extraintro = 0;
            global.msg[0] = "* Ridiculously powerful enemies&  showed up!";
            global.monsterinstance[0] = instance_create(39, 30, obj_doghole_mrsunshine);
            global.monsterinstance[1] = instance_create(518, 168, obj_doghole_abberant);
            break;
    }
}
