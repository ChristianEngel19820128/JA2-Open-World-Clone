


'----------------------------------------------------------------------------------------
'waffen
'----------------------------------------------------------------------------------------

item_type_name[coltcommando]="M4 Colt Commando 5,56x45mm"
item_type_img[coltcommando]=LoadImage("gfx/guns/m4coltcommando.png",0)
MidHandleImage(item_type_img[coltcommando])
item_type_inv_slot[coltcommando]=player_inv_ruecken
item_type_dual[coltcommando]=1
item_type_space[coltcommando]=25
item_type_supressor[coltcommando]=1
item_type_2bein[coltcommando]=1
item_type_scope[coltcommando]=1
item_type_granate[coltcommando]=1
item_type_laser[coltcommando]=1
item_type_kaliber[coltcommando]=cal556x45mm
item_type_magazin[coltcommando]=1
item_type_group1[coltcommando]=group_weapon
item_type_group2[coltcommando]=group_rifle


item_type_name[remington870]="Remington 870"
item_type_img[remington870]=LoadImage("gfx/guns/remington870.png",0)
MidHandleImage(item_type_img[remington870])
item_type_inv_slot[remington870]=player_inv_ruecken
item_type_dual[remington870]=1
item_type_space[remington870]=25
item_type_kaliber[remington870]=cal12x70
item_type_munition[remington870]=1
item_type_contain[remington870]=6
item_type_group1[remington870]=group_weapon
item_type_group2[remington870]=group_shotgun


item_type_name[izh43]="Izh 43 Shotgun"
item_type_img[izh43]=LoadImage("gfx/guns/Izh43Shotgun.png",0)
MidHandleImage(item_type_img[izh43])
item_type_inv_slot[izh43]=player_inv_ruecken
item_type_dual[izh43]=1
item_type_space[izh43]=25
item_type_kaliber[izh43]=cal12x70
item_type_munition[izh43]=1
item_type_contain[izh43]=2
item_type_group1[izh43]=group_weapon
item_type_group2[izh43]=group_shotgun



item_type_name[beretta]="Beretta 92F 9mm"
item_type_img[beretta]=LoadImage("gfx/guns/beretta92f.png",0)
MidHandleImage(item_type_img[beretta])
item_type_inv_slot[beretta]=player_inv_holster
item_type_space[beretta]=15
item_type_supressor[beretta]=1
item_type_kaliber[beretta]=cal9mm
item_type_magazin[beretta]=1
item_type_group1[beretta]=group_weapon
item_type_group2[beretta]=group_pistol

'----------------------------------------------------------------------------------------
'aufsätze
'----------------------------------------------------------------------------------------

'----------------------------------------------------------------------------------------
'magazine
'----------------------------------------------------------------------------------------

item_type_name[mag_9mm_15_pistol]="9mm Magazin 15 Schuß für Pistole"
item_type_img[mag_9mm_15_pistol]=LoadImage("gfx/mags/9mm_15.png",0)
MidHandleImage(item_type_img[mag_9mm_15_pistol])
item_type_kaliber[mag_9mm_15_pistol]=cal9mm
item_type_munition[mag_9mm_15_pistol]=1
item_type_contain[mag_9mm_15_pistol]=15
item_type_group1[mag_9mm_15_pistol]=group_magazin

item_type_name[mag_556x45mm_30]="5,56x45mm Magazin 30 Schuß"
item_type_img[mag_556x45mm_30]=LoadImage("gfx/mags/5,56x45mm_30.png",0)
MidHandleImage(item_type_img[mag_556x45mm_30])
item_type_kaliber[mag_556x45mm_30]=cal556x45mm
item_type_munition[mag_556x45mm_30]=1
item_type_contain[mag_556x45mm_30]=30
item_type_group1[mag_556x45mm_30]=group_magazin

