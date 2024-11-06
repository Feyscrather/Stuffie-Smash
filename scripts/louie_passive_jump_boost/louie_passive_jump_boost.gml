function louie_passive_jump_boost() {
	var _p = custom_passive_struct;
	
	if !(variable_struct_exists(custom_passive_struct, "last_effected_potion")) {
		custom_passive_struct.last_effected_potion = "jump";
	} else {
		if (custom_passive_struct.last_effected_potion == "speed") {
			walk_speed -= 3;
			run_speed -= 3;
			dash_speed -= 3;
		} else if (custom_passive_struct.last_effected_potion == "strength") {
			damage_attack_multiplier = 1;
			knockback_multiplier = 1;
		} else if (custom_passive_struct.last_effected_potion == "jump") {
			shorthop_speed -= 6;
			jump_speed -= 6;
			double_jump_speed -= 6;
		}
		custom_passive_struct.last_effected_potion = "jump";
	}
	shorthop_speed += 6;
	jump_speed += 6;
	double_jump_speed += 6;
}
/* Copyright 2024 Springroll Games / Yosi */