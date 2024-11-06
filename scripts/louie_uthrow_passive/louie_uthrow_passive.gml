function louie_uthrow_passive(){
	if (custom_passive_struct.potion_count > 0) {
		if (custom_passive_struct.potion_type = 0) {
			my_attacks[$ "Uthrow"] = louie_uthrow_speed;
		} else if (custom_passive_struct.potion_type = 1) {
			my_attacks[$ "Uthrow"] = louie_uthrow_strength;
		} else if (custom_passive_struct.potion_type == 2) {
			my_attacks[$ "Uthrow"] = louie_backfire;
		} else {
			my_attacks[$ "Uthrow"] = louie_self_effect;
		}
	} else {
		my_attacks[$ "Uthrow"] = vert_utilt;
	}
}