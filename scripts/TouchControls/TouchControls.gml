function TouchRegion(arg0, arg1, arg2, arg3, arg4, arg5) constructor
{
    static markBoundingBoxDirty = function()
    {
        if (bboxDirty)
            exit;
        
        bboxDirty = true;
        var i = 0;
        var n = array_length(subRegions);
        
        while (i < n)
        {
            subRegions[i].markBoundingBoxDirty();
            i++;
        }
    };
    
    static setNormalizedTop = function(arg0)
    {
        self.normalizedTop = arg0;
        markBoundingBoxDirty();
    };
    
    static setWidthProportion = function(arg0)
    {
        self.widthProportion = arg0;
        markBoundingBoxDirty();
    };
    
    static getBoundingBox = function()
    {
        if (bboxDirty)
        {
            var bw = global.last_browser_width;
            var bh = global.last_browser_height;
            
            if (global.touch_app_surface_rotated)
            {
                var right = bw * (1 - normalizedTop);
                var left = bw * (1 - normalizedBottom);
                var top, bottom;
                
                if (widthProportion >= 0)
                {
                    top = bh * normalizedAnchorX;
                    bottom = top + (widthProportion * (right - left));
                    var limit = normalizedLimitX * bh;
                    
                    if (bottom > limit)
                    {
                        bottom = limit;
                        right = left + ((bottom - top) * (1 / widthProportion));
                    }
                }
                else
                {
                    bottom = bh * normalizedAnchorX;
                    top = bottom + (widthProportion * (right - left));
                    var limit = normalizedLimitX * bh;
                    
                    if (top < limit)
                    {
                        top = limit;
                        right = left + ((bottom - top) * (1 / abs(widthProportion)));
                    }
                }
                
                bboxArray[0] = left;
                bboxArray[1] = top;
                bboxArray[2] = right;
                bboxArray[3] = bottom;
            }
            else
            {
                var top = bh * normalizedTop;
                var bottom = bh * normalizedBottom;
                var left, right;
                
                if (widthProportion >= 0)
                {
                    left = bw * normalizedAnchorX;
                    right = left + (widthProportion * (bottom - top));
                    var limit = normalizedLimitX * bw;
                    
                    if (right > limit)
                    {
                        right = limit;
                        top = bottom - ((right - left) * (1 / widthProportion));
                    }
                }
                else
                {
                    right = bw * normalizedAnchorX;
                    left = right + (widthProportion * (bottom - top));
                    var limit = normalizedLimitX * bw;
                    
                    if (left < limit)
                    {
                        left = limit;
                        top = bottom - ((right - left) * (1 / abs(widthProportion)));
                    }
                }
                
                bboxArray[0] = left;
                bboxArray[1] = top;
                bboxArray[2] = right;
                bboxArray[3] = bottom;
            }
            
            bboxDirty = false;
        }
        
        return bboxArray;
    };
    
    static pointInBoundingBox = function(arg0, arg1)
    {
        var rect = getBoundingBox();
        return point_in_rectangle(arg0, arg1, rect[0], rect[1], rect[2], rect[3]);
    };
    
    static getSubRegionsAtPoint = function(arg0, arg1)
    {
        if (!pointInBoundingBox(arg0, arg1))
            return [];
        
        var res = [];
        var i = 0;
        var n = array_length(subRegions);
        
        while (i < n)
        {
            if (subRegions[i].pointInBoundingBox(arg0, arg1))
                array_push(res, subRegions[i]);
            
            i++;
        }
        
        return res;
    };
    
    static drawDebug = function()
    {
        draw_set_color(c_red);
        draw_set_alpha(0.5);
        var bbox = getBoundingBox();
        ossafe_fill_rectangle(bbox[0], bbox[1], bbox[2], bbox[3]);
        draw_set_alpha(1);
        var i = 0;
        var n = array_length(subRegions);
        
        while (i < n)
        {
            subRegions[i].drawDebug();
            i++;
        }
    };
    
    self.normalizedAnchorX = arg0;
    self.normalizedLimitX = arg1;
    self.normalizedTop = arg2;
    self.normalizedBottom = arg3;
    self.widthProportion = arg4;
    self.subRegions = arg5;
    var i = 0;
    var n = array_length(arg5);
    
    while (i < n)
    {
        arg5[i].parent = self;
        i++;
    }
    
    self.bboxArray = array_create(4, 0);
    self.bboxDirty = true;
}

