if (mercymod > 10 && global.monsterhp[myself] == global.monstermaxhp[myself])
    global.goldreward[3] += 145;

x -= 96;
y -= 74;
scr_monsterdefeat();

with (mypart1)
    instance_destroy();
