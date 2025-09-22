with (obj_sansb)
    timer_on = 1;

if (a_type == 0)
{
    global.turntimer = 405;
    scr_sbophy(40, -6, 60, 0);
    scr_sbophy(30, -6, 66, 2);
    scr_sbophy(20, -6, 100, 0);
    scr_sbophy(80, -6, 102, 0);
    
    for (var i = 0; i < 4; i++)
    {
        scr_sbophy(30, -14, 140 + (i * 20), 0);
        scr_sbophy(30, -14, 141 + (i * 20), 0);
        scr_sbophy(30, -14, 142 + (i * 20), 0);
        scr_sbophy(30, -14, 143 + (i * 20), 0);
        scr_sbophy(30, -14, 144 + (i * 20), 0);
        scr_sbophy(30, -14, 145 + (i * 20), 0);
        scr_sbophy(30, -14, 146 + (i * 20), 0);
        scr_sbophy(30, -14, 147 + (i * 20), 0);
        scr_sbophy(30, -14, 148 + (i * 20), 0);
        scr_sbophy(30, -14, 149 + (i * 20), 0);
        scr_sbophy(30, -14, 150 + (i * 20), 0);
    }
    
    for (var i = 0; i < 9; i++)
        scr_sbophy(50, -3, 180 + (26 * i), 2);
    
    for (var i = 0; i < 8; i++)
        scr_sbophyhang(64, 44, -3, 201 + (26 * i), 0);
    
    for (var i = 0; i < 3; i++)
    {
        scr_sbophy(30, -14, 258 + (i * 55), 0);
        scr_sbophy(30, -14, 259 + (i * 55), 0);
        scr_sbophy(30, -14, 260 + (i * 55), 0);
        scr_sbophy(30, -14, 261 + (i * 55), 0);
        scr_sbophy(30, -14, 262 + (i * 55), 0);
        scr_sbophy(30, -14, 263 + (i * 55), 0);
        scr_sbophy(30, -14, 264 + (i * 55), 0);
        scr_sbophy(30, -14, 265 + (i * 55), 0);
        scr_sbophy(30, -14, 266 + (i * 55), 0);
        scr_sbophy(30, -14, 267 + (i * 55), 0);
        scr_sbophy(30, -14, 268 + (i * 55), 0);
    }
}

if (a_type == 1)
{
    global.turntimer = 435;
    scr_sbophy(50, -6, 50, 0);
    scr_sbophy(50, -6, 52, 0);
    scr_sbophy(50, -6, 54, 0);
    scr_sbophy(70, -6, 84, 0);
    scr_sbophy(70, -6, 86, 0);
    scr_sbophy(70, -6, 88, 0);
    scr_sbophy(90, -6, 118, 0);
    scr_sbophy(90, -6, 120, 0);
    scr_sbophy(90, -6, 122, 0);
    scr_sbophy(20, -6, 128, 2);
    scr_sbophy(65, -6, 134, 0);
    scr_sbophy(30, -6, 182, 0);
    scr_sbophy(30, -6, 187, 2);
    scr_sbophy(30, -6, 192, 0);
    scr_sbophy(30, -6, 197, 2);
    scr_sbophy(30, -6, 202, 0);
    scr_sbophy(30, -6, 207, 2);
    scr_sbophy(20, -6, 227, 0);
    scr_sbophy(20, -6, 229, 0);
    scr_sbophy(20, -6, 231, 0);
    scr_sbophy(45, -6, 227, 2);
    scr_sbophy(60, -6, 251, 0);
    scr_sbophy(60, -6, 253, 0);
    scr_sbophy(60, -6, 255, 0);
    scr_sbophy(100, -6, 290, 0);
    scr_sbophy(100, -6, 292, 0);
    scr_sbophy(100, -6, 294, 0);
    scr_sbophy(60, 18, 404, 0);
}

if (a_type == 2)
{
    global.turntimer = 585;
    scr_sbophy(20, -6, 70, 0);
    scr_sbophy(50, -6, 70, 2);
    scr_sbophy(90, -6, 77, 1);
    scr_sbophy(20, -6, 84, 0);
    scr_sbophy(50, -6, 84, 2);
    scr_sbophy(90, -6, 91, 1);
    scr_sbophy(20, -6, 98, 0);
    scr_sbophy(50, -6, 98, 2);
    scr_sbophy(90, -6, 105, 1);
    scr_sbophy(70, -6, 130, 0);
    scr_sbophy(90, -6, 130, 2);
    scr_sbophyhang(130, 0, -6, 135, 1);
    scr_sbophy_horz(0, -2, 120, 0, 200);
    
    with (bone)
    {
        y += 15;
        ystart = y;
        riseTimer += 130;
        leaveTimer += 400;
    }
    
    scr_sbophy_horz(0, -2, 221, 0, 200);
    
    with (bone)
    {
        y += 15;
        ystart = y;
        riseTimer += 133;
        leaveTimer += 400;
    }
    
    scr_sbophy_horz(0, -2, 322, 0, 200);
    
    with (bone)
    {
        y += 15;
        ystart = y;
        riseTimer += 136;
        leaveTimer += 400;
    }
    
    for (var i = 0; i < 16; i++)
        scr_sbophyhang(130, 12, -7, 180 + (i * 15), 1);
    
    scr_sbophy(20, -6, 456, 0);
    scr_sbophy(20, -6, 458, 0);
    scr_sbophy(20, -6, 460, 0);
    scr_sbophy(90, -6, 470, 0);
    scr_sbophy(90, -6, 472, 0);
    scr_sbophy(90, -6, 474, 0);
    scr_sbophy(90, -6, 476, 0);
    scr_sbophy(90, -6, 510, 1);
    scr_sbophy(90, -6, 512, 1);
    scr_sbophy(90, -6, 514, 1);
    scr_sbophy(60, -6, 520, 0);
    scr_sbophy(40, -6, 526, 2);
}

