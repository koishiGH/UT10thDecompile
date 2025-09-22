if (mypart1.hurt != 1)
{
    dmgwriter = instance_create(obj_doghole_abberant_body.x - (wd * 0.5), obj_doghole_abberant_body.y - 80, obj_dmgwriter);
    global.damage = takedamage;
    
    with (dmgwriter)
        dmg = global.damage;
    
    mypart1.hurt = 1;
    snd_play(snd_damage);
    
    if (mercymod < 900)
    {
        HairCut();
        whatiheard = 3;
        con = 1;
    }
    
    alarm[8] = 11;
}

if (sha == 0)
    sha = x;

x = sha + shudder;

with (obj_doghole_abberant_body)
    x = xstart + other.shudder;

if (shudder < 0)
    shudder = -(shudder + 1);
else
    shudder = -shudder;

if (shudder == 0)
{
    sha = 0;
    global.hurtanim[myself] = 2;
    exit;
}

alarm[3] = 2;
