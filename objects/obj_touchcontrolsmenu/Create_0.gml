function Slider(arg0, arg1, arg2, arg3, arg4, arg5) : TouchableStruct() constructor
{
    static draw = function()
    {
        draw_set_color(c_white);
        ossafe_fill_rectangle(x, (y + (height * 0.5)) - 2, x + width, y + (height * 0.5) + 4);
        var val = getter();
        var _x = x + (val * (width - 4));
        ossafe_fill_rectangle(_x, y, _x + 4, y + height);
    };
    
    static attemptInitialTouch = function(arg0, arg1)
    {
        if (point_in_rectangle(arg0, arg1, x, y, x + width, y + height))
        {
            drag(arg0, arg1);
            return true;
        }
        
        return false;
    };
    
    static drag = function(arg0, arg1)
    {
        var val = clamp((arg0 - x) / width, 0, 1);
        setter(val);
    };
    
    self.x = arg0;
    self.y = arg1;
    self.width = arg2;
    self.height = arg3;
    self.getter = arg4;
    self.setter = arg5;
}

function Button(arg0, arg1, arg2, arg3, arg4, arg5) : TouchableStruct() constructor
{
    static update = function()
    {
        if (highlightCounter > 0)
            highlightCounter--;
    };
    
    static draw = function()
    {
        draw_set_color(c_white);
        ossafe_fill_rectangle(x, y, x + width, y + height);
        draw_set_color((highlightCounter > 0) ? c_gray : c_black);
        ossafe_fill_rectangle(x + 2, y + 2, (x + width) - 2, (y + height) - 2);
        draw_set_color(c_white);
        scr_setfont(fnt_main);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(x + (width * 0.5), y + (height * 0.5), text);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    };
    
    static attemptInitialTouch = function(arg0, arg1)
    {
        if (point_in_rectangle(arg0, arg1, x, y, x + width, y + height))
        {
            drag(arg0, arg1);
            return true;
        }
        
        return false;
    };
    
    static drag = function(arg0, arg1)
    {
        if (point_in_rectangle(arg0, arg1, x, y, x + width, y + height))
            highlightCounter = 2;
    };
    
    static release = function(arg0, arg1)
    {
        if (point_in_rectangle(arg0, arg1, x, y, x + width, y + height))
            clicked();
    };
    
    self.x = arg0;
    self.y = arg1;
    self.width = arg2;
    self.height = arg3;
    self.text = arg4;
    self.clicked = arg5;
    self.highlightCounter = 0;
}

sliderSideOffset = new Slider(16, 100, 250, 32, function()
{
    return global.touch_side_offset;
}, function(arg0)
{
    global.touch_side_offset = arg0;
    update_touch_regions();
});
sliderScale = new Slider(374, 100, 250, 32, function()
{
    return global.touch_scale;
}, function(arg0)
{
    global.touch_scale = arg0;
    update_touch_regions();
});
buttonDone = new Button(256, 164, 128, 48, "Finish", function()
{
    snd_play(snd_select);
    global.touch_configured = true;
    config_save_controls();
    
    if (global.__room == room_touch_configure)
    {
        __room_goto(room_menu);
    }
    else
    {
        with (obj_browsermenu)
            phase = 2;
        
        instance_destroy();
    }
});

attemptInitialTouch = function(arg0)
{
    if (fadeAlpha < 1)
        exit;
    
    if (switchToMainControls == 1)
    {
        switchToMainControls = 0;
        exit;
    }
    
    if (sliderSideOffset.attemptInitialTouch(arg0.gameX, arg0.gameY))
    {
        arg0.touchedStruct = sliderSideOffset;
        exit;
    }
    
    if (sliderScale.attemptInitialTouch(arg0.gameX, arg0.gameY))
    {
        arg0.touchedStruct = sliderScale;
        exit;
    }
    
    if (doneBuffer <= 0 && buttonDone.attemptInitialTouch(arg0.gameX, arg0.gameY))
    {
        arg0.touchedStruct = buttonDone;
        exit;
    }
};

onOtherInputMethod = function()
{
    if (otherInputMethodBuffer > 0)
        exit;
    
    if (switchToMainControls == 0)
    {
        switchToMainControls = 1;
        otherInputMethodBuffer = 2;
        switchToMainControlsCancelTimer = 90;
    }
    else if (switchToMainControls == 1)
    {
        global.touch_controls_hidden = true;
        switchToMainControls = 2;
    }
};

doneBuffer = (global.__room == room_touch_configure) ? 30 : 8;
otherInputMethodBuffer = 10;
fadeAlpha = (global.__room == room_touch_configure) ? 0 : 1;
switchToMainControls = 0;
switchToMainControlsCancelTimer = 0;
