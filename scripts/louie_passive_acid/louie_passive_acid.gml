function louie_passive_acid() {
	if !(variable_struct_exists(custom_passive_struct, "last_effected_potion")) {
		custom_passive_struct.last_effected_potion = "strength";
	} else {
		if (custom_passive_struct.last_effected_potion == "speed") {
			walk_speed -= 3;
			run_speed -= 3;
			dash_speed -= 3;
		} else if (custom_passive_struct.last_effected_potion == "strength") {
			damage_attack_multiplier = 1;
			knockback_multiplier = 1;
		} else if (custom_passive_struct.last_effected_potion == "slippery") {
			friction_gravity();
		}
		custom_passive_struct.last_effected_potion = "acid";
	}
	//Variables
	var _p = custom_passive_struct;
	if (!variable_struct_exists(_p, "acid_time_frame")) then _p.acid_time_frame = 0;
	if (!variable_struct_exists(_p, "witch_time_x")) then _p.witch_time_x = x;
	if (!variable_struct_exists(_p, "witch_time_y")) then _p.witch_time_y = y;
	
	//Slowdown
	if (_p.acid_time_frame % 6 == 0) {
		apply_damage(player_id, 1)
	}
		
	//Ending
	_p.acid_time_frame -= 1;
	if (_p.acid_time_frame <= 0) {
		callback_remove(callback_passive, louie_passive_acid);
	}
}
/* Copyright 2024 Springroll Games / Yosi */