'----------------------------------------------------------------------------------------
'patronen
'----------------------------------------------------------------------------------------
item_type_name[mun_mixed]="verschiedene Arten von Munition"
item_type_img[mun_mixed]=LoadImage("gfx/mun/mixed.png",0)
MidHandleImage(item_type_img[mun_mixed])
item_type_room[mun_mixed]=60
item_type_stack[mun_mixed]=45
item_type_group1[mun_mixed]=group_munition

item_type_name[mun_9mm]="9mm Patronen"
item_type_img[mun_9mm]=LoadImage("gfx/mun/9mm.png",0)
MidHandleImage(item_type_img[mun_9mm])
item_type_space[mun_9mm]=1
item_type_room[mun_9mm]=60
item_type_kaliber[mun_9mm]=cal9mm
item_type_kaliber_type[mun_9mm]=cal9mm
item_type_stack[mun_9mm]=45
item_type_group1[mun_9mm]=group_munition
item_type_group2[mun_9mm]=cal9mm

item_type_name[mun_p357]=".357 Patronen"
item_type_img[mun_p357]=LoadImage("gfx/mun/.357.png",0)
MidHandleImage(item_type_img[mun_p357])
item_type_space[mun_p357]=1
item_type_room[mun_p357]=60
item_type_kaliber[mun_p357]=calp357
item_type_kaliber_type[mun_p357]=calp357
item_type_stack[mun_p357]=45
item_type_group1[mun_p357]=group_munition
item_type_group2[mun_p357]=calp357

item_type_name[mun_p45acp]=".45ACP Patronen"
item_type_img[mun_p45acp]=LoadImage("gfx/mun/.45ACP.png",0)
MidHandleImage(item_type_img[mun_p45acp])
item_type_space[mun_p45acp]=1
item_type_room[mun_p45acp]=60
item_type_kaliber[mun_p45acp]=calp45acp
item_type_kaliber_type[mun_p45acp]=calp45acp
item_type_stack[mun_p45acp]=45
item_type_group1[mun_p45acp]=group_munition
item_type_group2[mun_p45acp]=calp45acp


item_type_name[mun_556x45mm]="5,56x45mm Patronen"
item_type_img[mun_556x45mm]=LoadImage("gfx/mun/5,56x45mm.png",0)
MidHandleImage(item_type_img[mun_556x45mm])
item_type_space[mun_556x45mm]=2
item_type_room[mun_556x45mm]=60
item_type_kaliber[mun_556x45mm]=cal556x45mm
item_type_kaliber_type[mun_556x45mm]=cal556x45mm
item_type_stack[mun_556x45mm]=30
item_type_group1[mun_556x45mm]=group_munition
item_type_group2[mun_556x45mm]=cal556x45mm

item_type_name[mun_762x39mm]="7,62x39mm Patronen"
item_type_img[mun_762x39mm]=LoadImage("gfx/mun/7,62x39mm.png",0)
MidHandleImage(item_type_img[mun_762x39mm])
item_type_space[mun_762x39mm]=2
item_type_room[mun_762x39mm]=60
item_type_kaliber[mun_762x39mm]=cal762x39mm
item_type_kaliber_type[mun_762x39mm]=cal762x39mm
item_type_stack[mun_762x39mm]=30
item_type_group1[mun_762x39mm]=group_munition
item_type_group2[mun_762x39mm]=cal762x39mm

item_type_name[mun_12x70schrot]="Kaliber 12/70 Schrot"
item_type_img[mun_12x70schrot]=LoadImage("gfx/mun/12x70schrot.png",0)
MidHandleImage(item_type_img[mun_12x70schrot])
item_type_space[mun_12x70schrot]=3
item_type_room[mun_12x70schrot]=60
item_type_kaliber[mun_12x70schrot]=cal12x70
item_type_kaliber_type[mun_12x70schrot]=cal12x70schrot
item_type_stack[mun_12x70schrot]=20
item_type_group1[mun_12x70schrot]=group_munition
item_type_group2[mun_12x70schrot]=cal12x70schrot