function TouchSubRegion(arg0, arg1, arg2, arg3, arg4, arg5 = []) constructor
{
    static markBoundingBoxDirty = function()
    {
        if (bboxDirty)
            exit;
        
        bboxDirty = true;
        var i = 0;
        var n = array_length(subRegions);
        
        while (i < n)
        {
            subRegions[i].markBoundingBoxDirty();
            i++;
        }
    };
    
    static getBoundingBox = function()
    {
        if (bboxDirty)
        {
            var parentBbox = parent.getBoundingBox();
            var left, top, right, bottom;
            
            if (global.touch_app_surface_rotated)
            {
                if (isAnchoredLeft)
                {
                    left = parentBbox[2] - ((parentBbox[2] - parentBbox[0]) * normalizedBottom);
                    right = parentBbox[2] - ((parentBbox[2] - parentBbox[0]) * normalizedTop);
                    top = parentBbox[1] + ((parentBbox[3] - parentBbox[1]) * normalizedX);
                    bottom = top + ((right - left) * widthProportion);
                }
                else
                {
                    left = parentBbox[2] - ((parentBbox[2] - parentBbox[0]) * normalizedBottom);
                    right = parentBbox[2] - ((parentBbox[2] - parentBbox[0]) * normalizedTop);
                    bottom = parentBbox[3] - ((parentBbox[3] - parentBbox[1]) * normalizedX);
                    top = bottom - ((right - left) * widthProportion);
                }
            }
            else if (isAnchoredLeft)
            {
                top = parentBbox[1] + ((parentBbox[3] - parentBbox[1]) * normalizedTop);
                bottom = parentBbox[1] + ((parentBbox[3] - parentBbox[1]) * normalizedBottom);
                left = parentBbox[0] + ((parentBbox[2] - parentBbox[0]) * normalizedX);
                right = left + ((bottom - top) * widthProportion);
            }
            else
            {
                top = parentBbox[1] + ((parentBbox[3] - parentBbox[1]) * normalizedTop);
                bottom = parentBbox[1] + ((parentBbox[3] - parentBbox[1]) * normalizedBottom);
                right = parentBbox[2] - ((parentBbox[2] - parentBbox[0]) * normalizedX);
                left = right - ((bottom - top) * widthProportion);
            }
            
            bboxArray[0] = left;
            bboxArray[1] = top;
            bboxArray[2] = right;
            bboxArray[3] = bottom;
            bboxDirty = false;
        }
        
        return bboxArray;
    };
    
    static pointInBoundingBox = function(arg0, arg1)
    {
        var rect = getBoundingBox();
        return point_in_rectangle(arg0, arg1, rect[0], rect[1], rect[2], rect[3]);
    };
    
    static pointInRadius = function(arg0, arg1, arg2)
    {
        var rect = getBoundingBox();
        var centerX = (rect[0] + rect[2]) * 0.5;
        var centerY = (rect[1] + rect[3]) * 0.5;
        var radius = max(abs(rect[3] - rect[1]), abs(rect[2] - rect[0])) * 0.5 * arg2;
        return point_distance(centerX, centerY, arg0, arg1) <= radius;
    };
    
    static drawDebug = function()
    {
        draw_set_color(c_blue);
        draw_set_alpha(0.5);
        var bbox = getBoundingBox();
        ossafe_fill_rectangle(bbox[0], bbox[1], bbox[2], bbox[3]);
        draw_set_alpha(1);
        var i = 0;
        var n = array_length(subRegions);
        
        while (i < n)
        {
            subRegions[i].drawDebug();
            i++;
        }
    };
    
    static drawSprite = function(arg0, arg1, arg2)
    {
        var bbox = getBoundingBox();
        
        if (global.touch_app_surface_rotated)
            draw_sprite_ext(arg0, arg1, bbox[2], bbox[1], (bbox[3] - bbox[1]) / sprite_get_width(arg0), (bbox[2] - bbox[0]) / sprite_get_height(arg0), -90, c_white, arg2);
        else
            draw_sprite_ext(arg0, arg1, bbox[0], bbox[1], (bbox[2] - bbox[0]) / sprite_get_width(arg0), (bbox[3] - bbox[1]) / sprite_get_height(arg0), 0, c_white, arg2);
    };
    
    self.normalizedX = arg0;
    self.isAnchoredLeft = arg1;
    self.normalizedTop = arg2;
    self.normalizedBottom = arg3;
    self.widthProportion = arg4;
    self.parent = undefined;
    self.subRegions = arg5;
    var i = 0;
    var n = array_length(arg5);
    
    while (i < n)
    {
        arg5[i].parent = self;
        i++;
    }
    
    self.bboxArray = array_create(4, 0);
    self.bboxDirty = true;
}

