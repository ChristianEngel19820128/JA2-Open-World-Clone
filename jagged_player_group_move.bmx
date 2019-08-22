
Function group_move()

  For Local i=0 To group_max-1
    If group[i]=1 Then
      If group_map_have_tar[i]=1 Then

        Local s1

        Select map_vegetation[group_map_x[i],group_map_y[i]]
          Case veg_empty
            s1=1
          Case veg_wiese
            s1=2
          Case veg_busch
            s1=4
          Case veg_nadelwald
            s1=8
          Case veg_laubwald
            s1=12
          Case veg_mischwald
            s1=16
          Case veg_sumpf
            s1=32
        End Select

        Local s=group_move_s[i]*(map_height[group_map_x[i],group_map_y[i]]+s1+9-map_urban[group_map_x[i],group_map_y[i]]+303-group_scout[i]*2+101-group_leader[i])/100

        If timestemp>group_move_t[i]+s Then

          group_move_t[i]=timestemp




          If group_map_x[i]=group_map_tar_x[i,0] And group_map_y[i]>group_map_tar_y[i,0] Then
            group_position[i]=north
          End If

          If group_map_x[i]=group_map_tar_x[i,0] And group_map_y[i]<group_map_tar_y[i,0] Then
            group_position[i]=south
          End If

          If group_map_x[i]>group_map_tar_x[i,0] And group_map_y[i]=group_map_tar_y[i,0] Then
            group_position[i]=east
          End If

          If group_map_x[i]<group_map_tar_x[i,0] And group_map_y[i]=group_map_tar_y[i,0] Then
            group_position[i]=west
          End If

          If group_map_x[i]>group_map_tar_x[i,0] And group_map_y[i]>group_map_tar_y[i,0] Then
            group_position[i]=northeast
          End If

          If group_map_x[i]<group_map_tar_x[i,0] And group_map_y[i]>group_map_tar_y[i,0] Then
            group_position[i]=northwest
          End If

          If group_map_x[i]>group_map_tar_x[i,0] And group_map_y[i]<group_map_tar_y[i,0] Then
            group_position[i]=southeast
          End If

          If group_map_x[i]<group_map_tar_x[i,0] And group_map_y[i]<group_map_tar_y[i,0] Then
            group_position[i]=southwest
          End If

          group_position_set[i]=0

          group_map_x[i]=group_map_tar_x[i,0]
          group_map_y[i]=group_map_tar_y[i,0]






          Local k
          Local f
          While f=False And k<mx_waypoints-1

            If group_map_tar[i,k]=1 Then
              group_map_tar[i,k]=group_map_tar[i,k+1]
              group_map_tar_x[i,k]=group_map_tar_x[i,k+1]
              group_map_tar_y[i,k]=group_map_tar_y[i,k+1]
            Else
              f=True
            End If

            k:+1
          Wend

          group_map_tar[i,k]=0

          If group_map_tar[i,0]=0 Then group_map_have_tar[i]=0

        End If
      End If
    End If
  Next

End Function





Function group_map_find_way(x,y)

  Local f

  group_new_waypoints_clear(0)


  If group_map_x[group_selected]<>x Or group_map_y[group_selected]<>y Then

   
	
	  If group_map_x[group_selected]<x Then
	    group_map_new_tar_x[group_selected,0] = group_map_x[group_selected]+1
	    group_map_new_tar[group_selected,0] = 1
	  End If
	
	  If group_map_x[group_selected]>x Then
	    group_map_new_tar_x[group_selected,0] = group_map_x[group_selected]-1
	    group_map_new_tar[group_selected,0] = 1
	  End If
		
	  If group_map_y[group_selected]<y Then
	    group_map_new_tar_y[group_selected,0] = group_map_y[group_selected]+1
		  group_map_new_tar[group_selected,0] = 1
	  End If
	
	  If group_map_y[group_selected]>y Then
	    group_map_new_tar_y[group_selected,0] = group_map_y[group_selected]-1
	    group_map_new_tar[group_selected,0] = 1
	  End If
	
	
	  If group_map_x[group_selected]=x Then
	    group_map_new_tar_x[group_selected,0] = group_map_x[group_selected]
	    group_map_new_tar[group_selected,0] = 1
	  End If
	
	  If group_map_y[group_selected]=y Then
	    group_map_new_tar_y[group_selected,0] = group_map_y[group_selected]
	    group_map_new_tar[group_selected,0] = 1
	  End If
	
				
	  Local i=1
	
	
	
	  While f=False
	
	
			  If group_map_new_tar_x[group_selected,i-1]<x Then
			    group_map_new_tar_x[group_selected,i] = group_map_new_tar_x[group_selected,i-1]+1
			    group_map_new_tar[group_selected,i] = 1
			  End If
			
			  If group_map_new_tar_x[group_selected,i-1]>x Then
			    group_map_new_tar_x[group_selected,i] = group_map_new_tar_x[group_selected,i-1]-1
			    group_map_new_tar[group_selected,i] = 1
			  End If
				
			  If group_map_new_tar_y[group_selected,i-1]<y Then
			    group_map_new_tar_y[group_selected,i] = group_map_new_tar_y[group_selected,i-1]+1
				  group_map_new_tar[group_selected,i] = 1
			  End If
			
			  If group_map_new_tar_y[group_selected,i-1]>y Then
			    group_map_new_tar_y[group_selected,i] = group_map_new_tar_y[group_selected,i-1]-1
			    group_map_new_tar[group_selected,i] = 1
			  End If
	
			  If group_map_new_tar_x[group_selected,i-1]=x Then
			    group_map_new_tar_x[group_selected,i] = group_map_new_tar_x[group_selected,i-1]
			    group_map_new_tar[group_selected,i] = 1
			  End If
				
			  If group_map_new_tar_y[group_selected,i-1]=y Then
			    group_map_new_tar_y[group_selected,i] = group_map_new_tar_y[group_selected,i-1]
				  group_map_new_tar[group_selected,i] = 1
			  End If	
	
	    If group_map_new_tar_x[group_selected,i]=x And group_map_new_tar_y[group_selected,i]=y Then f=True
	
	    i:+1
	
	    If i>mx_waypoints-1 Then f=True
	
	  Wend

  End If

End Function



Function group_new_waypoints_clear(group)

  For Local i=0 To mx_waypoints-1
	  group_map_new_tar[group,i]=0
  Next

End Function


Function group_copy_new_way(group)

  group_map_have_tar[group]=1
  group_move_t[group]=timestemp

  For Local i=0 To mx_waypoints-1

	  group_map_tar[group,i]=group_map_new_tar[group,i]
	  group_map_tar_x[group,i]=group_map_new_tar_x[group,i]
	  group_map_tar_y[group,i]=group_map_new_tar_y[group,i]

  Next

End Function



Function group_stop(group)

	group_map_have_tar[group]=0
  group_move_t[group]=timestemp

  For Local i=0 To mx_waypoints-1

	  group_map_tar[group,i]=0

  Next

End Function


Function group_reset_new_way()

    For Local l=0 To group_max-1
      group_map_find_new_way[l]=0
    Next

End Function