item_type_name[mun_12x70slug]="Kaliber 12/70 Slug"
item_type_img[mun_12x70slug]=LoadImage("gfx/mun/12x70slug.png",0)
MidHandleImage(item_type_img[mun_12x70slug])
item_type_space[mun_12x70slug]=3
item_type_room[mun_12x70slug]=60
item_type_kaliber[mun_12x70slug]=cal12x70
item_type_kaliber_type[mun_12x70slug]=cal12x70slug
item_type_stack[mun_12x70slug]=20
item_type_group1[mun_12x70slug]=group_munition
item_type_group2[mun_12x70slug]=cal12x70slug

'----------------------------------------------------------------------------------------
'ausrüstung
'----------------------------------------------------------------------------------------


item_type_name[feldarztgepaeck]="Feldarztgepäck"
item_type_img[feldarztgepaeck]=LoadImage("gfx/ausruestung/feldarztgepaeck.png",0)
MidHandleImage(item_type_img[feldarztgepaeck])
item_type_inv_slot[feldarztgepaeck]=player_inv_schulter
item_type_space[feldarztgepaeck]=5
item_type_slots[feldarztgepaeck]=4
item_type_slot_capacity[feldarztgepaeck,0]=0
item_type_slot_capacity[feldarztgepaeck,1]=0
item_type_slot_capacity[feldarztgepaeck,2]=1
item_type_slot_capacity[feldarztgepaeck,3]=1


item_type_name[flakweste]="Flakweste"
item_type_img[flakweste]=LoadImage("gfx/ausruestung/flakweste.png",0)
MidHandleImage(item_type_img[flakweste])
item_type_inv_slot[flakweste]=player_inv_brust
item_type_space[flakweste]=3
item_type_slots[flakweste]=4
item_type_slot_capacity[flakweste,0]=0
item_type_slot_capacity[flakweste,1]=0
item_type_slot_capacity[flakweste,2]=0
item_type_slot_capacity[flakweste,3]=0


item_type_name[kevlarweste]="Kevlarweste"
item_type_img[kevlarweste]=LoadImage("gfx/ausruestung/kevlarweste.png",0)
MidHandleImage(item_type_img[kevlarweste])
item_type_inv_slot[kevlarweste]=player_inv_brust
item_type_space[kevlarweste]=3
item_type_slots[kevlarweste]=2
item_type_slot_capacity[kevlarweste,0]=0
item_type_slot_capacity[kevlarweste,1]=0

item_type_name[kevlarhose]="Kevlarhose"
item_type_img[kevlarhose]=LoadImage("gfx/ausruestung/kevlarhose.png",0)
MidHandleImage(item_type_img[kevlarhose])
item_type_inv_slot[kevlarhose]=player_inv_beine
item_type_space[kevlarhose]=2
item_type_slots[kevlarhose]=4
item_type_slot_capacity[kevlarhose,0]=0
item_type_slot_capacity[kevlarhose,1]=0
item_type_slot_capacity[kevlarhose,2]=0
item_type_slot_capacity[kevlarhose,3]=0


item_type_name[stahlhelm]="Stahlhelm"
item_type_img[stahlhelm]=LoadImage("gfx/ausruestung/stahlhelm.png",0)
MidHandleImage(item_type_img[stahlhelm])
item_type_inv_slot[stahlhelm]=player_inv_kopf
item_type_space[stahlhelm]=3


item_type_name[brille]="Schutzbrille"
item_type_img[brille]=LoadImage("gfx/ausruestung/brille.png",0)
MidHandleImage(item_type_img[brille])
item_type_inv_slot[brille]=player_inv_augen
item_type_space[brille]=1



