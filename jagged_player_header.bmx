
Const player_righthand=0
Const player_lefthand=1
Const player_dualhand=2



Global player_inv_x=309
Global player_inv_y=wy-200

Const player_inv_max=15

Const player_inv_none=0
Const player_inv_head=1
Const player_inv_face=2
Const player_inv_eyes=3
Const player_inv_mouth=4
Const player_inv_chest=5
Const player_inv_back=6
Const player_inv_torso=7
Const player_inv_belt=8
Const player_inv_legs=9
Const player_inv_knees=10
Const player_inv_foot=11
Const player_inv_holster=12
Const player_inv_shoulders=13
Const player_inv_wrist=14


Const player_hand_max=2

Const player_hand_left=1
Const player_hand_right=2



Const player_act_stand=0
Const player_act_turn_left=1
Const player_act_turn_right=2
Const player_act_walk=3
Const player_act_run=4
Const player_act_swat=5
Const player_act_crawl=6
Const player_act_pos_down=7
Const player_act_pos_up=8
Const player_act_jump=9
Const player_act_climb_up=10
Const player_act_climb_down=11
Const player_act_pickup=12
Const player_act_open=13
Const player_act_throw=14
Const player_act_w_stand=15
Const player_act_w_walk=16
Const player_act_w_tred=17
Const player_act_w_swim=18
Const player_act_w_swimfast=19








'advanced animation porting

Const player_anim_max=16

Global player_anim[player_anim_max]
Global player_anim_reverse[player_anim_max]
Global player_anim_loop[player_anim_max]
Global player_anim_keyframe_min[player_anim_max]
Global player_anim_keyframe_max[player_anim_max]

'stances

Const player_anim_stand=0
Const player_anim_crouch=1
Const player_anim_prone=2
Const player_anim_w_stand=3
Const player_anim_w_tred=4

'transition

Const player_anim_go_stand_to_crouch=5
Const player_anim_go_crouch_to_prone=6
Const player_anim_go_prone_to_crouch=7
Const player_anim_go_crouch_to_stand=8

'move

Const player_anim_walk=9
Const player_anim_run=10
Const player_anim_swat=11
Const player_anim_crawl=12
Const player_anim_w_walk=13
Const player_anim_w_swim=14
Const player_anim_w_swimfast=15

'animation config data

'stances

player_anim[player_anim_stand]=anim_stand
player_anim_reverse[player_anim_stand]=0
player_anim_loop[player_anim_stand]=1
player_anim_keyframe_min[player_anim_stand]=0
player_anim_keyframe_max[player_anim_stand]=7

player_anim[player_anim_crouch]=anim_crouch
player_anim_reverse[player_anim_crouch]=0
player_anim_loop[player_anim_crouch]=1
player_anim_keyframe_min[player_anim_crouch]=5
player_anim_keyframe_max[player_anim_crouch]=14

player_anim[player_anim_prone]=anim_prone
player_anim_reverse[player_anim_prone]=0
player_anim_loop[player_anim_prone]=1
player_anim_keyframe_min[player_anim_prone]=5
player_anim_keyframe_max[player_anim_prone]=5

player_anim[player_anim_w_stand]=anim_w_stand
player_anim_reverse[player_anim_w_stand]=0
player_anim_loop[player_anim_w_stand]=1
player_anim_keyframe_min[player_anim_w_stand]=0
player_anim_keyframe_max[player_anim_w_stand]=7

player_anim[player_anim_w_tred]=anim_w_tred
player_anim_reverse[player_anim_w_tred]=0
player_anim_loop[player_anim_w_tred]=1
player_anim_keyframe_min[player_anim_w_tred]=0
player_anim_keyframe_max[player_anim_w_tred]=11

'transition

player_anim[player_anim_go_stand_to_crouch]=anim_crouch
player_anim_reverse[player_anim_go_stand_to_crouch]=0
player_anim_loop[player_anim_go_stand_to_crouch]=0
player_anim_keyframe_min[player_anim_go_stand_to_crouch]=0
player_anim_keyframe_max[player_anim_go_stand_to_crouch]=5

