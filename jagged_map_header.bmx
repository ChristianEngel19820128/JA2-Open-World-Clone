



Const mx_map_x=2048
Const mx_map_y=2048

Global img_map:TImage=LoadImage("gfx/map/heightmap/FeFHA1024.png")

Global map_x=ImageWidth(img_map)
Global map_y=ImageHeight(img_map)

Global img_map_frame:TImage = LoadImage("gfx/map/gps_map/frame.png")
Global img_map_back:TImage = LoadImage("gfx/map/gps_map/map.png")

Global map_saved
Global map_cache[mx_map_x,mx_map_y]
Global map_initialized[mx_map_x,mx_map_y]


Global map_height[mx_map_x,mx_map_y]
Global img_map_height:TImage[17]

img_map_height[0]=LoadImage("gfx/map/gps_map/3000u.png")
img_map_height[1]=LoadImage("gfx/map/gps_map/2000u.png")
img_map_height[2]=LoadImage("gfx/map/gps_map/1500u.png")
img_map_height[3]=LoadImage("gfx/map/gps_map/1000u.png")
img_map_height[4]=LoadImage("gfx/map/gps_map/500u.png")
img_map_height[5]=LoadImage("gfx/map/gps_map/100u.png")
img_map_height[6]=LoadImage("gfx/map/gps_map/0.png")
img_map_height[7]=LoadImage("gfx/map/gps_map/100.png")
img_map_height[8]=LoadImage("gfx/map/gps_map/250.png")
img_map_height[9]=LoadImage("gfx/map/gps_map/500.png")
img_map_height[10]=LoadImage("gfx/map/gps_map/750.png")
img_map_height[11]=LoadImage("gfx/map/gps_map/1000.png")
img_map_height[12]=LoadImage("gfx/map/gps_map/1250.png")
img_map_height[13]=LoadImage("gfx/map/gps_map/1500.png")
img_map_height[14]=LoadImage("gfx/map/gps_map/1750.png")
img_map_height[15]=LoadImage("gfx/map/gps_map/2000.png")
img_map_height[16]=LoadImage("gfx/map/gps_map/3000.png")




Global map_cx
Global map_cy

Global map_c_t
Global map_c_s=60

Global img_group:TImage=LoadImage("gfx/map/gps_map/flage.png")
Global img_waypoint:TImage=LoadImage("gfx/map/gps_map/wegpunkt.png")
Global img_moving:TImage=LoadImage("gfx/map/gps_map/moving.png")
Global img_target:TImage=LoadImage("gfx/map/gps_map/target.png")

Global map_size=32
Global map_tile=16
Global map_zoom=1









Const mx_veg=6

Const veg_empty=0
Const veg_wiese=1
Const veg_busch=2
Const veg_nadelwald=3
Const veg_laubwald=4
Const veg_mischwald=5
Const veg_sumpf=6

Global map_vegetation[mx_map_x,mx_map_y]

Global img_vegetation:TImage[9]

img_vegetation[veg_wiese]=LoadImage("gfx/map/gps_map/wiese.png")
img_vegetation[veg_busch]=LoadImage("gfx/map/gps_map/busch.png")
img_vegetation[veg_nadelwald]=LoadImage("gfx/map/gps_map/nadelwald.png")
img_vegetation[veg_laubwald]=LoadImage("gfx/map/gps_map/laubwald.png")
img_vegetation[veg_mischwald]=LoadImage("gfx/map/gps_map/mischwald.png")
img_vegetation[veg_sumpf]=LoadImage("gfx/map/gps_map/sumpf.png")


Global map_debris[mx_map_x,mx_map_y]
Global map_urban[mx_map_x,mx_map_y]

Global img_urban:TImage[9]

img_urban[1]=LoadImage("gfx/map/gps_map/urban_1.png")
img_urban[2]=LoadImage("gfx/map/gps_map/urban_2.png")
img_urban[3]=LoadImage("gfx/map/gps_map/urban_3.png")
img_urban[4]=LoadImage("gfx/map/gps_map/urban_4.png")
img_urban[5]=LoadImage("gfx/map/gps_map/urban_5.png")
img_urban[6]=LoadImage("gfx/map/gps_map/urban_6.png")
img_urban[7]=LoadImage("gfx/map/gps_map/urban_7.png")
img_urban[8]=LoadImage("gfx/map/gps_map/urban_8.png")


Global img_shadow:TImage=LoadImage("gfx/map/gps_map/shadow.png")

Global map_known[mx_map_x,mx_map_y]
Global map_view[mx_map_x,mx_map_y]



Const object_empty=0
Const object_house=1
Const object_car=2


Global map_object[mx_map_x,mx_map_y]
Global map_object_condition[mx_map_x,mx_map_y]
Global map_object_known[mx_map_x,mx_map_y]


'map events

Global map_event[mx_map_x,mx_map_y]
Global map_event_type[mx_map_x,mx_map_y]
Global map_event_known[mx_map_x,mx_map_y]


