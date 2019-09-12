
'licht

Global img_lichtkegel:TImage=LoadImage("gfx/world/light/lichtkegel.png",0)
MidHandleImage img_lichtkegel


Global img_light_1600x800:TImage=LoadImage("gfx/world/light/1600x800.png",0)
MidHandleImage img_light_1600x800
Global img_light_800x400:TImage=LoadImage("gfx/world/light/800x400.png",0)
MidHandleImage img_light_800x400
Global img_light_400x200:TImage=LoadImage("gfx/world/light/400x200.png",0)
MidHandleImage img_light_400x200





Function lightmap_clear()
  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1
    world_light[x,y,z]=0
  Next
  Next
  Next
End Function


Function light_blend(r1,g1,b1,r2,g2,b2)

Local r=255-((255-r1)*(255-r2))/255
Local g=255-((255-g1)*(255-g2))/255
Local b=255-((255-b1)*(255-b2))/255

SetColor r,g,b

End Function



Function set_light(i,x,y,z)

      For Local j=-item_type_light_range[item_type[i]] To item_type_light_range[item_type[i]]
      For Local l=-item_type_light_range[item_type[i]] To item_type_light_range[item_type[i]]
        If x+j>=0 And x+j<=world_x-1 And y+l>=0 And y+l<=world_y-1 Then

            Local r:Float=Sqr(j^2+l^2)
            Local r_max:Float=Sqr(item_type_light_range[item_type[i]]^2+item_type_light_range[item_type[i]]^2)*0.5

            If world_light[x+j,y+l,z]>0 Then
              world_light[x+j,y+l,z]=255-((255-world_light[x+j,y+l,z])*(255-(255*(Float(1)-Float(r)/r_max)+55)))/255
            Else
              world_light[x+j,y+l,z]=255*(Float(1)-Float(r)/r_max)+55
            End If
        End If
      Next
      Next

End Function



Function lightmap_refresh_item()

  For Local i=0 To item_last
    If item[i]>0 Then
      If item_type_light[item_type[i]]=1 Then
        If item_aktiv[i]=1 Then
          If item_time[i]+item_type_light_duration[item_type[i]]>timestemp Then

	                Local x
	                Local y
	                Local z

	          Select item_location[i]

	
	            Case location_player_hand
	
	              If item_type_stack[item_type[i]]=0 Then
				          If player_hand_index[item_location_index[i],player_hand_right]=i Or player_hand_index[item_location_index[i],player_hand_left]=i Then
				
			                x=player_world_x[item_location_index[i]]
			                y=player_world_y[item_location_index[i]]
			                z=player_world_z[item_location_index[i]]
				
			                set_light(i,x,y,z)
			
				         End If
	             End If
	
	            Case location_map
	
		          If item_type_stack[item_type[i]]=0 Then
		
	                Local x=item_location_pos[i,0]
	                Local y=item_location_pos[i,1]
	                Local z=item_location_pos[i,2]
		
	                set_light(i,x,y,z)
	
	              End If
		
                Case location_item_stack

                  Select item_location[item_location_index[i]]

	                Case location_player_hand
	
		              If player_hand_index[item_location_index[item_location_index[i]],player_hand_right]=item_location_index[i] Or player_hand_index[item_location_index[item_location_index[i]],player_hand_left]=item_location_index[i] Then
	                    x=player_world_x[item_location_index[item_location_index[i]]]
	                    y=player_world_y[item_location_index[item_location_index[i]]]
	                    z=player_world_z[item_location_index[item_location_index[i]]]	
	
	                    set_light(i,x,y,z)

	                  End If
	
		            Case location_map
	
	                  Local x=item_location_pos[item_location_index[i],0]
	                  Local y=item_location_pos[item_location_index[i],1]
	                  Local z=item_location_pos[item_location_index[i],2]
		
                      set_light(i,x,y,z)
	
                  End Select

              End Select



          End If
        End If
      End If
    End If
  Next

End Function



Function lightmap_refresh()


  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1
  For Local item=0 To world_item_max-1

    If world_item[x,y,z,item]>0 Then

      If item_type_group[item_type[world_item_index[x,y,z,item]],0]=group_light Or item_type_group[item_type[world_item_index[x,y,z,item]],1]=group_light Or item_type_group[item_type[world_item_index[x,y,z,item]],2]=group_light Then
      If item_aktiv[world_item_index[x,y,z,item]]=1 Then
      If item_time[world_item_index[x,y,z,item]]+item_type_light_duration[item_type[world_item_index[x,y,z,item]]]>timestemp Then
      For Local i=-item_type_light_range[item_type[world_item_index[x,y,z,item]]] To item_type_light_range[item_type[world_item_index[x,y,z,item]]]
      For Local k=-item_type_light_range[item_type[world_item_index[x,y,z,item]]] To item_type_light_range[item_type[world_item_index[x,y,z,item]]]
        If x+i>=0 And x+i<=world_x-1 And y+k>=0 And y+k<=world_y-1 Then
          'licht muss mit vorhandenem licht multipliziert werden
          world_light[x+i,y+k,z]=(255/(Abs(i)+1)+255/(Abs(k)+1))/2
        End If
      Next
      Next
      End If
      End If
      End If

    End If

  Next
  Next
  Next
  Next

