


Global player_list_open_last
Global player_list_close_last

Global player_list_close_ref[world_x,world_y]
Global player_list_close_ref_index[world_x,world_y]

Global player_list_close[world_x*world_y]
Global player_list_close_x[world_x*world_y]
Global player_list_close_y[world_x*world_y]
Global player_list_close_a[world_x*world_y]
Global player_list_close_c[world_x*world_y]
Global player_list_close_p[world_x*world_y]
Global player_list_close_n[world_x*world_y]

Global player_list_open_ref[world_x,world_y]
Global player_list_open_ref_index[world_x,world_y]

Global player_list_open[world_x*world_y]
Global player_list_open_x[world_x*world_y]
Global player_list_open_y[world_x*world_y]
Global player_list_open_a[world_x*world_y]
Global player_list_open_c[world_x*world_y]
Global player_list_open_p[world_x*world_y]




Function player_list_check(x,y,z)
  If in_world(x,y)=True Then
    If world_obj_type[x,y,z]=0 Then
      'If player_list_open_ref[x,y]=0 Then
        If player_list_close_ref[x,y]=0 Then
          Return True
        End If
      'End If
    End If
  End If
  Return False
End Function


Function player_list_open_new()
  Local i=0
  While i<world_x*world_y
    If player_list_open[i]=0 Then
      If player_list_open_last<i Then player_list_open_last=i
      Return i
    Else
      i:+1
    End If
  Wend
  Return -1
End Function


Function player_list_close_new()
  Local i=0
  While i<world_x*world_y
    If player_list_close[i]=0 Then
      If player_list_close_last<i Then player_list_close_last=i
      Return i
    Else
      i:+1
    End If
  Wend
  Return -1
End Function


Function player_list_open_set(x,y,a,c,p)
  If player_list_open_ref[x,y]=1 Then
    Local i=player_list_open_ref_index[x,y]
    If player_list_open_c[i]>c Then
      player_list_open[i]=1
      player_list_open_x[i]=x
      player_list_open_y[i]=y
      player_list_open_a[i]=a
      player_list_open_c[i]=c
      player_list_open_p[i]=p
      player_list_open_ref[x,y]=1
      player_list_open_ref_index[x,y]=i
    End If
  Else
    Local i=player_list_open_new()
    player_list_open[i]=1
    player_list_open_x[i]=x
    player_list_open_y[i]=y
    player_list_open_a[i]=a
    player_list_open_c[i]=c
    player_list_open_p[i]=p
    player_list_open_ref[x,y]=1
    player_list_open_ref_index[x,y]=i
  End If
End Function


Function player_list_close_set(i)
  Local k=player_list_close_new()
  player_list_close[k]=1
  player_list_close_x[k]=player_list_open_x[i]
  player_list_close_y[k]=player_list_open_y[i]
  player_list_close_a[k]=player_list_open_a[i]
  player_list_close_c[k]=player_list_open_c[i]
  player_list_close_p[k]=player_list_open_p[i]
  player_list_close_n[k]=-1
  player_list_close_ref[player_list_open_x[i],player_list_open_y[i]]=1
  player_list_close_ref_index[player_list_open_x[i],player_list_open_y[i]]=k
  Return k
End Function


Function player_list_open_find_min()
  Local open_min=-1
  Local f=False
  For Local i=0 To player_list_open_last
    If player_list_open[i]=1 Then
      If open_min>=0 Then
        If player_list_open_c[open_min]>player_list_open_c[i] Then
          open_min=i
          f=True
        End If
      Else
        open_min=i
        f=True
      End If
    End If
  Next
  If f=False Then
    Return -1
  Else
    Return open_min
  End If
End Function



Function player_list_open_cost_get_short(i,x1,y1,z1,a,x2,y2)

  Local c
  Local f
  Local g
  Local o
  Local h:Float
  Local a1
  Local a2


  h=Sqr(Abs(x2-x1)*Abs(x2-x1)+Abs(y2-y1)*Abs(y2-y1))

  g=player_list_open_c[i]

  If a<>player_list_open_a[i] Then

    a1=Abs(player_list_open_a[i]-a)
    If player_list_open_a[i]<a Then
      a2=player_list_open_a[i]+8-a
    Else
      a2=a+8-player_list_open_a[i]
    End If

    If a1<a2 Then
      o=a1
    Else
      o=a2
    End If

  End If

  c=Int(2*h)+g+o

  Return c
