

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
      If player_list_open_ref[x,y]=0 Then
        If player_list_close_ref[x,y]=0 Then
          Return True
        End If
      End If
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
  Local i=player_list_open_new()
  player_list_open[i]=1
  player_list_open_x[i]=x
  player_list_open_y[i]=y
  player_list_open_a[i]=a
  player_list_open_c[i]=c
  player_list_open_p[i]=p
  player_list_open_ref[x,y]=1
  player_list_open_ref_index[x,y]=i
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


Function player_list_open_cost_get(i,x1,y1,z1,a,x2,y2)

  Local c
  Local f
  Local g
  Local o
  Local h:Float
  Local a1
  Local a2


  h=Sqr(Abs(x2-x1)*Abs(x2-x1)+Abs(y2-y1)*Abs(y2-y1))

  g=player_list_open_c[i]

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

  c=Int(2*h)+g+o

  Return c
End Function


Function player_list_open_neighbour_set(i,p,a,x,y,z)

  Local x1=player_list_open_x[i]+player_get_x(a)
  Local y1=player_list_open_y[i]+player_get_y(a)

  If player_list_check(x1,y1,z)=True Then

    Local c1=player_list_open_cost_get(i,x1,y1,z,a,x,y)
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

End Function







Function player_way_find_fast(index,x,y,action)
  'irgendwie den a* algorithmus einbauen

  player_list_open_last=0
  player_list_close_last=0

  player_close_list_clear()
  player_close_ref_list_clear()
  player_open_list_clear()
  player_open_ref_list_clear()

  Local open_min
  Local target
  Local b=False

  player_list_open[0]=1
  player_list_open_x[0]=player_world_x[index]
  player_list_open_y[0]=player_world_y[index]
  player_list_open_a[0]=player_align[index]
  player_list_open_c[0]=0
  player_list_open_p[0]=-1

  Local z=player_world_z[index]

  player_list_open_ref[player_list_open_x[0],player_list_open_y[0]]=1
  player_list_open_ref_index[player_list_open_x[0],player_list_open_y[0]]=0


Print "x "+x
Print "y "+y

  While b=False And open_min<>-1

    open_min=player_list_open_find_min()

    If open_min>=0 Then

      target=player_list_close_set(open_min)

      If player_list_open_x[open_min]<>x Or player_list_open_y[open_min]<>y Then

        player_list_open_neighbour_set(open_min,target,north,x,y,z)
        player_list_open_neighbour_set(open_min,target,south,x,y,z)
        player_list_open_neighbour_set(open_min,target,east,x,y,z)
        player_list_open_neighbour_set(open_min,target,west,x,y,z)
        player_list_open_neighbour_set(open_min,target,northeast,x,y,z)
        player_list_open_neighbour_set(open_min,target,northwest,x,y,z)
        player_list_open_neighbour_set(open_min,target,southeast,x,y,z)
        player_list_open_neighbour_set(open_min,target,southwest,x,y,z)

Print "target "+target
Print "open min "+open_min
      Else
        b=True
      End If
      
      player_list_open_del(open_min)

    End If

  Wend

  Local i=0
  Local k=target
  Local f=False


  Local x2=player_world_x[index]
  Local y2=player_world_y[index]
  Local a2=player_align[index]
  Local p2=player_position[index]
  Local a
  Local act

Print "target "+target
Print "last "+player_list_close_last

For Local l=0 To player_list_close_last
Print player_list_close_x[l]+" "+player_list_close_y[l]+" "+player_list_close_p[l]
Next

  If b=True Then


    'suche den weg zum anfang
    While player_list_close_p[k]<>-1
      player_list_close_n[player_list_close_p[k]]=k
      k=player_list_close_p[k]
Print "k "+k
    Wend

    i=player_list_close_n[k]

    'setze die hauptwerte für tar

    'player_tar[index]=1
    'player_tar_pos[index]=0
    player_tar_main_action[index]=action
    If action=player_act_run Then player_tar_main_pos[index]=p2
    player_tar_main_x[index]=player_list_close_x[target]
    player_tar_main_y[index]=player_list_close_y[target]

    'gehe den weg schrittweise ab und weise die aktionen zu

    While f=False

Print "i "+i
Print "next "+player_list_close_n[i]

	      If x2<>player_list_close_x[target] Or y2<>player_list_close_y[target] Then
	
	        If action=player_act_run And p2>0 Then
	
	          'aufstehen wenn der spieler rennen soll
	          player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_pos_up)
	          p2:-1
	
	        Else
	
	          'prüfe ob zielfeld besetzt ist
	          If world_obj_type[player_list_close_x[i],player_list_close_y[i],z]>0 Then
	            'prüfe ob es das endziel objekt ist
	            If player_list_close_x[i]=player_list_close_x[target] And player_list_close_y[i]=player_list_close_y[target] Then
	              'ziel erreicht
	              'prüfe ob die aktion öffnen ist
	              If action=player_act_open Then
	                player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_open)
	              End If
	              f=True
	Print "ende 1"
	
	            Else
	              'nicht das endziel objekt
	              'irgendwas im weg
	              'stop
	              f=True
	
	Print "ende 2"
	
	            End If
	          Else
	
	            'zielfeld ist bekannt und frei
	            'prüfe ob der spieler gedreht werden muss
	            'wenn align = dann move oder run
	            'ansonsten ermittle richtung und turn
	
	            a=player_get_align(player_list_close_x[i]-x2,player_list_close_y[i]-y2)
	
	Print "x "+(player_list_close_x[i]-x2)
	Print "y "+(player_list_close_y[i]-y2)
	
	
	            'prüfe ob player align gleich ziel align
	            If a2=a Then
	
	              'move oder run zum nächsten feld
	              player_move_set(i,index,p2,action)
	
	              'nächsten schritt in der liste setzen
	               x2=player_list_close_x[i]
	               y2=player_list_close_y[i]
	               i=player_list_close_n[i]
	
	             Else
	
	               'nicht align dann turn
	                a2=player_turn_set(index,x2,y2,a2,a)
	
	              End If
	
	
	          End If
	
	        End If
	
	      Else
	
	        'ziel erreicht
	        'prüfe ob die aktion aufheben ist
	        If action=player_act_pickup Then
	           player_tar_add(index,player_list_close_x[i],player_list_close_y[i],player_act_pickup)
	        End If
	        f=True
	
	      End If

    Wend

  End If

  Return f

End Function




