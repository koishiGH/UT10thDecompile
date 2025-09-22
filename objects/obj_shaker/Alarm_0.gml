var cam = view_camera[myview];

if (hshake != 0)
{
    if (hshake < 0)
    {
        camera_set_view_pos(cam, camera_get_view_x(cam) + hshake, camera_get_view_y(cam));
        hshake += 1;
    }
    
    if (hshake > 0)
        camera_set_view_pos(cam, camera_get_view_x(cam) + hshake, camera_get_view_y(cam));
    
    hshake = -hshake;
}

if (vshake != 0)
{
    if (vshake > 0)
        camera_set_view_pos(cam, camera_get_view_x(cam), camera_get_view_y(cam) + vshake);
    
    if (vshake < 0)
    {
        camera_set_view_pos(cam, camera_get_view_x(cam), camera_get_view_y(cam) + vshake);
        vshake += 1;
    }
    
    vshake = -vshake;
}

alarm[myview] = shakespeed;

if (hshake == 0 && vshake == 0)
    instance_destroy();