player_anim[player_anim_go_crouch_to_prone]=anim_prone
player_anim_reverse[player_anim_go_crouch_to_prone]=0
player_anim_loop[player_anim_go_crouch_to_prone]=0
player_anim_keyframe_min[player_anim_go_crouch_to_prone]=0
player_anim_keyframe_max[player_anim_go_crouch_to_prone]=5

player_anim[player_anim_go_prone_to_crouch]=anim_prone
player_anim_reverse[player_anim_go_prone_to_crouch]=1
player_anim_loop[player_anim_go_prone_to_crouch]=0
player_anim_keyframe_min[player_anim_go_prone_to_crouch]=0
player_anim_keyframe_max[player_anim_go_prone_to_crouch]=5

player_anim[player_anim_go_crouch_to_stand]=anim_crouch
player_anim_reverse[player_anim_go_crouch_to_stand]=1
player_anim_loop[player_anim_go_crouch_to_stand]=0
player_anim_keyframe_min[player_anim_go_crouch_to_stand]=0
player_anim_keyframe_max[player_anim_go_crouch_to_stand]=5

'move

player_anim[player_anim_walk]=anim_walk
player_anim_reverse[player_anim_walk]=0
player_anim_loop[player_anim_walk]=1
player_anim_keyframe_min[player_anim_walk]=0
player_anim_keyframe_max[player_anim_walk]=11

player_anim[player_anim_run]=anim_run
player_anim_reverse[player_anim_run]=0
player_anim_loop[player_anim_run]=1
player_anim_keyframe_min[player_anim_run]=0
player_anim_keyframe_max[player_anim_run]=11

player_anim[player_anim_swat]=anim_swat
player_anim_reverse[player_anim_swat]=0
player_anim_loop[player_anim_swat]=1
player_anim_keyframe_min[player_anim_swat]=0
player_anim_keyframe_max[player_anim_swat]=21

player_anim[player_anim_crawl]=anim_prone
player_anim_reverse[player_anim_crawl]=0
player_anim_loop[player_anim_crawl]=1
player_anim_keyframe_min[player_anim_crawl]=5
player_anim_keyframe_max[player_anim_crawl]=18

player_anim[player_anim_w_walk]=anim_w_walk
player_anim_reverse[player_anim_w_walk]=0
player_anim_loop[player_anim_w_walk]=1
player_anim_keyframe_min[player_anim_w_walk]=0
player_anim_keyframe_max[player_anim_w_walk]=11

player_anim[player_anim_w_swim]=anim_w_swim
player_anim_reverse[player_anim_w_swim]=0
player_anim_loop[player_anim_w_swim]=1
player_anim_keyframe_min[player_anim_w_swim]=0
player_anim_keyframe_max[player_anim_w_swim]=15

player_anim[player_anim_w_swimfast]=anim_w_swim
player_anim_reverse[player_anim_w_swimfast]=0
player_anim_loop[player_anim_w_swimfast]=1
player_anim_keyframe_min[player_anim_w_swimfast]=0
player_anim_keyframe_max[player_anim_w_swimfast]=15



'energy uses

Const player_e_turn=2
Const player_e_walk=4
Const player_e_run=6
Const player_e_swat=6
Const player_e_crawl=8
Const player_e_turn_r=4
Const player_e_move_r=6
Const player_e_run_r=8
Const player_e_swat_r=8
Const player_e_crawl_r=10
Const player_e_throw_low=6
Const player_e_throw_high=10
Const player_e_open=4
Const player_e_jump=10
Const player_e_climb=12
Const player_e_pickup=4
Const player_e_pos_change=4
Const player_e_water_swim=8
Const player_e_water_swimfast=10
Const player_e_water_turn=4
Const player_e_water_walk=6
Const player_e_water_walk_r=8
Const player_e_inventory_action=1









Const player_max=512
Const player_tar_max=50



'player selection

Const player_select_max=10

Global player_select[player_select_max]
Global player_select_index[player_select_max]
Global player_select_count
Global player_select_main

Global player_selected[player_max]
Global player_selected_pos[player_max]




'single player data

Global player[player_max]

Global player_soldier[player_max]
Global player_main[player_max]

Global player_fraction[player_max]
Global player_group[player_max]

Global player_map_x[player_max]
Global player_map_y[player_max]

'weltkoordinaten
Global player_world_x[player_max]
Global player_world_y[player_max]
Global player_world_z[player_max]

