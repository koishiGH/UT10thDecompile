direction += diramt;
image_xscale += growamt;
image_yscale += growamt;

if (wobble != 0)
{
    direction += (sin(wobbleSiner) * wobble);
    wobbleSiner += 0.5;
}

if (leave)
    speed += 0.08;
