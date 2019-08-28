
Global world_cache_enabled=1
Global world_save_cache_enabled=0


Global compression=5

Const tileset_max=32
Const tiletype_max=16
Const tilestyle_max=35

Global img_tile:TPixmap[tileset_max,tiletype_max]
Global tile_offx[tileset_max,tiletype_max,tilestyle_max]
Global tile_offy[tileset_max,tiletype_max,tilestyle_max]



Const c_earth=1
Const c_gras=2
Const c_mud=3
Const c_water=4
Const c_deep_water=5
Const c_pool_water=6

Const c_floor_house=7
Const c_roof_house=8



Const world_wall_max=4

Global img_world_wall_0:TImage[world_wall_max]
Global img_world_wall_1:TImage[world_wall_max]

img_world_wall_0[0]=LoadImage("gfx/world/tileset/tileset_0000/wall_0_0.png",0)
img_world_wall_0[1]=LoadImage("gfx/world/tileset/tileset_0000/wall_1_0.png",0)
img_world_wall_0[2]=LoadImage("gfx/world/tileset/tileset_0000/wall_2_0.png",0)
img_world_wall_0[3]=LoadImage("gfx/world/tileset/tileset_0000/wall_3_0.png",0)

img_world_wall_1[0]=LoadImage("gfx/world/tileset/tileset_0000/wall_0_1.png",0)
img_world_wall_1[1]=LoadImage("gfx/world/tileset/tileset_0000/wall_1_1.png",0)
img_world_wall_1[2]=LoadImage("gfx/world/tileset/tileset_0000/wall_2_1.png",0)
img_world_wall_1[3]=LoadImage("gfx/world/tileset/tileset_0000/wall_3_1.png",0)






Const weed_00_max=10
Global img_weed_00:TImage[weed_00_max]
Global off_x_weed_00[weed_00_max]
Global off_y_weed_00[weed_00_max]

img_weed_00[0]=LoadImage("gfx/world/ambient/weed_0000/weed_00_00.png",0)
off_x_weed_00[0]=6
off_y_weed_00[0]=-11
img_weed_00[1]=LoadImage("gfx/world/ambient/weed_0000/weed_00_01.png",0)
off_x_weed_00[1]=4
off_y_weed_00[1]=-11
img_weed_00[2]=LoadImage("gfx/world/ambient/weed_0000/weed_00_02.png",0)
off_x_weed_00[2]=4
off_y_weed_00[2]=-11
img_weed_00[3]=LoadImage("gfx/world/ambient/weed_0000/weed_00_03.png",0)
off_x_weed_00[3]=10
off_y_weed_00[3]=-12
img_weed_00[4]=LoadImage("gfx/world/ambient/weed_0000/weed_00_04.png",0)
off_x_weed_00[4]=6
off_y_weed_00[4]=-17
img_weed_00[5]=LoadImage("gfx/world/ambient/weed_0000/weed_00_05.png",0)
off_x_weed_00[5]=7
off_y_weed_00[5]=-14
img_weed_00[6]=LoadImage("gfx/world/ambient/weed_0000/weed_00_06.png",0)
off_x_weed_00[6]=2
off_y_weed_00[6]=-15
img_weed_00[7]=LoadImage("gfx/world/ambient/weed_0000/weed_00_07.png",0)
off_x_weed_00[7]=5
off_y_weed_00[7]=-18
img_weed_00[8]=LoadImage("gfx/world/ambient/weed_0000/weed_00_08.png",0)
off_x_weed_00[8]=6
off_y_weed_00[8]=-13
img_weed_00[9]=LoadImage("gfx/world/ambient/weed_0000/weed_00_09.png",0)
off_x_weed_00[9]=7
off_y_weed_00[9]=-11


Const weed_01_max=12
Global img_weed_01:TImage[weed_01_max]
Global off_x_weed_01[weed_01_max]
Global off_y_weed_01[weed_01_max]