function TouchableStruct() constructor
{
    static attemptInitialTouch = function(arg0, arg1)
    {
        return false;
    };
    
    static drag = function(arg0, arg1)
    {
    };
    
    static release = function(arg0, arg1)
    {
    };
}

global.touch_controls = false;
global.touch_controls_hidden = false;
global.touch_controls_hide_alpha = 1;
global.touch_controls_hide_hint_counter = 0;
global.touch_controls_gestures = array_create_ext(4, function()
{
    return 
    {
        type: -1,
        x: 0,
        y: 0,
        gameX: 0,
        gameY: 0,
        touchedStruct: undefined
    };
});
global.touch_buttons_held_previous = array_create(7, false);
global.touch_buttons_held = array_create(7, false);
global.touch_buttons_pressed = array_create(7, false);
global.touch_side_offset = 0.25;
global.touch_scale = 0.5;
global.touch_alpha = 0.3;
global.touch_configured = false;
global.touch_subregion_dpad = new TouchSubRegion(0, false, 0, 1, 1);
global.touch_region_directions = new TouchRegion(0, 0.475, 0.75, 0.95, 1.1, [global.touch_subregion_dpad]);
global.touch_subregion_confirm = new TouchSubRegion(0, false, 0, 0.375, 1);
global.touch_subregion_cancel = new TouchSubRegion(0, true, 0.625, 1, 1);
global.touch_subregion_buttons = new TouchSubRegion(0, true, 0, 1, 1, [global.touch_subregion_confirm, global.touch_subregion_cancel]);
global.touch_region_buttons = new TouchRegion(1, 0.525, 0.75, 0.95, -1.1, [global.touch_subregion_buttons]);
update_touch_regions();

function update_touch_regions()
{
    if (!global.touch_controls)
        exit;
    
    var normalizedTop = 0.75 - (global.touch_scale * 0.5);
    var widthProportion = 1.02 + (global.touch_side_offset * 0.73);
    global.touch_region_directions.setNormalizedTop(normalizedTop);
    global.touch_region_directions.setWidthProportion(widthProportion);
    global.touch_region_buttons.setNormalizedTop(normalizedTop);
    global.touch_region_buttons.setWidthProportion(-widthProportion);
}

global.manual_browser_app_surface = false;
global.fill_browser_size = false;
update_browser_size(640, 480);

function update_browser_size(arg0, arg1)
{
    global.last_browser_width = arg0;
    global.last_browser_height = arg1;
    var h = arg1;
    var w = arg1 * (4/3);
    var _x = (arg0 * 0.5) - (w * 0.5);
    var _y = 0;
    
    if (_x < 0)
    {
        h = arg0;
        w = h * (4/3);
        _x = arg0;
        _y = (arg1 * 0.5) - (w * 0.5);
        
        if (_y < 0)
        {
            w = arg1;
            h = w * 0.75;
            _x = (arg0 * 0.5) + (h * 0.5);
            _y = 0;
        }
        
        global.touch_app_surface_rotated = true;
    }
    else
    {
        global.touch_app_surface_rotated = false;
    }
    
    global.touch_app_surface_w = w;
    global.touch_app_surface_h = h;
    global.touch_app_surface_x = _x;
    global.touch_app_surface_y = _y;
    global.touch_region_directions.markBoundingBoxDirty();
    global.touch_region_buttons.markBoundingBoxDirty();
    display_set_gui_size(arg0, arg1);
    display_set_gui_maximize(1, 1, 0, 0);
}

