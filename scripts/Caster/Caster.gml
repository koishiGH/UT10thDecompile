function caster_loop(arg0, arg1, arg2)
{
    return audio_play_sound(arg0, 120, true, arg1, 0, arg2);
}

function caster_play(arg0, arg1, arg2)
{
    return audio_play_sound(arg0, 100, false, arg1, 0, arg2);
}

function caster_free(arg0)
{
    if (arg0 != all)
        audio_stop_sound(arg0);
    else
        audio_stop_all();
}

function caster_stop(arg0)
{
    caster_free(arg0);
}