'bildschirmkoordinaten
Global player_x[player_max]
Global player_y[player_max]
Global player_z[player_max]

'wegpunkte

'Global player_tar[player_max]

Global player_tar_main[player_max]
Global player_tar_main_pos[player_max]
Global player_tar_main_action[player_max]
Global player_tar_main_x[player_max]
Global player_tar_main_y[player_max]

Global player_tar_list_count[player_max]
Global player_tar_list[player_max,player_tar_max]
Global player_tar_list_action[player_max,player_tar_max]
Global player_tar_list_x[player_max,player_tar_max]
Global player_tar_list_y[player_max,player_tar_max]
Global player_tar_list_z[player_max,player_tar_max]

'Global player_tar_next_x[player_max]
'Global player_tar_next_y[player_max]

'aktion
Global player_action[player_max]
Global player_action_started[player_max]
Global player_action_end[player_max]
Global player_action_x[player_max]
Global player_action_y[player_max]
Global player_action_z[player_max]
Global player_action_points[player_max]

'geschwindigkeit
Global player_move_t[player_max]
Global player_move_s[player_max]

'ausrichtung
Global player_align[player_max]
Global player_position[player_max]


'animationen

Global player_anim_cache_1:TPixmap[player_max]
Global player_anim_cache_2:TImage[player_max]

Global player_anim_transition[player_max]


Global player_anim_i[player_max]
Global player_anim_t[player_max]
Global player_anim_s[player_max]

Global player_in_motion[player_max]

Global player_color_hair_r[player_max]
Global player_color_hair_g[player_max]
Global player_color_hair_b[player_max]

Global player_color_shirt_r[player_max]
Global player_color_shirt_g[player_max]
Global player_color_shirt_b[player_max]

Global player_color_skin_r[player_max]
Global player_color_skin_g[player_max]
Global player_color_skin_b[player_max]

Global player_color_pants_r[player_max]
Global player_color_pants_g[player_max]
Global player_color_pants_b[player_max]

'charakterwerte

Global player_name:String[player_max]
Global player_nick:String[player_max]


Global player_sex[player_max]

Global player_temperatur[player_max]

Global player_handed[player_max]


Global player_life_max[player_max]
Global player_life_lowered[player_max]
Global player_life[player_max]
Global player_life_t[player_max]
Global player_life_s[player_max]

Global player_hurt[player_max]
Global player_bleeding[player_max]
Global player_venomed[player_max]
Global player_freeze[player_max]
Global player_sick[player_max]


Global player_exhaustion[player_max]

Global player_energy_max[player_max]
Global player_energy_lowered[player_max]
Global player_energy[player_max]
Global player_energy_t[player_max]
Global player_energy_s[player_max]

Global player_moral[player_max]
Global player_angst[player_max]
Global player_hoffnung[player_max]
Global player_vertrauen[player_max]
Global player_neugier[player_max]

Global player_hunger_max[player_max]
Global player_hunger[player_max]
Global player_hunger_t[player_max]
Global player_hunger_s[player_max]

Global player_durst_max[player_max]
Global player_durst[player_max]
Global player_durst_t[player_max]
Global player_durst_s[player_max]

Global player_schlaf_max[player_max]
Global player_schlaf[player_max]
Global player_schlaf_t[player_max]
Global player_schlaf_s[player_max]




'attribute

Const player_attribute_max=10

Const c_gesundheit=0
Const c_geschicklichkeit=1
Const c_beweglichkeit=2
Const c_reflexe=3
Const c_staerke=4
Const c_ausdauer=5
Const c_weisheit=6
Const c_erfahrung=7
Const c_glueck=8
Const c_charisma=9

Global player_attribute[player_max,player_attribute_max]

'fertigkeiten

Const player_fertigkeiten_max=8

Const c_treffsicherheit=0
Const c_schwimmen=1
Const c_fuehrung=2
Const c_scouting=3
Const c_jagen=4
Const c_fischen=5
Const c_kochen=6
Const c_bogenschiessen=7

Global player_fertigkeiten[player_max,player_fertigkeiten_max]

'wissen

Const player_wissen_max=11