img_weed_01[0]=LoadImage("gfx/world/ambient/weed_0001/weed_01_00.png",0)
off_x_weed_01[0]=5
off_y_weed_01[0]=-40
img_weed_01[1]=LoadImage("gfx/world/ambient/weed_0001/weed_01_01.png",0)
off_x_weed_01[1]=8
off_y_weed_01[1]=-28
img_weed_01[2]=LoadImage("gfx/world/ambient/weed_0001/weed_01_02.png",0)
off_x_weed_01[2]=9
off_y_weed_01[2]=-33
img_weed_01[3]=LoadImage("gfx/world/ambient/weed_0001/weed_01_03.png",0)
off_x_weed_01[3]=5
off_y_weed_01[3]=-30
img_weed_01[4]=LoadImage("gfx/world/ambient/weed_0001/weed_01_04.png",0)
off_x_weed_01[4]=7
off_y_weed_01[4]=-32
img_weed_01[5]=LoadImage("gfx/world/ambient/weed_0001/weed_01_05.png",0)
off_x_weed_01[5]=8
off_y_weed_01[5]=-22
img_weed_01[6]=LoadImage("gfx/world/ambient/weed_0001/weed_01_06.png",0)
off_x_weed_01[6]=4
off_y_weed_01[6]=-38
img_weed_01[7]=LoadImage("gfx/world/ambient/weed_0001/weed_01_07.png",0)
off_x_weed_01[7]=2
off_y_weed_01[7]=-30
img_weed_01[8]=LoadImage("gfx/world/ambient/weed_0001/weed_01_08.png",0)
off_x_weed_01[8]=-2
off_y_weed_01[8]=-35
img_weed_01[9]=LoadImage("gfx/world/ambient/weed_0001/weed_01_09.png",0)
off_x_weed_01[9]=1
off_y_weed_01[9]=-37
img_weed_01[10]=LoadImage("gfx/world/ambient/weed_0001/weed_01_10.png",0)
off_x_weed_01[10]=-4
off_y_weed_01[10]=-43
img_weed_01[11]=LoadImage("gfx/world/ambient/weed_0001/weed_01_11.png",0)
off_x_weed_01[11]=0
off_y_weed_01[11]=-42



Const weed_02_max=16
Global img_weed_02:TImage[weed_02_max]
Global off_x_weed_02[weed_02_max]
Global off_y_weed_02[weed_02_max]

img_weed_02[0]=LoadImage("gfx/world/ambient/weed_0002/weed_02_00.png",0)
off_x_weed_02[0]=13
off_y_weed_02[0]=-2
img_weed_02[1]=LoadImage("gfx/world/ambient/weed_0002/weed_02_01.png",0)
off_x_weed_02[1]=16
off_y_weed_02[1]=0
img_weed_02[2]=LoadImage("gfx/world/ambient/weed_0002/weed_02_02.png",0)
off_x_weed_02[2]=14
off_y_weed_02[2]=-1
img_weed_02[3]=LoadImage("gfx/world/ambient/weed_0002/weed_02_03.png",0)
off_x_weed_02[3]=13
off_y_weed_02[3]=0
img_weed_02[4]=LoadImage("gfx/world/ambient/weed_0002/weed_02_04.png",0)
off_x_weed_02[4]=15
off_y_weed_02[4]=-1
img_weed_02[5]=LoadImage("gfx/world/ambient/weed_0002/weed_02_05.png",0)
off_x_weed_02[5]=8
off_y_weed_02[5]=-2
img_weed_02[6]=LoadImage("gfx/world/ambient/weed_0002/weed_02_06.png",0)
off_x_weed_02[6]=13
off_y_weed_02[6]=2
img_weed_02[7]=LoadImage("gfx/world/ambient/weed_0002/weed_02_07.png",0)
off_x_weed_02[7]=7
off_y_weed_02[7]=-1
img_weed_02[8]=LoadImage("gfx/world/ambient/weed_0002/weed_02_08.png",0)
off_x_weed_02[8]=6
off_y_weed_02[8]=0
img_weed_02[9]=LoadImage("gfx/world/ambient/weed_0002/weed_02_09.png",0)
off_x_weed_02[9]=4
off_y_weed_02[9]=-1
img_weed_02[10]=LoadImage("gfx/world/ambient/weed_0002/weed_02_10.png",0)
off_x_weed_02[10]=8
off_y_weed_02[10]=-3
img_weed_02[11]=LoadImage("gfx/world/ambient/weed_0002/weed_02_11.png",0)
off_x_weed_02[11]=8
off_y_weed_02[11]=-1
img_weed_02[12]=LoadImage("gfx/world/ambient/weed_0002/weed_02_12.png",0)
off_x_weed_02[12]=6
off_y_weed_02[12]=-2
img_weed_02[13]=LoadImage("gfx/world/ambient/weed_0002/weed_02_13.png",0)
off_x_weed_02[13]=7
off_y_weed_02[13]=0
img_weed_02[14]=LoadImage("gfx/world/ambient/weed_0002/weed_02_14.png",0)
off_x_weed_02[14]=10
off_y_weed_02[14]=-1
img_weed_02[15]=LoadImage("gfx/world/ambient/weed_0002/weed_02_15.png",0)
off_x_weed_02[15]=9
off_y_weed_02[15]=-3


