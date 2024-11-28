function louie_passive() {
	var _p = custom_passive_struct;
	
	if !(variable_struct_exists(_p, "dspec_target")) {
		custom_passive_struct.dspec_target = -1;
	}
}
/* Copyright 2024 Springroll Games / Yosi */