Const c_allgemeinwissen=0
Const c_medizin=1
Const c_botanik=2
Const c_sprachen=3
Const c_technik=4
Const c_mathematik=5
Const c_physik=6
Const c_chemie=7
Const c_sprengstoffe=8
Const c_survivallism=9
Const c_waffen=10

Global player_wissen[player_max,player_wissen_max]







Global player_traglast[player_max]

'panzerung
Global player_schutz_kopf[player_max]
Global player_schutz_koerper[player_max]
Global player_schutz_beine[player_max]

'tarnung
Global player_tarnung_wald_kopf[player_max]
Global player_tarnung_wald_koerper[player_max]
Global player_tarnung_wald_beine[player_max]

Global player_tarnung_wueste_kopf[player_max]
Global player_tarnung_wueste_koerper[player_max]
Global player_tarnung_wueste_beine[player_max]

Global player_tarnung_schnee_kopf[player_max]
Global player_tarnung_schnee_koerper[player_max]
Global player_tarnung_schnee_beine[player_max]

Global player_tarnung_urban_kopf[player_max]
Global player_tarnung_urban_koerper[player_max]
Global player_tarnung_urban_beine[player_max]

Global player_tarnung_nacht_kopf[player_max]
Global player_tarnung_nacht_koerper[player_max]
Global player_tarnung_nacht_beine[player_max]

'inventar
Global player_inventory[player_max,player_inv_max]
Global player_inventory_index[player_max,player_inv_max]

Global player_hand[player_max,player_hand_max]
Global player_hand_index[player_max,player_hand_max]



'charakter eigenschaften

Const player_eigenschaften_max=47

Const c_pfadfinder=0         'findet immer den besten weg durch das gelände, zu dumm wenn er der einzige ist
Const c_vergesslich=1        'vergisst ab und zu den aufgetragenen weg oder die erteilte aufgabe
Const c_nachdenklich=2       'lässt sich häufig durch seine eigenen gedanken ablenken, führt aufträge nicht beim ersten mal aus und hat seltener unterbrechungen
Const c_psycho=3             'wenn er daneben schießt oder getroffen wird, bekommt er ausrasster und fängt an wild in der gegend herumzuballern
Const c_einzelgaenger=4      'fühlt sich allein am wohlsten, arbeitet ungern mit anderen in einer gruppe zusammen, je mehr teammitglieder desto schlimmer, noch schlimmer wenn teamspieler in der gruppe sind
Const c_teamspieler=5        'arbeitet gern mit anderen in einer gruppe zusammen, teamspieler ergänzen sich gegenseitig und werden dadurch besser z.b. bei unterbrechungen, nervt einzelgänger besonders stark
Const c_anfuehrer=6          'steigert die moral und leistung der gruppe, aber nur solange es keinen konkurierenden anführer gibt, mag es nicht wenn andere die führung haben
Const c_kurzsichtig=7        'kann ohne brille nur auf kurze distanz gut sehen und trifft auf weite entfernung schlechter
Const c_weitsichtig=8        'kann ohne brille nur auf weite distanz gut sehen und trifft auf kurze entfernung schlechter
Const c_nachtblind=9         'kann nachts so gut wie nichts sehen, aber da schläft man ja auch
Const c_geschickt=10         'bekommt jedes puzzle in rekordzeit gelöst, schlößer, fallen und waffen wieder flot machen, alles kein problem
Const c_stark=11             'stark wie hulk, aber weicheier sind nicht so begeistert
Const c_schlau=12            'nervt einfach extrem, nur weil er ein paar tausend bücher mehr gelesen hat
Const c_erfahren=13          'findet eher fallen und kann sonst auch alles besser, aber nervt andere mit seiner art
Const c_schleichen=14        'experte fürs schleichen, dreht durch wenn andere nur ein stöckchen zertreten
Const c_werfen=15            'experte für das werfen von dingen vorallem granaten, aber ist genervt und nervt andere die das nicht können und trotzdem probieren
Const c_waffenexperte=16     'kann so ziehmlich mit jeder waffe umgehen, neigt dazu genervt zu sein und andere zu nerven wenn sie mit ihrer waffe nur einigermaßen umgehen können
Const c_nichtschwimmer=17    'kann nicht schwimmen, wird ganz sicher kein pirat
Const c_drogensuechtig=18    'amphetamine wirken wunder und kifft denn nicht jeder mal gerne einen, fühlt sich unwohl ohne drogen im gepäck
Const c_alkoholiker=19       'braucht ab und zu mal einen schluck um sich wohl zu fühlen, nur nicht zuviel ..
Const c_sexistisch=20        'macht kindische witze über sexualität über die nur sexisten lachen können, frauen fühlen sich in seiner gegenwart unwohl, manchmal sind aber auch frauen sexistisch, das stört aber keinen, mögen vorallem pornomagazine
Const c_naturmensch=21       'fühlt sich in urbanen gebieten unwohl, ist am liebsten in der natur und findet dort auch leichter nahrung als andere
Const c_nudistisch=22        'trägt am liebsten keine kleidung oder wenigstens kurze
Const c_feminist=23          'kann männer*innen in der gruppe*innen einfach nicht leiden
Const c_langschlaefer=24     'hat ein höheres bedürfnis nach schlaf, kann aber dafür nächte durchmachen wie ein partylöwe, fühlt sich unwohl, wenn er nicht ausschlafen kann
Const c_leichterschlaf=25    'wird beim kleinsten geräusch wach und hat dann entsprechend schlechte laune
Const c_fahrerass=26         'verwandelt den dschungel in eine rennstrecke, wenn andere dabei angst bekommen ist das kein wunder
Const c_durchschnittstyp=27  'kann alles irgendwie nur mittelmäßig, stärken und schwächen haben so gut wie keine auswirkung
Const c_glueckskind=28       'etwas glück spielt überall eine wichtige rolle
Const c_feigling=29          'bleibt gerne im hintergrund
Const c_schlosser=30         'kann so gut wie jedes schloss öffnen
Const c_scharfschuetze=31    'trifft alles was ihm vor die flinte läuft
Const c_stadtkind=32
Const c_mutig=33
Const c_abstinenzler=34
Const c_triathlet=35
Const c_adlerauge=36
Const c_nachteule=37
Const c_elektriker=38
Const c_schizophren=39
Const c_messer=40
Const c_angstfrei=41
Const c_hitzeempfindlich=42
Const c_kaelteempfindlich=43
Const c_hitzeresistent=44
Const c_kaelteresistent=45
Const c_amazone=46


