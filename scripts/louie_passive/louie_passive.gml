function louie_passive() {
	var _p = custom_passive_struct;
	
	if !(variable_struct_exists(_p, "potion_count")) {
		custom_passive_struct.potion_count = 0;
	}
	if !(variable_struct_exists(_p, "potion_type")) {
		custom_passive_struct.potion_type = 0;
	}
}
/* Copyright 2024 Springroll Games / Yosi */