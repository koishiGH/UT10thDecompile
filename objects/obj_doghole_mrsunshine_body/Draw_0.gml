var xx = x - (sprite_get_xoffset(sprite_index) * 2);
var yy = y - (sprite_get_yoffset(sprite_index) * 2);
var head_isnormal = head_sprite != spr_mrsunshine_head_look;
var head_xoffset = !head_isnormal * random_range(-2, 2);
var head_yoffset = !head_isnormal * random_range(-2, 2);
draw_sprite_ext(spr_mrsunshine_backlegs, legs_image_index, xx, yy, 2, 2, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, 2, 2, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_mrsunshine_frontlegs, legs_image_index, xx, yy, 2, 2, image_angle, image_blend, image_alpha);
tailsiner += 33.333333333333336;
draw_sprite_ext(head_sprite, 0, x + head_xoffset, y + head_yoffset, 2, 2, image_angle, image_blend, image_alpha);

if (!head_isnormal)
    draw_sprite_ext(spr_mrsunshine_face, face_frame, x + random_range(-2, 2), y + random_range(-2, 2), 2, 2, image_angle, image_blend, image_alpha);

var tailangle = image_angle + (sin(tailsiner / 400) * 15 * tailamp);

if (pinwheel_con == -1)
{
    if (hurt == 1)
        draw_sprite_ext(spr_mrsunshine_tail_hurt, 0, xx + 196, yy + 116, 2, 2, tailangle, image_blend, image_alpha);
    else
        draw_sprite_ext(spr_mrsunshine_tail, 0, xx + 196, yy + 116, 2, 2, tailangle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(spr_mrsunshine_tail_pinwheel_base, 0, xx + 196, yy + 116, 2, 2, tailangle, image_blend, image_alpha);
    var len = 93;
    var dir = -105;
    var headoffx = lengthdir_x(len, dir - tailangle);
    var headoffy = -lengthdir_y(len, dir - tailangle);
    draw_sprite_ext(spr_mrsunshine_tail_pinwheel_head, 0, xx + 196 + headoffx, yy + 116 + headoffy, 2, 2, tailangle + pinwheel_angle, image_blend, image_alpha);
}
