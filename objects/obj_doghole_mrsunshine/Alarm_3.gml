if (mypart1.hurt != 1)
{
    dmgwriter = instance_create((x + (obj_doghole_mrsunshine_body.sprite_width / 2)) - 40, y, obj_dmgwriter);
    global.damage = takedamage;
    
    with (dmgwriter)
        dmg = global.damage;
    
    mypart1.hurt = 1;
    remface = obj_doghole_mrsunshine_body.head_sprite;
    snd_play(snd_damage);
    alarm[8] = 11;
}

if (sha == 0)
    sha = x;

x = sha + shudder;

with (obj_doghole_mrsunshine_body)
    x = xstart + other.shudder;

if (shudder < 0)
{
    shudder = -(shudder + 1);
}
else
{
    shudder = -shudder;
    obj_doghole_mrsunshine_body.head_sprite = spr_mrsunshine_head_look;
}

if (shudder == 0)
{
    sha = 0;
    global.hurtanim[myself] = 2;
    obj_doghole_mrsunshine_body.head_sprite = remface;
    exit;
}

alarm[3] = 2;
