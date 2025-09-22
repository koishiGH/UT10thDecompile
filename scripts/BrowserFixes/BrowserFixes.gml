function __room_goto(arg0)
{
    with (all)
    {
        event_perform(ev_other, ev_room_end);
        
        if (!persistent)
            instance_destroy(id, false);
    }
    
    global.__room = arg0;
    var info = room_get_info(arg0, true, true, false, false, false);
    room_width = info.width;
    room_height = info.height;
    view_enabled = info.enableViews;
    var i = 0;
    var n = array_length(info.views);
    
    while (i < n)
    {
        var v = info.views[i];
        view_visible[i] = v.visible;
        view_camera[i] = v.cameraID;
        camera_set_view_pos(view_camera[i], v.xview, v.yview);
        camera_set_view_size(view_camera[i], v.wview, v.hview);
        i++;
    }
    
    i = 0;
    n = array_length(info.instances);
    
    while (i < n)
    {
        var inst = info.instances[i];
        var precreate = 
        {
            image_xscale: inst.xscale,
            image_yscale: inst.yscale,
            image_angle: inst.angle,
            image_index: inst.image_index,
            image_speed: inst.image_speed,
            image_blend: inst.colour
        };
        
        if (is_callable(struct_get_from_hash(inst, variable_get_hash("pre_creation_code"))))
        {
            with (precreate)
                inst.pre_creation_code();
        }
        
        var obj = instance_create_depth(inst.x, inst.y, 0, asset_get_index(inst.object_index), precreate);
        
        if (is_callable(struct_get_from_hash(inst, variable_get_hash("creation_code"))))
        {
            with (obj)
                inst.creation_code();
        }
        
        i++;
    }
    
    if (is_callable(struct_get_from_hash(info, variable_get_hash("creationCode"))))
        info.creationCode();
    
    with (all)
        event_perform(ev_other, ev_room_start);
}
