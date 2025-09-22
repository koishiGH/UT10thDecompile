if (mercymod > 10 && global.monsterhp[myself] == global.monstermaxhp[myself])
    global.goldreward[3] += 196;

sprite_index = spr_mrsunshine_spared;
y += 16;
scr_monsterdefeat();

with (mypart1)
    instance_destroy();