Const weed_03_max=15
Global img_weed_03:TImage[weed_03_max]
Global off_x_weed_03[weed_03_max]
Global off_y_weed_03[weed_03_max]

img_weed_03[0]=LoadImage("gfx/world/ambient/weed_0003/weed_03_00.png",0)
off_x_weed_03[0]=2
off_y_weed_03[0]=-32
img_weed_03[1]=LoadImage("gfx/world/ambient/weed_0003/weed_03_01.png",0)
off_x_weed_03[1]=11
off_y_weed_03[1]=-32
img_weed_03[2]=LoadImage("gfx/world/ambient/weed_0003/weed_03_02.png",0)
off_x_weed_03[2]=4
off_y_weed_03[2]=-50
img_weed_03[3]=LoadImage("gfx/world/ambient/weed_0003/weed_03_03.png",0)
off_x_weed_03[3]=8
off_y_weed_03[3]=-43
img_weed_03[4]=LoadImage("gfx/world/ambient/weed_0003/weed_03_04.png",0)
off_x_weed_03[4]=7
off_y_weed_03[4]=-46
img_weed_03[5]=LoadImage("gfx/world/ambient/weed_0003/weed_03_05.png",0)
off_x_weed_03[5]=5
off_y_weed_03[5]=-55
img_weed_03[6]=LoadImage("gfx/world/ambient/weed_0003/weed_03_06.png",0)
off_x_weed_03[6]=13
off_y_weed_03[6]=-32
img_weed_03[7]=LoadImage("gfx/world/ambient/weed_0003/weed_03_07.png",0)
off_x_weed_03[7]=4
off_y_weed_03[7]=-37
img_weed_03[8]=LoadImage("gfx/world/ambient/weed_0003/weed_03_08.png",0)
off_x_weed_03[8]=4
off_y_weed_03[8]=-22
img_weed_03[9]=LoadImage("gfx/world/ambient/weed_0003/weed_03_09.png",0)
off_x_weed_03[9]=3
off_y_weed_03[9]=-19
img_weed_03[10]=LoadImage("gfx/world/ambient/weed_0003/weed_03_10.png",0)
off_x_weed_03[10]=7
off_y_weed_03[10]=-17
img_weed_03[11]=LoadImage("gfx/world/ambient/weed_0003/weed_03_11.png",0)
off_x_weed_03[11]=3
off_y_weed_03[11]=-20
img_weed_03[12]=LoadImage("gfx/world/ambient/weed_0003/weed_03_12.png",0)
off_x_weed_03[12]=4
off_y_weed_03[12]=-18
img_weed_03[13]=LoadImage("gfx/world/ambient/weed_0003/weed_03_13.png",0)
off_x_weed_03[13]=5
off_y_weed_03[13]=-16
img_weed_03[14]=LoadImage("gfx/world/ambient/weed_0003/weed_03_14.png",0)
off_x_weed_03[14]=4
off_y_weed_03[14]=-15


Const tree_leaf_00_max=9
Global img_tree_leaf_00:TImage[tree_leaf_00_max]
Global off_x_tree_leaf_00[tree_leaf_00_max]
Global off_y_tree_leaf_00[tree_leaf_00_max]

img_tree_leaf_00[0]=LoadImage("gfx/world/tree/leaftree/tree_00_00.png",0)
off_x_tree_leaf_00[0]=-16
off_y_tree_leaf_00[0]=-80
img_tree_leaf_00[1]=LoadImage("gfx/world/tree/leaftree/tree_00_01.png",0)
off_x_tree_leaf_00[1]=-18
off_y_tree_leaf_00[1]=-78
img_tree_leaf_00[2]=LoadImage("gfx/world/tree/leaftree/tree_00_02.png",0)
off_x_tree_leaf_00[2]=-29
off_y_tree_leaf_00[2]=-74
img_tree_leaf_00[3]=LoadImage("gfx/world/tree/leaftree/tree_00_03.png",0)
off_x_tree_leaf_00[3]=-26
off_y_tree_leaf_00[3]=-93
img_tree_leaf_00[4]=LoadImage("gfx/world/tree/leaftree/tree_00_04.png",0)
off_x_tree_leaf_00[4]=-22
off_y_tree_leaf_00[4]=-48
img_tree_leaf_00[5]=LoadImage("gfx/world/tree/leaftree/tree_00_05.png",0)
off_x_tree_leaf_00[5]=-3
off_y_tree_leaf_00[5]=-27
img_tree_leaf_00[6]=LoadImage("gfx/world/tree/leaftree/tree_00_06.png",0)
off_x_tree_leaf_00[6]=-15
off_y_tree_leaf_00[6]=-81
img_tree_leaf_00[7]=LoadImage("gfx/world/tree/leaftree/tree_00_07.png",0)
off_x_tree_leaf_00[7]=-19
off_y_tree_leaf_00[7]=-76
img_tree_leaf_00[8]=LoadImage("gfx/world/tree/leaftree/tree_00_08.png",0)
off_x_tree_leaf_00[8]=-29
off_y_tree_leaf_00[8]=-72



