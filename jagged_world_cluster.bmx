

Function world_cluster_save()

  Local change=0

  If world_save_cache_enabled=1 Then

  If FileType("data/map/"+world_map_x+"_"+world_map_y)=0 Then
    CreateDir("data/map/"+world_map_x+"_"+world_map_y)
  End If

  'For Local i=0 To world_x/world_cluster_size-1
  'For Local k=0 To world_y/world_cluster_size-1

  Local i=save_cluster_x
  Local k=save_cluster_y

  If i<world_x/world_cluster_size-1 And k<world_y/world_cluster_size-1 Then

    If world_cache[i,k]=0 Then

      If world_cluster_ground_img[i,k] <> Null Then

	      SavePixmapPNG(LockImage(world_cluster_ground_img[i,k]),"data/map/"+world_map_x+"_"+world_map_y+"/cluster_ground_"+i+"_"+k+".png",compression)
	
		    If world_cluster_img[i,k] <> Null Then
		
		      SavePixmapPNG(LockImage(world_cluster_img[i,k]),"data/map/"+world_map_x+"_"+world_map_y+"/cluster_"+i+"_"+k+".png",compression)
		
				  world_cache[i,k]=1
				  change=1
				
			  End If
		
		  End If

    End If

  End If

	    save_cluster_y:+1
	    If save_cluster_y>world_y/world_cluster_size-1 Then
	      save_cluster_x:+1
	      save_cluster_y=0
	    End If
	    If save_cluster_x>world_x/world_cluster_size-1 Then
	      save_cluster_x=0
	      save_cluster_y=0
      End If

    'loadbar("Save Tileset",i,world_x/world_cluster_size)

  'Next
  'Next

  End If

  Return change

End Function




Function world_cluster_load()

	  For Local i=0 To world_x/world_cluster_size-1
	  For Local k=0 To world_y/world_cluster_size-1
	
		  If world_cache[i,k]=1 And FileType("data/map/"+world_map_x+"_"+world_map_y+"/cluster_ground_"+i+"_"+k+".png")=1 And FileType("data/map/"+world_map_x+"_"+world_map_y+"/cluster_"+i+"_"+k+".png")=1 Then
		
		      world_cluster_ground_img[i,k]=LoadImage("data/map/"+world_map_x+"_"+world_map_y+"/cluster_ground_"+i+"_"+k+".png",0)
		
		      world_cluster_img[i,k]=LoadImage("data/map/"+world_map_x+"_"+world_map_y+"/cluster_"+i+"_"+k+".png",0)
			
	    Else
	      world_cluster_create(i,k,i*world_cluster_size,k*world_cluster_size)
	    End If

	  Next
	    loadbar("Load Tileset",i,world_x/world_cluster_size)
	  Next

End Function





