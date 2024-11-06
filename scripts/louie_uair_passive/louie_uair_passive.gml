function louie_uair_passive(){
	if !(custom_passive_struct.potion_count <= 0) {
		if (custom_passive_struct.potion_type == 2) {
			my_attacks[$ "Uair"] = louie_uair_shock;
		} else {
			my_attacks[$ "Uair"] = louie_uair;
		} 
	} else {
		my_attacks[$ "Uair"] = -1;
	}
}