Const tree_conifer_00_max=17
Global img_tree_conifer_00:TImage[tree_conifer_00_max]
Global off_x_tree_conifer_00[tree_conifer_00_max]
Global off_y_tree_conifer_00[tree_conifer_00_max]

img_tree_conifer_00[0]=LoadImage("gfx/world/tree/conifer/tree_00_00.png",0)
off_x_tree_conifer_00[0]=-4
off_y_tree_conifer_00[0]=-64
img_tree_conifer_00[1]=LoadImage("gfx/world/tree/conifer/tree_00_01.png",0)
off_x_tree_conifer_00[1]=-3
off_y_tree_conifer_00[1]=-59
img_tree_conifer_00[2]=LoadImage("gfx/world/tree/conifer/tree_00_02.png",0)
off_x_tree_conifer_00[2]=-4
off_y_tree_conifer_00[2]=-66
img_tree_conifer_00[3]=LoadImage("gfx/world/tree/conifer/tree_00_03.png",0)
off_x_tree_conifer_00[3]=15
off_y_tree_conifer_00[3]=-60
img_tree_conifer_00[4]=LoadImage("gfx/world/tree/conifer/tree_00_04.png",0)
off_x_tree_conifer_00[4]=-4
off_y_tree_conifer_00[4]=-67
img_tree_conifer_00[5]=LoadImage("gfx/world/tree/conifer/tree_00_05.png",0)
off_x_tree_conifer_00[5]=-18
off_y_tree_conifer_00[5]=-82
img_tree_conifer_00[6]=LoadImage("gfx/world/tree/conifer/tree_00_06.png",0)
off_x_tree_conifer_00[6]=2
off_y_tree_conifer_00[6]=-75
img_tree_conifer_00[7]=LoadImage("gfx/world/tree/conifer/tree_00_07.png",0)
off_x_tree_conifer_00[7]=-16
off_y_tree_conifer_00[7]=-73
img_tree_conifer_00[8]=LoadImage("gfx/world/tree/conifer/tree_00_08.png",0)
off_x_tree_conifer_00[8]=4
off_y_tree_conifer_00[8]=-73
img_tree_conifer_00[9]=LoadImage("gfx/world/tree/conifer/tree_00_09.png",0)
off_x_tree_conifer_00[9]=-24
off_y_tree_conifer_00[9]=-102
img_tree_conifer_00[10]=LoadImage("gfx/world/tree/conifer/tree_00_10.png",0)
off_x_tree_conifer_00[10]=3
off_y_tree_conifer_00[10]=-102
img_tree_conifer_00[11]=LoadImage("gfx/world/tree/conifer/tree_00_11.png",0)
off_x_tree_conifer_00[11]=-21
off_y_tree_conifer_00[11]=-103
img_tree_conifer_00[12]=LoadImage("gfx/world/tree/conifer/tree_00_12.png",0)
off_x_tree_conifer_00[12]=9
off_y_tree_conifer_00[12]=-99
img_tree_conifer_00[13]=LoadImage("gfx/world/tree/conifer/tree_00_13.png",0)
off_x_tree_conifer_00[13]=-16
off_y_tree_conifer_00[13]=-82
img_tree_conifer_00[14]=LoadImage("gfx/world/tree/conifer/tree_00_14.png",0)
off_x_tree_conifer_00[14]=7
off_y_tree_conifer_00[14]=-78
img_tree_conifer_00[15]=LoadImage("gfx/world/tree/conifer/tree_00_15.png",0)
off_x_tree_conifer_00[15]=-19
off_y_tree_conifer_00[15]=-85
img_tree_conifer_00[16]=LoadImage("gfx/world/tree/conifer/tree_00_16.png",0)
off_x_tree_conifer_00[16]=7
off_y_tree_conifer_00[16]=-85




