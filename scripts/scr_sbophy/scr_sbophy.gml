function scr_sbophy(yOffset, hSpeed, travel, type)
{
    bone = instance_create(320 - (hSpeed * travel), global.idealborder[3] - yOffset, obj_sans_bonebul_phy);
    bone.hspeed = hSpeed;
    bone.type = type;
    bone.yinit = bone.y;
}

function scr_sbophy_horz(yOffset, hSpeed, travel, type, width)
{
    bone = instance_create(320 - (hSpeed * travel), global.idealborder[3] - 10 - yOffset, obj_sans_bonebul_phy_horz);
    bone.hspeed = hSpeed;
    bone.type = type;
    bone.width = width;
    bone.yinit = bone.y;
}
