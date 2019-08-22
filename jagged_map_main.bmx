
Function map_save()

  If map_saved=0 Then

  Local file:TStream=WriteFile("data/map/map.txt")

  WriteInt(file,map_x)
  WriteInt(file,map_y)

  For Local i=0 To map_x-1
  For Local k=0 To map_y-1

    WriteInt(file,map_cache[i,k])
	  WriteInt(file,map_height[i,k])
	  WriteInt(file,map_vegetation[i,k])
	  WriteInt(file,map_debris[i,k])
	  WriteInt(file,map_urban[i,k])

  Next

    loadbar("Save Map",i,map_x,False)

  Next

  CloseFile(file)

  map_saved=1

  End If

End Function



Function map_load()

  If FileType("data/map/map.txt")=1 Then

	  Local file:TStream=ReadFile("data/map/map.txt")
	
	  map_x=ReadInt(file)
	  map_y=ReadInt(file)
	
	  For Local i=0 To map_x-1
	  For Local k=0 To map_y-1
	
		  map_cache[i,k]=ReadInt(file)
		  map_height[i,k]=ReadInt(file)
		  map_vegetation[i,k]=ReadInt(file)
		  map_debris[i,k]=ReadInt(file)
		  map_urban[i,k]=ReadInt(file)
	
	  Next
	
	    loadbar("Loading Map",i,map_x)
	
	  Next
	
	  CloseFile(file)
	
    map_saved=1

  Else

    map_init_topografic()

  End If

End Function





Function map_init_topografic()

  If FileType("data/map/map.txt")=1 Then DeleteFile("data/map/map.txt")

  Local pimage:TPixmap = LockImage(img_map)

  Local l

  For Local i=0 To map_x-1
  For Local k=0 To map_y-1

    map_cache[i,k]=0

    Local col = ReadPixel( pimage, i, k )

    If (col & $00ffffff) < $020202
      map_height[i,k]=0
    Else If (col & $00ffffff) < $040404
      map_height[i,k]=1
    Else If (col & $00ffffff) < $060606
      map_height[i,k]=2
    Else If (col & $00ffffff) < $080808
      map_height[i,k]=3
    Else If (col & $00ffffff) < $101010
      map_height[i,k]=4
    Else If (col & $00ffffff) < $121212
      map_height[i,k]=5
    Else If (col & $00ffffff) < $181818
      map_height[i,k]=6
    Else If (col & $00ffffff) < $242424
      map_height[i,k]=7
    Else If (col & $00ffffff) < $303030
      map_height[i,k]=8
    Else If (col & $00ffffff) < $333333
      map_height[i,k]=9
    Else If (col & $00ffffff) < $444444
      map_height[i,k]=10
    Else If (col & $00ffffff) < $666666
      map_height[i,k]=11
    Else If (col & $00ffffff) < $888888
      map_height[i,k]=12
    Else If (col & $00ffffff) < $aaaaaa
      map_height[i,k]=13
    Else If (col & $00ffffff) < $cccccc
      map_height[i,k]=14
    Else If (col & $00ffffff) < $ffffff
      map_height[i,k]=15
    Else
      map_height[i,k]=16
    End If

    'generate map details

    If map_height[i,k]>5 Then
      If Rand(0,100)<50 Then map_vegetation[i,k]=Rand(0,mx_veg)
      map_debris[i,k]=Rand(0,map_height[i,k])
    End If

    map_known[i,k]=0

  Next

    loadbar("Creating Map",i,map_x)

  Next

  UnlockImage(img_map)

  map_generate_urban()

  map_save()

End Function






Function map_center()

  map_cx=group_map_x[group_selected]-map_size/2
  map_cy=group_map_y[group_selected]-map_size/2

  While map_cx Mod 4 > 0 
    map_cx:+1
  Wend

  While map_cy Mod 4 > 0 
    map_cy:+1
  Wend


  If map_cx<0 Then map_cx=0
  If map_cx>map_x-map_size Then map_cx=map_x-map_size
  If map_cy<0 Then map_cy=0
  If map_cy>map_y-map_size Then map_cy=map_y-map_size

End Function



Function map_aktion_do()

  If MilliSecs()>map_c_t+map_c_s Then
    map_c_t=MilliSecs()

			If KeyDown(key_up) Then
			  If map_cy>0 Then
			    map_cy:-4
			    If map_cy<0 Then map_cy=0
			  End If
			End If
			
			If KeyDown(key_down) Then
			  If map_cy<map_y-map_size Then
			    map_cy:+4
			    If map_cy>map_y-map_size Then map_cy=map_y-map_size
			  End If
			End If
			
			If KeyDown(key_left) Then
			  If map_cx>0 Then
			    map_cx:-4
			    If map_cx<0 Then map_cx=0
			  End If
			End If
			
			If KeyDown(key_right) Then
			  If map_cx<map_x-map_size Then
			    map_cx:+4
			    If map_cx>map_x-map_size Then map_cx=map_x-map_size
			  End If
			End If
			
			If KeyHit(key_space) Then
			  map_center()
			End If
			
			
			If KeyHit(key_numadd) Then
			  map_zoom=1
			End If
			
			If KeyHit(key_numsubtract) Then
			  map_zoom=8
			End If

  End If