item_type_name[huntingbackpack]="Hunting Backpack"
item_type_img[huntingbackpack]=LoadImage("gfx/ausruestung/Hunting_Backpack.png",0)
MidHandleImage(item_type_img[huntingbackpack])
item_type_inv_slot[huntingbackpack]=player_inv_ruecken
item_type_space[huntingbackpack]=5
item_type_slots[huntingbackpack]=4
item_type_slot_capacity[huntingbackpack,0]=0
item_type_slot_capacity[huntingbackpack,1]=0
item_type_slot_capacity[huntingbackpack,2]=1
item_type_slot_capacity[huntingbackpack,3]=3

item_type_name[schoolbackpack]="Child Briefcase"
item_type_img[schoolbackpack]=LoadImage("gfx/ausruestung/School-backpack.png",0)
MidHandleImage(item_type_img[schoolbackpack])
item_type_inv_slot[schoolbackpack]=player_inv_ruecken
item_type_space[schoolbackpack]=3
item_type_slots[schoolbackpack]=1
item_type_slot_capacity[schoolbackpack,0]=2



'----------------------------------------------------------------------------------------
'food
'----------------------------------------------------------------------------------------

item_type_name[bacon]="Fleisch in einer Dose"
item_type_img[bacon]=LoadImage("gfx/food/Can_of_Tactical_Bacon.png",0)
MidHandleImage(item_type_img[bacon])
item_type_space[bacon]=1
item_type_group1[bacon]=group_food
item_type_value1[bacon]=250
item_type_value2[bacon]=5

item_type_name[cola]="Cola in einer Dose"
item_type_img[cola]=LoadImage("gfx/food/cola.png",0)
MidHandleImage(item_type_img[cola])
item_type_space[cola]=1
item_type_group1[cola]=group_drink
item_type_value1[cola]=1
item_type_value2[cola]=125

item_type_name[bierflasche]="Bier in einer Flasche"
item_type_img[bierflasche]=LoadImage("gfx/food/bier.png",0)
MidHandleImage(item_type_img[bierflasche])
item_type_space[bierflasche]=1
item_type_group1[bierflasche]=group_drink
item_type_group2[bierflasche]=group_alkohol
item_type_value1[bierflasche]=25
item_type_value2[bierflasche]=100
item_type_value3[bierflasche]=5

item_type_name[alkohol]="reiner Alkohol in einer Flasche"
item_type_img[alkohol]=LoadImage("gfx/food/Alcohol.png",0)
MidHandleImage(item_type_img[alkohol])
item_type_space[alkohol]=1
item_type_group1[alkohol]=group_drink
item_type_group2[alkohol]=group_alkohol
item_type_value1[alkohol]=10
item_type_value2[alkohol]=15
item_type_value3[alkohol]=80

'----------------------------------------------------------------------------------------
'items
'----------------------------------------------------------------------------------------

item_type_name[geld1]="1 Dollar Note"
item_type_img[geld1]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld1])
item_type_space[geld1]=1
item_type_room[geld1]=100
item_type_stack[geld1]=100
item_type_group1[geld1]=group_geld
item_type_group1[geld1]=group_scheine

item_type_name[geld5]="5 Dollar Note"
item_type_img[geld5]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld5])
item_type_space[geld5]=1
item_type_room[geld5]=100
item_type_stack[geld5]=100
item_type_group1[geld5]=group_geld
item_type_group1[geld5]=group_scheine

item_type_name[geld10]="10 Dollar Note"
item_type_img[geld10]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld10])
item_type_space[geld10]=1
item_type_room[geld10]=100
item_type_stack[geld10]=100
item_type_group1[geld10]=group_geld
item_type_group1[geld10]=group_scheine

item_type_name[geld20]="20 Dollar Note"
item_type_img[geld20]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld20])
item_type_space[geld20]=1
item_type_room[geld20]=100
item_type_stack[geld20]=100
item_type_group1[geld20]=group_geld
item_type_group1[geld20]=group_scheine

item_type_name[geld50]="50 Dollar Note"
item_type_img[geld50]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld50])
item_type_space[geld50]=1
item_type_room[geld50]=100
item_type_stack[geld50]=100
item_type_group1[geld50]=group_geld
item_type_group1[geld50]=group_scheine

