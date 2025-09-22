function scr_gameoverb()
{
    global.hp = 0;
    audio_stop_all();
    
    if (instance_exists(obj_heart))
    {
        global.myxb = obj_heart.x;
        global.myyb = obj_heart.y;
    }
    
    __room_goto(room_gameover);
}
