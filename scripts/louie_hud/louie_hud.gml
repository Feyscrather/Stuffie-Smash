function louie_hud()
	{
	var _args = argument[0];
	var _x = _args[@ 0];
	var _y = _args[@ 1];
	var _player = _args[@ 2];
	var _alpha = _args[@ 3];
	var _facing = _args[@ 4];
	
	switch (player_hud_type) 
		{
		case HUD_TYPE.normal:
			switch (_facing) {
				case 0:
				if (custom_passive_struct.dspec_target != -1) {
					draw_text(_x-65, _y, "PLAYER: " + string(custom_passive_struct.dspec_target));
				} else {
					draw_text(_x-65, _y, "PLAYER NOT CHOSEN");
				}
				break;
			}
		case HUD_TYPE.legacy:
			break;
		}
	
	//Script template for player hud scripts
	//Can be assigned to players with the code: callback_add(callback_hud, hud_script_template, CALLBACK_TYPE.permanent);
	}
/* Copyright 2024 Springroll Games / Yosi */