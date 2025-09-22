if (skippable && control_check_pressed(1))
{
    stringpos = string_length(originalstring);
    control_clear(1);
}

if (control_check_pressed(0))
    event_user(0);
