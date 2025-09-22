function SCR_TEXTTYPE()
{
    if (argument0 != 0)
        global.typer = argument0;
    
    if (global.typer == 1)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, x + (global.idealborder[1] - 55), 1, 1, SND_TXT2, 16, 32);
    
    if (global.typer == 2)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 190, 43, 1, SND_TXT1, 9, 20);
    
    if (global.typer == 3)
        SCR_TEXTSETUP(fnt_curs, 8421376, x, y, x + 100, 39, 3, SND_TXT1, 10, 10);
    
    if (global.typer == 5)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, SND_TXT1, 8, 18);
    
    if (global.typer == 10)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, snd_nosound, 8, 18);
    
    if (global.typer == 11)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 2, SND_TXT2, 9, 18);
    
    if (global.typer == 17)
        SCR_TEXTSETUP(fnt_comicsans, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, snd_txtsans, 8, 18);
    
    if (global.typer == 19)
        global.typer = 18;
    
    if (global.typer == 21)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 4, snd_nosound, 10, 18);
    
    if (global.typer == 23)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 310, 0, 1, SND_TXT1, 8, 18);
    
    if (global.typer == 25)
    {
        if (global.language == "ja")
            SCR_TEXTSETUP(fnt_ja_plainsmall, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, SND_TXT1, 10, 15);
        else
            SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, SND_TXT1, 8, 18);
    }
    
    if (global.typer == 30)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 9999, 0, 2, snd_txtasg, 20, 36);
    
    if (global.typer == 31)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, 9999, 0, 2, snd_txtasg, 12, 18);
    
    if (global.typer == 33)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 190, 43, 1, SND_TXT1, 9, 20);
    
    if (global.typer == 48)
        SCR_TEXTSETUP(fnt_comicsans, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, snd_txtsans2, 8, 18);
    
    if (global.typer == 55)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 999, 0, 2, snd_nosound, 9, 20);
    
    if (global.typer == 60)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 2, snd_txtasg, 8, 18);
    
    if (global.typer == 61)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, x + 99999, 0, 2, snd_nosound, 16, 32);
    
    if (global.typer == 62)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 200, 0, 3, snd_txtasg, 9, 20);
    
    if (global.typer == 63)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 200, 0, 2, snd_txtasg, 9, 20);
    
    if (global.typer == 64)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 200, 2, 3, snd_txtasg, 9, 20);
    
    if (global.typer == 73)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, x + 99999, 0, 5, snd_nosound, 16, 32);
    
    if (global.typer == 80)
        SCR_TEXTSETUP(fnt_comicsans, 0, x, y, x + 200, 0, 1, snd_txtsans, 10, 20);
    
    if (global.typer == 92)
        SCR_TEXTSETUP(fnt_plain, 16777215, x, y, x + 190, 43, 1, SND_TXT1, 9, 20);
    
    if (global.typer == 100)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 1, snd_nosound, 8, 18);
    
    if (global.typer == 104)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 999, 0, 4, snd_nosound, 16, 34);
    
    if (global.typer == 105)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 999, 0, 3, snd_nosound, 16, 34);
    
    if (global.typer == 106)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, 999, 0, 3, snd_nosound, 8, 18);
    
    if (global.typer == 107)
        SCR_TEXTSETUP(fnt_comicsans, 0, x + 5, y, x + 200, 0, 1, snd_txtsans, 10, 20);
    
    if (global.typer == 109)
        SCR_TEXTSETUP(fnt_comicsans, 0, x + 5, y, x + 200, 0, 1, snd_txtsans, 10, 20);
    
    if (global.typer == 110)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 9999, 0, 2, snd_txtsans, 20, 36);
    
    if (global.typer == 111)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 190, 43, 1, SND_TXT1, 9, 20);
    
    if (global.typer == 112)
        SCR_TEXTSETUP(fnt_maintext, 16777215, x + 20, y + 20, camera_get_view_x(view_camera[view_current]) + 290, 0, 2, snd_nosound, 9, 18);
    
    if (global.typer == 113)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 9999, 0, 1, snd_nosound, 16, 32);
    
    if (global.typer == 114)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 9999, 0, 3, snd_txtasg, 20, 36);
    
    if (global.typer == 118)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, 9999, 0, 2, snd_nosound, 16, 32);
    
    if (global.typer == 121)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, x + 99999, 0, 3, snd_nosound, 16, 32);
    
    if (global.typer == 121)
        SCR_TEXTSETUP(fnt_main, 16777215, x + 20, y + 20, x + 99999, 0, 3, snd_nosound, 16, 32);
    
    if (global.typer == 122)
        SCR_TEXTSETUP(fnt_plain, 0, x, y, x + 200, 2, 2, snd_nosound, 9, 20);
    
    if (global.language == "ja")
    {
        if (myfont == fnt_main)
        {
            myfont = fnt_ja_main;
            spacing = (spacing * 26) / 16;
            
            if (vspacing == 32)
                vspacing = 36;
            
            if (global.typer == 30 || global.typer == 32 || global.typer == 114 || global.typer == 115)
                spacing -= 2;
        }
        
        if (myfont == fnt_maintext)
        {
            myfont = fnt_ja_maintext;
            spacing = (spacing * 13) / 8;
            vspacing = 19;
        }
        
        if (myfont == fnt_plain)
        {
            myfont = fnt_ja_plain;
            spacing = (spacing * 13) / 9;
        }
        
        if (myfont == fnt_plainbig)
        {
            myfont = fnt_ja_plainbig;
            spacing = (spacing * 58) / 25;
        }
        
        if (myfont == fnt_comicsans)
        {
            if (global.typer < 80)
            {
                myfont = fnt_ja_comicsans_big;
                htextscale = 0.5;
                vtextscale = 0.5;
                spacing = (spacing * 15) / 8;
            }
            else
            {
                myfont = fnt_ja_comicsans;
                spacing = (spacing * 15) / 10;
            }
        }
        
        if (myfont == fnt_papyrus)
        {
            if (global.typer == 22 || global.typer == 83)
            {
                myfont = fnt_ja_papyrus_btl;
                vspacing = 20;
                writingxend += 14;
            }
            else
            {
                myfont = fnt_ja_papyrus;
                htextscale = 0.5;
                vtextscale = 0.5;
                vspacing = 18;
                writingxend += 20;
                writingy -= 1;
            }
            
            vtext = 1;
        }
        
        if (global.typer == 11 || global.typer == 112)
            textspeed += 1;
    }
}
