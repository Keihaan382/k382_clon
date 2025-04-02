local playerPed = PlayerPedId() -- Obtiene el ped del jugador
local spawnModeActive = false -- Estado del modo de spawn

local animations = {
    ["umbrella"] = {
        dict = "amb@world_human_drinking@coffee@male@base",
        anim = "base",
        name = "Umbrella",
        options = {
            Prop = "p_amb_brolly_01",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["box"] = {
        dict = "anim@heists@box_carry@",
        anim = "idle",
        name = "Box",
        options = {
            Prop = "hei_prop_heist_box",
            PropBone = 60309,
            PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["rose"] = {
        dict = "anim@heists@humane_labs@finale@keycards",
        anim = "ped_a_enter_loop",
        name = "Rose",
        options = {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke2"] = {
        dict = "amb@world_human_aa_smoke@male@idle_a",
        anim = "idle_c",
        name = "Smoke 2",
        options = {
            Prop = "prop_cs_ciggy_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bong"] = {
        dict = "anim@safehouse@bong",
        anim = "bong_stage3",
        name = "Bong",
        options = {
            Prop = "hei_heist_sh_bong_01",
            PropBone = 18905,
            PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
            EmoteLoop = true
        }
    },
    ["suitcase"] = {
        dict = "missheistdocksprep1hold_cellphone",
        anim = "static",
        name = "Suitcase",
        options = {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wine"] = {
        dict = "anim@heists@humane_labs@finale@keycards",
        anim = "ped_a_enter_loop",
        name = "Wine",
        options = {
            Prop = "prop_drink_redwine",
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar"] = {
        dict = "amb@world_human_musician@guitar@male@idle_a",
        anim = "idle_b",
        name = "Guitar",
        options = {
            Prop = "prop_acc_guitar_01",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["book"] = {
        dict = "cellphone@",
        anim = "cellphone_text_read_base",
        name = "Book",
        options = {
            Prop = "prop_novel_01",
            PropBone = 6286,
            PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bouquet"] = {
        dict = "impexp_int-0",
        anim = "mp_m_waremech_01_dual-0",
        name = "Bouquet",
        options = {
            Prop = "prop_snow_flower_02",
            PropBone = 24817,
            PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy"] = {
        dict = "impexp_int-0",
        anim = "mp_m_waremech_01_dual-0",
        name = "Teddy",
        options = {
            Prop = "v_ilev_mr_rasberryclean",
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["backpack"] = {
        dict = "move_p_m_zero_rucksack",
        anim = "idle",
        name = "Backpack",
        options = {
            Prop = "p_michael_backpack_s",
            PropBone = 24818,
            PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["clipboard"] = {
        dict = "missfam4",
        anim = "base",
        name = "Clipboard",
        options = {
            Prop = "p_amb_clipboard_01",
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map"] = {
        dict = "amb@world_human_tourist_map@male@base",
        anim = "base",
        name = "Map",
        options = {
            Prop = "prop_tourist_map_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["beg"] = {
        dict = "amb@world_human_bum_freeway@male@base",
        anim = "base",
        name = "Beg",
        options = {
            Prop = "prop_beggers_sign_03",
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["camera"] = {
        dict = "amb@world_human_paparazzi@male@base",
        anim = "base",
        name = "Camera",
        options = {
            Prop = "prop_pap_camera_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["coffee"] = {
        dict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        name = "Coffee",
        options = {
            Prop = "p_amb_coffeecup_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskey"] = {
        dict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        name = "Whiskey",
        options = {
            Prop = "prop_drink_whisky",
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer"] = {
        dict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        name = "Beer",
        options = {
            Prop = "prop_amb_beer_bottle",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cup"] = {
        dict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        name = "Cup",
        options = {
            Prop = "prop_plastic_cup_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["donut"] = {
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger",
        name = "Donut",
        options = {
            Prop = "prop_amb_donut",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["burger"] = {
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger",
        name = "Burger",
        options = {
            Prop = "prop_cs_burger_01",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["sandwich"] = {
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger",
        name = "Sandwich",
        options = {
            Prop = "prop_sandwich_01",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["soda"] = {
        dict = "amb@world_human_drinking@coffee@male@idle_a",
        anim = "idle_c",
        name = "Soda",
        options = {
            Prop = "prop_ecola_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["champagne"] = {
        dict = "anim@heists@humane_labs@finale@keycards",
        anim = "ped_a_enter_loop",
        name = "Champagne",
        options = {
            Prop = "prop_drink_champ",
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cigar"] = {
        dict = "amb@world_human_smoking@male@male_a@enter",
        anim = "enter",
        name = "Cigar",
        options = {
            Prop = "prop_cigar_02",
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric"] = {
        dict = "amb@world_human_musician@guitar@male@idle_a",
        anim = "idle_b",
        name = "Guitar Electric",
        options = {
            Prop = "prop_el_guitar_01",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric2"] = {
        dict = "amb@world_human_musician@guitar@male@idle_a",
        anim = "idle_b",
        name = "Guitar Electric 2",
        options = {
            Prop = "prop_el_guitar_03",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["tablet"] = {
        dict = "amb@world_human_tourist_map@male@base",
        anim = "base",
        name = "Tablet",
        options = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet2"] = {
        dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        anim = "idle_a",
        name = "Tablet 2",
        options = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall"] = {
        dict = "cellphone@",
        anim = "cellphone_call_listen_base",
        name = "Phone Call",
        options = {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean"] = {
        dict = "timetable@floyd@clean_kitchen@base",
        anim = "base",
        name = "Clean",
        options = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean2"] = {
        dict = "amb@world_human_maid_clean@",
        anim = "base",
        name = "Clean 2",
        options = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["notepad"] = {
        dict = "missheistdockssetup1clipboard@base",
        anim = "base",
        name = "Notepad",
        options = {
            Prop = "prop_notepad_01",
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            SecondProp = "prop_pencil_01",
            SecondPropBone = 58866,
            SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mugshot"] = {
        dict = "mp_character_creation@customise@male_a",
        anim = "loop",
        name = "Mugshot",
        options = {
            Prop = "prop_police_id_board",
            PropBone = 58868,
            PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sit"] = {
        dict = "anim@amb@business@bgen@bgen_no_work@",
        anim = "sit_phone_phoneputdown_idle_nowork",
        name = "Sit",
        options = {
            EmoteLoop = true
        }
    },
    ["sit2"] = {
        dict = "rcm_barry3",
        anim = "barry_3_sit_loop",
        name = "Sit 2",
        options = {
            EmoteLoop = true
        }
    },
    ["sit3"] = {
        dict = "amb@world_human_picnic@male@idle_a",
        anim = "idle_a",
        name = "Sit 3",
        options = {
            EmoteLoop = true
        }
    },
    ["sit4"] = {
        dict = "amb@world_human_picnic@female@idle_a",
        anim = "idle_a",
        name = "Sit 4",
        options = {
            EmoteLoop = true
        }
    },
    ["sit5"] = {
        dict = "anim@heists@fleeca_bank@ig_7_jetski_owner",
        anim = "owner_idle",
        name = "Sit 5",
        options = {
            EmoteLoop = true
        }
    },
    ["sit6"] = {
        dict = "timetable@jimmy@mics3_ig_15@",
        anim = "idle_a_jimmy",
        name = "Sit 6",
        options = {
            EmoteLoop = true
        }
    },
    ["sit7"] = {
        dict = "anim@amb@nightclub@lazlow@lo_alone@",
        anim = "lowalone_base_laz",
        name = "Sit 7",
        options = {
            EmoteLoop = true
        }
    },
    ["sit8"] = {
        dict = "timetable@jimmy@mics3_ig_15@",
        anim = "mics3_15_base_jimmy",
        name = "Sit 8",
        options = {
            EmoteLoop = true
        }
    },
    ["sit9"] = {
        dict = "amb@world_human_stupor@male@idle_a",
        anim = "idle_a",
        name = "Sit 9",
        options = {
            EmoteLoop = true
        }
    },
    ["sitlean"] = {
        dict = "timetable@tracy@ig_14@",
        anim = "ig_14_base_tracy",
        name = "Sit Lean",
        options = {
            EmoteLoop = true
        }
    },
    ["sitsad"] = {
        dict = "anim@amb@business@bgen@bgen_no_work@",
        anim = "sit_phone_phoneputdown_sleeping-noworkfemale",
        name = "Sit Sad",
        options = {
            EmoteLoop = true
        }
    },
    ["sitscared"] = {
        dict = "anim@heists@ornate_bank@hostages@hit",
        anim = "hit_loop_ped_b",
        name = "Sit Scared",
        options = {
            EmoteLoop = true
        }
    },
    ["sitdrunk"] = {
        dict = "timetable@amanda@drunk@base",
        anim = "base",
        name = "Sit Drunk",
        options = {
            EmoteLoop = true
        }
    },
    ["sitchair2"] = {
        dict = "timetable@ron@ig_5_p3",
        anim = "ig_5_p3_base",
        name = "Sit Chair 2",
        options = {
            EmoteLoop = true
        }
    },
    ["sitchair3"] = {
        dict = "timetable@reunited@ig_10",
        anim = "base_amanda",
        name = "Sit Chair 3",
        options = {
            EmoteLoop = true
        }
    },
    ["sitchairside"] = {
        dict = "timetable@ron@ron_ig_2_alt1",
        anim = "ig_2_alt1_base",
        name = "Sit Chair Side",
        options = {
            EmoteLoop = true
        }
    },
    ["situp"] = {
        dict = "amb@world_human_sit_ups@male@idle_a",
        anim = "idle_a",
        name = "Sit Up",
        options = {
            EmoteLoop = true
        }
    },
    ["jog2"] = {
        dict = "amb@world_human_jog_standing@male@idle_a",
        anim = "idle_a",
        name = "Jog 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog3"] = {
        dict = "amb@world_human_jog_standing@female@idle_a",
        anim = "idle_a",
        name = "Jog 3",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog4"] = {
        dict = "amb@world_human_power_walker@female@idle_a",
        anim = "idle_a",
        name = "Jog 4",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog5"] = {
        dict = "move_m@joy@a",
        anim = "walk",
        name = "Jog 5",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jumpingjacks"] = {
        dict = "timetable@reunited@ig_2",
        anim = "jimmy_getknocked",
        name = "Jumping Jacks",
        options = {
            EmoteLoop = true
        }
    },
    ["kneel2"] = {
        dict = "rcmextreme3",
        anim = "idle",
        name = "Kneel 2",
        options = {
            EmoteLoop = true
        }
    },
    ["kneel3"] = {
        dict = "amb@world_human_bum_wash@male@low@idle_a",
        anim = "idle_a",
        name = "Kneel 3",
        options = {
            EmoteLoop = true
        }
    },
    ["knock"] = {
        dict = "timetable@jimmy@doorknock@",
        anim = "knockdoor_idle",
        name = "Knock",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["meditate"] = {
        dict = "rcmcollect_paperleadinout@",
        anim = "meditiate_idle",
        name = "Meditate",
        options = {
            EmoteLoop = true
        }
    },
    ["meditate2"] = {
        dict = "rcmepsilonism3",
        anim = "ep_3_rcm_marnie_meditating",
        name = "Meditate 2",
        options = {
            EmoteLoop = true
        }
    },
    ["metal"] = {
        dict = "anim@mp_player_intincarrockstd@ps@",
        anim = "idle_a",
        name = "Metal",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no2"] = {
        dict = "mp_player_int_upper_nod",
        anim = "mp_player_int_nod_no",
        name = "No 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pushup"] = {
        dict = "amb@world_human_push_ups@male@idle_a",
        anim = "idle_d",
        name = "Pushup",
        options = {
            EmoteLoop = true
        }
    },
    ["salute"] = {
        dict = "anim@mp_player_intincarsalutestd@ds@",
        anim = "idle_a",
        name = "Salute",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sleep"] = {
        dict = "timetable@tracy@sleep@",
        anim = "idle_c",
        name = "Sleep",
        options = {
            EmoteLoop = true
        }
    },
    ["knock2"] = {
        dict = "missheistfbi3b_ig7",
        anim = "lift_fibagent_loop",
        name = "Knock 2",
        options = {
            EmoteLoop = true
        }
    },
    ["knucklecrunch"] = {
        dict = "anim@mp_player_intcelebrationfemale@knuckle_crunch",
        anim = "knuckle_crunch",
        name = "Knuckle Crunch",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lapdance"] = {
        dict = "mp_safehouse",
        anim = "lap_dance_girl",
        name = "Lapdance",
        options = {
            EmoteLoop = true
        }
    },
    ["lean2"] = {
        dict = "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
        anim = "idle_a",
        name = "Lean 2",
        options = {
            EmoteLoop = true
        }
    },
    ["lean3"] = {
        dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a",
        anim = "idle_a",
        name = "Lean 3",
        options = {
            EmoteLoop = true
        }
    },
    ["lean4"] = {
        dict = "amb@world_human_leaning@male@wall@back@foot_up@idle_a",
        anim = "idle_a",
        name = "Lean 4",
        options = {
            EmoteLoop = true
        }
    },
    ["lean5"] = {
        dict = "amb@world_human_leaning@male@wall@back@hands_together@idle_b",
        anim = "idle_b",
        name = "Lean 5",
        options = {
            EmoteLoop = true
        }
    },
    ["leanflirt"] = {
        dict = "random@street_race",
        anim = "_car_a_flirt_girl",
        name = "Lean Flirt",
        options = {
            EmoteLoop = true
        }
    },
    ["leanbar2"] = {
        dict = "amb@prop_human_bum_shopping_cart@male@idle_a",
        anim = "idle_c",
        name = "Lean Bar 2",
        options = {
            EmoteLoop = true
        }
    },
    ["leanbar3"] = {
        dict = "anim@amb@nightclub@lazlow@ig1_vip@",
        anim = "clubvip_base_laz",
        name = "Lean Bar 3",
        options = {
            EmoteLoop = true
        }
    },
    ["leanbar4"] = {
        dict = "anim@heists@prison_heist",
        anim = "ped_b_loop_a",
        name = "Lean Bar 4",
        options = {
            EmoteLoop = true
        }
    },
    ["leanhigh"] = {
        dict = "anim@mp_ferris_wheel",
        anim = "idle_a_player_one",
        name = "Lean High",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanhigh2"] = {
        dict = "anim@mp_ferris_wheel",
        anim = "idle_a_player_two",
        name = "Lean High 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside"] = {
        dict = "timetable@mime@01_gc",
        anim = "idle_a",
        name = "Leanside",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside2"] = {
        dict = "misscarstealfinale",
        anim = "packer_idle_1_trevor",
        name = "Leanside 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside3"] = {
        dict = "misscarstealfinalecar_5_ig_1",
        anim = "waitloop_lamar",
        name = "Leanside 3",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside4"] = {
        dict = "misscarstealfinalecar_5_ig_1",
        anim = "waitloop_lamar",
        name = "Leanside 4",
        options = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["leanside5"] = {
        dict = "rcmjosh2",
        anim = "josh_2_intp1_base",
        name = "Leanside 5",
        options = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["mechanic"] = {
        dict = "mini@repair",
        anim = "fixing_a_ped",
        name = "Mechanic",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mechanic2"] = {
        dict = "amb@world_human_vehicle_mechanic@male@base",
        anim = "idle_a",
        name = "Mechanic 2",
        options = {
            EmoteLoop = true
        }
    },
    ["mechanic3"] = {
        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        name = "Mechanic 3",
        options = {
            EmoteLoop = true
        }
    },
    ["mechanic4"] = {
        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        name = "Mechanic 4",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["medic2"] = {
        dict = "amb@medic@standing@tendtodead@base",
        anim = "base",
        name = "Medic 2",
        options = {
            EmoteLoop = true
        }
    },
    ["nosepick"] = {
        dict = "anim@mp_player_intcelebrationfemale@nose_pick",
        anim = "nose_pick",
        name = "Nose Pick",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["noway"] = {
        dict = "gestures@m@standing@casual",
        anim = "gesture_no_way",
        name = "No Way",
        options = {
            EmoteDuration = 1500,
            EmoteMoving = true
        }
    },
    ["outofbreath"] = {
        dict = "re@construction",
        anim = "out_of_breath",
        name = "Out of Breath",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["push"] = {
        dict = "missfinale_c2ig_11",
        anim = "pushcar_offcliff_f",
        name = "Push",
        options = {
            EmoteLoop = true
        }
    },
    ["push2"] = {
        dict = "missfinale_c2ig_11",
        anim = "pushcar_offcliff_m",
        name = "Push 2",
        options = {
            EmoteLoop = true
        }
    },
    ["point"] = {
        dict = "gestures@f@standing@casual",
        anim = "gesture_point",
        name = "Point",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["countdown"] = {
        dict = "random@street_race",
        anim = "grid_girl_race_start",
        name = "Countdown",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pointright"] = {
        dict = "mp_gun_shop_tut",
        anim = "indicate_right",
        name = "Point Right",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute2"] = {
        dict = "anim@mp_player_intincarsalutestd@ps@",
        anim = "idle_a",
        name = "Salute 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute3"] = {
        dict = "anim@mp_player_intuppersalute",
        anim = "idle_a",
        name = "Salute 3",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared"] = {
        dict = "random@domestic",
        anim = "f_distressed_loop",
        name = "Scared",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared2"] = {
        dict = "random@homelandsecurity",
        anim = "knees_loop_girl",
        name = "Scared 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["screwyou"] = {
        dict = "misscommon@response",
        anim = "screw_you",
        name = "Screw You",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shakeoff"] = {
        dict = "move_m@_idles@shake_off",
        anim = "shakeoff_1",
        name = "Shake Off",
        options = {
            EmoteMoving = true,
            EmoteDuration = 3500
        }
    },
    ["shot"] = {
        dict = "random@dealgonewrong",
        anim = "idle_a",
        name = "Shot",
        options = {
            EmoteLoop = true
        }
    },
    ["shrug"] = {
        dict = "gestures@f@standing@casual",
        anim = "gesture_shrug_hard",
        name = "Shrug",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["shrug2"] = {
        dict = "gestures@m@standing@casual",
        anim = "gesture_shrug_hard",
        name = "Shrug 2",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["drink"] = {
        dict = "mp_player_inteat@pnq",
        anim = "loop",
        name = "Drink",
        options = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["beast"] = {
        dict = "anim@mp_fm_event@intro",
        anim = "beast_transform",
        name = "Beast",
        options = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["chill"] = {
        dict = "switch@trevor@scares_tramp",
        anim = "trev_scares_tramp_idle_tramp",
        name = "Chill",
        options = {
            EmoteLoop = true
        }
    },
    ["cloudgaze"] = {
        dict = "switch@trevor@annoys_sunbathers",
        anim = "trev_annoys_sunbathers_loop_girl",
        name = "Cloudgaze",
        options = {
            EmoteLoop = true
        }
    },
    ["cloudgaze2"] = {
        dict = "switch@trevor@annoys_sunbathers",
        anim = "trev_annoys_sunbathers_loop_guy",
        name = "Cloudgaze 2",
        options = {
            EmoteLoop = true
        }
    },
    ["prone"] = {
        dict = "missfbi3_sniping",
        anim = "prone_dave",
        name = "Prone",
        options = {
            EmoteLoop = true
        }
    },
    ["pullover"] = {
        dict = "misscarsteal3pullover",
        anim = "pull_over_right",
        name = "Pullover",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ["idle"] = {
        dict = "anim@heists@heist_corona@team_idles@male_a",
        anim = "idle",
        name = "Idle",
        options = {
            EmoteLoop = true
        }
    },
    ["idle8"] = {
        dict = "amb@world_human_hang_out_street@male_b@idle_a",
        anim = "idle_b",
        name = "Idle 8"
    },
    ["idle9"] = {
        dict = "friends@fra@ig_1",
        anim = "base_idle",
        name = "Idle 9",
        options = {
            EmoteLoop = true
        }
    },
    ["idle10"] = {
        dict = "mp_move@prostitute@m@french",
        anim = "idle",
        name = "Idle 10",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["idle11"] = {
        dict = "random@countrysiderobbery",
        anim = "idle_a",
        name = "Idle 11",
        options = {
            EmoteLoop = true
        }
    },
    ["idle2"] = {
        dict = "anim@heists@heist_corona@team_idles@female_a",
        anim = "idle",
        name = "Idle 2",
        options = {
            EmoteLoop = true
        }
    },
    ["idle3"] = {
        dict = "anim@heists@humane_labs@finale@strip_club",
        anim = "ped_b_celebrate_loop",
        name = "Idle 3",
        options = {
            EmoteLoop = true
        }
    },
    ["idle4"] = {
        dict = "anim@mp_celebration@idles@female",
        anim = "celebration_idle_f_a",
        name = "Idle 4",
        options = {
            EmoteLoop = true
        }
    },
    ["idle5"] = {
        dict = "anim@mp_corona_idles@female_b@idle_a",
        anim = "idle_a",
        name = "Idle 5",
        options = {
            EmoteLoop = true
        }
    },
    ["idle6"] = {
        dict = "anim@mp_corona_idles@male_c@idle_a",
        anim = "idle_a",
        name = "Idle 6",
        options = {
            EmoteLoop = true
        }
    },
    ["idle7"] = {
        dict = "anim@mp_corona_idles@male_d@idle_a",
        anim = "idle_a",
        name = "Idle 7",
        options = {
            EmoteLoop = true
        }
    },
    ["wait3"] = {
        dict = "amb@world_human_hang_out_street@female_hold_arm@idle_a",
        anim = "idle_a",
        name = "Wait 3",
        options = {
            EmoteLoop = true
        }
    },
    ["idledrunk"] = {
        dict = "random@drunk_driver_1",
        anim = "drunk_driver_stand_loop_dd1",
        name = "Idle Drunk",
        options = {
            EmoteLoop = true
        }
    },
    ["idledrunk2"] = {
        dict = "random@drunk_driver_1",
        anim = "drunk_driver_stand_loop_dd2",
        name = "Idle Drunk 2",
        options = {
            EmoteLoop = true
        }
    },
    ["idledrunk3"] = {
        dict = "missarmenian2",
        anim = "standing_idle_loop_drunk",
        name = "Idle Drunk 3",
        options = {
            EmoteLoop = true
        }
    },
    ["airguitar"] = {
        dict = "anim@mp_player_intcelebrationfemale@air_guitar",
        anim = "air_guitar",
        name = "Air Guitar"
    },
    ["airsynth"] = {
        dict = "anim@mp_player_intcelebrationfemale@air_synth",
        anim = "air_synth",
        name = "Air Synth"
    },
    ["argue"] = {
        dict = "misscarsteal4@actor",
        anim = "actor_berating_loop",
        name = "Argue",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["argue2"] = {
        dict = "oddjobs@assassinate@vice@hooker",
        anim = "argue_a",
        name = "Argue 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bartender"] = {
        dict = "anim@amb@clubhouse@bar@drink@idle_a",
        anim = "idle_a_bartender",
        name = "Bartender",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["blowkiss"] = {
        dict = "anim@mp_player_intcelebrationfemale@blow_kiss",
        anim = "blow_kiss",
        name = "Blow Kiss"
    },
    ["blowkiss2"] = {
        dict = "anim@mp_player_intselfieblow_kiss",
        anim = "exit",
        name = "Blow Kiss 2",
        options = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["curtsy"] = {
        dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic",
        anim = "sarcastic_left",
        name = "Curtsy"
    },
    ["bringiton"] = {
        dict = "misscommon@response",
        anim = "bring_it_on",
        name = "Bring It On",
        options = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["comeatmebro"] = {
        dict = "mini@triathlon",
        anim = "want_some_of_this",
        name = "Come at me bro",
        options = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["cop2"] = {
        dict = "anim@amb@nightclub@peds@",
        anim = "rcmme_amanda1_stand_loop_cop",
        name = "Cop 2",
        options = {
            EmoteLoop = true
        }
    },
    ["cop3"] = {
        dict = "amb@code_human_police_investigate@idle_a",
        anim = "idle_b",
        name = "Cop 3",
        options = {
            EmoteLoop = true
        }
    },
    ["crossarms"] = {
        dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a",
        anim = "idle_a",
        name = "Crossarms",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms2"] = {
        dict = "amb@world_human_hang_out_street@male_c@idle_a",
        anim = "idle_b",
        name = "Crossarms 2",
        options = {
            EmoteMoving = true
        }
    },
    ["crossarms3"] = {
        dict = "anim@heists@heist_corona@single_team",
        anim = "single_team_loop_boss",
        name = "Crossarms 3",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms4"] = {
        dict = "random@street_race",
        anim = "_car_b_lookout",
        name = "Crossarms 4",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms5"] = {
        dict = "anim@amb@nightclub@peds@",
        anim = "rcmme_amanda1_stand_loop_cop",
        name = "Crossarms 5",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms2"] = {
        dict = "anim@amb@nightclub@peds@",
        anim = "rcmme_amanda1_stand_loop_cop",
        name = "Fold Arms 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms6"] = {
        dict = "random@shop_gunstore",
        anim = "_idle",
        name = "Crossarms 6",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms"] = {
        dict = "anim@amb@business@bgen@bgen_no_work@",
        anim = "stand_phone_phoneputdown_idle_nowork",
        name = "Fold Arms",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarmsside"] = {
        dict = "rcmnigel1a_band_groupies",
        anim = "base_m2",
        name = "Crossarms Side",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["damn"] = {
        dict = "gestures@m@standing@casual",
        anim = "gesture_damn",
        name = "Damn",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["damn2"] = {
        dict = "anim@am_hold_up@male",
        anim = "shoplift_mid",
        name = "Damn 2",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["pointdown"] = {
        dict = "gestures@f@standing@casual",
        anim = "gesture_hand_down",
        name = "Point Down",
        options = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["surrender"] = {
        dict = "random@arrests@busted",
        anim = "idle_a",
        name = "Surrender",
        options = {
            EmoteLoop = true
        }
    },
    ["facepalm2"] = {
        dict = "anim@mp_player_intcelebrationfemale@face_palm",
        anim = "face_palm",
        name = "Facepalm 2",
        options = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm"] = {
        dict = "random@car_thief@agitated@idle_a",
        anim = "agitated_idle_a",
        name = "Facepalm",
        options = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm3"] = {
        dict = "missarmenian2",
        anim = "tasered_2",
        name = "Facepalm 3",
        options = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm4"] = {
        dict = "anim@mp_player_intupperface_palm",
        anim = "idle_a",
        name = "Facepalm 4",
        options = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["fallover"] = {
        dict = "random@drunk_driver_1",
        anim = "drunk_fall_over",
        name = "Fall Over"
    },
    ["fallover2"] = {
        dict = "mp_suicide",
        anim = "pistol",
        name = "Fall Over 2"
    },
    ["fallover3"] = {
        dict = "mp_suicide",
        anim = "pill",
        name = "Fall Over 3"
    },
    ["fallover4"] = {
        dict = "friends@frf@ig_2",
        anim = "knockout_plyr",
        name = "Fall Over 4"
    },
    ["fallover5"] = {
        dict = "anim@gangops@hostage@",
        anim = "victim_fail",
        name = "Fall Over 5"
    },
    ["petting"] = {
        dict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        name = "Petting",
        options = {
            EmoteLoop = true
        }
    },
    ["crawl"] = {
        dict = "move_injured_ground",
        anim = "front_loop",
        name = "Crawl",
        options = {
            EmoteLoop = true
        }
    },
    ["flip2"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "cap_a_player_a",
        name = "Flip 2"
    },
    ["flip"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "flip_a_player_a",
        name = "Flip"
    },
    ["slide"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "slide_a_player_a",
        name = "Slide"
    },
    ["slide2"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "slide_b_player_a",
        name = "Slide 2"
    },
    ["slide3"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "slide_c_player_a",
        name = "Slide 3"
    },
    ["slugger"] = {
        dict = "anim@arena@celeb@flat@solo@no_props@",
        anim = "slugger_a_player_a",
        name = "Slugger"
    },
    ["flipoff"] = {
        dict = "anim@arena@celeb@podium@no_prop@",
        anim = "flip_off_a_1st",
        name = "Flip Off",
        options = {
            EmoteMoving = true
        }
    },
    ["flipoff2"] = {
        dict = "anim@arena@celeb@podium@no_prop@",
        anim = "flip_off_c_1st",
        name = "Flip Off 2",
        options = {
            EmoteMoving = true
        }
    },
    ["bow"] = {
        dict = "anim@arena@celeb@podium@no_prop@",
        anim = "regal_c_1st",
        name = "Bow",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bow2"] = {
        dict = "anim@arena@celeb@podium@no_prop@",
        anim = "regal_a_1st",
        name = "Bow 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["keyfob"] = {
        dict = "anim@mp_player_intmenu@key_fob@",
        anim = "fob_click",
        name = "Key Fob",
        options = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["golfswing"] = {
        dict = "rcmnigel1d",
        anim = "swing_a_mark",
        name = "Golf Swing"
    },
    ["eat"] = {
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger",
        name = "Eat",
        options = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["reaching"] = {
        dict = "move_m@intimidation@cop@unarmed",
        anim = "idle",
        name = "Reaching",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait"] = {
        dict = "random@shop_tattoo",
        anim = "_idle_a",
        name = "Wait",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait2"] = {
        dict = "missbigscore2aig_3",
        anim = "wait_for_van_c",
        name = "Wait 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait12"] = {
        dict = "rcmjosh1",
        anim = "idle",
        name = "Wait 12",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait13"] = {
        dict = "rcmnigel1a",
        anim = "base",
        name = "Wait 13",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lapdance2"] = {
        dict = "mini@strip_club@private_dance@idle",
        anim = "priv_dance_idle",
        name = "Lapdance 2",
        options = {
            EmoteLoop = true
        }
    },
    ["lapdance3"] = {
        dict = "mini@strip_club@private_dance@part2",
        anim = "priv_dance_p2",
        name = "Lapdance 3",
        options = {
            EmoteLoop = true
        }
    },
    ["twerk"] = {
        dict = "switch@trevor@mocks_lapdance",
        anim = "001443_01_trvs_28_idle_stripper",
        name = "Twerk",
        options = {
            EmoteLoop = true
        }
    },
    ["slap"] = {
        dict = "melee@unarmed@streamed_variations",
        anim = "plyr_takedown_front_slap",
        name = "Slap",
        options = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["headbutt"] = {
        dict = "melee@unarmed@streamed_variations",
        anim = "plyr_takedown_front_headbutt",
        name = "Headbutt"
    },
    ["fishdance"] = {
        dict = "anim@mp_player_intupperfind_the_fish",
        anim = "idle_a",
        name = "Fish Dance",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace"] = {
        dict = "mp_player_int_upperpeace_sign",
        anim = "mp_player_int_peace_sign",
        name = "Peace",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace2"] = {
        dict = "anim@mp_player_intupperpeace",
        anim = "idle_a",
        name = "Peace 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cpr"] = {
        dict = "mini@cpr@char_a@cpr_str",
        anim = "cpr_pumpchest",
        name = "CPR",
        options = {
            EmoteLoop = true
        }
    },
    ["cpr2"] = {
        dict = "mini@cpr@char_a@cpr_str",
        anim = "cpr_pumpchest",
        name = "CPR 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ledge"] = {
        dict = "missfbi1",
        anim = "ledge_loop",
        name = "Ledge",
        options = {
            EmoteLoop = true
        }
    },
    ["airplane"] = {
        dict = "missfbi1",
        anim = "ledge_loop",
        name = "Air Plane",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peek"] = {
        dict = "random@paparazzi@peek",
        anim = "left_peek_a",
        name = "Peek",
        options = {
            EmoteLoop = true
        }
    },
    ["cough"] = {
        dict = "timetable@gardener@smoking_joint",
        anim = "idle_cough",
        name = "Cough",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stretch"] = {
        dict = "mini@triathlon",
        anim = "idle_e",
        name = "Stretch",
        options = {
            EmoteLoop = true
        }
    },
    ["stretch2"] = {
        dict = "mini@triathlon",
        anim = "idle_f",
        name = "Stretch 2",
        options = {
            EmoteLoop = true
        }
    },
    ["stretch3"] = {
        dict = "mini@triathlon",
        anim = "idle_d",
        name = "Stretch 3",
        options = {
            EmoteLoop = true
        }
    },
    ["stretch4"] = {
        dict = "rcmfanatic1maryann_stretchidle_b",
        anim = "idle_e",
        name = "Stretch 4",
        options = {
            EmoteLoop = true
        }
    },
    ["celebrate"] = {
        dict = "rcmfanatic1celebrate",
        anim = "celebrate",
        name = "Celebrate",
        options = {
            EmoteLoop = true
        }
    },
    ["punching"] = {
        dict = "rcmextreme2",
        anim = "loop_punching",
        name = "Punching",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["superhero"] = {
        dict = "rcmbarry",
        anim = "base",
        name = "Superhero",
        options = {
            EmoteLoop = true
        }
    },
    ["superhero2"] = {
        dict = "rcmbarry",
        anim = "base",
        name = "Superhero 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mindcontrol"] = {
        dict = "rcmbarry",
        anim = "mind_control_b_loop",
        name = "Mind Control",
        options = {
            EmoteLoop = true
        }
    },
    ["mindcontrol2"] = {
        dict = "rcmbarry",
        anim = "bar_1_attack_idle_aln",
        name = "Mind Control 2",
        options = {
            EmoteLoop = true
        }
    },
    ["clown"] = {
        dict = "rcm_barry2",
        anim = "clown_idle_0",
        name = "Clown",
        options = {
            EmoteLoop = true
        }
    },
    ["clown2"] = {
        dict = "rcm_barry2",
        anim = "clown_idle_1",
        name = "Clown 2",
        options = {
            EmoteLoop = true
        }
    },
    ["clown3"] = {
        dict = "rcm_barry2",
        anim = "clown_idle_2",
        name = "Clown 3",
        options = {
            EmoteLoop = true
        }
    },
    ["clown4"] = {
        dict = "rcm_barry2",
        anim = "clown_idle_3",
        name = "Clown 4",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clown5"] = {
        dict = "rcm_barry2",
        anim = "clown_idle_6",
        name = "Clown 5",
        options = {
            EmoteLoop = true
        }
    },
    ["tryclothes"] = {
        dict = "mp_clothing@female@trousers",
        anim = "try_trousers_neutral_a",
        name = "Try Clothes",
        options = {
            EmoteLoop = true
        }
    },
    ["tryclothes2"] = {
        dict = "mp_clothing@female@shirt",
        anim = "try_shirt_positive_a",
        name = "Try Clothes 2",
        options = {
            EmoteLoop = true
        }
    },
    ["tryclothes3"] = {
        dict = "mp_clothing@female@shoes",
        anim = "try_shoes_positive_a",
        name = "Try Clothes 3",
        options = {
            EmoteLoop = true
        }
    },
    ["nervous2"] = {
        dict = "mp_missheist_countrybank@nervous",
        anim = "nervous_idle",
        name = "Nervous 2",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous"] = {
        dict = "amb@world_human_bum_standing@twitchy@idle_a",
        anim = "idle_c",
        name = "Nervous",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous3"] = {
        dict = "rcmme_tracey1",
        anim = "nervous_loop",
        name = "Nervous 3",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["uncuff"] = {
        dict = "mp_arresting",
        anim = "a_uncuff",
        name = "Uncuff",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["namaste"] = {
        dict = "timetable@amanda@ig_4",
        anim = "ig_4_base",
        name = "Namaste",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dj"] = {
        dict = "anim@amb@nightclub@djs@dixon@",
        anim = "dixn_dance_cntr_open_dix",
        name = "DJ",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["threaten"] = {
        dict = "random@atmrobberygen",
        anim = "b_atm_mugging",
        name = "Threaten",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["radio"] = {
        dict = "random@arrests",
        anim = "generic_radio_chatter",
        name = "Radio",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pull"] = {
        dict = "random@mugging4",
        anim = "struggle_loop_b_thief",
        name = "Pull",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bird"] = {
        dict = "random@peyote@bird",
        anim = "wakeup",
        name = "Bird"
    },
    ["chicken"] = {
        dict = "random@peyote@chicken",
        anim = "wakeup",
        name = "Chicken",
        options = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bark"] = {
        dict = "random@peyote@dog",
        anim = "wakeup",
        name = "Bark"
    },
    ["rabbit"] = {
        dict = "random@peyote@rabbit",
        anim = "wakeup",
        name = "Rabbit"
    },
    ["spiderman"] = {
        dict = "missexile3",
        anim = "ex03_train_roof_idle",
        name = "Spider-Man",
        options = {
            EmoteLoop = true
        }
    },
    ["boi"] = {
        dict = "special_ped@jane@monologue_5@monologue_5c",
        anim = "brotheradrianhasshown_2",
        name = "BOI",
        options = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["adjust"] = {
        dict = "missmic4",
        anim = "michael_tux_fidget",
        name = "Adjust",
        options = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["handsup"] = {
        dict = "missminuteman_1ig_2",
        anim = "handsup_base",
        name = "Hands Up",
        options = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    }
}

function spawnClone(animName)
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    
    -- Calcula la posición delante del jugador usando trigonometría
    local offsetDistance = 1.0
    local headingRad = math.rad(playerHeading)
    local spawnX = playerCoords.x + (offsetDistance * math.sin(-headingRad))
    local spawnY = playerCoords.y + (offsetDistance * math.cos(-headingRad))
    
    -- Crea el clon en la nueva posición
    local clonePed = ClonePed(playerPed, true, true, true)
    SetEntityCoords(clonePed, spawnX, spawnY, playerCoords.z, false, false, false, false)
    SetEntityHeading(clonePed, playerHeading)
    SetEntityVisible(clonePed, true)

    -- Obtiene la animación del array local
    local anim = animations[animName]
    if anim then
        RequestAnimDict(anim.dict)
        while not HasAnimDictLoaded(anim.dict) do
            Wait(100)
        end

        -- Espera 2 segundos antes de iniciar la animación
        Wait(2000)

        -- Iniciamos la animación con flags apropiados
        local flags = 51 -- 1 (base) + 2 (loop) + 16 (moving) + 32 (upper body)
        if not anim.options.EmoteMoving then
            flags = 35 -- 1 (base) + 2 (loop) + 32 (upper body)
        end

        SetPedCurrentWeaponVisible(clonePed, false, true, true, true)
        TaskPlayAnim(clonePed, anim.dict, anim.anim, 8.0, -8.0, -1, flags, 0, false, false, false)

        -- Aseguramos que la animación se mantenga
        SetPedKeepTask(clonePed, true)

        -- Luego creamos y adjuntamos el prop
        if anim.options.Prop then
            Wait(100)
            local prop = CreateObject(GetHashKey(anim.options.Prop), spawnX, spawnY, playerCoords.z + 0.2, true, true, true)
            AttachEntityToEntity(prop, clonePed, 
                GetPedBoneIndex(clonePed, anim.options.PropBone), 
                anim.options.PropPlacement[1], anim.options.PropPlacement[2], anim.options.PropPlacement[3], 
                anim.options.PropPlacement[4], anim.options.PropPlacement[5], anim.options.PropPlacement[6], 
                true, true, false, true, 1, true)
        end
    else
        print("Animación no encontrada: " .. animName)
    end
end

function spawnCloneWithTwoAnims(anim1Name, anim2Name)
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    
    -- Calcula la posición delante del jugador
    local offsetDistance = 1.0
    local headingRad = math.rad(playerHeading)
    local spawnX = playerCoords.x + (offsetDistance * math.sin(-headingRad))
    local spawnY = playerCoords.y + (offsetDistance * math.cos(-headingRad))
    
    -- Crea el clon
    local clonePed = ClonePed(playerPed, true, true, true)
    SetEntityCoords(clonePed, spawnX, spawnY, playerCoords.z, false, false, false, false)
    SetEntityHeading(clonePed, playerHeading)
    SetEntityVisible(clonePed, true)

    -- Obtiene las animaciones
    local anim1 = animations[anim1Name]
    local anim2 = animations[anim2Name]

    if anim1 and anim2 then
        -- Carga los diccionarios
        RequestAnimDict(anim1.dict)
        RequestAnimDict(anim2.dict)
        while not HasAnimDictLoaded(anim1.dict) or not HasAnimDictLoaded(anim2.dict) do
            Wait(100)
        end

        -- Espera 2 segundos antes de la primera animación
        Wait(2000)

        -- Ejecuta la primera animación (sentarse) con loop permanente
        local flags1 = 2 -- Solo usamos el flag de loop permanente
        TaskPlayAnim(clonePed, anim1.dict, anim1.anim, 8.0, -8.0, -1, flags1, 0, false, false, false)

        -- Espera 2 segundos antes de la segunda animación
        Wait(2000)

        -- Ejecuta la segunda animación (guitarra) solo para la parte superior del cuerpo
        local flags2 = 49 -- 1 (base) + 16 (moving) + 32 (upper body only)
        SetPedCurrentWeaponVisible(clonePed, false, true, true, true)
        TaskPlayAnim(clonePed, anim2.dict, anim2.anim, 8.0, -8.0, -1, flags2, 0, false, false, false)

        -- Aseguramos que la primera animación se mantenga
        SetPedKeepTask(clonePed, true)

        -- Maneja los props después de las animaciones
        if anim1.options.Prop then
            local prop1 = CreateObject(GetHashKey(anim1.options.Prop), spawnX, spawnY, playerCoords.z + 0.2, true, true, true)
            AttachEntityToEntity(prop1, clonePed, 
                GetPedBoneIndex(clonePed, anim1.options.PropBone), 
                anim1.options.PropPlacement[1], anim1.options.PropPlacement[2], anim1.options.PropPlacement[3], 
                anim1.options.PropPlacement[4], anim1.options.PropPlacement[5], anim1.options.PropPlacement[6], 
                true, true, false, true, 1, true)
        end

        Wait(100)

        if anim2.options.Prop then
            local prop2 = CreateObject(GetHashKey(anim2.options.Prop), spawnX, spawnY, playerCoords.z + 0.2, true, true, true)
            AttachEntityToEntity(prop2, clonePed, 
                GetPedBoneIndex(clonePed, anim2.options.PropBone), 
                anim2.options.PropPlacement[1], anim2.options.PropPlacement[2], anim2.options.PropPlacement[3], 
                anim2.options.PropPlacement[4], anim2.options.PropPlacement[5], anim2.options.PropPlacement[6], 
                true, true, false, true, 1, true)
        end
    end
end

-- Comando para generar un clon con la animación especificada
RegisterCommand("k", function(source, args)
    local animName1 = args[1]
    local animName2 = args[2]
    
    if animName1 then
        if animName2 then
            spawnCloneWithTwoAnims(animName1, animName2)
            print("Clon generado con las animaciones: " .. animName1 .. " y " .. animName2)
        else
            spawnClone(animName1)
            print("Clon generado con la animación: " .. animName1)
        end
    end
end, false)

-- Comando para desactivar el modo de spawn (opcional)
RegisterCommand("k2", function()
    spawnModeActive = false -- Desactiva el modo de spawn
    print("Modo de spawn desactivado.")
end, false)