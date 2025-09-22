if (won == 1)
{
    if (!instance_exists(OBJ_WRITER))
    {
        global.gameover_mode = 0;
        __room_goto(global.currentroom);
        exit;
    }
}

if (won == 1)
{
    if (instance_exists(OBJ_WRITER))
    {
        if (OBJ_WRITER.halt != 0)
        {
            global.gameover_mode = 0;
            __room_goto(global.currentroom);
            exit;
        }
    }
}
