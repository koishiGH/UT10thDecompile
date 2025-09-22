if (!first_one)
{
    instance_destroy();
    exit;
}

switch (attack_id)
{
    case 0:
        if (attack_timer == 0)
        {
            if (instance_exists(obj_doghole_abberant))
            {
                with (instance_create(0, 0, obj_doghole_dogknight_bullet))
                    hairActive = !instance_exists(obj_doghole_mrsunshine);
            }
            
            with (obj_doghole_mrsunshine_body)
                pinwheel_con = 0;
        }
        
        if (global.turntimer < 2)
        {
            with (obj_doghole_mrsunshine_bullet)
                leave = true;
        }
        
        break;
    
    case 1:
        if (attack_timer == 0)
            instance_create(640, 0, obj_doghole_dogsword_bullet);
        
        break;
}

attack_timer++;
