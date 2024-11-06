function louie_effect_potion(){
	var _target = argument[0]
	
	switch (custom_passive_struct.potion_type) {
		case 0:
			callback_add(callback_passive, louie_passive_speed, CALLBACK_TYPE.one_time, _target, false);
			break;
		case 1:
			callback_add(callback_passive, louie_passive_strength, CALLBACK_TYPE.one_time, _target, false);
			break;
		case 3:
			with (_target) {
				callback_add(callback_passive, louie_passive_acid, CALLBACK_TYPE.permanent, id, false);
				custom_passive_struct.acid_time_frame = 60;
			}
			break;
		case 4:
			callback_add(callback_passive, louie_passive_jump_boost, CALLBACK_TYPE.one_time, _target, false);
			break;
	}
}