if (os_type == os_gxgames)
{
    var info = os_get_info();
    
    if (ds_map_find_value(info, "mobile"))
        global.touch_controls = true;
    
    ds_map_destroy(info);
}

function enable_manual_orientation_flip()
{
    if (!global.touch_controls)
        exit;
    
    application_surface_draw_enable(false);
    global.manual_browser_app_surface = true;
}

function disable_manual_orientation_flip()
{
    if (!global.touch_controls)
        exit;
    
    application_surface_draw_enable(true);
    global.manual_browser_app_surface = false;
}

function enable_fill_browser_size()
{
    if (!global.touch_controls)
        exit;
    
    update_browser_size(window_get_width(), window_get_height());
    window_set_size(global.last_browser_width, global.last_browser_height);
    global.fill_browser_size = true;
}

function disable_fill_browser_size()
{
    if (!global.touch_controls)
        exit;
    
    update_browser_size(640, 480);
    window_set_size(640, 480);
    global.fill_browser_size = false;
}

function touch_controls_init()
{
    if (!global.touch_controls)
        exit;
    
    device_mouse_dbclick_enable(false);
    enable_fill_browser_size();
    enable_manual_orientation_flip();
}

function touch_controls_hint_hide()
{
    if (!global.touch_controls)
        exit;
    
    with (obj_touchcontrolsmenu)
        onOtherInputMethod();
    
    global.touch_controls_hide_hint_counter++;
    
    if (global.touch_controls_hide_hint_counter >= 5)
        global.touch_controls_hidden = true;
}

function touch_controls_hint_show()
{
    if (!global.touch_controls)
        exit;
    
    global.touch_controls_hidden = false;
    global.touch_controls_hide_hint_counter = 0;
}

function touch_controls_update()
{
    static attempted_fullscreen = false;
    
    if (!global.touch_controls)
        exit;
    
    if (global.fill_browser_size)
    {
        var curr_browser_width = window_get_width();
        var curr_browser_height = window_get_height();
        
        if (curr_browser_width != global.last_browser_width || curr_browser_height != global.last_browser_height)
        {
            window_set_size(curr_browser_width, curr_browser_height);
            update_browser_size(curr_browser_width, curr_browser_height);
        }
    }
    
    var configuring = instance_exists(obj_touchcontrolsmenu);
    
    for (var i = 0; i < 7; i++)
    {
        global.touch_buttons_held_previous[i] = global.touch_buttons_held[i];
        global.touch_buttons_held[i] = false;
        global.touch_buttons_pressed[i] = false;
    }
    
    for (var i = 0; i < 4; i++)
    {
        var pressed = device_mouse_check_button_pressed(i, mb_left);
        var held = pressed || device_mouse_check_button(i, mb_left);
        var _x, _y, gameX, gameY;
        
        if (!held)
        {
            _x = 0;
            _y = 0;
            gameX = 0;
            gameY = 0;
        }
        else
        {
            _x = device_mouse_x_to_gui(i);
            _y = device_mouse_y_to_gui(i);
            
            if (global.touch_app_surface_rotated)
            {
                gameX = 640 * ((_y - global.touch_app_surface_y) / global.touch_app_surface_w);
                gameY = 480 * ((global.touch_app_surface_x - _x) / global.touch_app_surface_h);
            }
            else
            {
                gameX = 640 * ((_x - global.touch_app_surface_x) / global.touch_app_surface_w);
                gameY = 480 * ((_y - global.touch_app_surface_y) / global.touch_app_surface_h);
            }
        }
        
        if (pressed)
        {
            if (!attempted_fullscreen)
            {
                attempted_fullscreen = true;
                
                if (os_type == os_gxgames)
                    window_post_message("attempt_enter_fullscreen");
            }
            
            touch_controls_hint_show();
            
            with (global.touch_controls_gestures[i])
            {
                x = _x;
                y = _y;
                self.gameX = gameX;
                self.gameY = gameY;
                
                if (type != -1)
                    touch_control_gesture_release();
                
                if (configuring)
                {
                    obj_touchcontrolsmenu.attemptInitialTouch(self);
                    
                    if (touchedStruct != undefined)
                    {
                        type = 3;
                        break;
                    }
                }
                
                if (global.touch_subregion_confirm.pointInBoundingBox(_x, _y))
                {
                    type = 1;
                    global.touch_buttons_pressed[0] = true;
                    global.touch_buttons_held[0] = true;
                }
                else if (global.touch_subregion_cancel.pointInBoundingBox(_x, _y))
                {
                    type = 2;
                    global.touch_buttons_pressed[1] = true;
                    global.touch_buttons_held[1] = true;
                }
                else if (global.touch_subregion_dpad.pointInRadius(_x, _y, 1.5))
                {
                    type = 0;
                    touch_control_handle_dpad(_x, _y, true);
                }
            }
        }
        else if (held)
        {
            with (global.touch_controls_gestures[i])
            {
                x = _x;
                y = _y;
                self.gameX = gameX;
                self.gameY = gameY;
                
                switch (type)
                {
                    case 1:
                        global.touch_buttons_held[0] = true;
                        break;
                    
                    case 2:
                        global.touch_buttons_held[1] = true;
                        break;
                    
                    case 0:
                        touch_control_handle_dpad(_x, _y, false);
                        break;
                    
                    case 3:
                        touchedStruct.drag(gameX, gameY);
                        break;
                }
            }
        }
        else
        {
            with (global.touch_controls_gestures[i])
                touch_control_gesture_release();
        }
    }
    
    if (global.touch_controls_hidden)
    {
        global.touch_controls_hide_alpha -= 0.05;
        
        if (global.touch_controls_hide_alpha <= 0)
            global.touch_controls_hide_alpha = 0;
    }
    else
    {
        global.touch_controls_hide_alpha = 1;
    }
}

