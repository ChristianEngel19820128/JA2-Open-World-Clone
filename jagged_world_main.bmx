

Function is_item(x,y,z)
  Local i=0
  Local f=False
  While f=False And i<world_item_max
    If world_item[x,y,z,i]>0 Then
      f=True
    Else
      i:+1
    End If
  Wend
Return f
End Function




Function in_world(x,y)
  If x>=0 And x<world_x And y>=0 And y<world_y Then
    Return True
  Else
    Return False
  End If
End Function




Function world_save()

  If FileType("data/map/"+world_map_x+"_"+world_map_y)<>2 Then
    CreateDir("data/map/"+world_map_x+"_"+world_map_y)
  End If

  If world_map_x>=0 And world_map_x<map_x And world_map_y>=0 And world_map_y<map_y Then 
	
	 If map_initialized[world_map_x,world_map_y]=1 Then
	
  	If world_cluster_save()=1 Or map_cache[world_map_x,world_map_y]=0 Then
	
		  Local file:TStream=WriteFile("data/map/"+world_map_x+"_"+world_map_y+"/"+world_map_x+"_"+world_map_y+".txt")
		
		  For Local i=0 To world_x/world_cluster_size-1
		  For Local k=0 To world_y/world_cluster_size-1
		    WriteInt(file,world_cache[i,k])
		  Next
		    'loadbar("Save Cache",i,world_x/world_cluster_size)
		  Next
	
	
	    For Local i=0 To world_x-1
	    For Local k=0 To world_y-1
	    For Local l=0 To world_z-1
		
		    WriteInt(file,world[i,k,l])
		
		    WriteInt(file,world_temperatur[i,k,l])
		    WriteInt(file,world_light[i,k,l])
		
		    WriteInt(file,world_ground_house[i,k,l])
		
		    WriteInt(file,world_ground_type[i,k,l])
		    WriteInt(file,world_ground_index[i,k,l])
		
		    WriteInt(file,world_margin_type[i,k,l])
		    WriteInt(file,world_margin_index[i,k,l])
		   
		    WriteInt(file,world_obj_type[i,k,l])
		    WriteInt(file,world_obj_index[i,k,l])
				WriteInt(file,world_obj_a[i,k,l])
				WriteInt(file,world_obj_x[i,k,l])
				WriteInt(file,world_obj_y[i,k,l])
		
		    For Local j=0 To align_max-1
		      WriteInt(file,world_wall_type[i,k,l,j])
		      WriteInt(file,world_wall_index[i,k,l,j])
		    Next
		
		    For Local j=0 To world_item_max-1
		      WriteInt(file,world_item[i,k,l,j])
		      WriteInt(file,world_item_index[i,k,l,j])
		    Next
		
		    WriteInt(file,world_ambient_type[i,k,l])
		    WriteInt(file,world_ambient_index[i,k,l])

	    Next	
	    Next
	      loadbar("Save World",i,world_x,False)
	    Next
	
	    CloseFile(file)
	
	    map_cache[world_map_x,world_map_y]=1
	
	  End If
   End If
  End If

End Function




Function world_load()

  If world_loaded_x<>world_map_x Or world_loaded_y<>world_map_y Then

	  If map_cache[world_map_x,world_map_y]=1 And FileType("data/map/"+world_map_x+"_"+world_map_y+"/"+world_map_x+"_"+world_map_y+".txt")=1 Then
			
				Local file:TStream=ReadFile("data/map/"+world_map_x+"_"+world_map_y+"/"+world_map_x+"_"+world_map_y+".txt")
			
			  For Local i=0 To world_x/world_cluster_size-1
			  For Local k=0 To world_y/world_cluster_size-1
			    world_cache[i,k]=ReadInt(file)
			  Next
			    loadbar("Load Cache",i,world_x/world_cluster_size)
			  Next
		
		
		    For Local i=0 To world_x-1
		    For Local k=0 To world_y-1
		    For Local l=0 To world_z-1

			    world[i,k,l]=ReadInt(file)
				
			    world_temperatur[i,k,l]=ReadInt(file)
			    world_light[i,k,l]=ReadInt(file)
			
			    world_ground_house[i,k,l]=ReadInt(file)
			
			    world_ground_type[i,k,l]=ReadInt(file)
			    world_ground_index[i,k,l]=ReadInt(file)
			
			    world_margin_type[i,k,l]=ReadInt(file)
			    world_margin_index[i,k,l]=ReadInt(file)
			   
			    world_obj_type[i,k,l]=ReadInt(file)
			    world_obj_index[i,k,l]=ReadInt(file)
					world_obj_a[i,k,l]=ReadInt(file)
					world_obj_x[i,k,l]=ReadInt(file)
					world_obj_y[i,k,l]=ReadInt(file)
		
					
			    For Local j=0 To align_max-1
			      world_wall_type[i,k,l,j]=ReadInt(file)
			      world_wall_index[i,k,l,j]=ReadInt(file)
			    Next
			
			    For Local j=0 To world_item_max-1
			    world_item[i,k,l,j]=ReadInt(file)
			    world_item_index[i,k,l,j]=ReadInt(file)
			    Next
			
			    world_ambient_type[i,k,l]=ReadInt(file)
			    world_ambient_index[i,k,l]=ReadInt(file)

			    Next			
			    Next
			      loadbar("Load World",i,world_x)
			    Next
			
			    CloseFile(file)
			
  			  map_initialized[world_map_x,world_map_y]=1
		
	   Else
		   world_init()
		   map_initialized[world_map_x,world_map_y]=1
	   End If
		
		 world_cluster_load()
		
	   world_loaded_x=world_map_x
	   world_loaded_y=world_map_y

   End If
	