if (a_type == 3)
{
    global.turntimer = 510;
    scr_sbophyhang(80, 60, 7, 80, 0);
    scr_sbophyhang(80, 60, 7, 100, 0);
    scr_sbophyhang(80, 60, 7, 120, 0);
    scr_sbophyhang(80, 60, 7, 140, 0);
    scr_sbophyhang(130, 100, 7, 140, 0);
    scr_sbophyhang(100, 60, 7, 160, 0);
    scr_sbophyhang(80, 60, 7, 180, 0);
    scr_sbophyhang(130, 100, 7, 180, 0);
    scr_sbophyhang(130, 60, -9, 200, 1);
    scr_sbophyhang(90, 60, -7, 230, 0);
    scr_sbophyhang(130, 110, -7, 230, 0);
    scr_sbophyhang(80, 60, -7, 250, 0);
    scr_sbophyhang(130, 100, -7, 250, 0);
    scr_sbophyhang(130, 60, 9, 260, 1);
    scr_sbophyhang(110, 60, -7, 300, 0);
    scr_sbophyhang(110, 60, -7, 330, 0);
    scr_sbophyhang(110, 60, -7, 360, 0);
    scr_sbophyhang(130, 110, 9, 370, 0);
    scr_sbophyhang(80, 60, 7, 400, 0);
    scr_sbophyhang(130, 100, 7, 400, 0);
    scr_sbophyhang(130, 60, -9, 410, 1);
    scr_sbophyhang(80, 60, 7, 430, 0);
    scr_sbophyhang(130, 100, 7, 430, 0);
    scr_sbophyhang(130, 60, -9, 440, 1);
    scr_sbophyhang(80, 60, 7, 460, 0);
    scr_sbophyhang(130, 100, 7, 460, 0);
    scr_sbophyhang(130, 60, -9, 470, 1);
    
    for (var i = 60; i < 520; i += 14)
        scr_sbophy(35, -14, i, 0);
}

if (a_type == 4)
{
    global.turntimer = 544;
    scr_sbophy(25, -5, 80, 0);
    scr_sbophy(25, -5, 82, 0);
    scr_sbophy(25, -5, 84, 0);
    scr_sbophy(25, -5, 86, 0);
    scr_sbophyhang(80, 60, -5, 110, 0);
    scr_sbophyhang(80, 60, -5, 112, 0);
    scr_sbophyhang(80, 60, -5, 114, 0);
    scr_sbophyhang(80, 60, -5, 116, 0);
    scr_sbophyhang(70, 50, -5, 150, 0);
    scr_sbophyhang(70, 50, -5, 152, 0);
    scr_sbophyhang(70, 50, -5, 154, 0);
    scr_sbophyhang(70, 50, -5, 156, 0);
    scr_sbophyhang(70, 50, -5, 190, 0);
    scr_sbophyhang(70, 50, -5, 192, 0);
    scr_sbophyhang(70, 50, -5, 194, 0);
    scr_sbophyhang(70, 50, -5, 196, 0);
    scr_sbophyhang(90, 70, -5, 230, 0);
    scr_sbophyhang(90, 70, -5, 232, 0);
    scr_sbophyhang(90, 70, -5, 234, 0);
    scr_sbophyhang(70, 50, -5, 270, 0);
    scr_sbophyhang(70, 50, -5, 272, 0);
    scr_sbophyhang(70, 50, -5, 274, 0);
    scr_sbophyhang(65, 50, -5, 310, 0);
    scr_sbophyhang(65, 50, -5, 312, 0);
    scr_sbophyhang(100, 70, -5, 327, 0, 1);
    scr_sbophyhang(65, 50, -5, 340, 0);
    scr_sbophyhang(65, 50, -5, 342, 0);
    scr_sbophyhang(100, 70, -5, 355, 0, 1);
    scr_sbophyhang(65, 50, -5, 370, 0);
    scr_sbophyhang(65, 50, -5, 372, 0);
    scr_sbophyhang(80, 55, -5, 408, 0);
    scr_sbophyhang(75, 50, -5, 448, 0);
    
    for (var i = 120; i < 467; i += 7)
        scr_sbophy(35, -21, 18 + i, 0);
}
