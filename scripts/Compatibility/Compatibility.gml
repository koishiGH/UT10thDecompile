layer_force_draw_depth(true, false);
surface_depth_disable(true);

function instance_create(arg0, arg1, arg2)
{
    return instance_create_depth(arg0, arg1, 0, arg2);
}
