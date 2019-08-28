


Global img_house_wall_0:TImage=LoadImage("gfx/world/house/wall_0_0.png")
Global img_house_wall_1:TImage=LoadImage("gfx/world/house/wall_0_1.png")

Const img_fence_max=3

Const c_wirefence=0
Const c_woodfence=1

Global img_house_fence_0:TImage[img_fence_max]
Global img_house_fence_1:TImage[img_fence_max]

img_house_fence_0[c_wirefence]=LoadImage("gfx/world/house/fence_0_0.png")
img_house_fence_1[c_wirefence]=LoadImage("gfx/world/house/fence_0_1.png")

img_house_fence_0[c_woodfence]=LoadImage("gfx/world/house/fence_1_0.png")
img_house_fence_1[c_woodfence]=LoadImage("gfx/world/house/fence_1_1.png")



Global house_offx[align_max,2]
Global house_offy[align_max,2]

house_offx[1,0]=20
house_offy[1,0]=-51

house_offx[3,0]=16
house_offy[3,0]=-41

house_offx[5,0]=0
house_offy[5,0]=-41

house_offx[7,0]=-4
house_offy[7,0]=-51


house_offx[1,1]=20
house_offy[1,1]=-51

house_offx[3,1]=20
house_offy[3,1]=-41

house_offx[5,1]=0
house_offy[5,1]=-41

house_offx[7,1]=0
house_offy[7,1]=-51


Global img_house_floor:TPixmap=LoadPixmap("gfx/world/house/floor_0.png")

Global roof_offx=0
Global roof_offy=-51

Global img_house_roof:TPixmap=LoadPixmap("gfx/world/house/roof_0.png")


Global img_house_door_0:TImage=LoadImage("gfx/world/house/door_0_0.png")
Global img_house_door_1:TImage=LoadImage("gfx/world/house/door_0_1.png")

Global img_house_window_0:TImage=LoadImage("gfx/world/house/window_0_0.png")
Global img_house_window_1:TImage=LoadImage("gfx/world/house/window_0_1.png")








Const house_ebene_max=3

Const house_max=512

Global house_count

Const house_ground_max=10
Const house_floor_max=10
Const house_roof_max=10
Const house_fence_max=25
Const house_wall_max=25
Const house_door_max=10
Const house_window_max=35


Global house[house_max]
Global house_ebene[house_max]

Global house_ground[house_max,house_ebene_max,house_ground_max]
Global house_ground_type[house_max,house_ebene_max,house_ground_max]
Global house_ground_x1[house_max,house_ebene_max,house_ground_max]
Global house_ground_y1[house_max,house_ebene_max,house_ground_max]
Global house_ground_x2[house_max,house_ebene_max,house_ground_max]
Global house_ground_y2[house_max,house_ebene_max,house_ground_max]

Global house_floor[house_max,house_ebene_max,house_floor_max]
Global house_floor_type[house_max,house_ebene_max,house_floor_max]
Global house_floor_x1[house_max,house_ebene_max,house_floor_max]
Global house_floor_y1[house_max,house_ebene_max,house_floor_max]
Global house_floor_x2[house_max,house_ebene_max,house_floor_max]
Global house_floor_y2[house_max,house_ebene_max,house_floor_max]

Global house_roof[house_max,house_ebene_max,house_roof_max]
Global house_roof_type[house_max,house_ebene_max,house_roof_max]
Global house_roof_x1[house_max,house_ebene_max,house_roof_max]
Global house_roof_y1[house_max,house_ebene_max,house_roof_max]
Global house_roof_x2[house_max,house_ebene_max,house_roof_max]
Global house_roof_y2[house_max,house_ebene_max,house_roof_max]

Global house_fence[house_max,house_ebene_max,house_fence_max]
Global house_fence_type[house_max,house_ebene_max,house_fence_max]
Global house_fence_x1[house_max,house_ebene_max,house_fence_max]
Global house_fence_y1[house_max,house_ebene_max,house_fence_max]
Global house_fence_x2[house_max,house_ebene_max,house_fence_max]
Global house_fence_y2[house_max,house_ebene_max,house_fence_max]
Global house_fence_align[house_max,house_ebene_max,house_fence_max]

Global house_wall[house_max,house_ebene_max,house_wall_max]
Global house_wall_type[house_max,house_ebene_max,house_wall_max]
Global house_wall_x1[house_max,house_ebene_max,house_wall_max]
Global house_wall_y1[house_max,house_ebene_max,house_wall_max]
Global house_wall_x2[house_max,house_ebene_max,house_wall_max]
Global house_wall_y2[house_max,house_ebene_max,house_wall_max]
Global house_wall_align[house_max,house_ebene_max,house_wall_max]


Global house_door[house_max,house_ebene_max,house_door_max]
Global house_door_type[house_max,house_ebene_max,house_door_max]
Global house_door_x1[house_max,house_ebene_max,house_door_max]
Global house_door_y1[house_max,house_ebene_max,house_door_max]
Global house_door_align[house_max,house_ebene_max,house_door_max]

Global house_window[house_max,house_ebene_max,house_window_max]
Global house_window_type[house_max,house_ebene_max,house_window_max]
Global house_window_x1[house_max,house_ebene_max,house_window_max]
Global house_window_y1[house_max,house_ebene_max,house_window_max]
Global house_window_align[house_max,house_ebene_max,house_window_max]


