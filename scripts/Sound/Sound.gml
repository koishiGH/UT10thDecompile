function snd_play(arg0)
{
    audio_play_sound(arg0, 80, false);
}

function snd_stop(arg0)
{
    audio_stop_sound(arg0);
}

function snd_isplaying(arg0)
{
    return audio_is_playing(arg0);
}

function snd_loop(arg0)
{
    return audio_play_sound(arg0, 80, true);
}