End Function






Function map_mouseover()

  Local x=wx/2-map_size/2*(map_tile+1)+20
  Local y=wy/2-map_size/2*(map_tile+1)-30

  For Local i=0 To map_size-1
  For Local k=0 To map_size-1

    If mouseover(x+i*(map_tile+1),y+k*(map_tile+1),x+i*(map_tile+1)+(map_tile),y+k*(map_tile+1)+(map_tile)) = 1 Then

     SetColor(255,255,255)
     DrawText("Coord.: "+(map_cx+i)+":"+(map_cy+k),x+map_size*(map_tile+1)+30,y)

     If group_map_find_new_way[group_selected]=1 Then
       group_map_find_way(map_cx+i,map_cy+k)
     End If

    If mouse=1 And mouseover(x,y,x+map_size*(map_tile+1)+(map_tile),y+map_size*(map_tile+1)+(map_tile)) = 1 And group_map_find_new_way[group_selected]=1 Then

      If map_cx+i=group_map_x[group_selected] And map_cy+k=group_map_x[group_selected] Then group_map_have_tar[group_selected]=0

      group_copy_new_way(group_selected)
      group_reset_new_way()
      mouse=0
    End If  

    End If  

  Next
  Next


  If mouse=2 And group_map_find_new_way[group_selected]=1 Then
    group_reset_new_way()
    group_new_waypoints_clear(group_selected)
    mouse=0
  EndIf

  If mouse=1 And mouseover(x,y,x+map_size*(map_tile+1)+(map_tile),y+map_size*(map_tile+1)+(map_tile)) = 1 And group_map_find_new_way[group_selected]=0 Then
    group_map_find_new_way[group_selected]=1
    mouse=0
  End If

End Function






Function map_draw_topografic()


  SetColor(255,255,255)




  Local x1=wx/2-map_size/2*(map_tile+1)+20
  Local y1=wy/2-map_size/2*(map_tile+1)-30

  DrawImage img_map_back,x1-(map_tile+1),y1-(map_tile+1)

  For Local i=0 To map_size-1
  For Local k=0 To map_size-1

      Local x=x1+i*(map_tile+1)
      Local y=y1+k*(map_tile+1)

   If map_cx+i>=0 And map_cx+i<mx_map_x And map_cy+k>=0 And map_cy+k<mx_map_y Then

        SetColor(255,255,255)

        DrawImage img_map_height[map_height[map_cx+i,map_cy+k]],x,y

        If map_vegetation[map_cx+i,map_cy+k]>0 And map_urban[map_cx+i,map_cy+k]=0 Then
          DrawImage img_vegetation[map_vegetation[map_cx+i,map_cy+k]],x,y
        End If

        If map_urban[map_cx+i,map_cy+k]>0 Then
          DrawImage img_urban[map_urban[map_cx+i,map_cy+k]],x,y
        End If


    End If


  Next
  Next


  For Local i=0 To map_size-1
  For Local k=0 To map_size-1

      Local x=x1+i*(map_tile+1)
      Local y=y1+k*(map_tile+1)

    If map_cx+i>=0 And map_cx+i<mx_map_x And map_cy+k>=0 And map_cy+k<mx_map_y Then

        For Local l=0 To group_max-1

	        If group[l]=1 Then
	        If group_map_x[l]=map_cx+i And group_map_y[l]=map_cy+k Then
	
	          Select group_fraction[l]
	            Case fraction_player SetColor(0,148,255)
	            Case fraction_militia SetColor(0,255,0)
	            Case fraction_enemy SetColor(255,0,0)
	            Case fraction_neutral SetColor(255,255,255)
	            Case fraction_bandit SetColor(100,100,100)
	          End Select
	
	          If group_selected=l Then SetColor(0,0,255)
	        
	          DrawImage img_group,x-3,y-21
	
	        End If
	        End If


          If group[l]=1 Then
          If group_fraction[l]=0 Then

            For Local j=0 To mx_waypoints-1

							If group_map_tar[l,j]=1 Then
							
								If group_map_tar_x[l,j]=map_cx+i And group_map_tar_y[l,j]=map_cy+k Then
							
								  If group_selected=l Then
								    SetColor(0,0,255)
								  Else
										SetColor(0,148,255)
								  End If
								
                    If j<mx_waypoints-1 Then
											If group_map_tar[l,j+1]=0 Then
											  DrawImage(img_target,x,y)
											Else
											  DrawImage(img_waypoint,x,y)
											End If
										Else
										  DrawImage(img_target,x,y)
									  End If
									
								End If								
								
							End If
							
							
							If group_selected=l Then
							  If group_map_find_new_way[l]=1 Then
								If group_map_new_tar[l,j]=1 Then
								
									If group_map_new_tar_x[l,j]=map_cx+i And group_map_new_tar_y[l,j]=map_cy+k Then
								
								    If group_map_find_new_way[l]=1 Then
									    SetColor(128,128,128)
									  Else
									    SetColor(0,0,255)
									  End If

                    DrawImage(img_waypoint,x,y)

									End If								
									
								End If
								End If
							End If
							
            Next

					End If
          End If

        Next


    End If


  Next
  Next

 

End Function



