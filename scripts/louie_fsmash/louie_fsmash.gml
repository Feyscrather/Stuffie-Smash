function louie_fsmash_strength()
	{
	//Forward Smash
	/*
	- Hold upwards when releasing to perform a stronger but slower uppercut
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(ground_friction, grav, max_fall_speed);

	//Canceling
	if (run && cancel_air_check()) then run = false;

	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_vert_fsmash;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 5;
				
				hurtbox_anim_match(spr_vert_fsmash_hurtbox);
				return;
				}
			//Charging
			case 0:
				{
				if (attack_frame == 3)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					if ((!input_held(INPUT.smash) && !input_held(INPUT.attack) && !input_held(INPUT.special)) || charge >= smash_attack_charge_max)
						{
						custom_passive_struct.potion_count--;
						if (stick_get_value(Lstick, DIR.up) > stick_flick_amount)
							{
							attack_phase = 4;
							attack_frame = 14;
							}
						else
							{
							attack_phase = 1;
							attack_frame = 10;
							}
						}
					else
						{
						charge++;
						if (charge % 8 == 0)
							{
							if (anim_frame == 2)
								anim_frame = 1;
							else
								{
								anim_frame = 2;
								
								//Shine VFX
								vfx_create(spr_shine_attack, 1, 0, 8, x + prng_number(0, 20, -20), y + prng_number(1, 20, -20), 1, prng_number(0, 360));
								}
							}
						}
					}
				break;
				}
			//Hitbox - Forward
			case 1:
				{
				if (attack_frame == 7)
					anim_frame = 2;
				if (attack_frame == 4)
					anim_frame = 3;
			
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					attack_frame = 10;
					
					game_sound_play(snd_swing3);
					speed_set(7 * facing, 0, false, false);
				
					var _damage = calculate_smash_damage(14);
					var _hitbox = hitbox_create_melee(20, 0, 0.8, 0.4, _damage, 6, 1.3, 4, 45, 4, SHAPE.square, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.knockback_state = PLAYER_STATE.balloon;
				
					var _damage = calculate_smash_damage(17);
					var _hitbox = hitbox_create_melee(48, 0, 0.8, 0.8, _damage, 6, 1.4, 12, 45, 4, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = [HIT_VFX.explosion, HIT_VFX.normal_medium];
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.knockback_state = PLAYER_STATE.balloon;
					}
				break;
				}
			//Active - Forward
			case 2:
				{
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 4)
					anim_frame = 6;
				
				if (attack_frame == 0)
					{
					anim_frame = 7;
					attack_phase++;
					attack_frame = attack_connected() ? 10 : 20;
					}
				break;
				}
			//Finish - Forward
			case 3:
				{
				//Animation
				if (attack_frame == 13)
					anim_frame = 8;
				if (attack_frame <= 7)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					run = false;
					}
				break;
				}
			//Hitbox - Up
			case 4:
				{
				if (attack_frame == 9)
					anim_frame = 10;
				if (attack_frame == 4)
					anim_frame = 11;
			
				if (attack_frame == 0)
					{
					anim_frame = 12;
					attack_phase++;
					attack_frame = 6;
					
					game_sound_play(snd_swing3);
					
					var _damage = calculate_smash_damage(15);
					var _hitbox = hitbox_create_melee(30, 0, 0.6, 0.8, _damage, 3, 2, 13, 85, 2, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong0;
					_hitbox.shieldstun_scaling = 2;
					_hitbox.knockback_state = PLAYER_STATE.balloon;
					}
				break;
				}
			//Active - Up
			case 5:
				{
				if (attack_frame == 4)
					{
					anim_frame = 13;
				
					var _damage = calculate_smash_damage(13);
					var _hitbox = hitbox_create_melee(26, -32, 0.6, 0.8, _damage, 3, 1.5, 12, 85, 2, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong0;
					}
				
				if (attack_frame == 2)
					{
					anim_frame = 14;
				
					var _damage = calculate_smash_damage(11);
					var _hitbox = hitbox_create_melee(24, -60, 0.5, 0.5, _damage, 3, 1.5, 11, 85, 3, SHAPE.circle, 0);
					_hitbox.hit_vfx_style = HIT_VFX.normal_strong;
					_hitbox.hit_sfx = snd_hit_weak0;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 15;
					attack_phase++;
					attack_frame = 25;
					}
				break;
				}
			//Finish - Up
			case 6:
				{
				//Animation
				if (attack_frame == 22)
					anim_frame = 16;
				if (attack_frame == 19)
					anim_frame = 17;
				if (attack_frame == 13)
					anim_frame = 18;
				if (attack_frame == 5)
					anim_frame = 19;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					run = false;
					}
				break;
				}
			}
		}
	
	//Movement
	move_grounded();
	
	//Hurtbox
	if (run)
		{
		hurtbox_anim_match(spr_vert_fsmash_hurtbox);
		}
	}

function louie_fsmash_speed()
	{
	//Upward Tilt
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	
	//Phases
	if (run)
		{
		switch (_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_basic_fsmash_spinning;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 20;
				
				speed_set(-7 * facing, -7, false, false);
				return;
				}
			//Startup + Charging
			case 0:
				{
				//Speeds
				if (on_ground())
					{
					friction_gravity(slide_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					}
				
				//Animation
				if (attack_frame == 18)
					anim_frame = 1;
				if (attack_frame == 16)
					anim_frame = 2;
				if (attack_frame == 14)
					anim_frame = 3;
				if (attack_frame == 12)
					anim_frame = 4;
				if (attack_frame == 10)
					anim_frame = 5;
				if (attack_frame == 8)
					anim_frame = 6;
				if (attack_frame == 6)
					anim_frame = 7;
				if (attack_frame == 4)
					anim_frame = 8;
				if (attack_frame == 2)
					anim_frame = 9;
				
				//Charging
				if (attack_frame == 0)
					{
					if (charge >= smash_attack_charge_max || (!input_held(INPUT.smash) && !input_held(INPUT.attack) && !input_held(INPUT.special)))
						{
						anim_frame = 12;
						attack_phase++;
						attack_frame = 16;
						custom_passive_struct.potion_count--;
						speed_set(11 * facing, 0, false, false);
						}
					else
						{
						charge++;
						if (charge % 7 == 0)
							{
							anim_frame++;
							if (anim_frame > 11)
								{
								anim_frame = 10;
								//Shine VFX
								vfx_create(spr_shine_attack, 1, 0, 8, x + prng_number(0, 20, -20), y + prng_number(1, 20, -20), 1, prng_number(0, 360));
								}
							}
						}
					}
				break;
				}
			//Startup + Active
			case 1:
				{
				//Animation
				if (attack_frame == 14)
					anim_frame = 13;
				if (attack_frame == 13)
					anim_frame = 14;
				if (attack_frame == 11)
					anim_frame = 15;
				if (attack_frame == 10)
					anim_frame = 16;
				if (attack_frame == 8)
					anim_frame = 17;
				if (attack_frame == 7)
					anim_frame = 18;
				if (attack_frame == 5)
					anim_frame = 19;
				if (attack_frame == 4)
					anim_frame = 20;
				if (attack_frame == 3)
					anim_frame = 21;
				if (attack_frame == 2)
					anim_frame = 22;
					
				//Magnetbox
				if (attack_frame == 14)
					{
					var _hitbox = hitbox_create_magnetbox(10, 0, 0.6, 0.9, 1, 1, 16, -4, 10, 12, SHAPE.circle, 0, true);
					_hitbox.hit_vfx_style = HIT_VFX.slash_weak;
					_hitbox.hit_sfx = snd_hit_weak1;
					}
					
				//Multihit
				if (attack_frame > 2 && attack_frame % 2 == 0)
					{
					hitbox_group_reset(0);
					}
					
				//VFX
				if (attack_frame % 4 == 0 && on_ground())
					{
					var _vfx = vfx_create(spr_dust_run, 1, 0, 14, x, (bbox_bottom - 1), 2, 0, "VFX_Layer_Below");
					_vfx.vfx_xscale = 2 * facing;
					}
				
				//Final hit
				if (attack_frame == 2)
					{
					var _damage = calculate_smash_damage(5);
					var _hitbox = hitbox_create_melee(0, 0, 1, 0.8, _damage, 6, 1.1, 20, 40, 2, SHAPE.circle, 1);
					_hitbox.hit_vfx_style = [HIT_VFX.slash_strong, HIT_VFX.normal_strong];
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.knockback_state = PLAYER_STATE.balloon;
					_hitbox.techable = false;
					}
					
				if (attack_frame == 0)
					{
					anim_frame = 23;
				 
					attack_phase++;
					attack_frame = attack_connected() ? 12 : 30;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Speeds
				if (on_ground())
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					aerial_drift();
					}
					
				//Animation
				if (attack_frame == 28)
					anim_frame = 24;
				if (attack_frame <= 20)
					anim_frame = 25;
				if (attack_frame <= 10)
					anim_frame = 26;

				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	if (on_ground())
		{
		move_grounded();
		}
	else
		{
		move();
		}
	}