Const bush_00_max=18
Global img_bush_00:TImage[bush_00_max]
Global off_x_bush_00[bush_00_max]
Global off_y_bush_00[bush_00_max]

img_bush_00[0]=LoadImage("gfx/world/tree/bush/bush_00_00.png",0)
off_x_bush_00[0]=-5
off_y_bush_00[0]=-45
img_bush_00[1]=LoadImage("gfx/world/tree/bush/bush_00_01.png",0)
off_x_bush_00[1]=1
off_y_bush_00[1]=-19
img_bush_00[2]=LoadImage("gfx/world/tree/bush/bush_00_02.png",0)
off_x_bush_00[2]=2
off_y_bush_00[2]=-22
img_bush_00[3]=LoadImage("gfx/world/tree/bush/bush_00_03.png",0)
off_x_bush_00[3]=0
off_y_bush_00[3]=-32
img_bush_00[4]=LoadImage("gfx/world/tree/bush/bush_00_04.png",0)
off_x_bush_00[4]=-4
off_y_bush_00[4]=-42
img_bush_00[5]=LoadImage("gfx/world/tree/bush/bush_00_05.png",0)
off_x_bush_00[5]=-7
off_y_bush_00[5]=-45
img_bush_00[6]=LoadImage("gfx/world/tree/bush/bush_00_06.png",0)
off_x_bush_00[6]=-8
off_y_bush_00[6]=-29
img_bush_00[7]=LoadImage("gfx/world/tree/bush/bush_00_07.png",0)
off_x_bush_00[7]=-2
off_y_bush_00[7]=-28
img_bush_00[8]=LoadImage("gfx/world/tree/bush/bush_00_08.png",0)
off_x_bush_00[8]=-7
off_y_bush_00[8]=-34
img_bush_00[9]=LoadImage("gfx/world/tree/bush/bush_00_09.png",0)
off_x_bush_00[9]=-1
off_y_bush_00[9]=-28
img_bush_00[10]=LoadImage("gfx/world/tree/bush/bush_00_10.png",0)
off_x_bush_00[10]=-2
off_y_bush_00[10]=-36
img_bush_00[11]=LoadImage("gfx/world/tree/bush/bush_00_11.png",0)
off_x_bush_00[11]=-3
off_y_bush_00[11]=-29
img_bush_00[12]=LoadImage("gfx/world/tree/bush/bush_00_12.png",0)
off_x_bush_00[12]=-9
off_y_bush_00[12]=-24
img_bush_00[13]=LoadImage("gfx/world/tree/bush/bush_00_13.png",0)
off_x_bush_00[13]=0
off_y_bush_00[13]=-30
img_bush_00[14]=LoadImage("gfx/world/tree/bush/bush_00_14.png",0)
off_x_bush_00[14]=-12
off_y_bush_00[14]=-35
img_bush_00[15]=LoadImage("gfx/world/tree/bush/bush_00_15.png",0)
off_x_bush_00[15]=-4
off_y_bush_00[15]=-30
img_bush_00[16]=LoadImage("gfx/world/tree/bush/bush_00_16.png",0)
off_x_bush_00[16]=-13
off_y_bush_00[16]=-35
img_bush_00[17]=LoadImage("gfx/world/tree/bush/bush_00_17.png",0)
off_x_bush_00[17]=-13
off_y_bush_00[17]=-48



Const car_max=2

Const c_blttruck=0
Const c_truck=1


Global img_car:TPixmap[car_max,align_max]

Global car_dx[car_max,align_max]
Global car_dy[car_max,align_max]

Global car_offx[car_max,align_max]
Global car_offy[car_max,align_max]

img_car[c_blttruck,1]=LoadPixmap("gfx/world/car/blttruck_1.png")
car_dx[c_blttruck,1]=2
car_dy[c_blttruck,1]=4
car_offx[c_blttruck,1]=-80
car_offy[c_blttruck,1]=-25

img_car[c_blttruck,3]=LoadPixmap("gfx/world/car/blttruck_3.png")
car_dx[c_blttruck,3]=4
car_dy[c_blttruck,3]=2
car_offx[c_blttruck,3]=-40
car_offy[c_blttruck,3]=-35

