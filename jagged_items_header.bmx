




Const item_stack_max=50
Const item_slot_max=5
Const item_capacity_max=4
Const item_type_max=512
Const item_max=10000
Const item_group_max=3
Const item_value_max=5





Const cal_none=0
Const cal_9mm=1
Const cal_9mmHS=2
Const cal_9mmPB=3
Const cal_9mmSS=4
Const cal_10mm=5
Const cal_10mmHS=6
Const cal_10mmPB=7
Const cal_p357=8
Const cal_p357HS=9
Const cal_p357PB=10
Const cal_p45acp=11
Const cal_p45acpHS=12
Const cal_p45acpPB=13
Const cal_556x45mm=14
Const cal_556x45mmHS=15
Const cal_556x45mmPB=16
Const cal_556x45mmSS=17
Const cal_570x28mm=18
Const cal_570x28mmHS=19
Const cal_570x28mmPB=20
Const cal_762x39mm=21
Const cal_762x39mmHS=22
Const cal_762x39mmPB=23
Const cal_762x51mm=24
Const cal_762x51mmHS=25
Const cal_762x51mmPB=26
Const cal_12x70=27
Const cal_12x70slug=28
Const cal_12x70buckshot=29






Const group_none=0

Const group_weapon=1

Const group_knife=2
Const group_throwingknife=3
Const group_machete=4
Const group_brassknuckles=5
Const group_bat=6
Const group_pistol=7
Const group_rifle=8
Const group_mpk=9
Const group_mp=10
Const group_assaultrifle=11
Const group_lmg=12
Const group_shotgun=13
Const group_revolver=14
Const group_smg=15

Const group_mortar=16
Const group_rocketlauncher=17

Const group_magazine=18
Const group_ammo=19
Const group_armorpiercing=20
Const group_hollowpoint=21
Const group_subsonic=22
Const group_supersonic=23

Const group_grenade=24
Const group_shell=25

Const group_rocket=26

Const group_explosive=27
Const group_detonator=28

Const group_addon=29

Const group_scope=30
Const group_supressor=31
Const group_bipod=32
Const group_grenadelauncher=33

Const group_light=34
Const group_flashlight=35
Const group_glowstick=36
Const group_weaponlight=37
Const group_laserpointer=38

Const group_gear=39

Const group_backpack=40
Const group_vest=41
Const group_protectionvest=42
Const group_goggles=43
Const group_watch=44
Const group_headgear=45
Const group_pants=46
Const group_shirt=47

Const group_tool=48

Const group_compass=49
Const group_canopener=50
Const group_crowbar=51
Const group_monkeywrench=52
Const group_wirecutter=53

Const group_lighter=54

Const group_camouflage=55

Const group_key=56
Const group_keycard=57

Const group_medipack=58
Const group_toolbox=59

Const group_journal=60
Const group_tape=61
Const group_disk=62

Const group_case=63

Const group_money=64
Const group_notes=65
Const group_coins=66

Const group_drink=67
Const group_food=68
Const group_alcohol=69
Const group_berries=70
Const group_drug=71

Const group_weaponpart=72
Const group_fastloader=73

Const group_picklock=74
Const group_leverage=75








Global item_type_count

Global item_type_name:String[item_type_max]
Global item_type_img:TImage[item_type_max]
Global item_type_inv_slot[item_type_max]
Global item_type_dual[item_type_max]
Global item_type_space[item_type_max]
Global item_type_room[item_type_max]
Global item_type_supressed[item_type_max]
Global item_type_supressor[item_type_max]
Global item_type_bipod[item_type_max]
Global item_type_scope[item_type_max]
Global item_type_grenade[item_type_max]
Global item_type_laser[item_type_max]
Global item_type_kaliber[item_type_max]
Global item_type_kaliber_type[item_type_max]
Global item_type_magazin[item_type_max]
Global item_type_damage[item_type_max]
Global item_type_range[item_type_max]
Global item_type_stack[item_type_max]
Global item_type_contain[item_type_max]
Global item_type_munition[item_type_max]
Global item_type_group[item_type_max,item_group_max]
Global item_type_light[item_type_max]
Global item_type_light_range[item_type_max]
Global item_type_light_duration[item_type_max]
Global item_type_light_r[item_type_max]
Global item_type_light_g[item_type_max]
Global item_type_light_b[item_type_max]

Global item_type_value[item_type_max,item_value_max]

Global item_type_slots[item_type_max]
Global item_type_slot_capacity[item_type_max,item_slot_max]




Global mouse_inventory
Global mouse_inventory_index









Const location_map=0
Const location_item=1
Const location_player=2
Const location_object=3
Const location_mouse=4
Const location_stack=5



Global item_last=0

Global item[item_max]

Global item_type[item_max]

Global item_location[item_max]
Global item_location_index[item_max]
Global item_location_pos[item_max]



Global item_world_x[item_max]
Global item_world_y[item_max]
Global item_world_z[item_max]
Global item_world_i[item_max]

Global item_zustand[item_max]
Global item_aktiv[item_max]
Global item_time[item_max]


Global item_room[item_max]

Global item_stack_count[item_max]

Global item_stack[item_max,item_stack_max]
Global item_stack_index[item_max,item_stack_max]

Global item_contain[item_max]



Global item_slot[item_max,item_slot_max,item_capacity_max]
Global item_slot_index[item_max,item_slot_max,item_capacity_max]