End Function




Function player_list_open_cost_get_fast(i,x1,y1,z1,a,x2,y2)

  Local c
  Local f
  Local g
  Local o
  Local h:Float
  Local a1
  Local a2
  Local s

  h=Sqr(Abs(x2-x1)*Abs(x2-x1)+Abs(y2-y1)*Abs(y2-y1))

  g=player_list_open_c[i]

  If world_ambient_type[x1,y1,z1]>0 Then s=4

  Select world_ground_type[x1,y1,z1]
    Case c_earth g:+4
    Case c_gras g:+6
    Case c_mud g:+8
    Case c_water g:+10
    Case c_deep_water g:+12
    Case c_pool_water g:+12
    Default g:+1
  End Select

  If a<>player_list_open_a[i] Then

    a1=Abs(player_list_open_a[i]-a)
    If player_list_open_a[i]<a Then
      a2=player_list_open_a[i]+8-a
    Else
      a2=a+8-player_list_open_a[i]
    End If

    If a1<a2 Then
      o=a1
    Else
      o=a2
    End If

  End If

  c=Int(2*h)+g+o+s

  Return c
End Function


Function player_list_open_neighbour_set(i,p,a,x,y,z,cost=0)

  Local x1=player_list_open_x[i]+player_get_x(a)
  Local y1=player_list_open_y[i]+player_get_y(a)

  If player_list_check(x1,y1,z)=True Then

    Local c1

    Select cost
      Case 0
        c1=player_list_open_cost_get_short(i,x1,y1,z,a,x,y)
      Case 1
        c1=player_list_open_cost_get_fast(i,x1,y1,z,a,x,y)
    End Select

    player_list_open_set(x1,y1,a,c1,p)

  End If

End Function


Function player_list_open_del(i)

  player_list_open_ref[player_list_open_x[i],player_list_open_y[i]]=0
  player_list_open[i]=0

End Function



Function player_close_list_clear()
  For Local i=0 To world_x*world_y-1
    player_list_close[i]=0
  Next
End Function

Function player_close_ref_list_clear()
  For Local i=0 To world_x-1
  For Local k=0 To world_y-1
    player_list_close_ref[i,k]=0
  Next
  Next
End Function

Function player_open_list_clear()
  For Local i=0 To world_x*world_y-1
    player_list_open[i]=0
  Next
End Function

Function player_open_ref_list_clear()
  For Local i=0 To world_x-1
  For Local k=0 To world_y-1
    player_list_open_ref[i,k]=0
  Next
  Next
End Function







Function player_turn_set(index,x2,y2,a2,a)

  Select player_check_align(a2,a)
    Case 1
      player_tar_add(index,x2,y2,player_act_turn_left)
      a2:-1
      If a2<0 Then a2=7
    Default
      player_tar_add(index,x2,y2,player_act_turn_right)
      a2:+1
      If a2>7 Then a2=0
  End Select

  Return a2

End Function





Function player_move_set(i,index,p2,action)

  Local g1=world_ground_type[player_list_close_x[i],player_list_close_y[i],player_world_z[index]]
  Local g2=world_ground_type[player_list_close_x[player_list_close_p[i]],player_list_close_y[player_list_close_p[i]],player_world_z[index]]

  If g1=c_water And g2=c_water Then

    player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_w_walk)

  Else

    If (g1=c_deep_water And g2=c_deep_water) Or (g1=c_pool_water And g2=c_pool_water) Then
      If action=player_act_run Then
        player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_w_swimfast)
      Else
        player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_w_swim)
      End If
    Else

		  If action=player_act_run Then
		    player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_run)
		  Else
		
		    Select p2
		      Case 0
		        player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_walk)
		      Case 1
		        player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_swat)
		      Case 2
		        player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_crawl)
		    End Select
		
		  End If

    End If

  End If

End Function
