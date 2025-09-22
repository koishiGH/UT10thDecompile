alpha = -1;
friction = 0.065;
vspeed = -2;
phase = 0;
phasetimer = 0;
mode = global.gameover_mode;
sel = 0;
global.kills = 0;

if (mode == 1 && global.myxb != undefined && global.myyb != undefined)
{
    phase = 2;
    instance_create(global.myxb, global.myyb, obj_heartdefeated);
    vspeed = 0;
}
