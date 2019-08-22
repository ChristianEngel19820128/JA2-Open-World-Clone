




Const item_inv_max=22
Const item_stack_max=50
Const item_slot_max=10
Const item_capacity_max=10
Const item_type_max=100
Const item_max=10000







Const cal9mm=0
Const cal9mmHS=1
Const cal9mmPB=2
Const cal9mmSS=3
Const cal10mm=4
Const cal10mmHS=5
Const cal10mmPB=6
Const calp357=7
Const calp357HS=8
Const calp357PB=9
Const calp45acp=10
Const calp45acpHS=11
Const calp45acpPB=12
Const cal556x45mm=13
Const cal556x45mmHS=14
Const cal556x45mmPB=15
Const cal556x45mmSS=16
Const cal570x28mm=17
Const cal570x28mmHS=18
Const cal570x28mmPB=19
Const cal762x39mm=20
Const cal762x39mmHS=21
Const cal762x39mmPB=22
Const cal762x51mm=23
Const cal762x51mmHS=24
Const cal762x51mmPB=25
Const cal12x70=26
Const cal12x70slug=27
Const cal12x70schrot=28






Const group_none=0
Const group_pistol=1
Const group_rifle=2
Const group_mp=3
Const group_mpk=4
Const group_lmg=5
Const group_magazin=6
Const group_tool=7
Const group_munition=8
Const group_weapon=9
Const group_supressor=10
Const group_zweibein=11
Const group_laser=12
Const group_granate=13
Const group_scope=14
Const group_light=15
Const group_shotgun=16
Const group_revolver=17
Const group_smg=18
Const group_knicklicht=19
Const group_geld=20
Const group_scheine=21
Const group_rot=22
Const group_gruen=23
Const group_blau=24
Const group_weiss=25
Const group_lampe=26
Const group_drink=27
Const group_food=28
Const group_alkohol=29



Const empty=0
Const coltcommando=1
Const beretta=2
Const iron_sight=3
Const scope_2x2=4 '
Const scope_4x4=5 '
Const supressor_9=6 '
Const supressor_556=7 '
Const flakweste=8
Const kevlarweste=9
Const stahlhelm=10
Const geld1=11
Const huntingbackpack=12
Const schoolbackpack=13
Const feldarztgepaeck=14
Const kevlarhose=15
Const brille=16
Const mag_9mm_15_pistol=17
Const mun_9mm=18
Const crowbar=19 '
Const knicklicht_blau=20
Const knicklicht_gruen=21
Const knicklicht_rot=22
Const mun_12x70schrot=23
Const mun_12x70slug=24
Const remington870=25
Const izh43=26
Const geld5=27
Const geld10=28
Const geld20=29
Const geld50=30
Const geld100=31
Const mun_556x45mm=32
Const mun_mixed=33
Const knicklichter=34
Const taschenlampe=35
Const mag_556x45mm_30=36
Const mun_762x39mm=37
Const mun_p357=38
Const mun_p45acp=39
Const bacon=40
Const cola=41
Const bierflasche=42
Const alkohol=43




Global item_type_name:String[item_type_max]
Global item_type_img:TImage[item_type_max]
Global item_type_inv_slot[item_type_max]
Global item_type_dual[item_type_max]
Global item_type_space[item_type_max]
Global item_type_room[item_type_max]
Global item_type_supressor[item_type_max]
Global item_type_2bein[item_type_max]
Global item_type_scope[item_type_max]
Global item_type_granate[item_type_max]
Global item_type_laser[item_type_max]
Global item_type_kaliber[item_type_max]
Global item_type_kaliber_type[item_type_max]
Global item_type_magazin[item_type_max]
Global item_type_damage[item_type_max]
Global item_type_range[item_type_max]
Global item_type_stack[item_type_max]
Global item_type_contain[item_type_max]
Global item_type_munition[item_type_max]
Global item_type_group1[item_type_max]
Global item_type_group2[item_type_max]
Global item_type_light[item_type_max]
Global item_type_light_range[item_type_max]
Global item_type_light_duration[item_type_max]
Global item_type_light_r[item_type_max]
Global item_type_light_g[item_type_max]
Global item_type_light_b[item_type_max]

Global item_type_value1[item_type_max]
Global item_type_value2[item_type_max]
Global item_type_value3[item_type_max]

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

Global item_inv[item_max,item_inv_max]
Global item_inv_index[item_max,item_inv_max]

Global item_slot[item_max,item_slot_max,item_capacity_max]
Global item_slot_index[item_max,item_slot_max,item_capacity_max]


