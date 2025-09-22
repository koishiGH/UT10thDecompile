var prevScissor = gpu_get_scissor();
gpu_set_scissor(obj_lborder.x, obj_uborder.y, obj_rborder.x - obj_lborder.x, obj_dborder.y - obj_uborder.y);

if (type == 0)
    image_blend = c_white;
else if (type == 1)
    image_blend = #14A9FF;

draw_sprite_ext(spr_s_bonebul_top, 0, x, y + 10, 1, 1, 90, image_blend, 1);

if (type == 0)
    draw_set_color(c_white);
else if (type == 1)
    draw_set_color(#14A9FF);

ossafe_fill_rectangle(x + 5, y + 2, (x + width) - 5, y + 7);
draw_sprite_ext(spr_s_bonebul_bottom, 0, (x + width) - 6, y + 10, 1, 1, 90, image_blend, 1);
gpu_set_scissor(prevScissor);
