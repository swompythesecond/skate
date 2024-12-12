player_sprite_width = 75;
player_sprite_height = 75;
player_spritesheet = s_riding_regular;
player_spritesheet = s_riding_regular;



player_rotation = 0; // Current rotation
player_rotation_max = (sprite_get_width(player_spritesheet)/player_sprite_width)-1;
player_rotation_speed = 0.3;

player_animation_index = 3; // Current animation frame
player_animation_index_max = (sprite_get_height(player_spritesheet)/player_sprite_height)-1;
player_animation_speed = 0.25; // Speed of animation (fractional for smooth stepping)

player_speed = 2;
player_direction = floor(-player_rotation)*(360/player_rotation_max);

function player_state_step_riding(this) {

    // Handle rotation (wrapping around)
    if (keyboard_check(vk_right)) {
        this.player_rotation += player_rotation_speed;
        this.player_animation_index += player_animation_speed;
    }
	else if (keyboard_check(vk_left)) {
        this.player_rotation -= player_rotation_speed;
        this.player_animation_index -= player_animation_speed;
    }
	else{
		if (this.player_animation_index > 3) {
			this.player_animation_index -= player_animation_speed;
		}
        if (this.player_animation_index < 3) {
            this.player_animation_index += player_animation_speed;
        }
    }	
	
	player_direction = round(-player_rotation)*(360/player_rotation_max);
	player_direction -= 33.75;
	
	
	x+=lengthdir_x(player_speed,player_direction);
	y+=lengthdir_y(player_speed,player_direction);
	
}

// Assign the current state function
player_state_step = player_state_step_riding;
