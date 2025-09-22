function scr_monstersetup()
{
    myself = 0;
    
    if (global.monster[1] == 1)
    {
        myself = 2;
        global.monster[2] = 1;
    }
    
    if (global.monster[0] == 1 && myself != 2)
    {
        myself = 1;
        global.monster[1] = 1;
    }
    
    if (global.monster[0] == 0)
    {
        myself = 0;
        global.monster[0] = 1;
    }
    
    if (global.monstertype[myself] == 68)
    {
        global.monstername[myself] = scr_gettext("monstername_68");
        global.monstermaxhp[myself] = 1;
        global.monsterhp[myself] = 1;
        global.monsteratk[myself] = 1;
        global.monsterdef[myself] = 1;
        global.xpreward[myself] = 0;
        global.goldreward[myself] = 0;
        global.itemrewardid = 0;
        global.itemrewardchance = 0;
    }
    
    if (global.monstertype[myself] == 200)
    {
        global.monstername[myself] = scr_gettext("monstername_10_1");
        global.monstermaxhp[myself] = 400;
        global.monsterhp[myself] = 400;
        global.monsteratk[myself] = 8;
        global.monsterdef[myself] = 8;
        global.xpreward[myself] = 387;
        global.goldreward[myself] = 294;
        global.itemrewardid = 0;
        global.itemrewardchance = 0;
    }
    
    if (global.monstertype[myself] == 201)
    {
        global.monstername[myself] = scr_gettext("monstername_10_2");
        global.monstermaxhp[myself] = 300;
        global.monsterhp[myself] = 300;
        global.monsteratk[myself] = 8;
        global.monsterdef[myself] = 13;
        global.xpreward[myself] = 322;
        global.goldreward[myself] = 217;
        global.itemrewardid = 0;
        global.itemrewardchance = 0;
    }
}
