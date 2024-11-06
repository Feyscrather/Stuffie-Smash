function louie_fsmash_passive(){
	if (custom_passive_struct.potion_count > 0) {
		if (custom_passive_struct.potion_type = 0) {
			my_attacks[$ "Fsmash"] = louie_fsmash_speed;
		} else if (custom_passive_struct.potion_type = 1) {
			my_attacks[$ "Fsmash"] = louie_fsmash_strength;
		}
	} else {
		my_attacks[$ "Fsmash"] = -1;
	}
}