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
				draw_sprite(spr_Bottle, 0, _x+(64), _y);
				switch (custom_passive_struct.potion_type) {
					case 0:
						draw_set_color(c_blue);
						break;
					case 1:
						draw_set_color(c_red);
						break;
					case 2:
						draw_set_color(c_yellow);
						break;
					case 3:
						draw_set_color(c_lime);
						break;
					case 4:
						draw_set_color(c_green);
						break;
				}
				draw_set_halign(fa_middle);
				draw_set_valign(fa_center);
				draw_text(_x+(63), _y, custom_passive_struct.potion_count);
				break;
				case 1:
				draw_sprite(spr_Bottle, 0, _x-64, _y);
				switch (custom_passive_struct.potion_type) {
					case 0:
						draw_set_color(c_blue);
						break;
					case 1:
						draw_set_color(c_red);
						break;
					case 2:
						draw_set_color(c_yellow);
						break;
					case 3:
						draw_set_color(c_lime);
						break;
					case 4:
						draw_set_color(c_green);
						break;
				}
				draw_set_halign(fa_middle);
				draw_set_valign(fa_center);
				draw_text(_x-65, _y, custom_passive_struct.potion_count);
				break;
			}
		case HUD_TYPE.legacy:
			break;
		}
	
	//Script template for player hud scripts
	//Can be assigned to players with the code: callback_add(callback_hud, hud_script_template, CALLBACK_TYPE.permanent);
	}
/* Copyright 2024 Springroll Games / Yosi */