End Function



Function items_light_draw()

  SetBlend lightblend
	
  For Local i=0 To item_last
    If item[i]>0 Then
      If item_type_light[item_type[i]]=1 Then
        If item_aktiv[i]=1 Then
          If item_time[i]+item_type_light_duration[item_type[i]]>timestemp Then


              Local p:Float=1-Float(timestemp-item_time[i])/item_type_light_duration[item_type[i]]

	          SetColor item_type_light_r[item_type[i]]*p,item_type_light_g[item_type[i]]*p,item_type_light_b[item_type[i]]*p
	
	          Select item_location[i]
	            Case location_mouse

	              If item_type_stack[item_type[i]]=0 Then
	              DrawImage(item_type_img[item_type[i]],MouseX(),MouseY())
	              DrawImage(img_light_1600x800,MouseX(),MouseY())
	              End If
	
	            Case location_player_hand
		
	              If item_type_stack[item_type[i]]=0 Then
	              If player_hand_index[item_location_index[i],player_hand_right]=i Or player_hand_index[item_location_index[i],player_hand_left]=i Then
	
	                Local x1=wx/2+(player_world_x[item_location_index[i]]-world_cam_x)*20-(player_world_y[item_location_index[i]]-world_cam_y)*20-20
	                Local y1=-wx/2+(player_world_y[item_location_index[i]]-world_cam_y)*10+(player_world_x[item_location_index[i]]-world_cam_x)*10
	                DrawImage(img_light_1600x800,x1+player_x[item_location_index[i]]+20,y1+player_y[item_location_index[i]]+10)
	
	              End If
	              End If
	
	            Case location_map
	
		
	              If item_type_stack[item_type[i]]=0 Then
	
	                Local x1=wx/2+(item_location_pos[i,0]-world_cam_x)*20-(item_location_pos[i,1]-world_cam_y)*20-20
	                Local y1=-wx/2+(item_location_pos[i,1]-world_cam_y)*10+(item_location_pos[i,0]-world_cam_x)*10
	                SetScale 0.2,0.2
	                DrawImage(item_type_img[item_type[i]],x1+20,y1+10)
	                SetScale 1,1
	                DrawImage(img_light_1600x800,x1+20,y1+10)

                  End If

                Case location_item_stack

			          Select item_location[item_location_index[i]]
			            Case location_mouse
			
			              DrawImage(item_type_img[item_type[item_location_index[i]]],MouseX(),MouseY())
			              DrawImage(img_light_1600x800,MouseX(),MouseY())
			
			            Case location_player_hand
			              If player_hand_index[item_location_index[item_location_index[i]],player_hand_right]=item_location_index[i] Or player_hand_index[item_location_index[item_location_index[i]],player_hand_left]=item_location_index[i] Then
		
			                Local x1=wx/2+(player_world_x[item_location_index[item_location_index[i]]]-world_cam_x)*20-(player_world_y[item_location_index[item_location_index[i]]]-world_cam_y)*20-20
			                Local y1=-wx/2+(player_world_y[item_location_index[item_location_index[i]]]-world_cam_y)*10+(player_world_x[item_location_index[item_location_index[i]]]-world_cam_x)*10
			                DrawImage(img_light_1600x800,x1+player_x[item_location_index[item_location_index[i]]]+20,y1+player_y[item_location_index[item_location_index[i]]]+10)
			
			              End If
			
			            Case location_map
			
			                Local x1=wx/2+(item_location_pos[item_location_index[i],0]-world_cam_x)*20-(item_location_pos[item_location_index[i],1]-world_cam_y)*20-20
			                Local y1=-wx/2+(item_location_pos[item_location_index[i],1]-world_cam_y)*10+(item_location_pos[item_location_index[i],0]-world_cam_x)*10
			                SetScale 0.2,0.2
			                DrawImage(item_type_img[item_type[i]],x1+20,y1+10)
			                SetScale 1,1
			                DrawImage(img_light_1600x800,x1+20,y1+10)
			
			          End Select



	          End Select

          End If
        End If
      End If
    End If
  Next

  SetBlend alphablend
  SetColor 255,255,255

End Function
