
if mobs.mod and mobs.mod == "redo" then

-- local variables
	local l_skins = {
		{"croco.png"},
		{"croco2.png"}
	}
	local l_anims = {
		speed_normal = 24,	speed_run = 24,
		stand_start = 0,	stand_end = 80,
		walk_start = 81,	walk_end = 170,
		run_start = 81,		run_end = 170,
		punch_start = 205,	punch_end = 220
	}
	local l_model			= "crocodile.x"
	local l_sounds			= {random = "croco"}
	local l_egg_texture		= "default_grass.png"
	local l_spawn_chance	= 60000

-- load settings
	dofile(minetest.get_modpath("mobs_crocs").."/SETTINGS.txt")
	if not ENABLE_WALKERS then
		l_spawn_chance = l_spawn_chance - 20000
	end
	if not ENABLE_FLOATERS then
		l_spawn_chance = l_spawn_chance - 20000
	end
	if not ENABLE_SWIMMERS then
		l_spawn_chance = l_spawn_chance - 20000
	end

-- no float
	if ENABLE_WALKERS then
		mobs:register_mob("mobs_crocs:crocodile", {
			type = "monster",
			attack_type = "dogfight",
			damage = 8,
			reach = 3,
			hp_min = 20,
			hp_max = 25,
			armor = 200,
			collisionbox = {-0.85, -0.30, -0.85, 0.85, 1.5, 0.85},
			drawtype = "front",
			visual = "mesh",
			mesh = l_model,
			textures = l_skins,
			visual_size = {x=4, y=4},
			sounds = l_sounds,
			fly = false,
			drops = {
				{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
				{name = "mobs:leather", chance = 1, min = 1, max = 2},
			},
			floats = 0,
			stepheight = 1,
			view_range = 10,
			water_damage = 0,
			lava_damage = 10,
			light_damage = 0,
			animation = l_anims
		})
		--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
		mobs:spawn_specific("mobs_crocs:crocodile",
			{"default:dirt_with_grass","default:dirt","default:jungle_grass","default:sand"},
			{"default:water_flowing","default:water_source","default:papyrus","dryplants:juncus","dryplants:reedmace"},
			-1, 18, 30, l_spawn_chance, 1, 0, 31000)
		mobs:register_egg("mobs_crocs:crocodile", "Crocodile", l_egg_texture, 1)
	end

-- float
	if ENABLE_FLOATERS then
		mobs:register_mob("mobs_crocs:crocodile_float", {
			type = "monster",
			attack_type = "dogfight",
			damage = 8,
			reach = 2,
			hp_min = 20,
			hp_max = 25,
			armor = 200,
			collisionbox = {-0.638, -0.23, -0.638, 0.638, 1.13, 0.638},
			drawtype = "front",
			visual = "mesh",
			mesh = l_model,
			textures = l_skins,
			visual_size = {x=3, y=3},
			sounds = l_sounds,
			fly = false,
			drops = {
				{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
				{name = "mobs:leather", chance = 1, min = 1, max = 2},
			},
			stepheight = 1,
			view_range = 10,
			water_damage = 0,
			lava_damage = 10,
			light_damage = 0,
			animation = l_anims
		})
		--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
		mobs:spawn_specific("mobs_crocs:crocodile_float",
			{"default:water_flowing","default:water_source"},
			{"default:dirt_with_grass","default:jungle_grass","default:sand","default:dirt","default:papyrus","group:seaplants","dryplants:juncus","dryplants:reedmace"},
			-1, 18, 30, l_spawn_chance, 1, -3, 31000)
		mobs:register_egg("mobs_crocs:crocodile_float", "Crocodile (floater)", l_egg_texture, 1)
	end

-- swim
	if ENABLE_SWIMMERS then
		mobs:register_mob("mobs_crocs:crocodile_swim", {
			type = "monster",
			attack_type = "dogfight",
			damage = 8,
			reach = 1,
			hp_min = 20,
			hp_max = 25,
			armor = 200,
			collisionbox = {-0.425, -0.15, -0.425, 0.425, 0.75, 0.425},
			drawtype = "front",
			visual = "mesh",
			mesh = l_model,
			textures = l_skins,
			visual_size = {x=2, y=2},
			sounds = l_sounds,
			fly = true,
			fly_in = "default:water_source",
			drops = {
				{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
				{name = "mobs:leather", chance = 1, min = 1, max = 2},
			},
			fall_speed = -1,
			floats = 0,
			view_range = 10,
			water_damage = 0,
			lava_damage = 10,
			light_damage = 0,
			animation = l_anims
		})
		--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
		mobs:spawn_specific("mobs_crocs:crocodile_swim",
			{"default:water_flowing","default:water_source"},
			{"default:sand","default:dirt","group:seaplants"},
			-1, 18, 30, l_spawn_chance, 1, -8, 31000)
		mobs:register_egg("mobs_crocs:crocodile_swim", "Crocodile (swimmer)", l_egg_texture, 1)
	end

end