End Function









Function world_gen_margins(c_type_1,c_type_2)


Local nw
Local ne
Local sw
Local se



  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

   If world_margin_type[x,y,z]=0 Then

   If world[x,y,z]=1 And world_ground_type[x,y,z]=c_type_2 Then

    nw=False
    ne=False
    sw=False
    se=False

    If x-1>=0 Then
      If world[x-1,y,z]=1 And world_ground_type[x-1,y,z]=c_type_1 Then
        nw=True
      End If
    Else
      'nw=Rand(0,1)
    End If

    If x+1<=world_x-1 Then
      If world[x+1,y,z]=1 And world_ground_type[x+1,y,z]=c_type_1 Then
        se=True
      End If
    Else
      'se=Rand(0,1)
    End If

    If y-1>=0 Then
      If world[x,y-1,z]=1 And world_ground_type[x,y-1,z]=c_type_1 Then
        ne=True
      End If
    Else
      'ne=Rand(0,1)
    End If

    If y+1<=world_y-1 Then
      If world[x,y+1,z]=1 And world_ground_type[x,y+1,z]=c_type_1 Then
        sw=True
      End If
    Else
      'sw=Rand(0,1)
    End If


    If Rand(0,1)=0 Then
      margin_sw_se=10
    Else
      margin_sw_se=25
    End If

    If Rand(0,1)=0 Then
      margin_nw_sw_se=11
    Else
      margin_nw_sw_se=26
    End If

    If Rand(0,1)=0 Then
      margin_nw_sw=12
    Else
      margin_nw_sw=27
    End If

    If Rand(0,1)=0 Then
      margin_ne_sw_se=13
    Else
      margin_ne_sw_se=28
    End If

    If Rand(0,1)=0 Then
      margin_nw_ne_sw=14
    Else
      margin_nw_ne_sw=29
    End If

    If Rand(0,1)=0 Then
      margin_ne_se=15
    Else
      margin_ne_se=30
    End If

    If Rand(0,1)=0 Then
      margin_nw_ne_se=16
    Else
      margin_nw_ne_se=31
    End If

    If Rand(0,1)=0 Then
      margin_nw_ne=17
    Else
      margin_nw_ne=32
    End If

    If Rand(0,1)=0 Then
      margin_nw=18
    End If

    If Rand(0,1)=0 Then
      margin_ne=20
    End If

    If Rand(0,1)=0 Then
      margin_se=21
    End If

    If Rand(0,1)=0 Then
      margin_sw=22
    End If


    If Rand(0,1)=0 Then
      margin_ne_sw=23
    Else
      margin_ne_sw=33
    End If

    If Rand(0,1)=0 Then
      margin_nw_se=24
    Else
      margin_nw_se=34
    End If


    If (nw=True Or ne=True Or sw=True Or se=True) And (nw=False Or ne=False Or sw=False Or se=False) Then
      world_margin_type[x,y,z]=c_type_1
    Else
      world_margin_type[x,y,z]=0
    End If

    world_margin_index[x,y,z]=0

    If nw=True And ne=True And sw=False And se=False Then world_margin_index[x,y,z]=margin_nw_ne
    If nw=False And ne=True And sw=False And se=True Then world_margin_index[x,y,z]=margin_ne_se
    If nw=True And ne=False And sw=True And se=False Then world_margin_index[x,y,z]=margin_nw_sw
    If nw=False And ne=False And sw=True And se=True Then world_margin_index[x,y,z]=margin_sw_se

    If nw=False And ne=True And sw=True And se=True Then world_margin_index[x,y,z]=margin_ne_sw_se
    If nw=True And ne=True And sw=False And se=True Then world_margin_index[x,y,z]=margin_nw_ne_se
    If nw=True And ne=True And sw=True And se=False Then world_margin_index[x,y,z]=margin_nw_ne_sw
    If nw=True And ne=False And sw=True And se=True Then world_margin_index[x,y,z]=margin_nw_sw_se

    'If nw=True And ne=True And sw=True And se=True Then world_margin_index[x,y]=margin_nw_ne_sw_se
    'If nw=False And ne=False And sw=False And se=False Then world_margin_index[x,y]=margin_nw_ne_sw_se

    If nw=True And ne=False And sw=False And se=True Then world_margin_index[x,y,z]=margin_nw_se
    If nw=False And ne=True And sw=True And se=False Then world_margin_index[x,y,z]=margin_ne_sw

    If nw=True And ne=False And sw=False And se=False Then world_margin_index[x,y,z]=margin_nw
    If nw=False And ne=True And sw=False And se=False Then world_margin_index[x,y,z]=margin_ne
    If nw=False And ne=False And sw=True And se=False Then world_margin_index[x,y,z]=margin_sw
    If nw=False And ne=False And sw=False And se=True Then world_margin_index[x,y,z]=margin_se

    If world_margin_index[x,y,z]=0 Then
      world_margin_type[x,y,z]=0
    End If


   End If
   End If

  Next
  Next
  Next

