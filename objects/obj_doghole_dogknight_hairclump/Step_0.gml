if (fade)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

spinAmount = lerp(spinAmount, 1, 0.2);
image_angle += (spinAmount * spinDir);