function touch_control_handle_dpad(arg0, arg1, arg2)
{
    static angles = [90, 270, 180, 0];
    
    var rect = global.touch_subregion_dpad.getBoundingBox();
    var length = max(abs(rect[3] - rect[1]), abs(rect[2] - rect[0]));
    var centerX = (rect[0] + rect[2]) * 0.5;
    var centerY = (rect[1] + rect[3]) * 0.5;
    var dist = point_distance(centerX, centerY, arg0, arg1);
    
    if (dist < (length * 0.1))
        exit;
    
    var dir = point_direction(centerX, centerY, arg0, arg1);
    var angleOffset = global.touch_app_surface_rotated ? -90 : 0;
    
    for (var i = 0; i < 4; i++)
    {
        if (abs(angle_difference(dir, angles[i] + angleOffset)) <= 60)
        {
            if (!global.touch_buttons_held_previous[3 + i] || arg2)
            {
                global.touch_buttons_held[3 + i] = true;
                global.touch_buttons_pressed[3 + i] = true;
            }
            else
            {
                global.touch_buttons_held[3 + i] = true;
            }
        }
    }
}

function touch_control_gesture_release()
{
    switch (type)
    {
        case 3:
            touchedStruct.release(self.gameX, self.gameY);
            break;
    }
    
    type = -1;
    touchedStruct = undefined;
}

function touch_controls_draw()
{
    if (instance_exists(obj_activatebrowser))
        exit;
    
    if (global.touch_controls_hidden && global.touch_controls_hide_alpha <= 0)
        exit;
    
    var alpha = global.touch_alpha * global.touch_controls_hide_alpha;
    
    for (var i = 0; i < 4; i++)
        global.touch_subregion_dpad.drawSprite(spr_touch_dpad, i + (global.touch_buttons_held[3 + i] ? 4 : 0), alpha);
    
    global.touch_subregion_confirm.drawSprite(spr_touch_confirm, global.touch_buttons_held[0] ? 1 : 0, alpha);
    global.touch_subregion_cancel.drawSprite(spr_touch_cancel, global.touch_buttons_held[1] ? 1 : 0, alpha);
}

function touch_controls_update_control(arg0, arg1)
{
    if (!global.touch_controls)
        return arg1;
    
    var pressed = global.touch_buttons_pressed[arg0];
    var held = global.touch_buttons_held[arg0];
    
    if (held)
        touch_controls_hint_show();
    
    if (pressed)
        global.control_state[arg0] = false;
    
    return arg1 || held;
}
