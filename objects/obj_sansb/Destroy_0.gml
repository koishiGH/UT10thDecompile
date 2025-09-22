if (mercymod > 10 && global.monsterhp[myself] == global.monstermaxhp[myself])
    global.goldreward[3] += 40;

scr_monsterdefeat();

with (mypart1)
    instance_destroy();