Global player_eigenschaften_selected_max=5

Global player_eigenschaften_selected[player_max]
Global player_eigenschaften[player_max,player_eigenschaften_max]

Global player_eigenschaften_strings[player_eigenschaften_max]
Global player_eigenschaften_costvalue[player_eigenschaften_max]
Global player_eigenschaften_disablevalue[player_eigenschaften_max,player_eigenschaften_max]


'strings

player_eigenschaften_strings[c_pfadfinder]=t_pfadfinder
player_eigenschaften_strings[c_vergesslich]=t_vergesslich
player_eigenschaften_strings[c_nachdenklich]=t_nachdenklich
player_eigenschaften_strings[c_psycho]=t_psycho
player_eigenschaften_strings[c_einzelgaenger]=t_einzelgaenger
player_eigenschaften_strings[c_teamspieler]=t_teamspieler
player_eigenschaften_strings[c_anfuehrer]=t_anfuehrer
player_eigenschaften_strings[c_kurzsichtig]=t_kurzsichtig
player_eigenschaften_strings[c_weitsichtig]=t_weitsichtig
player_eigenschaften_strings[c_nachtblind]=t_nachtblind
player_eigenschaften_strings[c_geschickt]=t_geschickt
player_eigenschaften_strings[c_stark]=t_stark
player_eigenschaften_strings[c_schlau]=t_schlau
player_eigenschaften_strings[c_erfahren]=t_erfahren
player_eigenschaften_strings[c_schleichen]=t_schleichen
player_eigenschaften_strings[c_werfen]=t_werfen
player_eigenschaften_strings[c_waffenexperte]=t_waffenexperte
player_eigenschaften_strings[c_nichtschwimmer]=t_nichtschwimmer
player_eigenschaften_strings[c_drogensuechtig]=t_drogensuechtig
player_eigenschaften_strings[c_alkoholiker]=t_alkoholiker
player_eigenschaften_strings[c_sexistisch]=t_sexistisch
player_eigenschaften_strings[c_naturmensch]=t_naturmensch
player_eigenschaften_strings[c_nudistisch]=t_nudistisch
player_eigenschaften_strings[c_feminist]=t_feminist
player_eigenschaften_strings[c_langschlaefer]=t_langschlaefer
player_eigenschaften_strings[c_leichterschlaf]=t_leichterschlaf
player_eigenschaften_strings[c_fahrerass]=t_fahrerass
player_eigenschaften_strings[c_durchschnittstyp]=t_durchschnittstyp
player_eigenschaften_strings[c_glueckskind]=t_glueckskind
player_eigenschaften_strings[c_feigling]=t_feigling
player_eigenschaften_strings[c_schlosser]=t_schlosser
player_eigenschaften_strings[c_scharfschuetze]=t_scharfschuetze
player_eigenschaften_strings[c_stadtkind]=t_stadtkind
player_eigenschaften_strings[c_mutig]=t_mutig
player_eigenschaften_strings[c_abstinenzler]=t_abstinenzler
player_eigenschaften_strings[c_triathlet]=t_triathlet
player_eigenschaften_strings[c_adlerauge]=t_adlerauge
player_eigenschaften_strings[c_nachteule]=t_nachteule
player_eigenschaften_strings[c_elektriker]=t_elektriker
player_eigenschaften_strings[c_schizophren]=t_schizophren
player_eigenschaften_strings[c_messer]=t_messer
player_eigenschaften_strings[c_angstfrei]=t_angstfrei
player_eigenschaften_strings[c_hitzeempfindlich]=t_hitzeempfindlich
player_eigenschaften_strings[c_kaelteempfindlich]=t_kaelteempfindlich
player_eigenschaften_strings[c_hitzeresistent]=t_hitzeresistent
player_eigenschaften_strings[c_kaelteresistent]=t_kaelteresistent
player_eigenschaften_strings[c_amazone]=t_amazone