Function world_cluster_create(x1,y1,x2,y2)

  

  Local pix:TPixmap=CreatePixmap(world_cluster_dx,world_cluster_dy,PF_RGBA8888)
  ClearPixels(pix)

  'ground zeichnen

  For Local i=0 To world_cluster_size-1
  For Local k=0 To world_cluster_size-1

    Local l=0

    If world[x2+i,y2+k,l]=1 Then


	    For Local x=0 To world_tilesize*2-1
	    For Local y=0 To world_tilesize-1
	
	      Local x3=world_cluster_dx/2+i*20-k*20-20+x
	      Local y3=world_cluster_dy-world_tilesize*world_cluster_size+k*10+i*10+y+roof_offy*l
	
	      If x3<world_cluster_dx And y3<world_cluster_dy Then
	
	      	Local argb
	
		      If world_ground_type[x2+i,y2+k,l]<c_pool_water Then
		
			      If img_tile[0,world_ground_type[x2+i,y2+k,l]] <> Null Then
			
			         argb=ReadPixel(img_tile[0,world_ground_type[x2+i,y2+k,l]],x+world_ground_index[x2+i,y2+k,l]*40,y)
			
			         If (argb Shr 24 & $FF) > 0 Then
			
			           WritePixel(pix,x3,y3,argb)
			
			         End If
			
			      End If
		
		      Else
		
			      If img_house_floor <> Null Then
			
			         argb=ReadPixel(img_house_floor,x+world_ground_index[x2+i,y2+k,l]*40,y)
			
			         If (argb Shr 24 & $FF) > 0 Then
			
			           WritePixel(pix,x3,y3,argb)
			
			         End If
			
			      End If        
		
		      End If
		
		
		
		      If img_tile[0,world_margin_type[x2+i,y2+k,l]] <> Null Then
		
		        argb=ReadPixel(img_tile[0,world_margin_type[x2+i,y2+k,l]],x+world_margin_index[x2+i,y2+k,l]*40,y)
		
		        If (argb Shr 24 & $FF) > 0 Then
		
		          WritePixel(pix,x3,y3,argb)
		
		        End If
		
		      End If
		
				End If
	
	      
	
	    Next
	    Next


    End If


  Next
  Next


  world_cluster_ground_img[x1,y1]=LoadImage(CopyPixmap(pix))



  If world_cache_enabled=1 Then

  ClearPixels(pix)
   

  For Local i=0 To world_cluster_size-1
  For Local k=0 To world_cluster_size-1
  For Local l=0 To world_z-1


    If world[x2+i,y2+k,l]=1 Then

    For Local x=0 To world_tilesize*2-1
    For Local y=0 To world_tilesize-1

      Local x3=world_cluster_dx/2+i*20-k*20-20+x
      Local y3=world_cluster_dy-world_tilesize*world_cluster_size+k*10+i*10+y+roof_offy*l

      If x3<world_cluster_dx And y3<world_cluster_dy Then

      	Local argb

	      If world_ground_type[x2+i,y2+k,l]<c_pool_water Then
	
		      If img_tile[0,world_ground_type[x2+i,y2+k,l]] <> Null Then
		
		         argb=ReadPixel(img_tile[0,world_ground_type[x2+i,y2+k,l]],x+world_ground_index[x2+i,y2+k,l]*40,y)
		
		         If (argb Shr 24 & $FF) > 0 Then
		
		           WritePixel(pix,x3,y3,argb)
		
		         End If
		
		      End If
	
	      Else
	
	        If world_ground_type[x2+i,y2+k,l]=c_floor_house
	
			      If img_house_floor  <> Null Then
			
			         argb=ReadPixel(img_house_floor,x+world_ground_index[x2+i,y2+k,l]*40,y)
			
			         If (argb Shr 24 & $FF) > 0 Then
			
			           WritePixel(pix,x3,y3,argb)
			
			         End If
			
			      End If    
			    
			    Else
			
				    If world_ground_type[x2+i,y2+k,l]=c_roof_house
				
				      If img_house_roof <> Null Then
				
				         argb=ReadPixel(img_house_roof,x+world_ground_index[x2+i,y2+k,l]*40,y)
				
				         If (argb Shr 24 & $FF) > 0 Then
				
				           WritePixel(pix,x3,y3,argb)
				
				         End If
				
				      End If 
				
			      End If 			
			
			    End If
	
	      End If
	
	
	
	      If img_tile[0,world_margin_type[x2+i,y2+k,l]] <> Null Then
	
	        argb=ReadPixel(img_tile[0,world_margin_type[x2+i,y2+k,l]],x+world_margin_index[x2+i,y2+k,l]*40,y)
	
	        If (argb Shr 24 & $FF) > 0 Then
	
	          WritePixel(pix,x3,y3,argb)
	
	        End If
	
	      End If
	
			End If

      

    Next
    Next



    Local p3:TPixmap
    Local img3:TImage

    Local ox3
    Local oy3


			Select world_obj_type[x2+i,y2+k,l]
				Case world_obj_tree_conifer
					img3=img_tree_conifer_00[world_obj_index[x2+i,y2+k,l]]
					ox3=off_x_tree_conifer_00[world_obj_index[x2+i,y2+k,l]]
					oy3=off_y_tree_conifer_00[world_obj_index[x2+i,y2+k,l]]
				Case world_obj_tree_leaf
					img3=img_tree_leaf_00[world_obj_index[x2+i,y2+k,l]]
					ox3=off_x_tree_leaf_00[world_obj_index[x2+i,y2+k,l]]
					oy3=off_y_tree_leaf_00[world_obj_index[x2+i,y2+k,l]]
				Case world_obj_bush
			   img3=img_bush_00[world_obj_index[x2+i,y2+k,l]]
					ox3=off_x_bush_00[world_obj_index[x2+i,y2+k,l]]
					oy3=off_y_bush_00[world_obj_index[x2+i,y2+k,l]]
				Case world_obj_weed1
				  img3=img_weed_00[world_obj_index[x2+i,y2+k,l]]
					ox3=off_x_weed_00[world_obj_index[x2+i,y2+k,l]]
					oy3=off_y_weed_00[world_obj_index[x2+i,y2+k,l]]
				Case world_obj_weed2
					img3=img_weed_03[world_obj_index[x2+i,y2+k,l]]
					ox3=off_x_weed_03[world_obj_index[x2+i,y2+k,l]]
					oy3=off_y_weed_03[world_obj_index[x2+i,y2+k,l]]
				End Select



			Select world_ambient_type[x2+i,y2+k,l]
				Case weed_01
					img3=img_weed_01[world_ambient_index[x2+i,y2+k,l]]
					ox3=off_x_weed_01[world_ambient_index[x2+i,y2+k,l]]
					oy3=off_y_weed_01[world_ambient_index[x2+i,y2+k,l]]
				Case weed_02
					img3=img_weed_02[world_ambient_index[x2+i,y2+k,l]]
					ox3=off_x_weed_02[world_ambient_index[x2+i,y2+k,l]]
					oy3=off_y_weed_02[world_ambient_index[x2+i,y2+k,l]]
			End Select




       If img3 <> Null Then
         p3 = LockImage(img3)
       End If


     Select world_obj_type[x2+i,y2+k,l]
       Case world_obj_car

         Local px=world_obj_x[x2+i,y2+k,l]*20-world_obj_y[x2+i,y2+k,l]*20-car_offx[world_obj_index[x2+i,y2+k,l],world_obj_a[x2+i,y2+k,l]]-20

         p3=PixmapWindow(img_car[world_obj_index[x2+i,y2+k,l],world_obj_a[x2+i,y2+k,l]],px,0,40,PixmapHeight(img_car[world_obj_index[x2+i,y2+k,l],world_obj_a[x2+i,y2+k,l]]))
         ox3=0
         oy3=car_offy[world_obj_index[x2+i,y2+k,l],world_obj_a[x2+i,y2+k,l]]-world_obj_x[x2+i,y2+k,l]*10-world_obj_y[x2+i,y2+k,l]*10+10


     End Select


    If p3 <> Null Then
	
	    For Local x=0 To PixmapWidth(p3)-1
	    For Local y=0 To PixmapHeight(p3)-1
	
	      Local argb
	
	         Local x3=world_cluster_dx/2+i*20-k*20-20+x+ox3
	         Local y3=world_cluster_dy-world_tilesize*world_cluster_size+k*10+i*10+y+oy3+roof_offy*l
	
	         If x3<world_cluster_dx And y3<world_cluster_dy Then
	
		         If x<PixmapWidth(p3) And y<PixmapHeight(p3) Then
		
			         argb=ReadPixel(p3,x,y)
			
			         If (argb Shr 24 & $FF) > 0 Then 'And (argb Shr 8 & $FF) > 0 And (argb & $FF) > 0 And (argb Shr 16 & $FF) < 255 And (argb Shr 8 & $FF) < 255 And (argb & $FF) < 255 Then
			
			           WritePixel(pix,x3,y3,argb)
			
			         End If
		
							End If
						
						End If
	
	    Next
	    Next

    End If


    Local p4:TPixmap
    Local img4:TImage

    Local ox4
    Local oy4


    For Local j=0 To align_max-1

       Local a
       Select j
         Case 0 a=7
         Case 1 a=0
         Case 2 a=1
         Case 3 a=6
         Case 4 a=2
         Case 5 a=5
         Case 6 a=4
         Case 7 a=3
       End Select

       If world_wall_type[x2+i,y2+k,l,a]>0 Then

         Select world_wall_type[x2+i,y2+k,l,a]

         Case c_wall
	
		         If a=1 Or a=5 Then img4=img_house_wall_1
		         If a=3 Or a=7 Then img4=img_house_wall_0
	
	           ox4=house_offx[a,0]
	           oy4=house_offy[a,0]
	
	         Case c_door
	
		         If a=1 Or a=5 Then img4=img_house_door_1
		         If a=3 Or a=7 Then img4=img_house_door_0
	
		         ox4=house_offx[a,0]
	           oy4=house_offy[a,0]
	
	         Case c_window
	
		         If a=1 Or a=5 Then img4=img_house_window_1
		         If a=3 Or a=7 Then img4=img_house_window_0
		
	           ox4=house_offx[a,0]
	           oy4=house_offy[a,0]

	         Case c_fence
		
		         If a=1 Or a=5 Then img4=img_house_fence_1[world_wall_index[x2+i,y2+k,l,a]]
		         If a=3 Or a=7 Then img4=img_house_fence_0[world_wall_index[x2+i,y2+k,l,a]]
	
	           ox4=house_offx[a,1]
	           oy4=house_offy[a,1]
	
		         Case c_cliff
		
		         If a=1 Or a=5 Then img4=img_world_wall_1[world_wall_index[x2+i,y2+k,l,a]]
		         If a=3 Or a=7 Then img4=img_world_wall_0[world_wall_index[x2+i,y2+k,l,a]]
	
	           ox4=house_offx[a,0]
	           oy4=house_offy[a,0]	

         End Select




       If img4 <> Null Then
         p4 = LockImage(img4)
       End If

		    If p4 <> Null Then
			
			    For Local x=0 To PixmapWidth(p4)-1
			    For Local y=0 To PixmapHeight(p4)-1
			
			      Local argb
			
			         Local x3=world_cluster_dx/2+i*20-k*20-20+x+ox4
			         Local y3=world_cluster_dy-world_tilesize*world_cluster_size+k*10+i*10+y+oy4+roof_offy*l
		
		           If x3<world_cluster_dx And y3<world_cluster_dy Then
			
				         If x<PixmapWidth(p4) And y<PixmapHeight(p4) Then
				
					         argb=ReadPixel(p4,x,y)
					
					         If (argb Shr 24 & $FF) > 0 Then 'And (argb Shr 8 & $FF) > 0 And (argb & $FF) > 0 And (argb Shr 16 & $FF) < 255 And (argb Shr 8 & $FF) < 255 And (argb & $FF) < 255 Then
			
					           WritePixel(pix,x3,y3,argb)
					
					         End If
				
									End If
			
			          End If
			
			    Next
			    Next
		
		    End If

    	End If

    Next

		
    End If

  Next
  Next
  Next


  'save image

  world_cluster_img[x1,y1]=LoadImage(CopyPixmap(pix))


  End If

