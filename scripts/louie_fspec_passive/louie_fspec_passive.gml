function louie_fspec_passive()
	{
	//Limits the number of uses of afterburner kick.
	if (!(state == PLAYER_STATE.attacking && attack_script == louie_fspec))
		{
		if (on_ground())
			{
			attack_uses_set(1, louie_fspec);
			attack_cooldown_set(0, louie_fspec);
			}
		}
	if (is_knocked_out())
		{
		attack_uses_set(1, louie_fspec);
		attack_cooldown_set(0, louie_fspec);
		}
	}
/* Copyright 2024 Springroll Games / Yosi */