'cost value

player_eigenschaften_costvalue[c_pfadfinder]=-8
player_eigenschaften_costvalue[c_vergesslich]=4
player_eigenschaften_costvalue[c_nachdenklich]=4
player_eigenschaften_costvalue[c_psycho]=6
player_eigenschaften_costvalue[c_einzelgaenger]=0
player_eigenschaften_costvalue[c_teamspieler]=0
player_eigenschaften_costvalue[c_anfuehrer]=-8
player_eigenschaften_costvalue[c_kurzsichtig]=4
player_eigenschaften_costvalue[c_weitsichtig]=4
player_eigenschaften_costvalue[c_nachtblind]=6
player_eigenschaften_costvalue[c_geschickt]=-8
player_eigenschaften_costvalue[c_stark]=-8
player_eigenschaften_costvalue[c_schlau]=-8
player_eigenschaften_costvalue[c_erfahren]=-6
player_eigenschaften_costvalue[c_schleichen]=-10
player_eigenschaften_costvalue[c_werfen]=-6
player_eigenschaften_costvalue[c_waffenexperte]=-8
player_eigenschaften_costvalue[c_nichtschwimmer]=8
player_eigenschaften_costvalue[c_drogensuechtig]=6
player_eigenschaften_costvalue[c_alkoholiker]=6
player_eigenschaften_costvalue[c_sexistisch]=4
player_eigenschaften_costvalue[c_naturmensch]=-4
player_eigenschaften_costvalue[c_nudistisch]=2
player_eigenschaften_costvalue[c_feminist]=2
player_eigenschaften_costvalue[c_langschlaefer]=2
player_eigenschaften_costvalue[c_leichterschlaf]=2
player_eigenschaften_costvalue[c_fahrerass]=-8
player_eigenschaften_costvalue[c_durchschnittstyp]=0
player_eigenschaften_costvalue[c_glueckskind]=-6
player_eigenschaften_costvalue[c_feigling]=4
player_eigenschaften_costvalue[c_schlosser]=-8
player_eigenschaften_costvalue[c_scharfschuetze]=-10
player_eigenschaften_costvalue[c_stadtkind]=-4
player_eigenschaften_costvalue[c_mutig]=-4
player_eigenschaften_costvalue[c_abstinenzler]=3
player_eigenschaften_costvalue[c_triathlet]=-8
player_eigenschaften_costvalue[c_adlerauge]=-8
player_eigenschaften_costvalue[c_nachteule]=-10
player_eigenschaften_costvalue[c_elektriker]=-8
player_eigenschaften_costvalue[c_schizophren]=8
player_eigenschaften_costvalue[c_messer]=-8
player_eigenschaften_costvalue[c_angstfrei]=-4
player_eigenschaften_costvalue[c_hitzeempfindlich]=4
player_eigenschaften_costvalue[c_kaelteempfindlich]=4
player_eigenschaften_costvalue[c_hitzeresistent]=-4
player_eigenschaften_costvalue[c_kaelteresistent]=-4
player_eigenschaften_costvalue[c_amazone]=-4