End Function






Function world_cluster_create_map()


  For Local i=0 To world_x/world_cluster_size-1
  For Local k=0 To world_y/world_cluster_size-1
    
    world_cluster_create(i,k,i*world_cluster_size,k*world_cluster_size)

  Next

    loadbar("Create Tileset",i,world_x/world_cluster_size)

  Next

End Function







Function world_cluster_draw_static(i,k,x,y)
  If world_cluster_img[i,k] <> Null Then
    SetColor time_color_r,time_color_g,time_color_b
    DrawImage(world_cluster_img[i,k],x,y)
    'DrawPixmap(world_cluster_pix[i,k],x,y)
  End If
End Function





Function world_cluster_draw_dynamic(i,k,x,y)

  SetColor time_color_r,time_color_g,time_color_b

   Local x3=x-world_cluster_dx/2
   Local y3=y-(world_cluster_dy-world_tilesize*world_cluster_size)


  If world_cluster_ground_img[i,k] <> Null Then
    DrawImage(world_cluster_ground_img[i,k],x3,y3)
  End If


  For Local j=0 To world_cluster_size-1
  For Local l=0 To world_cluster_size-1
  For Local z=0 To world_z-1


    Local x1=i*world_cluster_size+j
    Local y1=k*world_cluster_size+l

	  Local dx=world_tilesize
	  Local dy=world_tilesize/2
	
		Local x2=x+j*dx-l*dx-dx
		Local y2=y+l*dy+j*dy+roof_offy*z
			
			
						  If mouse_world=1 Then
			          If mouse_world_x=x1 And mouse_world_y=y1 Then
			            SetColor 255,255,255
			            DrawImage(img_cursor_yellow,x2,y2)
			          End If
			        End If
			
			
			  'light for objects
        If world_light[x1,y1,z]>0 Then
          light_blend(time_color_r,time_color_g,time_color_b,world_light[x1,y1,z],world_light[x1,y1,z],world_light[x1,y1,z])
			  Else
			    SetColor time_color_r,time_color_g,time_color_b
        End If


			  Select world_obj_type[x1,y1,z]
			    Case world_obj_player
			
			        If mouse_world=1 Then
			          If mouse_world_x=x1 And mouse_world_y=y1 Then
			            SetColor 255,255,255
			            DrawImage(img_cursor_yellow,x2,y2)
			          End If
			        End If
			
			        If player_selected[world_obj_index[x1,y1,z]]=1 Then
			          SetColor 255,255,255
			          DrawImage(img_cursor_green,x2+player_x[world_obj_index[x1,y1,z]],y2+player_y[world_obj_index[x1,y1,z]])
			        End If
			
			        If world_light[x1,y1,z]>0 Then
			          light_blend(time_color_r,time_color_g,time_color_b,world_light[x1,y1,z],world_light[x1,y1,z],world_light[x1,y1,z])
			        Else
			          SetColor time_color_r,time_color_g,time_color_b
			        End If

							player_animation_draw(world_obj_index[x1,y1,z],x2+player_x[world_obj_index[x1,y1,z]]+20,y2+player_y[world_obj_index[x1,y1,z]]+10)

			    Case world_obj_tree_conifer
			        DrawImage(img_tree_conifer_00[world_obj_index[x1,y1,z]],x2+off_x_tree_conifer_00[world_obj_index[x1,y1,z]],y2+off_y_tree_conifer_00[world_obj_index[x1,y1,z]])
			    Case world_obj_tree_leaf
			        DrawImage(img_tree_leaf_00[world_obj_index[x1,y1,z]],x2+off_x_tree_leaf_00[world_obj_index[x1,y1,z]],y2+off_y_tree_leaf_00[world_obj_index[x1,y1,z]])
			    Case world_obj_bush
			        DrawImage(img_bush_00[world_obj_index[x1,y1,z]],x2+off_x_bush_00[world_obj_index[x1,y1,z]],y2+off_y_bush_00[world_obj_index[x1,y1,z]])
			    Case world_obj_weed1
			        DrawImage(img_weed_00[world_obj_index[x1,y1,z]],x2+off_x_weed_00[world_obj_index[x1,y1,z]],y2+off_y_weed_00[world_obj_index[x1,y1,z]])
			    Case world_obj_weed2
			        DrawImage(img_weed_03[world_obj_index[x1,y1,z]],x2+off_x_weed_03[world_obj_index[x1,y1,z]],y2+off_y_weed_03[world_obj_index[x1,y1,z]])
			  End Select


          Select world_ambient_type[x1,y1,z]
            Case weed_01
              DrawImage(img_weed_01[world_ambient_index[x1,y1,z]],x2+off_x_weed_01[world_ambient_index[x1,y1,z]],y2+off_y_weed_01[world_ambient_index[x1,y1,z]])
            Case weed_02
              DrawImage(img_weed_02[world_ambient_index[x1,y1,z]],x2+off_x_weed_02[world_ambient_index[x1,y1,z]],y2+off_y_weed_02[world_ambient_index[x1,y1,z]])
            Case weed_03
              DrawImage(img_weed_03[world_ambient_index[x1,y1,z]],x2+off_x_weed_03[world_ambient_index[x1,y1,z]],y2+off_y_weed_03[world_ambient_index[x1,y1,z]])
          End Select



  Next
  Next
  Next