img_car[c_blttruck,5]=LoadPixmap("gfx/world/car/blttruck_5.png")
car_dx[c_blttruck,5]=2
car_dy[c_blttruck,5]=4
car_offx[c_blttruck,5]=-80
car_offy[c_blttruck,5]=-35

img_car[c_blttruck,7]=LoadPixmap("gfx/world/car/blttruck_7.png")
car_dx[c_blttruck,7]=4
car_dy[c_blttruck,7]=2
car_offx[c_blttruck,7]=-40
car_offy[c_blttruck,7]=-25


img_car[c_truck,3]=LoadPixmap("gfx/world/car/truck_3.png")
car_dx[c_truck,3]=4
car_dy[c_truck,3]=2
car_offx[c_truck,3]=-40
car_offy[c_truck,3]=-37

img_car[c_truck,7]=LoadPixmap("gfx/world/car/truck_7.png")
car_dx[c_truck,7]=4
car_dy[c_truck,7]=2
car_offx[c_truck,7]=-40
car_offy[c_truck,7]=-32


Const world_obj_item=1
Const world_obj_player=2
Const world_obj_object=3
Const world_obj_reserved=4
Const world_obj_tree_conifer=5
Const world_obj_tree_leaf=6
Const world_obj_bush=7
Const world_obj_weed1=8
Const world_obj_weed2=9
Const world_obj_container=10
Const world_obj_car=11


Const weed_00=1
Const weed_01=2
Const weed_02=3
Const weed_03=4


Global margin_nw_ne
Global margin_ne_se
Global margin_nw_sw
Global margin_sw_se
Global margin_ne_sw_se
Global margin_nw_ne_se
Global margin_nw_ne_sw
Global margin_nw_sw_se
Global margin_nw_ne_sw_se
Global margin_nw_se
Global margin_ne_sw
Global margin_nw
Global margin_ne
Global margin_sw
Global margin_se


Const c_wall=1
Const c_door=2
Const c_window=3
Const c_fence=4
Const c_cliff=5


Global img_world_minimap:TImage

Const mini_dx=2
Const mini_dy=2

Const align_max=8

Global world_map_x=0
Global world_map_y=0

Const world_x_max=250
Const world_y_max=250
Const world_z_max=4

Global world_x=100
Global world_y=100
Global world_z=4

Const world_item_max=25

Const world_view_x=120
Const world_view_y=120

Const world_tilesize=20

Const world_cluster_size=10


Global save_cluster_x
Global save_cluster_y


Const world_cluster_dx=500
Const world_cluster_dy=500

Global world_cluster[world_x_max/world_cluster_size,world_y_max/world_cluster_size]
Global world_cluster_ground_img:TImage[world_x_max/world_cluster_size,world_y_max/world_cluster_size]
Global world_cluster_objects_img:TImage[world_x_max/world_cluster_size,world_y_max/world_cluster_size]
Global world_cluster_activ[world_x_max/world_cluster_size,world_y_max/world_cluster_size]





Global world[world_x_max,world_y_max,world_z_max]
Global world_cache[world_x_max/world_cluster_size,world_y_max/world_cluster_size]

Global world_loaded_x=-1
Global world_loaded_y=-1


Global world_ground_house[world_x_max,world_y_max,world_z_max]

Global world_temperatur[world_x_max,world_y_max,world_z_max]
Global world_light[world_x_max,world_y_max,world_z_max]

Global world_ground_type[world_x_max,world_y_max,world_z_max]
Global world_ground_index[world_x_max,world_y_max,world_z_max]

Global world_margin_type[world_x_max,world_y_max,world_z_max]
Global world_margin_index[world_x_max,world_y_max,world_z_max]



Global world_obj_type[world_x_max,world_y_max,world_z_max]
Global world_obj_index[world_x_max,world_y_max,world_z_max]
Global world_obj_a[world_x_max,world_y_max,world_z_max]
Global world_obj_x[world_x_max,world_y_max,world_z_max]
Global world_obj_y[world_x_max,world_y_max,world_z_max]


Global world_wall_type[world_x_max,world_y_max,world_z_max,align_max]
Global world_wall_index[world_x_max,world_y_max,world_z_max,align_max]

Global world_item[world_x_max,world_y_max,world_z_max,world_item_max]
Global world_item_index[world_x_max,world_y_max,world_z_max,world_item_max]

Global world_ambient_type[world_x_max,world_y_max,world_z_max]
Global world_ambient_index[world_x_max,world_y_max,world_z_max]


Global world_cam_x=-0
Global world_cam_y=-0
Global world_cam_t
Global world_cam_s=30