item_type_name[geld100]="100 Dollar Note"
item_type_img[geld100]=LoadImage("gfx/items/geld.png",0)
MidHandleImage(item_type_img[geld100])
item_type_space[geld100]=1
item_type_room[geld100]=100
item_type_stack[geld100]=100
item_type_group1[geld100]=group_geld
item_type_group1[geld100]=group_scheine




item_type_name[knicklichter]="Knicklichter in  verschiedenen Farben"
item_type_img[knicklichter]=LoadImage("gfx/items/knicklichter.png",0)
MidHandleImage(item_type_img[knicklichter])
item_type_room[knicklichter]=10
item_type_stack[knicklichter]=5
item_type_group1[knicklichter]=group_knicklicht


item_type_name[knicklicht_blau]="Knicklicht Blau"
item_type_img[knicklicht_blau]=LoadImage("gfx/items/knicklichtblau.png",0)
MidHandleImage(item_type_img[knicklicht_blau])
item_type_space[knicklicht_blau]=2
item_type_room[knicklicht_blau]=10
item_type_stack[knicklicht_blau]=5
item_type_light[knicklicht_blau]=1
item_type_light_duration[knicklicht_blau]=1500
item_type_light_range[knicklicht_blau]=7
item_type_light_r[knicklicht_blau]=0
item_type_light_g[knicklicht_blau]=0
item_type_light_b[knicklicht_blau]=255
item_type_group1[knicklicht_blau]=group_knicklicht
item_type_group2[knicklicht_blau]=group_blau

item_type_name[knicklicht_gruen]="Knicklicht Grün"
item_type_img[knicklicht_gruen]=LoadImage("gfx/items/knicklichtgruen.png",0)
MidHandleImage(item_type_img[knicklicht_gruen])
item_type_space[knicklicht_gruen]=2
item_type_room[knicklicht_gruen]=10
item_type_stack[knicklicht_gruen]=5
item_type_light[knicklicht_gruen]=1
item_type_light_duration[knicklicht_gruen]=1500
item_type_light_range[knicklicht_gruen]=7
item_type_light_r[knicklicht_gruen]=0
item_type_light_g[knicklicht_gruen]=255
item_type_light_b[knicklicht_gruen]=0
item_type_group1[knicklicht_gruen]=group_knicklicht
item_type_group2[knicklicht_gruen]=group_gruen

item_type_name[knicklicht_rot]="Knicklicht Rot"
item_type_img[knicklicht_rot]=LoadImage("gfx/items/knicklichtrot.png",0)
MidHandleImage(item_type_img[knicklicht_rot])
item_type_space[knicklicht_rot]=2
item_type_room[knicklicht_rot]=10
item_type_stack[knicklicht_rot]=5
item_type_light[knicklicht_rot]=1
item_type_light_duration[knicklicht_rot]=1500
item_type_light_range[knicklicht_rot]=7
item_type_light_r[knicklicht_rot]=255
item_type_light_g[knicklicht_rot]=0
item_type_light_b[knicklicht_rot]=0
item_type_group1[knicklicht_rot]=group_knicklicht
item_type_group2[knicklicht_rot]=group_rot


item_type_name[taschenlampe]="Taschenlampe"
item_type_img[taschenlampe]=LoadImage("gfx/items/taschenlampe.png",0)
MidHandleImage(item_type_img[taschenlampe])
item_type_space[taschenlampe]=12
item_type_light[taschenlampe]=1
item_type_light_duration[taschenlampe]=1000
item_type_light_range[taschenlampe]=11
item_type_light_r[taschenlampe]=255
item_type_light_g[taschenlampe]=255
item_type_light_b[taschenlampe]=255
item_type_group1[taschenlampe]=group_lampe
item_type_group2[taschenlampe]=group_weiss