End Function






Function world_gen_field(c_type,runs,radius)


	For Local i=1 To runs
	
	  For Local x=0 To world_x-1
	  For Local y=0 To world_y-1
	  For Local z=0 To world_z-1
	
	
	    If world[x,y,z]=1 And world_ground_type[x,y,z]=c_type Then
	
	      Local r=Rand(1,radius)
	
	      For Local r1=-r To r
	      For Local r2=-r To r
	
	        If x+r1>=0 And x+r1<=world_x-1 And y+r2>=0 And y+r2<=world_y-1 And (Rand(0,r+1)>Abs(r1) And Rand(0,r+1)>Abs(r2)) Then
	          If world[x+r1,y+r2,z]=1 And world_ground_type[x+r1,y+r2,z]<>c_type Then
	            world_ground_type[x+r1,y+r2,z]=0
	          End If
	        End If
	
	      Next
	      Next
	
	    End If
	
	  Next
	  Next
	  Next
	
	  For Local x=0 To world_x-1
	  For Local y=0 To world_y-1
	  For Local z=0 To world_z-1
	
	    If world[x,y,z]=1 And world_ground_type[x,y,z]=0 Then
	      world_ground_type[x,y,z]=c_type
		    world_ground_index[x,y,z]=Rand(0,9)
	    End If
	
	  Next
	  Next
	  Next
	
	Next





  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 And world_ground_type[x,y,z]<>c_type Then 

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=1 And world_ground_type[x+1,y,z]=c_type Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=1 And world_ground_type[x-1,y,z]=c_type Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y+1<=world_y-1 Then
        If world[x,y+1,z]=1 And world_ground_type[x,y+1,z]=c_type Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y-1>=0 Then
        If world[x,y-1,z]=1 And world_ground_type[x,y-1,z]=c_type Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

    End If

  Next
  Next
  Next



End Function






Function world_gen_dbl_field(c_type_1,c_type_2,runs,radius)

	For Local i=1 To runs
	
	  For Local x=0 To world_x-1
	  For Local y=0 To world_y-1
	  For Local z=0 To world_z-1
	
	    Local r=Rand(1,radius)
	
	    If world[x,y,z]=1 And world_ground_type[x,y,z]=c_type_1 Then
	
	      For Local r1=-r To r
	      For Local r2=-r To r
	
	        If x+r1>=0 And x+r1<=world_x-1 And y+r2>=0 And y+r2<=world_y-1 And (Rand(0,r+1)>Abs(r1) And Rand(0,r+1)>Abs(r2)) Then
	          If world[x+r1,y+r2,z]=1 And world_ground_type[x+r1,y+r2,z]<>c_type_1 And world_ground_type[x+r1,y+r2,z]<>c_type_2 Then
	            If Abs(r1)<=Floor(r/1.2) And Abs(r2)<=Floor(r/1.2) Then
	              world_ground_type[x+r1,y+r2,z]=-1
              Else
	              world_ground_type[x+r1,y+r2,z]=-2
	            End If
	          End If
	        End If
	
	      Next
	      Next

	    Else
	
		    If world[x,y,z]=1 And world_ground_type[x,y,z]=c_type_2 Then
				
		      Local r=Rand(1,radius)
		
		      For Local r1=-r To r
		      For Local r2=-r To r
		
		        If x+r1>=0 And x+r1<=world_x-1 And y+r2>=0 And y+r2<=world_y-1 And (Rand(0,r+1)>Abs(r1) And Rand(0,r+1)>Abs(r2)) Then
		          If world[x+r1,y+r2,z]=1 And world_ground_type[x+r1,y+r2,z]<>c_type_1 And world_ground_type[x+r1,y+r2,z]<>c_type_2 Then
		            world_ground_type[x+r1,y+r2,z]=-2
		          End If
		        End If
		
		      Next
		      Next

	      End If
	
	    End If
	
	  Next
	  Next
	  Next
	
	  For Local x=0 To world_x-1
	  For Local y=0 To world_y-1
	  For Local z=0 To world_z-1
	
	    If world[x,y,z]=1 And world_ground_type[x,y,z]=-1 Then
	      world_ground_type[x,y,z]=c_type_1
		    world_ground_index[x,y,z]=Rand(0,9)
	    End If
	
	  Next
	  Next
	  Next

	  For Local x=0 To world_x-1
	  For Local y=0 To world_y-1
	  For Local z=0 To world_z-1
	
	    If world[x,y,z]=1 And world_ground_type[x,y,z]=-2 Then
	      world_ground_type[x,y,z]=c_type_2
		    world_ground_index[x,y,z]=Rand(0,9)
	    End If
	
	  Next
	  Next
	  Next


