

var _range = 500;

instance_activate_all()
instance_deactivate_object(o_height_parent);
instance_deactivate_object(o_wall_parent);
instance_deactivate_object(o_tilted_parent);
instance_activate_object(o_mask_parent);
instance_activate_region(x-_range, y-_range, x+_range, y+_range, true);