'disable matrix

player_eigenschaften_disablevalue[c_hitzeempfindlich,c_hitzeresistent]=1
player_eigenschaften_disablevalue[c_hitzeresistent,c_hitzeempfindlich]=1
player_eigenschaften_disablevalue[c_kaelteempfindlich,c_kaelteresistent]=1
player_eigenschaften_disablevalue[c_kaelteresistent,c_kaelteempfindlich]=1


player_eigenschaften_disablevalue[c_einzelgaenger,c_teamspieler]=1
player_eigenschaften_disablevalue[c_einzelgaenger,c_anfuehrer]=1
player_eigenschaften_disablevalue[c_teamspieler,c_einzelgaenger]=1
player_eigenschaften_disablevalue[c_anfuehrer,c_einzelgaenger]=1

player_eigenschaften_disablevalue[c_kurzsichtig,c_weitsichtig]=1
player_eigenschaften_disablevalue[c_kurzsichtig,c_adlerauge]=1

player_eigenschaften_disablevalue[c_weitsichtig,c_kurzsichtig]=1
player_eigenschaften_disablevalue[c_weitsichtig,c_adlerauge]=1

player_eigenschaften_disablevalue[c_adlerauge,c_kurzsichtig]=1
player_eigenschaften_disablevalue[c_adlerauge,c_weitsichtig]=1

player_eigenschaften_disablevalue[c_nachtblind,c_nachteule]=1
player_eigenschaften_disablevalue[c_nachteule,c_nachtblind]=1

player_eigenschaften_disablevalue[c_nichtschwimmer,c_triathlet]=1
player_eigenschaften_disablevalue[c_triathlet,c_nichtschwimmer]=1

player_eigenschaften_disablevalue[c_abstinenzler,c_alkoholiker]=1
player_eigenschaften_disablevalue[c_abstinenzler,c_drogensuechtig]=1

player_eigenschaften_disablevalue[c_alkoholiker,c_abstinenzler]=1
player_eigenschaften_disablevalue[c_drogensuechtig,c_abstinenzler]=1


player_eigenschaften_disablevalue[c_sexistisch,c_feminist]=1
player_eigenschaften_disablevalue[c_feminist,c_sexistisch]=1

player_eigenschaften_disablevalue[c_naturmensch,c_stadtkind]=1
player_eigenschaften_disablevalue[c_stadtkind,c_naturmensch]=1

player_eigenschaften_disablevalue[c_feigling,c_mutig]=1
player_eigenschaften_disablevalue[c_feigling,c_angstfrei]=1
player_eigenschaften_disablevalue[c_angstfrei,c_feigling]=1
player_eigenschaften_disablevalue[c_mutig,c_feigling]=1

player_eigenschaften_disablevalue[c_langschlaefer,c_leichterschlaf]=1
player_eigenschaften_disablevalue[c_leichterschlaf,c_langschlaefer]=1


player_eigenschaften_disablevalue[c_durchschnittstyp,c_geschickt]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_stark]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_schlau]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_erfahren]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_schleichen]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_werfen]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_waffenexperte]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_fahrerass]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_glueckskind]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_schlosser]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_scharfschuetze]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_elektriker]=1
player_eigenschaften_disablevalue[c_durchschnittstyp,c_messer]=1

player_eigenschaften_disablevalue[c_geschickt,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_stark,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_schlau,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_erfahren,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_schleichen,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_werfen,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_waffenexperte,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_fahrerass,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_glueckskind,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_schlosser,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_scharfschuetze,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_elektriker,c_durchschnittstyp]=1
player_eigenschaften_disablevalue[c_messer,c_durchschnittstyp]=1





