


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


Const anim_max=53



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


Const anim_stand_p=14
Const anim_stand_p_shoot_low=15
Const anim_stand_p_shoot=16
Const anim_stand_dbl=17
Const anim_stand_dbl_shoot=18
Const anim_crouch_shoot=19
Const anim_crouch_dbl_shoot=20
Const anim_prone_dbl_shoot=21


Const anim_stand_r=22
Const anim_stand_r_up=23
Const anim_crouch_r_up=24
Const anim_prone_r=25


Const anim_walk_r=26

Const anim_run_r=27
Const anim_swat_r=28
Const anim_crawl_r=29


Const anim_raise_r_up=30
Const anim_shoot_r=31

Const anim_crouch_shoot_r=32


Const anim_w_stand=33
Const anim_w_walk=34
Const anim_w_shoot=35

Const anim_w_dbl_shoot=36

Const anim_w_throw=37
Const anim_w_die_1=38
Const anim_w_die_2=39
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










Global img_merc:TPixmap[sex_max,anim_max]

Global img_merc_dx:Int[sex_max,anim_max]
Global img_merc_dy:Int[sex_max,anim_max]

Global img_merc_offx:Int[sex_max,anim_max,anim_align_max,img_count_max]
Global img_merc_offy:Int[sex_max,anim_max,anim_align_max,img_count_max]

Global img_merc_count:Int[sex_max,anim_max]
