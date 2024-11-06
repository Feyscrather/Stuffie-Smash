function louie_fair_passive(){
	if !(custom_passive_struct.potion_count <= 0) {
		if (custom_passive_struct.potion_type == 2) {
			my_attacks[$ "Fair"] = bowser_fair;
		} else {
			my_attacks[$ "Fair"] = louie_fair;
		}
	} else {
		my_attacks[$ "Fair"] = -1;
	}
}