Function house_load()

  house_count=0

  For Local i=0 To house_max-1


		Local s:String
		
	  If i<10 Then s="000"+i
	  If i>9 And i<100 Then s="00"+i
	  If i>99 And i<1000 Then s="0"+i
	  If i>999 Then s=i
	
		Local e=0
		
		While e<house_ebene_max And FileType("config/house/house_"+s+"_"+e+".txt")=1
	
	    Local file:TStream=ReadFile("config/house/house_"+s+"_"+e+".txt")
	
	
	    Local i_ground=0
	    Local i_floor=0
	    Local i_roof=0
	    Local i_wall=0
	    Local i_door=0
	    Local i_window=0
	    Local i_fence=0
	
	    If e=0 Then
	      house[house_count]=1
	      house_count:+1
	    End If
	
	    While Eof(file)=False
	
	      Select ReadLine(file)
	
	        Case "ground"
	
	          house_ground[house_count-1,e,i_ground]=1
	          house_ground_type[house_count-1,e,i_ground]=Int(ReadLine(file))
	          house_ground_x1[house_count-1,e,i_ground]=Int(ReadLine(file))
	          house_ground_y1[house_count-1,e,i_ground]=Int(ReadLine(file))
	          house_ground_x2[house_count-1,e,i_ground]=Int(ReadLine(file))
	          house_ground_y2[house_count-1,e,i_ground]=Int(ReadLine(file))
	
	          If i_ground<house_ground_max-1 Then i_ground:+1
	
	        Case "floor"
	
	          house_floor[house_count-1,e,i_floor]=1
	          house_floor_type[house_count-1,e,i_floor]=Int(ReadLine(file))
	          house_floor_x1[house_count-1,e,i_floor]=Int(ReadLine(file))
	          house_floor_y1[house_count-1,e,i_floor]=Int(ReadLine(file))
	          house_floor_x2[house_count-1,e,i_floor]=Int(ReadLine(file))
	          house_floor_y2[house_count-1,e,i_floor]=Int(ReadLine(file))
	
	          If i_floor<house_floor_max-1 Then i_floor:+1          
	
	        Case "roof"
	
	          house_roof[house_count-1,e,i_roof]=1
	          house_roof_type[house_count-1,e,i_roof]=Int(ReadLine(file))
	          house_roof_x1[house_count-1,e,i_roof]=Int(ReadLine(file))
	          house_roof_y1[house_count-1,e,i_roof]=Int(ReadLine(file))
	          house_roof_x2[house_count-1,e,i_roof]=Int(ReadLine(file))
	          house_roof_y2[house_count-1,e,i_roof]=Int(ReadLine(file))
	
	          If i_roof<house_roof_max-1 Then i_roof:+1 
		
	        Case "fence"
	
	          house_fence[house_count-1,e,i_fence]=1
	          house_fence_type[house_count-1,e,i_fence]=Int(ReadLine(file))
	          house_fence_x1[house_count-1,e,i_fence]=Int(ReadLine(file))
	          house_fence_y1[house_count-1,e,i_fence]=Int(ReadLine(file))
	          house_fence_x2[house_count-1,e,i_fence]=Int(ReadLine(file))
	          house_fence_y2[house_count-1,e,i_fence]=Int(ReadLine(file))
	          house_fence_align[house_count-1,e,i_fence]=Int(ReadLine(file))
	
	          If i_fence<house_fence_max-1 Then i_fence:+1    
	
	        Case "wall"
	
	          house_wall[house_count-1,e,i_wall]=1
	          house_wall_type[house_count-1,e,i_wall]=Int(ReadLine(file))
	          house_wall_x1[house_count-1,e,i_wall]=Int(ReadLine(file))
	          house_wall_y1[house_count-1,e,i_wall]=Int(ReadLine(file))
	          house_wall_x2[house_count-1,e,i_wall]=Int(ReadLine(file))
	          house_wall_y2[house_count-1,e,i_wall]=Int(ReadLine(file))
	          house_wall_align[house_count-1,e,i_wall]=Int(ReadLine(file))
	
	          If i_wall<house_wall_max-1 Then i_wall:+1
	
	        Case "door"
	
	          house_door[house_count-1,e,i_door]=1
	          house_door_type[house_count-1,e,i_door]=Int(ReadLine(file))
	          house_door_x1[house_count-1,e,i_door]=Int(ReadLine(file))
	          house_door_y1[house_count-1,e,i_door]=Int(ReadLine(file))
	          house_door_align[house_count-1,e,i_door]=Int(ReadLine(file))
	
	          If i_door<house_door_max-1 Then i_door:+1
	
	        Case "window"
	
	          house_window[house_count-1,e,i_window]=1
	          house_window_type[house_count-1,e,i_window]=Int(ReadLine(file))
	          house_window_x1[house_count-1,e,i_window]=Int(ReadLine(file))
	          house_window_y1[house_count-1,e,i_window]=Int(ReadLine(file))
	          house_window_align[house_count-1,e,i_window]=Int(ReadLine(file))
	
	          If i_window<house_window_max-1 Then i_window:+1
	
	      End Select
	
	    Wend
	
	    CloseFile(file)
	    e:+1
	    house_ebene[house_count-1]=e
		
	  Wend
	

	
	  loadbar("Load Houses",i,house_max)

  Next

End Function