Next




  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 And world_ground_type[x,y,z]<>c_type_1 And world_ground_type[x,y,z]<>c_type_2 Then 

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=1 And (world_ground_type[x+1,y,z]=c_type_1 Or world_ground_type[x+1,y,z]=c_type_2) Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=1 And (world_ground_type[x-1,y,z]=c_type_1 Or world_ground_type[x-1,y,z]=c_type_2) Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y+1<=world_y-1 Then
        If world[x,y+1,z]=1 And (world_ground_type[x,y+1,z]=c_type_1 Or world_ground_type[x,y+1,z]=c_type_2) Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y-1>=0 Then
        If world[x,y-1,z]=1 And (world_ground_type[x,y-1,z]=c_type_1 Or world_ground_type[x,y-1,z]=c_type_2) Then
	       world_ground_type[x,y,z]=c_earth
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

    End If

  Next
  Next
  Next


  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 And world_ground_type[x,y,z]=c_type_1 Then 

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=1 And world_ground_type[x+1,y,z]=c_earth Then
	       world_ground_type[x,y,z]=c_type_2
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=1 And world_ground_type[x-1,y,z]=c_earth Then
	       world_ground_type[x,y,z]=c_type_2
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y+1<=world_y-1 Then
        If world[x,y+1,z]=1 And world_ground_type[x,y+1,z]=c_earth Then
	       world_ground_type[x,y,z]=c_type_2
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If


      If y-1>=0 Then
        If world[x,y-1,z]=1 And world_ground_type[x,y-1,z]=c_earth Then
	       world_ground_type[x,y,z]=c_type_2
	       world_ground_index[x,y,z]=Rand(0,9)	
	     End If
	   End If

    End If

  Next
  Next
  Next




End Function




Function world_clear_single()

  For Local i=0 To 2

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then 

      Local c_type=world_ground_type[x,y,z]

      Local f=0

      Local c

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=1 Then
          If world_ground_type[x+1,y,z]=c_type Then
            f:+1
          Else
            c=world_ground_type[x+1,y,z]
          End If
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=1 Then
          If world_ground_type[x-1,y,z]=c_type Then
            f:+1
          Else
            c=world_ground_type[x-1,y,z]
          End If
	     End If
	   End If


      If y+1<=world_y-1 Then
        If world[x,y+1,z]=1 Then
          If world_ground_type[x,y+1,z]=c_type Then
            f:+1
          Else
            c=world_ground_type[x,y+1,z]
         End If
	     End If
	   End If


      If y-1>=0 Then
        If world[x,y-1,z]=1 Then
         If world_ground_type[x,y-1,z]=c_type Then
            f:+1
          Else
            c=world_ground_type[x,y-1,z]
         End If
	     End If
	   End If      

     If f=0 Then
				world_ground_type[x,y,z]=c
     		world_ground_index[x,y,z]=Rand(0,9)
     End If

    End If

  Next
  Next
  Next

  Next

End Function