End Function



Function world_cluster_draw_screen()

  If world_cache_enabled=1 Then world_cluster_check()

  For Local i=0 To world_x/world_cluster_size-1
  For Local k=0 To world_y/world_cluster_size-1

    Local j=world_cam_x*world_tilesize*2
    Local l=world_cam_y*world_tilesize

    If world_cluster_activ[i,k] = 1 Or world_cache_enabled=0 Then

	    Local dx=world_tilesize*world_cluster_size
	    Local dy=world_tilesize/2*world_cluster_size
	
	    Local dx2=(world_cluster_dx-world_tilesize*2*world_cluster_size)/2
	    Local dy2=world_cluster_dy-world_tilesize*world_cluster_size
		
			Local x=wx/2+dx2+i*dx-k*dx
			Local y=-wy/2+dy2+k*dy+i*dy

      If x+j>=-world_cluster_dx And x+j<=wx+world_cluster_dx And y+l>=-world_cluster_dy And y+l<=wy+world_cluster_dy Then
      	world_cluster_draw_dynamic(i,k,x+j,y+l)
	    End If

    Else

	    Local dx=world_cluster_dx-(world_tilesize*world_cluster_size)/2
	    Local dy=world_cluster_dy-(world_cluster_dy-world_tilesize*world_cluster_size)
	
	    Local x=wx/2+i*dx/2-k*dx/2-dx/2
	    Local y=-wy/2+k*dy/2+i*dy/2

	    If x+j>=-world_cluster_dx And x+j<=wx+world_cluster_dx And y+l>=-world_cluster_dy And y+l<=wy+world_cluster_dy Then
	      world_cluster_draw_static(i,k,x+j,y+l)
	    End If
	
    End If

  Next
  Next

End Function







Function world_cluster_activ_rand()

  For Local i=0 To world_x/world_cluster_size-1
  For Local k=0 To world_y/world_cluster_size-1


    world_cluster_activ[i,k]=Rand(0,1)


  Next
  Next

End Function




Function world_cluster_check()


  For Local i=0 To world_x/world_cluster_size-1
  For Local k=0 To world_y/world_cluster_size-1

    world_cluster_activ[i,k]=0

  For Local z=0 To world_z-1

    For Local j=0 To world_cluster_size-1
    For Local l=0 To world_cluster_size-1
    
      If world_obj_type[i*world_cluster_size+j,k*world_cluster_size+l,z]=world_obj_player Then
        world_cluster_activ[i,k]=1
      End If

      If world_obj_type[i*world_cluster_size+j,k*world_cluster_size+l,z]=world_obj_reserved Then
        world_cluster_activ[i,k]=1
      End If

      If mouse_world_x=i*world_cluster_size+j And mouse_world_y=k*world_cluster_size+l Then
        world_cluster_activ[i,k]=1
      End If

    Next
    Next

  Next
  Next
  Next

End Function

