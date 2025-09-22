function scr_sbophyhang(topOffset, bottomY, hSpeed, travel, type, swing = 0)
{
    bone = instance_create(320 - (hSpeed * travel), global.idealborder[3] - topOffset, obj_sans_bonebul_phy_hang);
    bone.hspeed = hSpeed;
    bone.type = type;
    bone.yinit = bone.y;
    bone.bottom_y = bottomY;
    bone.bottom_yinit = bone.bottom_y;
    bone.swing = swing;
}
