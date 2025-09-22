if (global.manual_browser_app_surface)
{
    var _x = global.touch_app_surface_x;
    var _y = global.touch_app_surface_y;
    var w = global.touch_app_surface_w;
    var h = global.touch_app_surface_h;
    var rot = global.touch_app_surface_rotated ? -90 : 0;
    gpu_set_blendenable(false);
    draw_surface_ext(application_surface, _x, _y, w / surface_get_width(application_surface), h / surface_get_height(application_surface), rot, c_white, 1);
    gpu_set_blendenable(true);
}
