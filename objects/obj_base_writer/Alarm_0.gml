if (stringpos >= string_length(originalstring))
    exit;

var advance = 1;

if (global.typer == 111)
    advance += 1;

var dosound = 0;
var delay = textspeed;

while (stringpos < string_length(originalstring) && advance > 0)
{
    stringpos++;
    var ch = string_char_at(originalstring, stringpos);
    
    if (ch == "^")
    {
        stringpos++;
        ch = string_char_at(originalstring, stringpos);
        
        if (ch != "" && ch != "0")
        {
            var n = real(ch);
            delay = n * 10;
            advance = 1;
        }
    }
    else if (ch == "\\")
    {
        stringpos++;
        ch = string_char_at(originalstring, stringpos);
        
        if (ch == "S")
        {
            stringpos++;
            var sfxtype = string_char_at(originalstring, stringpos);
            
            if (sfxtype == "+")
                sound_enable = 1;
            else if (sfxtype == "-")
                sound_enable = 0;
        }
        else if (ch == "z")
        {
            stringpos++;
            advance--;
            
            if (sound_enable)
                dosound = 1;
        }
        else if (ch == "E" || ch == "F" || ch == "M" || ch == "T" || ch == "*")
        {
            stringpos++;
        }
    }
    else if (ch != "/" && ch != "%" && ch != "&")
    {
        advance--;
        
        if (sound_enable)
            dosound = 1;
    }
}

alarm[0] = delay;

if (dosound)
{
    var ch = string_char_at(originalstring, stringpos);
    
    if (ch != " " && ch != "　")
    {
        snd_stop(txtsound);
        snd_play(txtsound);
    }
}