Function world_gen_buildings()

  If house_count>0 Then

		'If map_urban[world_map_x,world_map_y]>0 Then
		
		  For Local x=5 To world_x-5 Step 5
		  For Local y=5 To world_y-5 Step 5
		  For Local z=0 To world_z-1
				
		    If Rand(0,10000)>9999-map_urban[world_map_x,world_map_y]*100 Then
		    'If Rand(0,10000)>8000 Then
		
		      Local i=Rand(0,house_count-1)
			
			    Local legal=True
					
		      Local dx
		      Local dy

		      If world[x,y,z]=1 And world_z-1-z>house_ebene[i]-1 Then


		        For Local e=0 To house_ebene[i]-1
			      For Local k=0 To house_ground_max-1
		
	        		If house_ground[i,e,k]=1 Then
				
				        If dx<house_ground_x2[i,e,k] Then dx=house_ground_x2[i,e,k]
				        If dy<house_ground_y2[i,e,k] Then dy=house_ground_y2[i,e,k]
				
				        If x+dx<world_x-5 And y+dy<world_y-5 Then
				
					          For Local j=house_ground_x1[i,e,k]-1 To house_ground_x2[i,e,k]+1
					          For Local l=house_ground_y1[i,e,k]-1 To house_ground_y2[i,e,k]+1
					
					            If world[x+j,y+l,z]=0 Or world_ground_house[x+j,y+l,z+e]=1 Or world_ground_type[x+j,y+l,z+e]=c_water Then
			                  legal=False
					            End If
					
					          Next
					          Next
					
								Else
								  legal=False
					      End If
		          
		          End If
					
	          Next
	          Next

          Else
            legal=False
          End If
			
				
				  If legal=True Then

		        For Local e=0 To house_ebene[i]-1
			      For Local k=0 To house_ground_max-1

	        		If house_ground[i,e,k]=1 Then
	
	              For Local j=house_ground_x1[i,e,k]-2 To house_ground_x2[i,e,k]+2
				        For Local l=house_ground_y1[i,e,k]-2 To house_ground_y2[i,e,k]+2

			            world_margin_type[x+j,y+l,z+e]=0
			
			            world_ambient_type[x+j,y+l,z+e]=0
			
						      world_obj_type[x+j,y+l,z+e]=0				
				
			          Next
			          Next
							
			          For Local j=house_ground_x1[i,e,k] To house_ground_x2[i,e,k]
			          For Local l=house_ground_y1[i,e,k] To house_ground_y2[i,e,k]
			
			            world_ground_house[x+j,y+l,z+e]=1
			
			          Next
			          Next
			
			        End If
		
		        Next
		        Next
			
			
		        For Local e=0 To house_ebene[i]-1
		
				      For Local k=0 To house_floor_max-1
	
		        		If house_floor[i,e,k]=1 Then
		
				          For Local j=house_floor_x1[i,e,k] To house_floor_x2[i,e,k]
				          For Local l=house_floor_y1[i,e,k] To house_floor_y2[i,e,k]
				
				            world[x+j,y+l,z+e]=1
				            world_ground_type[x+j,y+l,z+e]=c_floor_house
		                world_ground_index[x+j,y+l,z+e]=0
				
				          Next
				          Next
				
				        End If
			
			        Next
			
							  For Local k=0 To house_roof_max-1
	
		        		If house_roof[i,e,k]=1 Then
		
				          For Local j=house_roof_x1[i,e,k] To house_roof_x2[i,e,k]
				          For Local l=house_roof_y1[i,e,k] To house_roof_y2[i,e,k]
				
				            world[x+j,y+l,z+e+1]=1
				            world_ground_type[x+j,y+l,z+e+1]=c_roof_house
		                world_ground_index[x+j,y+l,z+e+1]=0
				
				          Next
				          Next
				
				        End If
			
			        Next
			
							For Local k=0 To house_fence_max-1
							
								If house_fence[i,e,k]=1 Then
	
									For Local j=house_fence_x1[i,e,k] To house_fence_x2[i,e,k]
					        For Local l=house_fence_y1[i,e,k] To house_fence_y2[i,e,k]
					
									  world_wall_type[x+j,y+l,z+e,house_wall_align[i,e,k]]=c_fence
		  							world_wall_index[x+j,y+l,z+e,house_wall_align[i,e,k]]=house_fence_type[i,e,k]
									
					        Next
					        Next
				
								End If
				
		          Next
				
							For Local k=0 To house_wall_max-1
							
								If house_wall[i,e,k]=1 Then
	
									For Local j=house_wall_x1[i,e,k] To house_wall_x2[i,e,k]
					        For Local l=house_wall_y1[i,e,k] To house_wall_y2[i,e,k]
					
									  world_wall_type[x+j,y+l,z+e,house_wall_align[i,e,k]]=c_wall
		  							world_wall_index[x+j,y+l,z+e,house_wall_align[i,e,k]]=0
									
					        Next
					        Next
				
								End If
				
		          Next
			
			
							For Local k=0 To house_door_max-1
							
								If house_door[i,e,k]=1 Then
	
									  world_wall_type[x+house_door_x1[i,e,k],y+house_door_y1[i,e,k],z+e,house_door_align[i,e,k]]=c_door
		  							world_wall_index[x+house_door_x1[i,e,k],y+house_door_y1[i,e,k],z+e,house_door_align[i,e,k]]=0
				
								End If
				
		          Next
			
							For Local k=0 To house_window_max-1
							
								If house_window[i,e,k]=1 Then
	
									  world_wall_type[x+house_window_x1[i,e,k],y+house_window_y1[i,e,k],z+e,house_window_align[i,e,k]]=c_window
		  							world_wall_index[x+house_window_x1[i,e,k],y+house_window_y1[i,e,k],z+e,house_window_align[i,e,k]]=0
				
								End If
				
		          Next


            Next
			
		      End If
  	    End If
		
		  Next
		  Next
		  Next

		'End If

  End If

End Function



Function world_gen_minimap()

  If FileType("data/map/"+world_map_x+"_"+world_map_y)=0 Then
    CreateDir("data/map/"+world_map_x+"_"+world_map_y)
  End If

  Local pix:TPixmap=CreatePixmap(world_x/mini_dx,world_y/mini_dx,PF_RGBA8888)
  Local argb

  For Local x=0 To world_x-1 Step mini_dx
  For Local y=0 To world_y-1 Step mini_dy
  For Local z=0 To world_z-1
 
    If world[x,y,z]=1 Then

	    Select world_ground_type[x,y,z]
	
	        Case c_earth
	          argb = 127 Shl 16 + 55 Shl 8 
	        Case c_gras
	          argb = 110 Shl 16 + 90 Shl 8 + 70
	        Case c_water
	          argb = 30 Shl 16 + 45 Shl 8 + 50
	        Case c_deep_water
	          argb = 15 Shl 16 + 35 Shl 8 + 40
	        Case c_floor_house
	          argb = 128 Shl 16 + 128 Shl 8 + 128
	
	    End Select
	
	    Select world_obj_type[x,y,z]
	
	      Case world_obj_tree_conifer
	         argb = 40 Shl 16 + 127 Shl 8 
	      Case world_obj_tree_leaf
	         argb = 40 Shl 16 + 127 Shl 8 
	      Case world_obj_bush
	         argb = 40 Shl 16 + 127 Shl 8 
	
	    End Select

    End If

  Next

    WritePixel(pix,x/mini_dx,y/mini_dy,argb)

  Next

    loadbar("Create Minimap",x,world_x)

  Next

    img_world_minimap=LoadImage(MaskPixmap(pix,0,0,0))
    SavePixmapPNG(MaskPixmap(pix,0,0,0),"data/map/"+world_map_x+"_"+world_map_y+"/minimap.png",compression)

End Function


