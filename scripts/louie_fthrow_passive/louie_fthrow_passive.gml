function louie_fthrow_passive(){
	if (custom_passive_struct.potion_count > 0) {
		if (custom_passive_struct.potion_type = 0) {
			my_attacks[$ "Fthrow"] = louie_fthrow_speed;
		} else if (custom_passive_struct.potion_type = 1) {
			my_attacks[$ "Fthrow"] = louie_fthrow_strength;
		} else if (custom_passive_struct.potion_type == 2) {
			my_attacks[$ "Fthrow"] = louie_backfire;
		} else {
			my_attacks[$ "Fthrow"] = louie_self_effect;
		}
	} else {
		my_attacks[$ "Fthrow"] = louie_ftilt;
	}
}