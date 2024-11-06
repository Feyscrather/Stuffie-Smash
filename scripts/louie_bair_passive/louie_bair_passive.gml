function louie_bair_passive(){
	if !(custom_passive_struct.potion_count <= 0) {
		if (custom_passive_struct.potion_type == 2) {
			my_attacks[$ "Bair"] = louie_bair_shock;
		} else {
			my_attacks[$ "Bair"] = louie_bair;
		}
	} else {
		my_attacks[$ "Bair"] = -1;
	}
}