Function world_clear()

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1


    world[x,y,z]=0

    world_ground_type[x,y,z]=0

    world_ground_house[x,y,z]=0

    world_temperatur[x,y,z]=0

    world_light[x,y,z]=0

    world_ground_type[x,y,z]=0

    world_margin_type[x,y,z]=0

    world_obj_type[x,y,z]=0
    world_obj_a[x,y,z]=0
    world_obj_x[x,y,z]=0
    world_obj_y[x,y,z]=0

    For Local i=0 To align_max-1
      world_wall_type[x,y,z,i]=0
    Next

    For Local i=0 To world_item_max-1
      world_item[x,y,z,i]=0
    Next

    world_ambient_type[x,y,z]=0

  Next
  Next
  Next

End Function



Function world_gen_mountain()

	Local y1=Rand(1,(world_y-1))
	Local x1=Rand(1,(world_x-1)) 

	Local y2=Rand(y1+1,world_y-1)
	Local x2=Rand(x1+1,world_x-1)
	
	Local s1:Float=(y2-y1)/(x2-x1)
	Local s2:Float=y1-x1*s1	
	
	Local h=Rand(0,Floor(map_height[world_map_x,world_map_y]*(world_z-1)/16))
	If h>world_z-1 Then h=world_z-1
	
	Local r=Rand(5,map_height[world_map_x,world_map_y]*3)
	
	Local rh
	
  Local r1
  Local r2
	
	Local xt
	Local yt
	
	Local i
	Local j
	Local k
	Local l
	
	

		If x2-x1>y2-y1 Then
		
			For i=x1 To x2
			For k=1 To h	
				
				rh=Rand(1,Rand(Ceil(r/k),Floor(r/k))-k)

        If rh>1 Then

				For j=-rh To rh
				For l=-rh To rh

          r1=0
          If j<0 Then r1=-1*Rand(1,Abs(j))
          If j>0 Then r1=Rand(1,j)

          r2=0
          If l<0 Then r2=-1*Rand(1,Abs(l))
          If l>0 Then r2=Rand(1,l)
	
					xt=i+r1
					yt=Rand(Ceil(s1*i+s2),Floor(s1*i+s2))+r2
	
					If xt>=0 And xt<=world_x-1 And yt>=0 And yt<=world_y-1 Then
						If k<=world_z-1 Then
							world[xt,yt,k]=1
						End If
					End If
	
				Next
				Next

        End If
				
			Next
			Next
			
		Else
		
			For i=y1 To y2
			For k=1 To h
						
				rh=Rand(1,Rand(Ceil(r/k),Floor(r/k))-k)

        If rh>1 Then

				For j=-rh To rh
				For l=-rh To rh
	
          r1=0
          If j<0 Then r1=-1*Rand(1,Abs(j))
          If j>0 Then r1=Rand(1,j)

          r2=0
          If l<0 Then r2=-1*Rand(1,Abs(l))
          If l>0 Then r2=Rand(1,l)
	
					xt=Rand(Ceil((i-s2)/s1),Floor((i-s2)/s1))+r2
					yt=i+r1
					
					If xt>=0 And xt<=world_x-1 And yt>=0 And yt<=world_y-1 Then
						If k<=world_z-1 Then
							world[xt,yt,k]=1
						End If
					End If	
	
				Next
				Next
				
				End If
				
			Next
			Next
					
		End If


		
End Function




Function world_place_large_obj(t,i,a,x,y,z)

	Select t
	Case world_obj_car
	
		If img_car[i,a] <> Null Then
		
		  If x+car_dx[i,a]-1<world_x And y+car_dy[i,a]-1<world_y Then
		
				For Local j=0 To car_dx[i,a]-1
				For Local l=0 To car_dy[i,a]-1
					
					world_obj_type[x+j,y+l,z]=t
					world_obj_index[x+j,y+l,z]=i
					world_obj_a[x+j,y+l,z]=a
					world_obj_x[x+j,y+l,z]=j
					world_obj_y[x+j,y+l,z]=l
					
				Next
				Next
			
			End If
			
		End If
	
	End Select

End Function




