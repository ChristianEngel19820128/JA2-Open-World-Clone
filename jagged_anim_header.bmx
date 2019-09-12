


'------------------------------------------------------------------------------------------
' merc
'------------------------------------------------------------------------------------------


Const anim_align_max=8

Const img_count_max=60

Const sex_max=2

Const male=0
Const female=1

Const parts_max=7

Const hair=0
Const shirt=1
Const skin=2
Const pants=3
Const equip=4
Const misc=5
Const blood=6


Const anim_max=67



Const anim_stand=0
Const anim_walk=1
Const anim_run=2
Const anim_prone=3
Const anim_crouch=4
Const anim_swat=5

Const anim_climb=6
Const anim_jump=7

Const anim_fall_back=8
Const anim_fall_forward=9


Const anim_throw=10
Const anim_throw_low=11

Const anim_open=12
Const anim_pickup_item=13
Const anim_medic=14
Const anim_crowbar=15


Const anim_stand_p=16
Const anim_stand_p_shoot_low=17
Const anim_stand_p_shoot=18
Const anim_crouch_shoot=19

Const anim_stand_dbl=20
Const anim_stand_dbl_shoot=21
Const anim_crouch_dbl_shoot=22
Const anim_prone_dbl_shoot=23


Const anim_stand_r=24
Const anim_crouch_r=25
Const anim_prone_r=26

Const anim_walk_r=27
Const anim_run_r=28
Const anim_swat_r=29

Const anim_shoot_r=30
Const anim_shoot_low_r=31
Const anim_crouch_shoot_r=32


Const anim_w_stand=33
Const anim_w_walk=34
Const anim_w_shoot=35
Const anim_w_dbl_shoot=36

Const anim_w_throw=37
Const anim_w_die=38
Const anim_w_deep_die=39
Const anim_w_fall=40

Const anim_w_stand_r=41
Const anim_w_walk_r=42
Const anim_w_shoot_r=43


Const anim_w_swim=44
Const anim_w_tred=45


Const anim_die_back=46
Const anim_die_forward=47
Const anim_die_hard=48
Const anim_die_hard_burst=49
Const anim_die_jfk=50

Const anim_crouch_die=51
Const anim_prone_die=52

Const anim_mortar=53
Const anim_law=54

Const anim_stand_k_slice=55
Const anim_stand_k_stab=56
Const anim_crouch_k_stab=57
Const anim_stand_k_throw=58

Const anim_stand_punch=59
Const anim_crouch_punch_low=60
Const anim_stand_kick=61

Const anim_i_stand=62
Const anim_i_walk=63
Const anim_i_stand_r=64
Const anim_i_walk_r=65

Const anim_crouch_trans_r=66








Global img_merc:TPixmap[sex_max,anim_max]

Global img_merc_dx:Int[sex_max,anim_max]
Global img_merc_dy:Int[sex_max,anim_max]

Global img_merc_offx:Int[sex_max,anim_max,anim_align_max,img_count_max]
Global img_merc_offy:Int[sex_max,anim_max,anim_align_max,img_count_max]

Global img_merc_count:Int[sex_max,anim_max]
