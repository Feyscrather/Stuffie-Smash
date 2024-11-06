function louie_backfire(){
	apply_damage(player_id, 4);
	state_set(PLAYER_STATE.shield_break);
	state_frame = 30;
}