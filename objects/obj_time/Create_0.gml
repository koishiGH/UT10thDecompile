up = 0;
down = 0;
left = 0;
right = 0;
quit = 0;
try_up = 0;
try_down = 0;
try_left = 0;
try_right = 0;
canquit = 1;
h_skip = 0;
time = 0;
paused = false;
queued_methods = [];
global.locale = os_get_language() + "_" + string_upper(os_get_region());
global.language = substr(global.locale, 1, 2);

if (global.language != "ja")
    global.language = "en";

global.language = "en";
control_init();
config_load_controls();