Function world_init()

  loadbar("Create World")

  world_clear()

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1

    world[x,y,0]=1

  Next
  Next

  For Local i=0 To Rand(0,map_height[world_map_x,world_map_y]-map_urban[world_map_x,world_map_y]-6)
    world_gen_mountain()
  Next


  For Local i=0 To 2

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=0 Then 

      Local f=0

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=1 Then
          f:+1
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=1 Then
          f:+1
	     End If
	   End If

      If y+1<=world_y-1 Then
        If world[x,y+1,z]=1 Then
          f:+1
	     End If
	   End If

      If y-1>=0 Then
        If world[x,y-1,z]=1 Then
          f:+1
	     End If
	   End If      

     If f>2 Then
				world[x,y,z]=1
     End If

    End If


    If world[x,y,z]=1 Then 

      Local f=0

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=0 Then
          f:+1
	     End If
	   End If

      If x-1>=0 Then
        If world[x-1,y,z]=0 Then
          f:+1
	     End If
	   End If

      If y+1<=world_y-1 Then
        If world[x,y+1,z]=0 Then
          f:+1
	     End If
	   End If

      If y-1>=0 Then
        If world[x,y-1,z]=0 Then
          f:+1
	     End If
	   End If      

     If f>2 Then
				world[x,y,z]=0
     End If

    End If


  Next
  Next
  Next

  Next

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-2

    If world[x,y,z+1]=1 Then world[x,y,z]=0

  Next
  Next
  Next


  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-2

    If world[x,y,z]=1 Then

      If x+1<=world_x-1 Then
        If world[x+1,y,z]=0 And world[x+1,y,z+1]=1 Then
  				world_wall_type[x,y,z,3]=c_cliff
	  	  	world_wall_index[x,y,z,3]=Rand(0,world_wall_max-1)	
        End If
      End If

      If x-1>=0 Then
        If world[x-1,y,z]=0 And world[x-1,y,z+1]=1 Then
			    world_wall_type[x,y,z,7]=c_cliff
		  		world_wall_index[x,y,z,7]=Rand(0,world_wall_max-1)	
        End If
      End If

      If y+1<=world_y-1 Then
        If world[x,y+1,z]=0 And world[x,y+1,z+1]=1 Then
					world_wall_type[x,y,z,5]=c_cliff
		  		world_wall_index[x,y,z,5]=Rand(0,world_wall_max-1)	
        End If
      End If

      If y-1>=0 Then
        If world[x,y-1,z]=0 And world[x,y-1,z+1]=1 Then
					world_wall_type[x,y,z,1]=c_cliff
		  	  world_wall_index[x,y,z,1]=Rand(0,world_wall_max-1)	
        End If
      End If

    End If

  Next
  Next
  Next



  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
	    
		  world_ground_type[x,y,z]=c_earth
		  world_ground_index[x,y,z]=Rand(0,9)	   
	
	  If map_vegetation[world_map_x,world_map_y]=veg_wiese Then
		  If Rand(0,100)<25 Then
		     world_ground_type[x,y,z]=c_gras
		     world_ground_index[x,y,z]=Rand(0,9)
	    End If
		Else
			If Rand(0,100)<15 Then
		     world_ground_type[x,y,z]=c_gras
		     world_ground_index[x,y,z]=Rand(0,9)
	    End If
	  End If
		
		
	    If Rand(0,10000)>9900-16*2+map_height[world_map_x,world_map_y]*2-8*2+map_urban[world_map_x,world_map_y]*2 Then
      	If map_vegetation[world_map_x,world_map_y]=veg_sumpf Then
          If Rand(0,25)<20 Then
			      world_ground_type[x,y,z]=c_deep_water
		        world_ground_index[x,y,z]=Rand(0,9)
  	      Else
            world_ground_type[x,y,z]=c_water
		        world_ground_index[x,y,z]=Rand(0,9)
		      End If
		    Else
			    If Rand(0,10000)>9900-16*2+map_height[world_map_x,world_map_y]*2-8*2+map_urban[world_map_x,world_map_y]*2 Then
	          If Rand(0,25)<20 Then
				      world_ground_type[x,y,z]=c_deep_water
			        world_ground_index[x,y,z]=Rand(0,9)
	  	      Else
	            world_ground_type[x,y,z]=c_water
			        world_ground_index[x,y,z]=Rand(0,9)
			      End If
			    End If
			  End If
	  	End If
		
		End If
	
  Next
  Next
  Next



  If map_vegetation[world_map_x,world_map_y]=veg_sumpf Then
    world_gen_dbl_field(c_deep_water,c_water,3,4)
  Else
    world_gen_dbl_field(c_deep_water,c_water,1,4)
  End If



  world_gen_field(c_gras,1,3)

  world_clear_single()

  world_gen_margins(c_gras,c_earth)
  world_gen_margins(c_earth,c_water)
  world_gen_margins(c_gras,c_water)
  world_gen_margins(c_earth,c_deep_water)
  world_gen_margins(c_gras,c_deep_water)
  world_gen_margins(c_water,c_deep_water)





  'normal vegetation
  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
    If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then
    If x Mod 2 = 0 And y Mod 2 = 0 Then
      If Rand(0,100)<15 Then
	    Select Rand(0,4)
	      Case 0
         world_obj_type[x,y,z]=world_obj_tree_conifer
         world_obj_index[x,y,z]=Rand(0,tree_conifer_00_max-1)
	      Case 1
         world_obj_type[x,y,z]=world_obj_tree_leaf
         world_obj_index[x,y,z]=Rand(0,tree_leaf_00_max-1)
	      Case 2
		     world_obj_type[x,y,z]=world_obj_bush
         world_obj_index[x,y,z]=Rand(0,bush_00_max-1)
	      Case 3
	      world_obj_type[x,y,z]=world_obj_weed1
	      world_obj_index[x,y,z]=Rand(0,weed_00_max-1)
		    Case 4
	        world_obj_type[x,y,z]=world_obj_weed2
	        world_obj_index[x,y,z]=Rand(0,weed_03_max-1)
        End Select
      End If
    End If
    End If
    End If
    End If
    End If

  Next
  Next
  Next



If map_vegetation[world_map_x,world_map_y]=veg_busch Then

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
    If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then
    If x Mod 2 = 0 And y Mod 2 = 0 Then
      If Rand(0,100)<35 Then
         world_obj_type[x,y,z]=world_obj_bush
         world_obj_index[x,y,z]=Rand(0,bush_00_max-1)
      End If
    End If
    End If
    End If
    End If
    End If

  Next
  Next
  Next

End If



