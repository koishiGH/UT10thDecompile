siner += 1;

if (obj_doghole_abberant.mercymod < 900)
{
    draw_sprite_ext(spr_abberant_body, 0, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_abberant_sword, 0, x, y - (sin(siner / 6) * 5), 2, 2, 0 - (sin(siner / 6) * 3), c_white, 1);
    draw_sprite_ext(spr_abberant_antenna, 0, x - 5, y - (sin(siner / 6) * 4), 2, 2, 0 + (sin(siner / 10) * 3), c_white, 1);
    draw_sprite_ext(spr_abberant_head, 0, x, y - (sin(siner / 6) * 4), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_abberant_hair, 0, x, y - (sin(siner / 6) * 4), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_abberant_shield, 0, x, y - (sin(siner / 6) * 5), 2, 2, 0 - (sin(siner / 6) * 3), c_white, 1);
}
else
{
    draw_sprite_ext(spr_abberant_body, 0, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_abberant_sword, 0, x, y - (sin(siner / 6) * 5), 2, 2, 0 - (sin(siner / 6) * 3), c_white, 1);
    draw_sprite_ext(spr_abberant_head_spared, 0, x, y - (sin(siner / 6) * 4), 2, 2, 0 - (sin(siner / 6) * 20), c_white, 1);
    draw_sprite_ext(spr_abberant_dizzyeyes, 0, x + 2 + (sin(siner / 6) * 3), (y - 8) + (sin(siner / 6) * 3), 2, 2, (siner * 16) - (sin(siner / 6) * 20), c_white, 1);
    draw_sprite_ext(spr_abberant_dizzyeyes, 0, x + 23 + (sin(siner / 6) * 3), (y - 8) + (sin(siner / 6) * 2), 2, 2, (-siner * 16) - (sin(siner / 6) * 20), c_white, 1);
    draw_sprite_ext(spr_abberant_shield, 0, x, y - (sin(siner / 6) * 5), 2, 2, 0 - (sin(siner / 6) * 3), c_white, 1);
}
