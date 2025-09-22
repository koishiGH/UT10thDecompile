first_one = instance_number(obj_doghole_bulletgen) == 1;

if (!first_one)
    exit;

battlegroup_number = -1;
turn_counter = 0;

with (obj_monsterparent)
{
    other.battlegroup_number = battlegroup_number;
    other.turn_counter = turn_counter;
    break;
}

global.msg[0] = "* [missing text]";

if (battlegroup_number == 201)
{
    rtext = choose(1, 2);
    
    switch (rtext)
    {
        case 1:
            if (instance_exists(obj_doghole_abberant))
                global.msg[0] = "* Abberant tells tales of&  a tailed hero.";
            else
                global.msg[0] = "* Mr. Sunshine makes shadows&  and allegorically believes&  them as real.";
            
            break;
        
        case 2:
            if (instance_exists(obj_doghole_mrsunshine))
                global.msg[0] = "* Mr. Sunshine makes shadows&  and allegorically believes&  them as real.";
            else
                global.msg[0] = "* Abberant tells tales of&  a tailed hero.";
            
            break;
    }
}

attack_id = (turn_counter + 1) % 2;

if (!instance_exists(obj_doghole_abberant))
    attack_id = 0;

attack_timer = 0;

switch (attack_id)
{
    case 0:
        global.turntimer = 280;
        global.firingrate = 9;
        global.border = 19;
        SCR_BORDERSETUP();
        
        if (!instance_exists(obj_doghole_mrsunshine))
            global.turntimer += 20;
        
        break;
    
    case 1:
        global.turntimer = 280;
        global.firingrate = 9;
        global.border = 54;
        SCR_BORDERSETUP();
        break;
    
    default:
        global.turntimer = 180;
        global.firingrate = 9;
        global.border = 19;
        SCR_BORDERSETUP();
        break;
}

dmg = 0;
rate = global.firingrate;