If map_vegetation[world_map_x,world_map_y]=veg_nadelwald Then

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
    If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then
    If x Mod 2 = 0 And y Mod 2 = 0 Then
      If Rand(0,100)<35 Then
         world_obj_type[x,y,z]=world_obj_tree_conifer
         world_obj_index[x,y,z]=Rand(0,tree_conifer_00_max-1)
      End If
    End If
    End If
    End If
    End If
    End If

  Next
  Next
  Next

End If



If map_vegetation[world_map_x,world_map_y]=veg_laubwald Then

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
    If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then
    If x Mod 2 = 0 And y Mod 2 = 0 Then
      If Rand(0,100)<35 Then
         world_obj_type[x,y,z]=world_obj_tree_leaf
         world_obj_index[x,y,z]=Rand(0,tree_leaf_00_max-1)
      End If
    End If
    End If
    End If
    End If
    End If

  Next
  Next
  Next

End If



If map_vegetation[world_map_x,world_map_y]=veg_mischwald Then

  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

    If world[x,y,z]=1 Then
    If world_ground_type[x,y,z]<>c_water And world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then
    If x Mod 2 = 0 And y Mod 2 = 0 Then
      If Rand(0,100)<35 Then
	    Select Rand(0,1)
	      Case 0
         world_obj_type[x,y,z]=world_obj_tree_conifer
         world_obj_index[x,y,z]=Rand(0,tree_conifer_00_max-1)
	      Case 1
         world_obj_type[x,y,z]=world_obj_tree_leaf
         world_obj_index[x,y,z]=Rand(0,tree_leaf_00_max-1)
        End Select
      End If
    End If
    End If
    End If
    End If
    End If

  Next
  Next
  Next

End If








  For Local x=0 To world_x-1
  For Local y=0 To world_y-1
  For Local z=0 To world_z-1

   If world[x,y,z]=1 Then
   If world_obj_type[x,y,z]=0 Then

    If x-1>=0 And x+1<=world_x-1 And y-1>=0 And y+1<=world_y-1 Then
    If world[x-1,y,z]=1 And world[x+1,y,z]=1 And world[x,y-1,z]=1 And world[x,y+1,z]=1 Then

    If world_ground_type[x,y,z]=c_water Then

	    If Rand(0,100)<25 Then
		   Select Rand(0,1)
	      Case 0
	        world_ambient_type[x,y,z]=weed_01
	        world_ambient_index[x,y,z]=Rand(0,weed_01_max-1)
	     End Select
		  End If
		
    Else

      If world_ground_type[x,y,z]<>c_deep_water And world_ground_type[x,y,z]<>c_pool_water Then
	      If map_vegetation[world_map_x,world_map_y]=veg_wiese Then
			    If Rand(0,100)<30 Then
				    Select Rand(0,1)
				      Case 0
				        world_ambient_type[x,y,z]=weed_01
				        world_ambient_index[x,y,z]=Rand(0,weed_01_max-1)
					  Case 1
				        world_ambient_type[x,y,z]=weed_02
				        world_ambient_index[x,y,z]=Rand(0,weed_02_max-1)
				    End Select
			    End If
	      Else
			    If Rand(0,100)<15 Then
				    Select Rand(0,1)
				      Case 0
				        world_ambient_type[x,y,z]=weed_01
				        world_ambient_index[x,y,z]=Rand(0,weed_01_max-1)
					  Case 1
				        world_ambient_type[x,y,z]=weed_02
				        world_ambient_index[x,y,z]=Rand(0,weed_02_max-1)
				    End Select
			    End If
	      End If
      End If

    End If

    End If
    End If

   End If
   End If

  Next
  Next
  Next



  world_gen_buildings()

  world_gen_minimap()


  'world_place_large_obj(world_obj_car,c_truck,7,0,0,0)


End Function



Function reserve_world_player(x,y,z)

  world_obj_type[x,y,z]=world_obj_reserved

End Function



Function del_world_player(x,y,z)

  world_obj_type[x,y,z]=0

End Function

Function set_world_player(x,y,z,index)

  world_obj_type[x,y,z]=world_obj_player
  world_obj_index[x,y,z]=index

End Function



Function del_world_item(x,y,z,i)

  world_item[x,y,z,i]=0

End Function

Function set_world_item(x,y,z,i,index)

  world_item[x,y,z,i]=1
  world_item_index[x,y,z,i]=index

End Function




Function world_cam_move()

  If MilliSecs()>world_cam_t+world_cam_s Then
    world_cam_t=MilliSecs()

    If KeyDown(KEY_LEFT) Or KeyDown(KEY_A) Then
      world_cam_x:+1
      world_cam_y:-1
    End If

    If KeyDown(KEY_RIGHT) Or KeyDown(KEY_D) Then
      world_cam_x:-1
      world_cam_y:+1
    End If

    If KeyDown(KEY_UP) Or KeyDown(KEY_W) Then
      world_cam_x:+1
      world_cam_y:+1
    End If

    If KeyDown(KEY_DOWN) Or KeyDown(KEY_S) Then
      world_cam_x:-1
      world_cam_y:-1
    End If

    If KeyDown(KEY_SPACE) Then
      'world_cam_x=player_x[player_selected]-world_view_x/2
      'world_cam_y=player_y[player_selected]-world_view_y/2
    End If

  End If

End Function






